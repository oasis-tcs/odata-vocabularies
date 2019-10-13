const assert = require('assert');
const fs = require('fs');

const csdl = require('odata-csdl');
const lib = require('../lib/csdl2markdown');

const vocabularies = ['Aggregation', 'Authorization', 'Capabilities', 'Core', 'Measures', 'Repeatability', 'Temporal', 'Validation'];
const input = {};
const expected = {};

vocabularies.forEach(v => {
    input[v] = csdl.xml2json(fs.readFileSync('vocabularies/Org.OData.' + v + '.V1.xml'), true);
    expected[v] = fs.readFileSync('vocabularies/Org.OData.' + v + '.V1.md', 'utf8');
})

describe('Examples', function () {

    vocabularies.forEach(v => {
        it(v, function () {
            const markdown = lib.csdl2markdown('Org.OData.' + v + '.V1.xml', input[v]);
            check(markdown, expected[v]);
        })
    })

})

function check(actual, expected) {
    assert.deepStrictEqual(actual, expected.split(/\r\n|\r|\n/g), 'Markdown');
}