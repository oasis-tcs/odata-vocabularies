# JSON Vocabulary
**Namespace: [Org.OData.JSON.V1](Org.OData.JSON.V1.xml)**

Terms, types, and functions for JSON data

OData [stream properties](https://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_ManagingStreamProperties) allow embedding data of arbitrary media types,
and the OData JSON format allows [direct embedding of JSON data](https://docs.oasis-open.org/odata/odata-json-format/v4.01/odata-json-format-v4.01.html#sec_StreamProperty) in request and response payloads.

This vocabulary defines a convenience [type for JSON data](#JSON) as well as a term for referencing a [JSON Schema](#Schema) describing the structure of the JSON data.

In addition it defines two functions for [querying](#query) JSON data and using a [primitive value](#value) extracted from JSON data in common expressions, for example in `$filter`, `$orderby`, or `$compute`.

**Example**

The `Employees` entity set has a JSON data property `resume`:
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

This allows to filter and sort by values in that resume, and extract parts of the resume as a dynamic JSON data property
```http
GET http://www.example.com/mycompany/Employees
      ?$filter=resume/JSON.value(path='$.lastname') eq 'Doe'
      &$orderby=resume/JSON.valueNumber(path='$.experience')
      &$compute=resume/JSON.query(path='$.address') as address
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
[Schema](./Org.OData.JSON.V1.xml#L151:~:text=<Term%20Name="-,Schema,-")|[JSON](#JSON)|<a name="Schema"></a>The JSON Schema for JSON values of the annotated media entity type, property, parameter, return type, term, or type definition<br>The schema can be a reference, i.e. `{"$ref":"url/of/schemafile#/path/to/schema/within/schemafile"}`


## Functions

<a name="query"></a>
### [query](./Org.OData.JSON.V1.xml#L160:~:text=<Function%20Name="-,query,-")

Query a stream value of media type `application/json`, returning a stream value of media type `application/json`

Extracts a JSON value, such as an array, object, or a JSON scalar value (string, number, boolean, or `null`) from the `input` JSON value:
- If `path` only consists of the root identifier followed by name and index selectors, it returns the identified single node within `input`, or `null` if no node is identified. 
- If `path` potentially identifies multiple nodes within `input` (by using descendant, wildcard, union, array subset, or filter selectors), it returns an array containing the identified nodes, or an empty array if no node is identified. 
- If `input` is not a valid JSON value, the function returns `null`.
- If `path` is `null`, not a valid [JSONPath expression](#Path), or does not match the structure of `input` (for example applying an index selector to a scalar value), the function returns `null`. 
          

Parameter|Type|Description
:--------|:---|:----------
**[input](./Org.OData.JSON.V1.xml#L171:~:text=<Function%20Name="-,query,-")**|[JSON?](#JSON)|**Binding parameter:** JSON input
[path](./Org.OData.JSON.V1.xml#L174:~:text=<Function%20Name="-,query,-")|[Path?](#Path)|JSONPath expression to be applied to value of `expr`
[&rarr;](./Org.OData.JSON.V1.xml#L178:~:text=<Function%20Name="-,query,-")|[JSON?](#JSON)|JSON value resulting from applying `path` to `input`


<a name="value"></a>
### [value](./Org.OData.JSON.V1.xml#L184:~:text=<Function%20Name="-,value,-")

Query a stream value of media type `application/json`, returning a string

Extracts a single OData primitive value from the `input` JSON value and casts it to a string:
- If `path` only consists of the root identifier followed by name and index selectors and identifies a single scalar JSON value (string, number, boolean, or `null`) within `input`, it returns the identified single value, cast to an OData primitive value (see below).
- If `path` identifies multiple nodes within `input` (by using descendant, wildcard, union, array subset, or filter selectors), identifies an object or array, or does not identify any node, the function returns `null`.
- If `input` is not a valid JSON value, the function returns `null`.
- If `path` is `null`, not a valid [JSONPath expression](#Path), or does not match the structure of `input` (for example applying an index selector to a scalar value), the function returns `null`.

Parameter|Type|Description
:--------|:---|:----------
**[input](./Org.OData.JSON.V1.xml#L194:~:text=<Function%20Name="-,value,-")**|[JSON?](#JSON)|**Binding parameter:** JSON input
[path](./Org.OData.JSON.V1.xml#L197:~:text=<Function%20Name="-,value,-")|[Path?](#Path)|JSONPath expression to be applied to value of `expr`
[&rarr;](./Org.OData.JSON.V1.xml#L201:~:text=<Function%20Name="-,value,-")|PrimitiveType?|String value resulting from applying `path` to `input`


<a name="valueNumber"></a>
### [valueNumber](./Org.OData.JSON.V1.xml#L206:~:text=<Function%20Name="-,valueNumber,-")

Query a stream value of media type `application/json`, returning a number

Like [`value`](#value), but casts the extracted value to an `Edm.Decimal` with unspecified precision and floating scale.
          Returns null if that cast fails.

Parameter|Type|Description
:--------|:---|:----------
**[input](./Org.OData.JSON.V1.xml#L212:~:text=<Function%20Name="-,valueNumber,-")**|[JSON?](#JSON)|**Binding parameter:** JSON input
[path](./Org.OData.JSON.V1.xml#L215:~:text=<Function%20Name="-,valueNumber,-")|[Path?](#Path)|JSONPath expression to be applied to value of `expr`
[&rarr;](./Org.OData.JSON.V1.xml#L218:~:text=<Function%20Name="-,valueNumber,-")|Decimal?|Numeric value resulting from applying `path` to `input`


<a name="valueBoolean"></a>
### [valueBoolean](./Org.OData.JSON.V1.xml#L222:~:text=<Function%20Name="-,valueBoolean,-")

Query a stream value of media type `application/json`, returning a Boolean

Like [`value`](#value), but casts the extracted value to an `Edm.Boolean`.
          Returns null if that cast fails.

Parameter|Type|Description
:--------|:---|:----------
**[input](./Org.OData.JSON.V1.xml#L228:~:text=<Function%20Name="-,valueBoolean,-")**|[JSON?](#JSON)|**Binding parameter:** JSON input
[path](./Org.OData.JSON.V1.xml#L231:~:text=<Function%20Name="-,valueBoolean,-")|[Path?](#Path)|JSONPath expression to be applied to value of `expr`
[&rarr;](./Org.OData.JSON.V1.xml#L234:~:text=<Function%20Name="-,valueBoolean,-")|Boolean?|Boolean value resulting from applying `path` to `input`


<a name="JSON"></a>
## [JSON](./Org.OData.JSON.V1.xml#L239:~:text=<TypeDefinition%20Name="-,JSON,-")
**Type:** Stream

Textual data of media type `application/json`

<a name="Path"></a>
## [Path](./Org.OData.JSON.V1.xml#L250:~:text=<TypeDefinition%20Name="-,Path,-")
**Type:** String

[JSONPath](https://datatracker.ietf.org/doc/html/rfc9535) expression

Implementations MUST support at least the following subset of JSONPath:

Syntax Element | Description | Examples
---------------|-------------|--------
`$` | [root identifier](https://datatracker.ietf.org/doc/html/rfc9535#root-identifier) | `$`
`[<selector>]` | [child segment](https://datatracker.ietf.org/doc/html/rfc9535#child-segment) selects one child of a node; contains one [name selector](https://datatracker.ietf.org/doc/html/rfc9535#name-selector) (single- or double-quoted string using JSON escaping rules) or [index selector](https://datatracker.ietf.org/doc/html/rfc9535#index-selector) (non-negative decimal integer) | `$['foo']`, `$.foo["bar"]`, `$.bar[0]`, `$.bar[42]`
`.name` | shorthand for `['name']` | `$.foo`, `$.foo.bar`, `$.bar[42].baz`

Implementations MAY in addition support other JSONPath constructs, for example:

Syntax Element | Description | Examples
---------------|-------------|--------
`[<selector>]` | index selector with negative integer array index (counts from the end of the array) | `$.bar[-1]`
`[<selectors>]` | non-empty, comma-separated sequence of selectors | `$.foo['bar','baz']`, `$.bar[0,1,2,3,5,7,11]`
`..[<selectors>]` | [descendant segment](https://datatracker.ietf.org/doc/html/rfc9535#descendant-segment): selects zero or more descendants of a node | `$.foo..["bar"]`
`..name` | shorthand for `..['name']` | `$.foo..bar`
`*` | [wildcard selector](https://datatracker.ietf.org/doc/html/rfc9535#name-selector): selects all children of a node | `$.foo[*]`, `$[*]`
`.*` | shorthand for `[*]` | `$.foo.*`, `$.*`
`..*` | shorthand for `..[*]` | `$.foo..*`, `$..*`
`[start:end]` | array subset by range of indices (including the item at _start_ and excluding the item at _end_ | `$.bar[2:5]`, same as `$.bar[2,3,4]`
`[start:]` | array subset from _start_ to end of array | `$.bar[2:]`
`[:n]` | the first _n_ array items | `$.bar[:4]`
`[-n:]` | the last _n_ array items | `$.bar[-3:]`
`[start:end:step]` | [array slice selector](https://datatracker.ietf.org/doc/html/rfc9535#slice) |
`[?<logical-expr>]` | [filter selector](https://datatracker.ietf.org/doc/html/rfc9535#filter-selector): selects particular children using a logical expression | 
`@` | [current node identifier](https://datatracker.ietf.org/doc/html/rfc9535#filter-selector) (valid only within filter selectors) | `$.bar[?@.baz==42]`

**References for JSONPath**
- RFC 9535: https://datatracker.ietf.org/doc/html/rfc9535
- Historic site: https://goessner.net/articles/JsonPath/
- Node.js implementation: https://www.npmjs.com/package/jsonpath
- Java implementation: https://github.com/json-path/JsonPath
- Online evaluator: https://jsonpath.com/
          
