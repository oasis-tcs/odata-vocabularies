/**
 * Converts OData CSDL JSON to Github Flavored Markdown
 * 
 * Latest version: https://github.com/oasis-tcs/odata-vocabularies/blob/master/lib/csdl2markdown.js
*/

//TODO
// everything
// line numbers: 
// - enhance odata-csdl-xml2json to preserve the line numbers and put them into constructs we need to reference
// - types, terms, actions, functions, properties, ...
// - use something like https://github.com/epoberezkin/json-source-map for JSON vocabulary input

/**
 * Create Markdown documentation from a CSDL document
 * @param {object} csdl CSDL document
 * @return {Array} Array of strings containing Markdown lines
 */
module.exports.csdl2markdown = function (filename, csdl) {
    const lines = [];
    const index = {
        alias: {},
        namespace: { 'Edm': 'Edm' },
        namespaceUrl: {},
        schema: {},
        terms: [],
        actions: [],
        functions: [],
        types: []
    };
    preProcess(csdl, index);
    const voc = vocabularies(index.alias);

    lines.push(...header(index.schema, filename));

    //TODO: terms, actions, functions

    index.types.forEach(type => {
        lines.push(...typeSection(type));
    })

    return lines;


    /**
     * Collect model info for easier lookup
     * @param {object} csdl CSDL document
     * @param {object} index Map of model elements
     */
    function preProcess(csdl, index) {
        Object.keys(csdl.$Reference || {}).forEach(url => {
            const reference = csdl.$Reference[url];
            (reference.$Include || []).forEach(include => {
                const qualifier = include.$Alias || include.$Namespace;
                index.alias[include.$Namespace] = qualifier;
                index.namespace[qualifier] = include.$Namespace;
                index.namespace[include.$Namespace] = include.$Namespace;
                index.namespaceUrl[include.$Namespace] = url;
            });
        });

        Object.keys(csdl).filter(name => isIdentifier(name)).forEach(name => {
            index.schema = csdl[name];
            index.schema.$$namespace = name;
            const qualifier = index.schema.$Alias || name;

            index.alias[name] = qualifier;
            index.namespace[qualifier] = name;
            index.namespace[name] = name;

            Object.keys(index.schema).filter(name => isIdentifier(name)).forEach(name => {
                const element = index.schema[name];
                element.$$name = name;
                switch (element.$Kind) {
                    case 'Action':
                        index.actions.push(element);
                        break;
                    case 'Function':
                        index.functions.push(element);
                        break;
                    case 'Term':
                        index.terms.push(element);
                        break;
                    case 'ComplexType':
                    case 'EnumType':
                    case 'TypeDefinition':
                        index.types.push(element);
                        break;
                }
            });
        });
    }

    /**
     * @param {object} schema Schema
     * @param {string} filename Name of source file
     * @return {Array} Array of strings containing Markdown lines
     */
    function header(schema, filename) {
        const lines = [];

        const temp = schema.$$namespace.substring(0, schema.$$namespace.lastIndexOf('.'));
        const name = temp.substring(temp.lastIndexOf('.') + 1);

        lines.push('# ' + name + ' Vocabulary');
        lines.push('**Namespace: [' + schema.$$namespace + '](' + filename + ')**');
        lines.push('');
        lines.push(escape(schema[voc.Core.Description]));

        //TODO: Core.LongDescription
        lines.push('');
        lines.push('');

        return lines;
    }

    /**
     * @param {object} schema Schema
     * @param {string} filename Name of source file
     * @return {Array} Array of strings containing Markdown lines
     */
    function typeSection(type) {
        const lines = [];

        //TODO: headline with base type
        lines.push('## <a name="' + type.$$name + '"></a>' + sourceLink(type));
        lines.push(escape(type[voc.Core.Description]));
        //TODO: Core.Description and Core.LongDescription
        lines.push('');

        if (['ComplexType', 'EntityType'].includes(type.$Kind)) {
            lines.push(...propertyTable(type));
        } else if (type.$Kind == 'EnumType') {
            lines.push(...memberTable(type));
        }

        return lines;
    }

    /**
     * @param {object} type Structured type
     * @return {Array} Array of strings containing Markdown lines
     */
    function propertyTable(type) {
        const lines = [];
        const properties = [];

        //TODO: recurse to $BaseType
        Object.keys(type).filter(name => isIdentifier(name)).forEach(name => {
            const property = type[name];
            property.$$name = name;
            properties.push(property);
        });

        if (properties.length > 0) {
            lines.push('Property|Type|Description');
            lines.push(':-------|:---|:----------');
        }

        properties.forEach(p => {
            lines.push(sourceLink(p) + '|' + typeLink(p) + '|' + descriptionInTable(p));
        })

        lines.push('');

        return lines;
    }

    /**
     * @param {object} type Enumeration type
     * @return {Array} Array of strings containing Markdown lines
     */
    function memberTable(type) {
        const lines = [];
        const members = [];

        //TODO: recurse to $BaseType
        Object.keys(type).filter(name => isIdentifier(name)).forEach(name => {
            const member = { $$value: type[name] };
            member.$$name = name;
            member['@parser.line'] = type[name + '@parser.line'];
            member[voc.Core.Description] = type[name + voc.Core.Description];
            member[voc.Core.LongDescription] = type[name + voc.Core.LongDescription];
            members.push(member);
            console.log(member);
        });

        if (members.length > 0) {
            lines.push('Member|Value|Description');
            lines.push(':-----|----:|:----------');
        }

        members.forEach(m => {
            lines.push(sourceLink(m) + '|' + m.$$value + '|' + descriptionInTable(m));
        })

        lines.push('');

        return lines;
    }

    /**
     * Description of model element escaped for use in a Markdown table
     * @param {object} modelElement Model element to describe
     * @return {string} description
     */
    function descriptionInTable(modelElement) {
        const text = modelElement[voc.Core.Description];
        //TODO: LongDescription, Example, Revisions
        return escape(text);
    }

    /**
     * Escape text for use in Markdown
     * @param {string} text Text to escape
     * @return {string} Escaped text
     */
    function escape(text) {
        //TODO: escape
        return text || '';
    }

    /**
     * Construct link to definition of model element in source file
     * @param {object} modelElement Model element to link
     * @return {string} link
     */
    function sourceLink(modelElement) {
        const line = modelElement['@parser.line'];
        return '[' + modelElement.$$name + '](' + filename + (line ? '#L' + line : '') + ')';
    }

    /**
     * Construct link to documentation of a model element's type in markdown
     * @param {object} modelElement Type to link
     * @return {string} link
     */
    function typeLink(modelElement) {
        const np = nameParts(modelElement.$Type || 'Edm.String');
        const localType = index.namespace[np.qualifier] == index.schema.$$namespace;

        //TODO: Edm.String annotated with IsMediaType or IsUrl
        //TODO: link to referenced file

        return (modelElement.$Collection ? '\\[' : '')
            + (localType ? '[' : '')
            + np.name
            + (localType ? '](#' + np.name + ')' : '')
            + (modelElement.$Collection ? '\\]' : '');
    }

    /**
     * a qualified name consists of a namespace or alias, a dot, and a simple name
     * @param {string} qualifiedName 
     * @return {object} with components qualifier and name
     */
    function nameParts(qualifiedName) {
        const pos = qualifiedName.lastIndexOf('.');
        console.assert(pos > 0, 'Invalid qualified name ' + qualifiedName);
        return {
            qualifier: qualifiedName.substring(0, pos),
            name: qualifiedName.substring(pos + 1)
        };
    }

    /**
     * an identifier does not start with $ and does not contain @
     * @param {string} name 
     * @return {boolean} name is an identifier
     */
    function isIdentifier(name) {
        return !name.startsWith('$') && !name.includes('@');
    }

    /**
     * Construct map of qualified term names
     * @param {object} alias Map of namespace or alias to alias
     * @return {object}Vocabulary term name map
     */
    function vocabularies(alias) {
        const terms = {
            Core: ['Description', 'Example', 'IsMediaType', 'IsUrl', 'LongDescription', 'Revisions'],
            Validation: ['AllowedValues', 'Exclusive', 'Maximum', 'Minimum', 'Pattern']
        };
        const v = {};

        Object.keys(terms).forEach(vocab => {
            v[vocab] = {};
            terms[vocab].forEach(term => {
                v[vocab][term] = '@' + alias['Org.OData.' + vocab + '.V1'] + '.' + term;
            });
        });

        return v;
    }

}