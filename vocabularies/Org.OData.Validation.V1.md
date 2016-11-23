# Validation Vocabulary

Terms describing validation rules

**Namespace: [Org.OData.Validation.V1](Org.OData.Validation.V1.xml)**

Term|Type|Description
----|----|-----------
Pattern|Edm.String|The pattern that a string property, parameter, or term must match. This SHOULD be a valid regular expression, according to the ECMA 262 regular expression dialect.
Minimum|Edm.Decimal|Minimum value that a property, parameter, or term can have.
Maximum|Edm.Decimal|Maximum value that a property, parameter, or term can have.
Exclusive|Core.Tag|Tags a Minimum or Maximum as exclusive, i.e. an open interval boundary.
AllowedValues|Collection(Validation.AllowedValue)|A collection of valid values for the annotated property, parameter, or type definition
MultipleOf|Edm.Decimal|The value of the annotated property, parameter, or term must be an integer multiple of this positive value. For temporal types, the value is measured in seconds.


## <a name="AllowedValue"></a>AllowedValue

