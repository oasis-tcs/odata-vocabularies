const assert = require("assert");
const fs = require("fs");

const csdl = require("odata-csdl");
const lib = require("../lib/csdl2markdown");

const input = {};
const expected = {};

const vocabularies = [
  "Aggregation",
  "Authorization",
  "Capabilities",
  "Core",
  "Measures",
  "Repeatability",
  "Temporal",
  "Validation",
];

vocabularies.forEach((v) => {
  const vocab = `Org.OData.${v}.V1`;
  input[`${vocab}.xml`] = csdl.xml2json(
    fs.readFileSync(`vocabularies/${vocab}.xml`),
    { lineNumbers: true }
  );
  expected[v] = fs.readFileSync(`vocabularies/${vocab}.md`, "utf8");
});

describe("OASIS Vocabularies", function () {
  it("Validation without potentially referenced vocabularies", function () {
    const filename = "Org.OData.Validation.V1.xml";
    const markdown = lib.csdl2markdown(filename, input[filename]);
    check(markdown, expected.Validation);
  });

  vocabularies.forEach((v) => {
    it(v, function () {
      const filename = `Org.OData.${v}.V1.xml`;
      const markdown = lib.csdl2markdown(filename, input[filename], input);
      check(markdown, expected[v]);
    });
  });
});

