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

    vocabularies.forEach(v => {
        it(v, function () {
            const markdown = lib.csdl2markdown('Org.OData.' + v + '.V1.xml', input[v]);
            check(markdown, expected[v]);
        })
    })

})

//TODO: remove from here
// const sapVocabs = ['Analytics', 'CodeList', 'Common', 'Communication', 'Hierarchy', 'PersonalData', 'Session', 'UI'];

// sapVocabs.forEach(v => {
//     input[v] = csdl.xml2json(fs.readFileSync('../vocabularies/' + v + '.xml'), true);
//     expected[v] = fs.readFileSync('../vocabularies/' + v + '.md', 'utf8');
// })

// describe('SAP Vocabularies', function () {

//     sapVocabs.forEach(v => {
//         it(v, function () {
//             const markdown = lib.csdl2markdown(v + '.xml', input[v]);
//             check(markdown, expected[v]);
//         })
//     })

// })
//TODO: remove up to here

function check(actual, expected) {
    assert.deepStrictEqual(actual, expected.split(/\r\n|\r|\n/g), 'Markdown');
}