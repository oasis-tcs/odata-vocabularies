const assert = require('assert');
const fs = require('fs');

const csdl = require('odata-csdl');
const lib = require('../lib/csdl2markdown');

const input = {};
const expected = {};

const vocabularies = ['Aggregation', 'Authorization', 'Capabilities', 'Core', 'Measures', 'Repeatability', 'Temporal', 'Validation'];

vocabularies.forEach(v => {
    const vocab = `Org.OData.${v}.V1`;
    input[`${vocab}.xml`] = csdl.xml2json(fs.readFileSync(`vocabularies/${vocab}.xml`), true);
    expected[v] = fs.readFileSync(`vocabularies/${vocab}.md`, 'utf8');
})

describe('OASIS Vocabularies', function () {

    it('Validation without potentially referenced vocabularies', function () {
        const filename = 'Org.OData.Validation.V1.xml'
        const markdown = lib.csdl2markdown(filename, input[filename]);
        check(markdown, expected.Validation);
    })

    vocabularies.forEach(v => {
        it(v, function () {
            const filename = `Org.OData.${v}.V1.xml`;
            const markdown = lib.csdl2markdown(filename, input[filename], input);
            check(markdown, expected[v]);
        })
    })

})

function check(actual, expected) {
    assert.deepStrictEqual(actual, expected.split(/\r\n|\r|\n/g), 'Markdown');
}