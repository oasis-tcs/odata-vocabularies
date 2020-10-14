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

describe('Non-OASIS Vocabularies', function () {

    it('Non-OASIS Vocabulary referencing an OASIS Vocabulary', function () {
        const filename = 'Other.xml'
        const vocabulary = {
            $Version: '4.01',
            $Reference: {
                'https://oasis-tcs.github.io/odata-vocabularies/vocabularies/Org.OData.Core.V1.json': {
                    $Include: [{
                        $Namespace: 'Org.OData.Core.V1'
                    }]
                },
                'Another.xml': {
                    $Include: [{
                        $Namespace: 'com.acme.Another.v42',
                        $Alias: 'Another'
                    }]
                }
            },
            'com.acme.Other.v42': {
                $Alias: 'Other',
                '@Org.OData.Core.V1.Description': 'Other terms',
                Foo: {
                    $Kind: 'Term',
                    $Type: 'Org.OData.Core.V1.Tag',
                    '@Org.OData.Core.V1.Revisions': [
                        {
                            Kind: 'Deprecated',
                            Description: 'Use term `Foo` from the OASIS Core vocabulary instead'
                        }
                    ]
                },
                Bar: {
                    $Kind: 'Term',
                    $Type: 'Another.Type'
                }
            }
        }
        const expectedMarkdown = [
            '# Other Vocabulary',
            '**Namespace: [com.acme.Other.v42](Other.xml)**',
            '',
            'Other terms',
            '',
            '',
            '## Terms',
            '',
            'Term|Type|Description',
            ':---|:---|:----------',
            'Foo *(Deprecated)*|[Tag](https://github.com/oasis-tcs/odata-vocabularies/blob/master/vocabularies/Org.OData.Core.V1.md#Tag)|<a name=\"Foo\"></a>Use term `Foo` from the OASIS Core vocabulary instead',
            'Bar|[Type](Another.md#Type)|<a name=\"Bar\"></a>',
            ''
        ]
        const markdown = lib.csdl2markdown(filename, vocabulary);
        assert.deepStrictEqual(markdown, expectedMarkdown);
    })

    it('No references to other vocabularies', function () {
        const filename = 'Selfcontained.xml'
        const vocabulary = {
            $Version: '4.01',
            'com.acme.Selfcontained.v0': {
                Foo: {
                    $Kind: 'Term',
                    $Type: 'com.acme.Selfcontained.v0.Bar'
                }
            }
        }
        const expectedMarkdown = [
            '# Selfcontained Vocabulary',
            '**Namespace: [com.acme.Selfcontained.v0](Selfcontained.xml)**',
            '',
            undefined, // No Core.Description for vocabulary
            '',
            '',
            '## Terms',
            '',
            'Term|Type|Description',
            ':---|:---|:----------',
            'Foo|[Bar](#Bar)|<a name="Foo"></a>',
            ''
        ]
        const markdown = lib.csdl2markdown(filename, vocabulary);
        assert.deepStrictEqual(markdown, expectedMarkdown);
    })

    it('Reference without Include', function () {
        const filename = 'Funny.json'
        const vocabulary = {
            $Version: '4.01',
            $Reference: {
                '': {}
            },
            'Funny.v0': {
                Foo: {
                    $Kind: 'Term',
                    $Type: 'Edm.String',
                    '@com.sap.vocabularies.Common.v1.Experimental': true
                }
            }
        }
        const expectedMarkdown = [
            '# Funny Vocabulary',
            '**Namespace: [Funny.v0](Funny.json)**',
            '',
            undefined, // No Core.Description for vocabulary
            '',
            '',
            '## Terms',
            '',
            'Term|Type|Description',
            ':---|:---|:----------',
            'Foo *([Experimental](Common.md#Experimental))*|String|<a name="Foo"></a>',
            ''
        ]
        const markdown = lib.csdl2markdown(filename, vocabulary);
        assert.deepStrictEqual(markdown, expectedMarkdown);
    })

})

function check(actual, expected) {
    assert.deepStrictEqual(actual, expected.split(/\r\n|\r|\n/g), 'Markdown');
}