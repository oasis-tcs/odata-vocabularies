const assert = require('assert');
const fs = require('fs');

//TODO:
// everything

const lib = require('../lib/csdl2markdown');

const example1 = require('../vocabularies/Org.OData.Aggregation.V1.json');
const result1 = fs.readFileSync('vocabularies/Org.OData.Aggregation.V1.md', 'utf8');

describe('Examples', function () {

    it('Aggregation', function () {
        const markdown = lib.csdl2markdown(example1);
        check(markdown, result1);
    })

})

function check(actual, expected) {
    assert.deepStrictEqual(actual.split(/\r\n|\r|\n/g), expected.split(/\r\n|\r|\n/g), 'Markdown');
}