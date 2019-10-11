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

        //TODO: Core.Description and Core.LongDescription

        return lines;
    }

    /**
     * @param {object} schema Schema
     * @param {string} filename Name of source file
     * @return {Array} Array of strings containing Markdown lines
     */
    function typeSection(type) {
        const lines = [];

        // "## <a name=\"AvailableOnAggregatesType\"></a>[AvailableOnAggregatesType](Org.OData.Aggregation.V1.xml#L201)"

        lines.push('');
        //TODO: headline with base type
        lines.push('## <a name="' + type.$$name + '"></a>[' + type.$$name + '](' + filename + '#L' + type['@parser.line'] + ')');
        lines.push('');
        //TODO: Core.Description and Core.LongDescription
        lines.push('');

        const properties = [];
        Object.keys(type).filter(name => isIdentifier(name)).forEach(name => {
            const property = type[name];
            property.$$name = name;
            properties.push(property);
        });

        if (properties.length > 0) {
            if (type.$Kind == 'ComplexType') {
                lines.push('Property|Type|Description');
                lines.push(':-------|:---|:----------');
            } else if (type.$Kind == 'EnumType') {
                lines.push('Member|Value|Description');
                lines.push(':-----|----:|:----------');
            }
        }

        return lines;
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