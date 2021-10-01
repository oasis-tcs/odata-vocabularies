# JSON Vocabulary
**Namespace: [Org.OData.JSON.V1](Org.OData.JSON.V1.xml)**

Terms, types, and functions for JSON properties



> Motivation from OData Extension for JSON Data - A Directional White Paper   

> Example schema - separate files, link here, show excerpt

**Example**

The `Employees` entity set has a property `resume` of type `JSON.JSON`, and one of its entities has a `resume` of
```json
{ 
  "ssn": "1234", 
  "lastname": "Doe", 
  "address": {
    "zipcode": "10022", 
    "street": "ABC st"
  },
  "experience": "excellent", 
  ...
  }
```

This allows to
```http
GET http://www.example.com/mycompany/Employees
      ?$filter=JSON.value(resume,'$.lastname') eq 'Doe'
      &$orderby=JSON.value(resume,'$.experience')
      &$compute=JSON.query(resume,'$.address') as address
      &$expand=address
```
        


## Terms

Term|Type|Description
:---|:---|:----------
[Schema](./Org.OData.JSON.V1.xml#L101:~:text=<Term%20Name="-,Schema,-")|[JSON](#JSON)|<a name="Schema"></a>The JSON Schema for JSON values of the annotated property, parameter, return type, term, or type definition<br>The schema can be a schema reference, i.e. `{"$ref":"url/of/schemafile#/path/to/schema/within/schemafile"}`


## Functions

### <a name="query"></a>[query](./Org.OData.JSON.V1.xml#L109:~:text=<Function%20Name="-,query,-")

Query stream values of media type `application/json`, returning a stream value of media type `application/json`

Extracts a JSON value, such as an array, object, or a JSON scalar value (string, number, boolean, or `null`) from the `input` JSON value:
- If `path` only consists of the root selector followed by member and index selectors, it returns the identified single node within `input`, or `null` if no node is identified. 
- If `path` potentially identifies multiple nodes within `input` (by using descendant, wildcard, union, array subset, or filter selectors), it returns an array containing the identified nodes, or an empty array if no node is identified. 
- If `input` is not a valid JSON value, the function returns `null`.
- If `path` is `null`, not a valid [JSONPath expression](#Path), or does not match the structure of `input` (for example applying an index selector to a scalar value), the function returns `null`. 
          

Parameter|Type|Description
:--------|:---|:----------
[input](./Org.OData.JSON.V1.xml#L119:~:text=<Function%20Name="-,query,-")|[JSON?](#JSON)|JSON input
[path](./Org.OData.JSON.V1.xml#L122:~:text=<Function%20Name="-,query,-")|[Path?](#Path)|JSONPath expression to be applied to value of `expr`
[&rarr;](./Org.OData.JSON.V1.xml#L125:~:text=<Function%20Name="-,query,-")|[JSON?](#JSON)|JSON value resulting from applying `path` to `input`


### <a name="value"></a>[value](./Org.OData.JSON.V1.xml#L130:~:text=<Function%20Name="-,value,-")

Query stream values of media type `application/json`, returning an OData primitive value

Extracts a single OData primitive value from the `input` JSON value:
- If `path` only consists of the root selector followed by member and index selectors and identifies a single scalar JSON value (string, number, boolean, or `null`) within `input`, it returns the identified single value cast to an OData primitive value (see below).
- If `path` identifies multiple nodes within `input` (by using descendant, wildcard, union, array subset, or filter selectors), identifies an object or array, or does not identify any node, the function returns `null`.
- If `input` is not a valid JSON value, the function returns `null`.
- If `path` is `null`, not a valid [JSONPath expression](#Path), or does not match the structure of `input` (for example applying an index selector to a scalar value), the function returns `null`.

If a single non-null scalar JSON value is identified by `path` within `input`, the function returns that value as an OData primitive value of type
- `Edm.String` if the value is a JSON string
- `Edm.Boolean` if the value is `true` or `false`
- `Edm.Decimal` with unspecified precision and floating scale if the value is a JSON number
          

Parameter|Type|Description
:--------|:---|:----------
[input](./Org.OData.JSON.V1.xml#L145:~:text=<Function%20Name="-,value,-")|[JSON?](#JSON)|JSON input
[path](./Org.OData.JSON.V1.xml#L148:~:text=<Function%20Name="-,value,-")|[Path?](#Path)|JSONPath expression to be applied to value of `expr`
[&rarr;](./Org.OData.JSON.V1.xml#L151:~:text=<Function%20Name="-,value,-")|PrimitiveType?|OData primitive value resulting from applying `path` to `input`


## <a name="JSON"></a>[JSON](./Org.OData.JSON.V1.xml#L156:~:text=<TypeDefinition%20Name="-,JSON,-")
**Type:** Stream

Textual data of media type `application/json`

## <a name="Path"></a>[Path](./Org.OData.JSON.V1.xml#L167:~:text=<TypeDefinition%20Name="-,Path,-")
**Type:** String

[JSONPath](https://datatracker.ietf.org/doc/html/draft-ietf-jsonpath-base-01) expression

Implementations SHOULD support at least the following subset of JSONPath:

JSONPath | Description | Examples
---------|-------------|--------
`$` | Root selector | `$`
`.` | Member selector | `$.foo`, `$.foo.bar`
`[]` | Index selector with member name (single- or double-quoted string using JSON escaping rules) or zero-based array index (non-negative base-10 integer) | `$['foo']`, `$.foo["bar"]`, `$.bar[0]`, `$.bar[42]`

Implementations MAY support in addition:

JSONPath | Description | Examples
---------|-------------|--------
`[]` | Index selector with negative integer array index (counts from the end of the array) | `$.bar[-1]`
`..` | Descendant selector: searches for the specified member name recursively and returns an array of all values with this member name | `$..foo`
`*` | Wildcard selector matching all elements in an object or array | `$.foo.*`, `$.bar[*]`, `$..*`
`[,]` | Union selector for alternate member names or array indices as a set | `$.foo['bar','baz']`, `$.bar[0,1,2,3,5,7,11]`
`[start:end]` | Array subset by range of indices (including the item at _start_ and excluding the item at _end_ | `$.bar[2:5]`, same as `$.bar[2,3,4]`
`[start:]` | Array subset from _start_ to end of array | `$.bar[2:]`
`[:n]` | The first _n_ array items | `$.bar[:4]`
`[-n:]` | The last _n_ array items | `$.bar[-3:]`
`[start:end:step]` | [Array slice selector](https://datatracker.ietf.org/doc/html/draft-ietf-jsonpath-base-01#section-3.5.6) |
`[?()]` | Filter selector | `$.bar[?(@.baz==42)]`
`()` | Static expression | `$.bar[(@.length-1)]`
`@` | in expressions: the current node being processed

**References**
- Current IETF draft: https://datatracker.ietf.org/doc/html/draft-ietf-jsonpath-base-01
- Historic site: https://goessner.net/articles/JsonPath/
- Node.js implementation: https://www.npmjs.com/package/jsonpath
- Java implementation: https://github.com/json-path/JsonPath
- Online evaluator: https://jsonpath.com/
          
