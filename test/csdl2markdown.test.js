const assert = require('assert');
const fs = require('fs');

const csdl = require('odata-csdl');
const lib = require('../lib/csdl2markdown');

const input = {};
const expected = {};

const vocabularies = ['Aggregation', 'Authorization', 'Capabilities', 'Core', 'Measures', 'Repeatability', 'Temporal', 'Validation'];

vocabularies.forEach(v => {
    input[v] = csdl.xml2json(fs.readFileSync('vocabularies/Org.OData.' + v + '.V1.xml'), true);
    expected[v] = fs.readFileSync('vocabularies/Org.OData.' + v + '.V1.md', 'utf8');
})

describe('OASIS Vocabularies', function () {

    it('Validation without potentially referenced vocabularies', function () {
        const markdown = lib.csdl2markdown('Org.OData.Validation.V1.xml', input.Validation);
        check(markdown, expected.Validation);
    })

    vocabularies.forEach(v => {
        it(v, function () {
            const markdown = lib.csdl2markdown('Org.OData.' + v + '.V1.xml', input[v], input);
            check(markdown, expected[v]);
        })
    })

})

function check(actual, expected) {
    assert.deepStrictEqual(actual, expected.split(/\r\n|\r|\n/g), 'Markdown');
}