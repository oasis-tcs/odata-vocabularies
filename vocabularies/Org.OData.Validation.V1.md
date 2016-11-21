# Validation Vocabulary

Terms describing validation rules

**Namespace: Org.OData.Validation.V1**

<table width="100%" style="border: 1px solid #000000;" border="1">
<tbody><tr><th><strong>Term</strong></th><th><strong>Description</strong></th></tr>
<tr><td>Pattern</td>
<td>The pattern that a string property, parameter, or term must match. This SHOULD be a valid regular expression, according to the ECMA 262 regular expression dialect.</td></tr>
<tr><td>Minimum</td>
<td>Minimum value that a property, parameter, or term can have.</td></tr>
<tr><td>Maximum</td>
<td>Maximum value that a property, parameter, or term can have.</td></tr>
<tr><td>Exclusive</td>
<td>Tags a Minimum or Maximum as exclusive, i.e. an open interval boundary.</td></tr>
<tr><td>AllowedValues</td>
<td>A collection of valid values for the annotated property, parameter, or type definition</td></tr>
<tr><td>MultipleOf</td>
<td>The value of the annotated property, parameter, or term must be an integer multiple of this positive value. For temporal types, the value is measured in seconds.</td></tr>
</tbody></table>

[XML Source](Org.OData.Validation.V1.xml)