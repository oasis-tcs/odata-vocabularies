# JSON Vocabulary
**Namespace: [Org.OData.JSON.V1](Org.OData.JSON.V1.xml)**

Terms for JSON properties


## Terms

Term|Type|Description
:---|:---|:----------
[Schema](./Org.OData.JSON.V1.xml#L67:~:text=<Term%20Name="-,Schema,-")|[JSON](#JSON)|<a name="Schema"></a>The JSON Schema for JSON values of the annotated property, parameter, return type, term, or type definition<br>The schema can be a schema reference, i.e. `{"$ref":"url/of/schemafile#/path/to/schema/within/schemafile"}`


## Functions

### <a name="query"></a>[query](./Org.OData.JSON.V1.xml#L75:~:text=<Function%20Name="-,query,-")

Query stream values of media type `application/json`

Extracts a JSON value, such as an array or object, or a JSON scalar value, such as a string, number, or boolean.

_TODO: describe behavior and edge cases, especially null handling_
          

Parameter|Type|Description
:--------|:---|:----------
[input](./Org.OData.JSON.V1.xml#L83:~:text=<Function%20Name="-,query,-")|[JSON?](#JSON)|JSON input
[path](./Org.OData.JSON.V1.xml#L86:~:text=<Function%20Name="-,query,-")|[Path](#Path)|JSONPath expression to be applied to value of `expr`
[&rarr;](./Org.OData.JSON.V1.xml#L89:~:text=<Function%20Name="-,query,-")|[JSON?](#JSON)|JSON value resulting from applying `path` to `input`


## <a name="JSON"></a>[JSON](./Org.OData.JSON.V1.xml#L96:~:text=<TypeDefinition%20Name="-,JSON,-")
**Type:** Stream

Textual data of media type `application/json`

## <a name="Path"></a>[Path](./Org.OData.JSON.V1.xml#L107:~:text=<TypeDefinition%20Name="-,Path,-")
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
          