describe("Non-OASIS Vocabularies", function () {
  it("Non-OASIS Vocabulary referencing an OASIS Vocabulary", function () {
    const filename = "Other.xml";
    const vocabulary = {
      $Version: "4.01",
      $Reference: {
        "https://oasis-tcs.github.io/odata-vocabularies/vocabularies/Org.OData.Core.V1.json":
          {
            $Include: [
              {
                $Namespace: "Org.OData.Core.V1",
              },
            ],
          },
        "Another.xml": {
          $Include: [
            {
              $Namespace: "com.acme.Another.v42",
              $Alias: "Another",
            },
          ],
        },
      },
      "com.acme.Other.v42": {
        $Alias: "Other",
        "@Org.OData.Core.V1.Description": "Other terms",
        Foo: {
          $Kind: "Term",
          $Type: "Org.OData.Core.V1.Tag",
          "@Org.OData.Core.V1.Revisions": [
            {
              Kind: "Deprecated",
              Description:
                "Use term `Foo` from the OASIS Core vocabulary instead",
            },
          ],
        },
        Bar: {
          $Kind: "Term",
          $Type: "Another.Type",
        },
      },
    };
    const expectedMarkdown = [
      "# Other Vocabulary",
      "**Namespace: [com.acme.Other.v42](Other.xml)**",
      "",
      "Other terms",
      "",
      "",
      "## Terms",
      "",
      "Term|Type|Description",
      ":---|:---|:----------",
      'Foo *(Deprecated)*|[Tag](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Core.V1.md#Tag)|<a name="Foo"></a>Use term `Foo` from the OASIS Core vocabulary instead',
      'Bar|[Type](Another.md#Type)|<a name="Bar"></a>',
      "",
    ];
    const markdown = lib.csdl2markdown(filename, vocabulary);
    assert.deepStrictEqual(markdown, expectedMarkdown);
  });

  it("No references to other vocabularies", function () {
    const filename = "SelfContained.xml";
    const vocabulary = {
      $Version: "4.01",
      "com.acme.SelfContained.v0": {
        Foo: {
          $Kind: "Term",
          $Type: "com.acme.SelfContained.v0.Bar",
        },
      },
    };
    const expectedMarkdown = [
      "# SelfContained Vocabulary",
      "**Namespace: [com.acme.SelfContained.v0](SelfContained.xml)**",
      "",
      "", // No Core.Description for vocabulary
      "",
      "",
      "## Terms",
      "",
      "Term|Type|Description",
      ":---|:---|:----------",
      'Foo|[Bar](#Bar)|<a name="Foo"></a>',
      "",
    ];
    const markdown = lib.csdl2markdown(filename, vocabulary);
    assert.deepStrictEqual(markdown, expectedMarkdown);
  });

  it("Reference without Include", function () {
    const filename = "Funny.json";
    const vocabulary = {
      $Version: "4.01",
      $Reference: {
        "": {},
      },
      "Funny.v0": {
        Foo: {
          $Kind: "Term",
          $Type: "Edm.String",
          "@com.sap.vocabularies.Common.v1.Experimental": true,
        },
      },
    };
    const expectedMarkdown = [
      "# Funny Vocabulary",
      "**Namespace: [Funny.v0](Funny.json)**",
      "",
      "", // No Core.Description for vocabulary
      "",
      "",
      "## Terms",
      "",
      "Term|Type|Description",
      ":---|:---|:----------",
      'Foo *([Experimental](Common.md#Experimental))*|String|<a name="Foo"></a>',
      "",
    ];
    const markdown = lib.csdl2markdown(filename, vocabulary);
    assert.deepStrictEqual(markdown, expectedMarkdown);
  });

  it("Deprecated complex type", function () {
    const filename = "volatile.xml";
    const vocabulary = {
      $Version: "4.01",
      "Volatile.v42": {
        $Alias: "vola",
        "@Org.OData.Core.V1.Description": "Volatile terms",
        New: {
          $Kind: "ComplexType",
          bar: {},
        },
        Old: {
          $Kind: "ComplexType",
          "@Org.OData.Core.V1.Revisions": [
            {
              Kind: "Deprecated",
              Description: "Use type `New` instead",
            },
          ],
          bar: {},
        },
      },
    };
    const expectedMarkdown = [
      "# Volatile Vocabulary",
      "**Namespace: [Volatile.v42](volatile.xml)**",
      "",
      "Volatile terms",
      "",
      '## <a name="New"></a>New',
      "",
      "",
      "Property|Type|Description",
      ":-------|:---|:----------",
      "bar|String|",
      "",
      '## <a name="Old"></a>Old *(Deprecated)*',
      "Use type `New` instead",
      "",
    ];
    const markdown = lib.csdl2markdown(filename, vocabulary);
    assert.deepStrictEqual(markdown, expectedMarkdown);
  });

  it("Annotation path", function () {
    const filename = "volatile.xml";
    const vocabulary = {
      $Version: "4.01",
      $Reference: {
        "https://oasis-tcs.github.io/odata-vocabularies/vocabularies/Org.OData.Core.V1.json":
          {
            $Include: [
              {
                $Namespace: "Org.OData.Core.V1",
                $Alias: "Core",
              },
            ],
          },
      },
      "com.acme.test.annotationPath": {
        "@Core.Description": "Annotation paths",
        Reference: {
          $Kind: "Term",
          $Type: "Edm.AnnotationPath",
          "@Core.Description": "Reference to a description",
          "@Org.OData.Validation.V1.AllowedTerms": [
            "Org.OData.Core.V1.Description",
          ],
        },
      },
    };
    const expectedMarkdown = [
      "# test Vocabulary",
      "**Namespace: [com.acme.test.annotationPath](volatile.xml)**",
      "",
      "Annotation paths",
      "",
      "",
      "## Terms",
      "",
      "Term|Type|Description",
      ":---|:---|:----------",
      'Reference|AnnotationPath|<a name="Reference"></a>Reference to a description<br>Allowed terms:<br>- [Description](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Core.V1.md#Description)',
      "",
    ];
    const markdown = lib.csdl2markdown(filename, vocabulary);
    assert.deepStrictEqual(markdown, expectedMarkdown);
  });

  it("Text fragments", function () {
    const filename = "overload.tst.xml";
    const expectedMarkdown = [
      "# test Vocabulary",
      "**Namespace: [com.acme.test.overload1](overload.tst.xml)**",
      "",
      "Test case with multiple overloads",
      "",
      "",
      "## Functions",
      "",
      '### <a name="condense"></a>[condense](./overload.tst.xml#L11:~:text=<Function%20Name="-,condense,-")',
      "",
      "Overload 1",
      "",
      "Parameter|Type|Description",
      ":--------|:---|:----------",
      '**[InputSet](./overload.tst.xml#L13:~:text=<Function%20Name="-,condense,-")**|\\[EntityType\\]|**Binding parameter**',
      '[&rarr;](./overload.tst.xml#L14:~:text=<Function%20Name="-,condense,-")|\\[EntityType\\]|',
      "",
      "",
      '### <a name="condense"></a>[condense](./overload.tst.xml#L16) *(Deprecated)*',
      "Deprecated in favor of overload 1",
      "",
    ];
    const markdown = lib.csdl2markdown(
      filename,
      csdl.xml2json(fs.readFileSync("test/" + filename, "utf8"), {
        lineNumbers: true,
      })
    );
    assert.deepStrictEqual(markdown, expectedMarkdown);
  });
});

