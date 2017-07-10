# Validation Vocabulary
**Namespace: [Org.OData.Validation.V1](Org.OData.Validation.V1.xml)**

Terms describing validation rules

Term|Type|Description
:---|:---|:----------
[Pattern](Org.OData.Validation.V1.xml#L65)|String|<a name="Pattern"></a>The pattern that a string property, parameter, or term must match. This SHOULD be a valid regular expression, according to the ECMA 262 regular expression dialect.
[Minimum](Org.OData.Validation.V1.xml#L71)|Decimal|<a name="Minimum"></a>Minimum value that a property, parameter, or term can have.
[Maximum](Org.OData.Validation.V1.xml#L75)|Decimal|<a name="Maximum"></a>Maximum value that a property, parameter, or term can have.
[Exclusive](Org.OData.Validation.V1.xml#L79)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Exclusive"></a>Tags a Minimum or Maximum as exclusive, i.e. an open interval boundary.
[AllowedValues](Org.OData.Validation.V1.xml#L83)|\[[AllowedValue](#AllowedValue)\]|<a name="AllowedValues"></a>A collection of valid values for the annotated property, parameter, or type definition
[MultipleOf](Org.OData.Validation.V1.xml#L92)|Decimal|<a name="MultipleOf"></a>The value of the annotated property, parameter, or term must be an integer multiple of this positive value. For temporal types, the value is measured in seconds.
[Constraint](Org.OData.Validation.V1.xml#L97)|[ConstraintType](#ConstraintType)|<a name="Constraint"></a>Condition that the annotation target has to fulfill
[ItemsOf](Org.OData.Validation.V1.xml#L111)|\[[ItemsOfType](#ItemsOfType)\]|<a name="ItemsOf"></a>A list of constraints describing that entities related via one navigation property MUST also be related via another, collection-valued navigation property. The same `path` value MUST NOT occur more than once.<p>Example: entity type `Customer` has navigation properties `AllOrders`, `OpenOrders`, and `ClosedOrders`.  The term allows to express that items of `OpenOrders` and `ClosedOrders` are also items of the `AllOrders` navigation property, even though they are defined in an `Orders` entity set.</p>
[OpenPropertyTypeConstraint](Org.OData.Validation.V1.xml#L131)|\[[QualifiedTypeName](Org.OData.Core.V1.md#QualifiedTypeName)\]|<a name="OpenPropertyTypeConstraint"></a>Dynamic properties added to the annotated open structured type are restricted to the listed types
[DerivedTypeConstraint](Org.OData.Validation.V1.xml#L136)|\[[QualifiedTypeName](Org.OData.Core.V1.md#QualifiedTypeName)\]|<a name="DerivedTypeConstraint"></a>Values are restricted to types derived from the declared type and listed in this collection<p>Types listed in this collection that are not derived form the declared type of the annotated model element are ignored</p>

## <a name="AllowedValue"></a>[AllowedValue](Org.OData.Validation.V1.xml#L86)


Property|Type|Description
:-------|:---|:----------
[Value](Org.OData.Validation.V1.xml#L87)|PrimitiveType|An allowed value for the property, parameter, or type definition

## <a name="ConstraintType"></a>[ConstraintType](Org.OData.Validation.V1.xml#L100)


Property|Type|Description
:-------|:---|:----------
[FailureMessage](Org.OData.Validation.V1.xml#L101)|String|Human-readable message that can be shown to end users if the constraint is not fulfilled
[Condition](Org.OData.Validation.V1.xml#L105)|Boolean|Value MUST be a dynamic expression that evaluates to true if and only if the constraint is fulfilled

## <a name="ItemsOfType"></a>[ItemsOfType](Org.OData.Validation.V1.xml#L120)
Entities related via the single- or collection-valued navigation property identified by `path` are also related via the collection-valued navigation property identified by `target`.

Property|Type|Description
:-------|:---|:----------
[path](Org.OData.Validation.V1.xml#L123)|NavigationPropertyPath|A path to a single- or collection-valued navigation property
[target](Org.OData.Validation.V1.xml#L126)|NavigationPropertyPath|A path to a or collection-valued navigation property
