const assert = require('assert');
const fs = require('fs');

//TODO:
// everything

const csdl = require('odata-csdl');
const lib = require('../lib/csdl2markdown');

const example1 = csdl.xml2json(fs.readFileSync('vocabularies/Org.OData.Aggregation.V1.xml'), true);
const result1 = fs.readFileSync('vocabularies/Org.OData.Aggregation.V1.md', 'utf8');

describe('Examples', function () {

    it('Aggregation', function () {
        const markdown = lib.csdl2markdown('Org.OData.Aggregation.V1.xml', example1);
        check(markdown, result1);
    })

})

function check(actual, expected) {
    assert.deepStrictEqual(actual, expected.split(/\r\n|\r|\n/g), 'Markdown');
}