describe("Edge cases", function () {
  let warnings = [];
  let warn;
  beforeEach(function () {
    warn = console.warn;
    warnings = [];
    console.warn = (args) => warnings.push(args);
  });
  afterEach(function () {
    console.warn = warn;
  });

  it("Unknown base type", function () {
    const filename = "unknownBase.xml";
    const vocabulary = {
      $Version: "4.01",
      "Weird.v8": {
        Derived: {
          $Kind: "ComplexType",
          $BaseType: "other.notThere",
        },
      },
    };
    const expectedMarkdown = [
      "# Weird Vocabulary",
      "**Namespace: [Weird.v8](unknownBase.xml)**",
      "",
      "",
      "",
      '## <a name="Derived"></a>Derived: [notThere](#notThere)',
      "",
      "",
    ];
    const markdown = lib.csdl2markdown(filename, vocabulary);
    assert.deepStrictEqual(markdown, expectedMarkdown);
    assert.deepStrictEqual(warnings, [
      "- Cannot find 'other.notThere'",
      "- Cannot find 'other.notThere'",
    ]);
  });

  it("Functions", function () {
    const filename = "function.xml";
    const vocabulary = {
      $Version: "4.01",
      "Fun.v12": {
        NoParams: [
          {
            $Kind: "Function",
            $ReturnType: {},
          },
        ],
        DeprecatedParam: [
          {
            $Kind: "Function",
            $Parameter: [
              {
                $Name: "DoNotUse",
                "@Org.OData.Core.V1.Revisions": [
                  {
                    Kind: "Deprecated",
                    Description: "Do not use any more",
                  },
                ],
              },
            ],
            $ReturnType: {},
          },
        ],
        OptionalParam: [
          {
            $Kind: "Function",
            $Parameter: [
              {
                $Name: "ProvideOrOmit",
                "@Org.OData.Core.V1.OptionalParameter": { DefaultValue: "42" },
              },
            ],
            $ReturnType: {},
          },
        ],
      },
    };
    const expectedMarkdown = [
      "# Fun Vocabulary",
      "**Namespace: [Fun.v12](function.xml)**",
      "",
      "",
      "",
      "",
      "## Functions",
      "",
      '### <a name="NoParams"></a>NoParams',
      "",
      "",
      "",
      "Parameter|Type|Description",
      ":--------|:---|:----------",
      "&rarr;|String|",
      "",
      "",
      '### <a name="DeprecatedParam"></a>DeprecatedParam',
      "",
      "",
      "",
      "Parameter|Type|Description",
      ":--------|:---|:----------",
      "DoNotUse *(Deprecated)*|String|Do not use any more",
      "&rarr;|String|",
      "",
      "",
      '### <a name="OptionalParam"></a>OptionalParam',
      "",
      "",
      "",
      "Parameter|Type|Description",
      ":--------|:---|:----------",
      "*ProvideOrOmit*|String|*Optional parameter*",
      "&rarr;|String|",

      "",
      "",
    ];
    const markdown = lib.csdl2markdown(filename, vocabulary);
    assert.deepStrictEqual(markdown, expectedMarkdown);
  });
});

function check(actual, expected) {
  assert.deepStrictEqual(actual, expected.split(/\r\n|\r|\n/g), "Markdown");
}
