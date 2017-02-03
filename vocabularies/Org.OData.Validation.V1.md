# Validation Vocabulary
**Namespace: [Org.OData.Validation.V1](Org.OData.Validation.V1.xml)**

Terms describing validation rules

Term|Type|Description
:---|:---|:----------
[Pattern](Org.OData.Validation.V1.xml#L51)|String|<a name="Pattern"></a>The pattern that a string property, parameter, or term must match. This SHOULD be a valid regular expression, according to the ECMA 262 regular expression dialect.
[Minimum](Org.OData.Validation.V1.xml#L57)|Decimal|<a name="Minimum"></a>Minimum value that a property, parameter, or term can have.
[Maximum](Org.OData.Validation.V1.xml#L61)|Decimal|<a name="Maximum"></a>Maximum value that a property, parameter, or term can have.
[Exclusive](Org.OData.Validation.V1.xml#L65)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Exclusive"></a>Tags a Minimum or Maximum as exclusive, i.e. an open interval boundary.
[AllowedValues](Org.OData.Validation.V1.xml#L69)|\[[AllowedValue](#AllowedValue)\]|<a name="AllowedValues"></a>A collection of valid values for the annotated property, parameter, or type definition
[MultipleOf](Org.OData.Validation.V1.xml#L79)|Decimal|<a name="MultipleOf"></a>The value of the annotated property, parameter, or term must be an integer multiple of this positive value. For temporal types, the value is measured in seconds.

## <a name="AllowedValue"></a>[AllowedValue](Org.OData.Validation.V1.xml#L73)


Property|Type|Description
:-------|:---|:----------
[Value](Org.OData.Validation.V1.xml#L74)|PrimitiveType|An allowed value for the property, parameter, or type definition
