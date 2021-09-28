# JSON Vocabulary
**Namespace: [Org.OData.JSON.V1](Org.OData.JSON.V1.xml)**

Terms for JSON properties


## Terms

Term|Type|Description
:---|:---|:----------
[Schema](./Org.OData.JSON.V1.xml#L67:~:text=<Term%20Name="-,Schema,-")|[JSON](#JSON)|<a name="Schema"></a>The JSON Schema for JSON values of the annotated property, parameter, return type, term, or type definition<br>The schema can be a schema reference, i.e. `{"$ref":"url/of/schemafile#/path/to/schema/within/schemafile"}`


## Functions

### <a name="query"></a>[query](./Org.OData.JSON.V1.xml#L75:~:text=<Function%20Name="-,query,-")

Query stream values of media type `application/json`, returning a stream value of media type `application/json`

Extracts a JSON value, such as an array, object, or a JSON scalar value (string, number, boolean, or `null`) from the `input` JSON value:
- If `path` only consists of child member and single subscript operators, it returns the identified single node within `input`, or `null` if no node is identified. 
- If `path` potentially identifies multiple nodes within `input` (by using recursive descendant, wildcard, array subset, or array filter expressions), it returns an array containing the identified nodes, or an empty array if no node is identified. 
- If `input` is not a valid JSON value, the function returns `null`.
- If `path` is `null`, not a valid [JSONPath expression](#Path), or does not match the structure of `input`, the function returns `null`. 
          

Parameter|Type|Description
:--------|:---|:----------
[input](./Org.OData.JSON.V1.xml#L85:~:text=<Function%20Name="-,query,-")|[JSON?](#JSON)|JSON input
[path](./Org.OData.JSON.V1.xml#L88:~:text=<Function%20Name="-,query,-")|[Path?](#Path)|JSONPath expression to be applied to value of `expr`
[&rarr;](./Org.OData.JSON.V1.xml#L91:~:text=<Function%20Name="-,query,-")|[JSON?](#JSON)|JSON value resulting from applying `path` to `input`


### <a name="value"></a>[value](./Org.OData.JSON.V1.xml#L96:~:text=<Function%20Name="-,value,-")

Query stream values of media type `application/json`, returning an OData primitive value

Extracts an OData primitive value from the `input` JSON value:
- If `path` only consists of child member and single subscript operators and identifies a single scalar JSON value (string, number, boolean, or `null`) within `input`, it returns the identified single value cast to an OData primitive value (see below).
- If `path` identifies multiple nodes within `input` (by using recursive descendant, wildcard, array subset, or array filter expressions), identifies an object or array, or does not identify any node, the function returns `null`.
- If `input` is not a valid JSON value, the function returns `null`.
- If `path` is `null`, not a valid [JSONPath expression](#Path), or does not match the structure of `input`, the function returns `null`.

If a single non-null scalar JSON value is identified by `path` within `input`, the function returns that value as a primitive value of type
- `Edm.String` if the value is a JSON string
- `Edm.Boolean` if the value is `true` or `false`
- `Edm.Decimal` with unspecified precision and floating scale if the value is a JSON number
          

Parameter|Type|Description
:--------|:---|:----------
[input](./Org.OData.JSON.V1.xml#L111:~:text=<Function%20Name="-,value,-")|[JSON?](#JSON)|JSON input
[path](./Org.OData.JSON.V1.xml#L114:~:text=<Function%20Name="-,value,-")|[Path?](#Path)|JSONPath expression to be applied to value of `expr`
[&rarr;](./Org.OData.JSON.V1.xml#L117:~:text=<Function%20Name="-,value,-")|PrimitiveType?|OData primitive value resulting from applying `path` to `input`


## <a name="JSON"></a>[JSON](./Org.OData.JSON.V1.xml#L122:~:text=<TypeDefinition%20Name="-,JSON,-")
**Type:** Stream

Textual data of media type `application/json`

## <a name="Path"></a>[Path](./Org.OData.JSON.V1.xml#L133:~:text=<TypeDefinition%20Name="-,Path,-")
**Type:** String

[JSONPath](https://datatracker.ietf.org/doc/html/draft-ietf-jsonpath-base-01) expression

Implementations SHOULD support at least the following subset of JSONPath:

_TODO: check which data sources support which subset, then reduce expressions_
- SQL Server: https://docs.microsoft.com/en-us/sql/relational-databases/json/json-path-expressions-sql-server?view=sql-server-2017
- SAP HANA: https://help.sap.com/products/SAP_HANA_PLATFORM/4fe29514fd584807ac9f2a04f6754767/3126ea33d50d42d19517a08fe22ec5a1.html?version=2.0.05#description
- Google BigQuery references the Java implementation - all of it supported?

JSONPath | Description | Examples
---------|-------------|--------
`$` | The root object, array, or value
`.` | Child member operator | `$.foo`, `$.foo.bar`
`..` | Recursive descendant operator: searches for the specified member name recursively and returns an array of all values with this property name | `$..foo`
`*` | Wildcard matching all elements in an object or array | `$.foo.*`, `$.bar[*]`
`[]` | Subscript operator, accepting names (single-quoted strings) or array indices (zero-based integers, negative integers count from the end of the array) | `$['foo']`, `$.foo['bar']`, `$.bar[0]`, `$.bar[-1]`
`[,]` | Union operator for alternate names or array indices as a set | `$.foo['bar','baz']`, `$.bar[0,1,2,3,5,7,11]`
`[start:end]` | Array subset by range of indices | `$.bar[2:4]`
`[start:]` | Array subset from index to end of array | `$.bar[2:]`
`[:end]` | Array subset from start of array to index | `$.bar[:4]`
`[-start:]` | Array subset from _length-start_ to end of array | `$.bar[-3:]`
`[?()]` | Filter expession | `$.bar[?(@.baz==42)]`
`[()]` | Static expression | `$.bar[(@.length-1)]`
`@` | in filter expressions: the current node being processed

**References**
- Current IETF draft: https://datatracker.ietf.org/doc/html/draft-ietf-jsonpath-base-01
- Historic site: https://goessner.net/articles/JsonPath/
- Node.js implementation: https://www.npmjs.com/package/jsonpath
- Java implementation: https://github.com/json-path/JsonPath
- Online evaluator: https://jsonpath.com/
          
