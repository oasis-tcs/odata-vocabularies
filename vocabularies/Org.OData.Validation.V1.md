# Validation Vocabulary

Terms describing validation rules

**Namespace: Org.OData.Validation.V1**

Term|Description
----|-----------
Pattern|The pattern that a string property, parameter, or term must match. This SHOULD be a valid regular expression, according to the ECMA 262 regular expression dialect.
Minimum|Minimum value that a property, parameter, or term can have.
Maximum|Maximum value that a property, parameter, or term can have.
Exclusive|Tags a Minimum or Maximum as exclusive, i.e. an open interval boundary.
AllowedValues|A collection of valid values for the annotated property, parameter, or type definition
MultipleOf|The value of the annotated property, parameter, or term must be an integer multiple of this positive value. For temporal types, the value is measured in seconds.

[XML Source](Org.OData.Validation.V1.xml)