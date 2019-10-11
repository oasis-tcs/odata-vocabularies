/**
 * Converts OData CSDL JSON to Github Flavored Markdown
 * 
 * Latest version: https://github.com/oasis-tcs/odata-vocabularies/blob/master/lib/csdl2markdown.js
*/

//TODO
// everything
// parameter "use-alias-as-filename" needed? Probalby not, we get the file name from cli.js
// line numbers: we need to enhance odata-csdl-xml2json to preserve the line numbers and put them into constructs we need to reference
// - types, terms, actions, functions, properties, ...

/**
 * Create Markdown documentation from a CSDL document
 * @param {object} csdl CSDL document
 * @return {Array} Array of strings containing Markdown lines
 */
module.exports.csdl2markdown = function (filename, csdl) {
    let lines = [];

    //TODO
    Object.keys(csdl).filter(name => isIdentifier(name)).forEach(name => {
        const schema = csdl[name];
        const qualifier = schema.$Alias || name;

        lines.push(...header(name, schema, filename));

    });

    return lines;


    /**
     * @param {string} namespace Namespace
     * @param {object} schema Schema
     * @param {string} filename Name of source file
     * @return {Array} Array of strings containing Markdown lines
     */
    function header(namespace, schema, filename) {
        const lines = [];

        const temp = namespace.substring(0, namespace.lastIndexOf('.'));
        const name = temp.substring(temp.lastIndexOf('.') + 1);

        lines.push('# ' + name + ' Vocabulary');
        lines.push('**Namespace: [' + namespace + '](' + filename + ')**');
        lines.push('');

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

}