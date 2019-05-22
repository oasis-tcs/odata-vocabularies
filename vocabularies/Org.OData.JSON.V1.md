# JSON Vocabulary
**Namespace: [Org.OData.JSON.V1](Org.OData.JSON.V1.xml)**

Terms and functions for JSON properties


## Terms

Term|Type|Description
:---|:---|:----------
[Schema](Org.OData.JSON.V1.xml#L69)|[SchemaType](#SchemaType)|<a name="Schema"></a>The JSON Schema for this JSON property

## <a name="SchemaType"></a>[*SchemaType*](Org.OData.JSON.V1.xml#L74)
The JSON Schema can be referenced or provided inline

**Derived Types:**
- [SchemaReference](#SchemaReference)
- [SchemaInlined](#SchemaInlined)

## <a name="SchemaReference"></a>[SchemaReference](Org.OData.JSON.V1.xml#L78): [SchemaType](#SchemaType)


Property|Type|Description
:-------|:---|:----------
[ref](Org.OData.JSON.V1.xml#L79)|URL|URL to the JSON Schema for the annotated stream property

## <a name="SchemaInlined"></a>[SchemaInlined](Org.OData.JSON.V1.xml#L85): [SchemaType](#SchemaType)


Property|Type|Description
:-------|:---|:----------
[schema](Org.OData.JSON.V1.xml#L86)|String|JSON Schema for the annotated stream property
