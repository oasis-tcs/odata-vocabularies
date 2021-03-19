/**
 * Converts OData CSDL JSON to Github Flavored Markdown
 *
 * Latest version: https://github.com/oasis-tcs/odata-vocabularies/blob/master/lib/csdl2markdown.js
 */

//TODO
// - See //TODO comments below
// - use something like https://github.com/epoberezkin/json-source-map to get source linenumbers for JSON vocabulary input

/**
 * Create Markdown documentation from a CSDL document
 * @param {object} csdl CSDL document
 * @return {Array} Array of strings containing Markdown lines
 */
module.exports.csdl2markdown = function (filename, csdl, referenced = {}) {
  const lines = [];
  const index = {
    alias: {},
    namespace: { Edm: "Edm" },
    namespaceUrl: {},
    schema: {},
    schemas: {},
    terms: [],
    actions: [],
    functions: [],
    types: [],
    derivedTypes: {},
  };
  preProcess(index, csdl, referenced);
  const voc = vocabularies(index.alias);
  const sourceLine = "@parser.line";

  lines.push(...header(index.schema, filename));

  if (index.terms.length > 0) {
    lines.push(...termSection(index.terms));
  }

  if (index.actions.length > 0) {
    lines.push(...operationSection(index.actions));
  }

  if (index.functions.length > 0) {
    lines.push(...operationSection(index.functions));
  }

  index.types.forEach((type) => {
    lines.push(...typeSection(type));
  });

  lines.push("");

  return lines;

  /**
   * Collect model info for easier lookup
   * @param {object} index Map of model elements
   * @param {object} csdl main CSDL document
   * @param {object} referenced more CSDL documents
   */
  function preProcess(index, csdl, referenced) {
    Object.keys(csdl.$Reference || {}).forEach((url) => {
      const reference = csdl.$Reference[url];
      (reference.$Include || []).forEach((include) => {
        const qualifier = include.$Alias || include.$Namespace;
        index.alias[include.$Namespace] = qualifier;
        index.alias[qualifier] = qualifier;
        index.namespace[qualifier] = include.$Namespace;
        index.namespace[include.$Namespace] = include.$Namespace;
        index.namespaceUrl[qualifier] = url;
        index.namespaceUrl[include.$Namespace] = url;
      });
    });

    // implicit assumption: exactly one schema in a vocabulary
    Object.keys(csdl)
      .filter((name) => isIdentifier(name))
      .forEach((name) => {
        index.schemas[name] = csdl[name];
        index.schema = csdl[name];
        index.schema.$$namespace = name;
        index.qualifier = index.schema.$Alias || name;

        index.alias[name] = index.qualifier;
        index.alias[index.qualifier] = index.qualifier;
        index.namespace[index.qualifier] = name;
        index.namespace[name] = name;

        Object.keys(index.schema)
          .filter((name) => isIdentifier(name))
          .forEach((name) => {
            const element = index.schema[name];

            if (Array.isArray(element)) {
              element.forEach((overload) => {
                overload.$$name = name;
                if (overload.$Kind == "Action") index.actions.push(overload);
                else index.functions.push(overload);
              });
            } else {
              element.$$name = name;

              switch (element.$Kind) {
                case "Term":
                  index.terms.push(element);
                  break;
                case "ComplexType":
                case "EntityType":
                case "EnumType":
                case "TypeDefinition":
                  index.types.push(element);
                  break;
              }

              if (element.$BaseType) {
                if (!index.derivedTypes[element.$BaseType])
                  index.derivedTypes[element.$BaseType] = [];
                index.derivedTypes[element.$BaseType].push(
                  index.qualifier + "." + name
                );
              }
            }
          });
      });

    for (const [filename, referencedCsdl] of Object.entries(referenced)) {
      Object.keys(referencedCsdl)
        .filter((name) => isIdentifier(name))
        .forEach((namespace) => {
          if (index.schema.$$namespace !== namespace) {
            index.schemas[namespace] = referencedCsdl[namespace];
            index.schemas[namespace].$$filename = filename;
          }
        });
    }
  }

  /**
   * Document header
   * @param {object} schema Schema
   * @param {string} filename Name of source file
   * @return {Array} Array of strings containing Markdown lines
   */
  function header(schema, filename) {
    const lines = [];

    const temp = schema.$$namespace.substring(
      0,
      schema.$$namespace.lastIndexOf(".")
    );
    const name = temp.substring(temp.lastIndexOf(".") + 1);

    lines.push("# " + name + " Vocabulary");
    lines.push("**Namespace: [" + schema.$$namespace + "](" + filename + ")**");
    lines.push("");
    lines.push(schema[voc.Core.Description]);

    const longDescription = schema[voc.Core.LongDescription];
    if (longDescription) {
      lines.push("");
      lines.push(...longDescription.split("\n"));
    }

    return lines;
  }

  /**
   * Section with table of terms
   * @param {Array} terms List of terms
   * @return {Array} Array of strings containing Markdown lines
   */
  function termSection(terms) {
    const lines = [];

    lines.push("");
    lines.push("");
    lines.push("## Terms");
    lines.push("");
    lines.push("Term|Type|Description");
    lines.push(":---|:---|:----------");

    terms.forEach((t) => {
      lines.push(
        sourceLink(t) +
          experimentalOrDeprecated(t) +
          "|" +
          typeLink(t) +
          "|" +
          '<a name="' +
          t.$$name +
          '"></a>' +
          descriptionInTable(t)
      );
    });

    return lines;
  }

  /**
   * Section with table of functions
   * @param {Array} overloads List of functions
   * @return {Array} Array of strings containing Markdown lines
   */
  function operationSection(overloads) {
    const lines = [];
    const kind = overloads[0].$Kind;

    lines.push("");
    lines.push("");
    lines.push("## " + kind + "s");

    overloads.forEach((o) => {
      lines.push("");
      lines.push(
        '### <a name="' +
          o.$$name +
          '"></a>' +
          sourceLink(o) +
          experimentalOrDeprecated(o)
      );
      const depr = deprecated(o);
      if (depr) {
        lines.push(...depr.Description.split("\n"));
        return lines;
      }
      lines.push("");
      lines.push(escape(o[voc.Core.Description]));
      const longDescription = o[voc.Core.LongDescription];
      if (longDescription) {
        lines.push("");
        lines.push(...longDescription.split("\n"));
      }

      lines.push("");
      lines.push("Parameter|Type|Description");
      lines.push(":--------|:---|:----------");
      o.$Parameter.forEach(function (p, i) {
        var desc = descriptionInTable(p);
        lines.push(
          p.$Name +
            "|" +
            typeLink(p) +
            "|" +
            (o.$IsBound && i === 0
              ? "**Binding parameter" + (desc ? ":** " : "**")
              : "") +
            desc
        );
      });
      if (o.$ReturnType)
        lines.push(
          "&rarr;" +
            "|" +
            typeLink(o.$ReturnType) +
            "|" +
            descriptionInTable(o.$ReturnType)
        );
    });

    return lines;
  }

  /**
   * Section for a single type
   * @param {object} type Type model element
   * @return {Array} Array of strings containing Markdown lines
   */
  function typeSection(type) {
    const lines = [];

    lines.push("");
    lines.push(
      '## <a name="' +
        type.$$name +
        '"></a>' +
        sourceLink(type) +
        (type.$BaseType ? ": " + typeLink({ $Type: type.$BaseType }) : "") +
        experimentalOrDeprecated(type)
    );

    const depr = deprecated(type);
    if (depr) {
      lines.push(...depr.Description.split("\n"));
      return lines;
    }

    if (type.$Kind == "TypeDefinition") {
      lines.push("**Type:** " + typeLink({ $Type: type.$UnderlyingType }));
      lines.push("");
    }

    lines.push(escape(type[voc.Core.Description]));
    const longDescription = type[voc.Core.LongDescription];
    if (longDescription) {
      lines.push("");
      lines.push(...longDescription.split("\n"));
    }

    const derivedTypes =
      index.derivedTypes[index.qualifier + "." + type.$$name];
    if (derivedTypes) {
      lines.push("");
      lines.push("**Derived Types:**");
      lines.push(...derivedTypesList(derivedTypes));
    }

    if (["ComplexType", "EntityType"].includes(type.$Kind)) {
      lines.push(...propertyTable(type));
      lines.push(...applicableTermsTable(type));
    } else if (type.$Kind == "EnumType") {
      lines.push(...memberTable(type));
    }

    if (type.$Kind == "TypeDefinition") {
      lines.push(...allowedValues(type));
    }

    return lines;
  }

  /**
   * Allowed values for type definitions
   * @param {object} typeDefinition Type Definition
   * @return {Array} Array of strings containing Markdown lines
   */
  function allowedValues(typeDefinition) {
    const lines = [];

    const values = typeDefinition[voc.Validation.AllowedValues];
    if (values) {
      lines.push("");
      lines.push("Allowed Value|Description");
      lines.push(":------------|:----------");
      values.forEach((v) => {
        v.$$name = v.Value;
        lines.push(
          sourceLink(v) +
            experimentalOrDeprecated(v) +
            "|" +
            descriptionInTable(v)
        );
      });
    }

    return lines;
  }

  /**
   * List of derived types
   * @param {Array} derivedTypes Array of derived type names
   * @return {Array} Array of strings containing Markdown lines
   */
  function derivedTypesList(derivedTypes, indent = "") {
    const lines = [];

    derivedTypes.forEach((t) => {
      const type = modelElement(t);
      lines.push(
        indent +
          "- " +
          (type.$Abstract ? "*" : "") +
          typeLink({ $Type: t }) +
          (type.$Abstract ? "*" : "")
      );
      const derivedTypes = index.derivedTypes[t];
      if (derivedTypes) {
        lines.push(...derivedTypesList(derivedTypes, indent + "  "));
      }
    });

    return lines;
  }

  /**
   * Table of properties of structured type
   * @param {object} type Structured type
   * @return {Array} Array of strings containing Markdown lines
   */
  function propertyTable(type) {
    const lines = [];

    const pLines = propertyLines(type);

    if (pLines.length > 0) {
      lines.push("");
      lines.push("Property|Type|Description");
      lines.push(":-------|:---|:----------");
      lines.push(...pLines);
    }

    return lines;
  }

  /**
   * Table lines of properties of structured type
   * @param {object} type Structured type
   * @param {boolean} parent Current type is base type of "original" type
   * @return {Array} Array of strings containing Markdown lines
   */
  function propertyLines(type, parent = false) {
    const lines = [];

    if (!type) return lines;

    if (type.$BaseType) {
      lines.push(...propertyLines(modelElement(type.$BaseType), true));
    }

    Object.keys(type)
      .filter((name) => isIdentifier(name))
      .forEach((name) => {
        const p = type[name];
        p.$$name = name;
        p.$$filename = type.$$filename;
        lines.push(
          sourceLink(p, parent) +
            experimentalOrDeprecated(p) +
            "|" +
            typeLink(p) +
            "|" +
            descriptionInTable(p)
        );
      });

    return lines;
  }

  /**
   * Table of applicable terms of structured type
   * @param {object} type Structured type
   * @return {Array} Array of strings containing Markdown lines
   */
  function applicableTermsTable(type) {
    const lines = [];

    const tLines = applicableTermLines(type);
    if (tLines.length > 0) {
      lines.push("");
      lines.push("**Applicable Annotation Terms:**");
      lines.push("");
      lines.push(...tLines);
    }

    return lines;
  }

  /**
   * Table lines of applicable terms of structured type
   * @param {object} type Structured type
   * @return {Array} Array of strings containing Markdown lines
   */
  function applicableTermLines(type) {
    const lines = [];

    if (!type) return lines;

    if (type.$BaseType) {
      lines.push(...applicableTermLines(modelElement(type.$BaseType), true));
    }

    const terms = type[voc.Validation.ApplicableTerms] || [];
    terms.forEach((term) => {
      lines.push(`- ${typeLink({ $Type: term })}`);
    });

    return lines;
  }

  /**
   * Table of enumeration type members
   * @param {object} type Enumeration type
   * @return {Array} Array of strings containing Markdown lines
   */
  function memberTable(type) {
    const lines = [];
    const members = [];

    Object.keys(type)
      .filter((name) => isIdentifier(name))
      .forEach((name) => {
        const member = { $$value: type[name] };
        member.$$name = name;
        member[sourceLine] = type[name + sourceLine];
        member[voc.Core.Description] = type[name + voc.Core.Description];
        member[voc.Core.LongDescription] =
          type[name + voc.Core.LongDescription];
        member[voc.Core.Deprecated] = type[name + voc.Core.Deprecated];
        member[voc.Common.Experimental] = type[name + voc.Common.Experimental];
        members.push(member);
      });

    if (members.length > 0) {
      lines.push("");
      lines.push((type.$IsFlags ? "Flag " : "") + "Member|Value|Description");
      lines.push(":-----|----:|:----------");
    }

    members.forEach((m) => {
      lines.push(
        sourceLink(m) +
          experimentalOrDeprecated(m) +
          "|" +
          m.$$value +
          "|" +
          descriptionInTable(m)
      );
    });

    return lines;
  }

  /**
   * Mark as experimental or deprecated
   * @param {object} modelElement Model element
   * @return {string} Marker for experimental or deprecated
   */
  function experimentalOrDeprecated(modelElement) {
    return (
      (modelElement[voc.Common.Experimental]
        ? " *(" +
          typeLink({ $Type: "com.sap.vocabularies.Common.v1.Experimental" }) +
          ")*"
        : "") + (deprecated(modelElement) ? " *(Deprecated)*" : "")
    );
  }

  /**
   * Return Decorate as experimental or deprecated
   * @param {object} modelElement Model element
   * @return {Array} Array of strings containing Markdown lines
   */
  function deprecated(modelElement) {
    return (modelElement[voc.Core.Revisions] || []).find(
      (r) => r.Kind == "Deprecated"
    );
  }

  /**
   * Description of model element escaped for use in a Markdown table
   * @param {object} modelElement Model element to describe
   * @return {string} description
   */
  function descriptionInTable(modelElement) {
    const depr = deprecated(modelElement);
    const text = modelElement[voc.Core.Description];
    const long = modelElement[voc.Core.LongDescription];
    const example = modelElement[voc.Core.Example];
    if (example) {
      example.$$name = "Example";
      // the record value of the annotation has the source line
      if (example[sourceLine]) example[sourceLine] -= 1;
    }
    return depr
      ? depr.Description
      : escape(text) +
          (example ? " (" + sourceLink(example) + ")" : "") +
          (long ? " <p>" + escape(long) + "</p>" : "") +
          applicableTermsList(
            modelElement[voc.Validation.ApplicableTerms] || []
          );
  }

  /**
   * List of applicable terms
   * @param {array} applicableTerms Array of applicable terms
   * @return {string} Text
   */
  function applicableTermsList(applicableTerms) {
    const text = [];
    if (applicableTerms.length > 0) text.push(" <p>Can be annotated with:<ul>");
    applicableTerms.forEach((term) => {
      text.push(`<li>${typeLink({ $Type: term })}</li>`);
    });
    if (applicableTerms.length > 0) text.push("</ul></p>");
    return text.join("");
  }

  /**
   * Escape text for use in Markdown
   * @param {string} text Text to escape
   * @return {string} Escaped text
   */
  function escape(text) {
    return (text || "")
      .trim()
      .replace(/\n\n/g, "<br/>")
      .replace(/\n/g, " ")
      .replace(/[ \t]+/g, " ")
      .replace(/\|/g, "\\|");
  }

  /**
   * Construct link to definition of model element in source file
   * @param {object} modelElement Model element to link
   * @return {string} link
   */
  function sourceLink(modelElement, parent = false) {
    const line = modelElement[sourceLine];
    return (
      (line ? "[" : "") +
      (modelElement.$Abstract || parent ? "*" : "") +
      modelElement.$$name +
      (modelElement.$Abstract || parent ? "*" : "") +
      (line
        ? "](" + (modelElement.$$filename || filename) + "#L" + line + ")"
        : "")
    );
  }

  /**
   * Construct link to documentation of a model element's type in markdown
   * @param {object} modelElement Type to link
   * @return {string} link
   */
  function typeLink(modelElement) {
    const np = nameParts(modelElement.$Type || "Edm.String");
    const customType = index.namespace[np.qualifier] != "Edm";
    const url = index.namespaceUrl[np.qualifier];

    let customFile = "";
    if (url) {
      // guess file name from reference URL
      const lastSegment = url.substring(url.lastIndexOf("/") + 1);
      if (lastSegment.startsWith(index.namespace[np.qualifier] + "."))
        customFile = index.namespace[np.qualifier] + ".md";
      else if (lastSegment.startsWith(index.alias[np.qualifier] + ".")) {
        customFile = index.alias[np.qualifier] + ".md";
      }
      if (
        customFile.startsWith("Org.OData.") &&
        !index.schema.$$namespace.startsWith("Org.OData.")
      ) {
        customFile =
          "https://github.com/oasis-tcs/odata-vocabularies/blob/master/vocabularies/" +
          customFile;
      }
    }
    //TODO: not so :-)
    if (modelElement.$Type == "com.sap.vocabularies.Common.v1.Experimental")
      customFile = "Common.md";

    return (
      (modelElement.$Collection ? "\\[" : "") +
      (customType ? "[" : "") +
      (customType
        ? np.name
        : modelElement[voc.Core.IsURL]
        ? "URL"
        : modelElement[voc.Core.IsMediaType]
        ? "MediaType"
        : np.name) +
      (modelElement.$Nullable ? "?" : "") +
      (customType ? "](" + customFile + "#" + np.name + ")" : "") +
      (modelElement.$Collection ? "\\]" : "")
    );
  }

  /**
   * a qualified name consists of a namespace or alias, a dot, and a simple name
   * @param {string} qualifiedName
   * @return {object} with components qualifier and name
   */
  function nameParts(qualifiedName) {
    const pos = qualifiedName.lastIndexOf(".");
    console.assert(pos > 0, "Invalid qualified name " + qualifiedName);
    return {
      qualifier: qualifiedName.substring(0, pos),
      name: qualifiedName.substring(pos + 1),
    };
  }

  /**
   * an identifier does not start with $ and does not contain @
   * @param {string} name
   * @return {boolean} name is an identifier
   */
  function isIdentifier(name) {
    return !name.startsWith("$") && !name.includes("@");
  }

  /**
   * Construct map of qualified term names
   * @param {object} alias Map of namespace or alias to alias
   * @return {object}Vocabulary term name map
   */
  function vocabularies(alias) {
    const terms = {
      Common: ["Experimental"],
      Core: [
        "Description",
        "Example",
        "IsMediaType",
        "IsURL",
        "LongDescription",
        "Revisions",
      ],
      Validation: [
        "AllowedValues",
        "ApplicableTerms",
        "Exclusive",
        "Maximum",
        "Minimum",
        "Pattern",
      ],
    };
    alias.Common = alias.Common || "com.sap.vocabularies.Common.v1";
    alias.Core = alias.Core || "Org.OData.Core.V1";
    alias.Validation = alias.Validation || "Org.OData.Validation.V1";

    const v = {};

    Object.keys(terms).forEach((vocab) => {
      v[vocab] = {};
      terms[vocab].forEach((term) => {
        v[vocab][term] = "@" + alias[vocab] + "." + term;
      });
    });

    return v;
  }

  /**
   * Find model element by qualified name
   * @param {string} qname Qualified name of model element
   * @return {object} Model element
   */
  function modelElement(qname) {
    const q = nameParts(qname);
    const schema =
      index.schemas[q.qualifier] || index.schemas[index.namespace[q.qualifier]];
    const element = schema ? schema[q.name] : null;
    if (!element) console.warn(`- Cannot find '${qname}'`);
    if (element && schema.$$filename) element.$$filename = schema.$$filename;
    return element;
  }
};
