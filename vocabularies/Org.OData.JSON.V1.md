# JSON Vocabulary
**Namespace: [Org.OData.JSON.V1](Org.OData.JSON.V1.xml)**

Terms, types, and functions for JSON streams

OData [stream properties](https://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_ManagingStreamProperties) allow embedding data of arbitrary media types,
and the OData JSON format allows [direct embedding of JSON data](https://docs.oasis-open.org/odata/odata-json-format/v4.01/odata-json-format-v4.01.html#sec_StreamProperty) in request and response payloads.
          
This vocabulary defines a convenience [type for JSON streams](#JSON) streams as well as a term for referencing a [JSON Schema](#Schema) describing the structure of the JSON stream. 

In addition it defines two functions for [querying](#query) JSON streams and using a [primitive value](#value) extracted from a JSON stream in common expressions, for example in `$filter`, `$orderby`, or `$compute`.

**Example**

The `Employees` entity set has a JSON stream property `resume`:
```json
"container": {
  "$Kind": "EntityContainer",
  "Employees": { "$Collection": true, "$Type": "this.Employee" }
},
"Employee": {
  "$Kind": "EntityType",
  "$Key": ["empid"],
  "empid": { "$Type": "Edm.Int32" },
  "resume": { "$Type": "JSON.JSON", "$Nullable": true }
}
```

One of its entities has a `resume` value of
```json
{ 
  "ssn": "1234", 
  "lastname": "Doe", 
  "address": {
    "zipcode": "10022", 
    "street": "ABC st"
  },
  "experience": "excellent"
}
```

This allows to filter and sort by values in that resume, and extract parts of the resume as a dynamic JSON stream property
```http
GET http://www.example.com/mycompany/Employees
      ?$filter=resume/JSON.value('$.lastname') eq 'Doe'
      &$orderby=resume/JSON.value('$.experience')
      &$compute=resume/JSON.query('$.address') as address
      &$expand=address
```
receiving
```json
{ 
  "@odata.context": "$metadata#Employees", 
  "value": [ 
    {
      "empid": 4711,
      "address": {
        "zipcode": "10022", 
        "street": "ABC st"
      }
    },
    ...
  ]
}
```
        


## Terms

Term|Type|Description
:---|:---|:----------
[Schema](./Org.OData.JSON.V1.xml#L131:~:text=<Term%20Name="-,Schema,-")|[JSON](#JSON)|<a name="Schema"></a>The JSON Schema for JSON values of the annotated media entity type, property, parameter, return type, term, or type definition<br>The schema can be a reference, i.e. `{"$ref":"url/of/schemafile#/path/to/schema/within/schemafile"}`


## Functions

<a name="query"></a>
### [query](./Org.OData.JSON.V1.xml#L139:~:text=<Function%20Name="-,query,-")

Query a stream value of media type `application/json`, returning a stream value of media type `application/json`

Extracts a JSON value, such as an array, object, or a JSON scalar value (string, number, boolean, or `null`) from the `input` JSON value:
- If `path` only consists of the root identifier followed by name and index selectors, it returns the identified single node within `input`, or `null` if no node is identified. 
- If `path` potentially identifies multiple nodes within `input` (by using descendant, wildcard, union, array subset, or filter selectors), it returns an array containing the identified nodes, or an empty array if no node is identified. 
- If `input` is not a valid JSON value, the function returns `null`.
- If `path` is `null`, not a valid [JSONPath expression](#Path), or does not match the structure of `input` (for example applying an index selector to a scalar value), the function returns `null`. 
          

Parameter|Type|Description
:--------|:---|:----------
**[input](./Org.OData.JSON.V1.xml#L149:~:text=<Function%20Name="-,query,-")**|[JSON?](#JSON)|**Binding parameter:** JSON input
[path](./Org.OData.JSON.V1.xml#L152:~:text=<Function%20Name="-,query,-")|[Path?](#Path)|JSONPath expression to be applied to value of `expr`
[&rarr;](./Org.OData.JSON.V1.xml#L155:~:text=<Function%20Name="-,query,-")|[JSON?](#JSON)|JSON value resulting from applying `path` to `input`


<a name="value"></a>
### [value](./Org.OData.JSON.V1.xml#L160:~:text=<Function%20Name="-,value,-")

Query a stream value of media type `application/json`, returning an OData primitive value

Extracts a single OData primitive value from the `input` JSON value:
- If `path` only consists of the root identifier followed by name and index selectors and identifies a single scalar JSON value (string, number, boolean, or `null`) within `input`, it returns the identified single value cast to an OData primitive value (see below).
- If `path` identifies multiple nodes within `input` (by using descendant, wildcard, union, array subset, or filter selectors), identifies an object or array, or does not identify any node, the function returns `null`.
- If `input` is not a valid JSON value, the function returns `null`.
- If `path` is `null`, not a valid [JSONPath expression](#Path), or does not match the structure of `input` (for example applying an index selector to a scalar value), the function returns `null`.

If a single non-null scalar JSON value is identified by `path` within `input`, the function returns that value as an OData primitive value of type
- `Edm.String` if the value is a JSON string
- `Edm.Boolean` if the value is `true` or `false`
- `Edm.Decimal` with unspecified precision and floating scale if the value is a JSON number
          

Parameter|Type|Description
:--------|:---|:----------
**[input](./Org.OData.JSON.V1.xml#L175:~:text=<Function%20Name="-,value,-")**|[JSON?](#JSON)|**Binding parameter:** JSON input
[path](./Org.OData.JSON.V1.xml#L178:~:text=<Function%20Name="-,value,-")|[Path?](#Path)|JSONPath expression to be applied to value of `expr`
[&rarr;](./Org.OData.JSON.V1.xml#L181:~:text=<Function%20Name="-,value,-")|PrimitiveType?|OData primitive value resulting from applying `path` to `input`


<a name="JSON"></a>
## [JSON](./Org.OData.JSON.V1.xml#L186:~:text=<TypeDefinition%20Name="-,JSON,-")
**Type:** Stream

Textual data of media type `application/json`

<a name="Path"></a>
## [Path](./Org.OData.JSON.V1.xml#L197:~:text=<TypeDefinition%20Name="-,Path,-")
**Type:** String

[JSONPath](https://www.ietf.org/archive/id/draft-ietf-jsonpath-base-20.html) expression

Implementations SHOULD support at least the following subset of JSONPath:

Syntax Element | Description | Examples
---------------|-------------|--------
`$` | [root identifier](https://www.ietf.org/archive/id/draft-ietf-jsonpath-base-20.html#root-identifier) | `$`
`[<selector>]` | [child segment](https://www.ietf.org/archive/id/draft-ietf-jsonpath-base-20.html#child-segment) selects one child of a node; contains one [name selector](https://www.ietf.org/archive/id/draft-ietf-jsonpath-base-20.html#name-selector) (single- or double-quoted string using JSON escaping rules) or [index selector](https://www.ietf.org/archive/id/draft-ietf-jsonpath-base-20.html#index-selector) (non-negative decimal integer) | `$['foo']`, `$.foo["bar"]`, `$.bar[0]`, `$.bar[42]`
`.name` | shorthand for `['name']` | `$.foo`, `$.foo.bar`, `$.bar[42].baz`

Implementations MAY in addition support other JSONPath constructs, for example:

Syntax Element | Description | Examples
---------------|-------------|--------
`[<selector>]` | index selector with negative integer array index (counts from the end of the array) | `$.bar[-1]`
`[<selectors>]` | non-empty, comma-separated sequence of selectors | `$.foo['bar','baz']`, `$.bar[0,1,2,3,5,7,11]`
`..[<selectors>]` | [descendant segment](https://www.ietf.org/archive/id/draft-ietf-jsonpath-base-20.html#descendant-segment): selects zero or more descendants of a node; contains one or more selectors, separated by commas | `$.foo..["bar"]`
`..name` | shorthand for `..['name']` | `$.foo..bar`
`*` | [wildcard selector](https://www.ietf.org/archive/id/draft-ietf-jsonpath-base-20.html#name-selector): selects all children of a node | `$.foo[*]`, `$[*]`
`.*` | shorthand for `[*]` | `$.foo.*`, `$.*`
`..*` | shorthand for `..[*]` | `$.foo..*`, `$..*`
`[start:end]` | array subset by range of indices (including the item at _start_ and excluding the item at _end_ | `$.bar[2:5]`, same as `$.bar[2,3,4]`
`[start:]` | array subset from _start_ to end of array | `$.bar[2:]`
`[:n]` | the first _n_ array items | `$.bar[:4]`
`[-n:]` | the last _n_ array items | `$.bar[-3:]`
`[start:end:step]` | [array slice selector](https://www.ietf.org/archive/id/draft-ietf-jsonpath-base-20.html#slice) |
`[?<logical-expr>]` | [filter selector](): selects particular children using a logical expression | 
`@` | [current node identifier](https://www.ietf.org/archive/id/draft-ietf-jsonpath-base-20.html#filter-selector) (valid only within filter selectors) | `$.bar[?@.baz==42]`

**References for JSONPath**
- Current IETF draft: https://datatracker.ietf.org/doc/draft-ietf-jsonpath-base/
- Historic site: https://goessner.net/articles/JsonPath/
- Node.js implementation: https://www.npmjs.com/package/jsonpath
- Java implementation: https://github.com/json-path/JsonPath
- Online evaluator: https://jsonpath.com/
          
