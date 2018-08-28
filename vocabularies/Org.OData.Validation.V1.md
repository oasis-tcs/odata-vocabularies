# Validation Vocabulary
**Namespace: [Org.OData.Validation.V1](Org.OData.Validation.V1.xml)**

Terms describing validation rules


## Terms

Term|Type|Description
:---|:---|:----------
[Pattern](Org.OData.Validation.V1.xml#L70)|String|<a name="Pattern"></a>The pattern that a string property, parameter, or term must match. This SHOULD be a valid regular expression, according to the ECMA 262 regular expression dialect.
[Minimum](Org.OData.Validation.V1.xml#L76)|Decimal|<a name="Minimum"></a>Minimum value that a property, parameter, or term can have.
[Maximum](Org.OData.Validation.V1.xml#L80)|Decimal|<a name="Maximum"></a>Maximum value that a property, parameter, or term can have.
[Exclusive](Org.OData.Validation.V1.xml#L84)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Exclusive"></a>Tags a Minimum or Maximum as exclusive, i.e. an open interval boundary.
[AllowedValues](Org.OData.Validation.V1.xml#L88)|\[[AllowedValue](#AllowedValue)\]|<a name="AllowedValues"></a>A collection of valid values for the annotated property, parameter, or type definition
[MultipleOf](Org.OData.Validation.V1.xml#L98)|Decimal|<a name="MultipleOf"></a>The value of the annotated property, parameter, or term must be an integer multiple of this positive value. For temporal types, the value is measured in seconds.
[Constraint](Org.OData.Validation.V1.xml#L103)|[ConstraintType](#ConstraintType)|<a name="Constraint"></a>Condition that the annotation target has to fulfill
[ItemsOf](Org.OData.Validation.V1.xml#L118)|\[[ItemsOfType](#ItemsOfType)\]|<a name="ItemsOf"></a>A list of constraints describing that entities related via one navigation property MUST also be related via another, collection-valued navigation property. The same `path` value MUST NOT occur more than once.<p>Example: entity type `Customer` has navigation properties `AllOrders`, `OpenOrders`, and `ClosedOrders`.  The term allows to express that items of `OpenOrders` and `ClosedOrders` are also items of the `AllOrders` navigation property, even though they are defined in an `Orders` entity set.</p>
[OpenPropertyTypeConstraint](Org.OData.Validation.V1.xml#L138)|\[[QualifiedTypeName](Org.OData.Core.V1.md#QualifiedTypeName)\]|<a name="OpenPropertyTypeConstraint"></a>Dynamic properties added to the annotated open structured type are restricted to the listed types
[DerivedTypeConstraint](Org.OData.Validation.V1.xml#L143)|\[[QualifiedTypeName](Org.OData.Core.V1.md#QualifiedTypeName)\]|<a name="DerivedTypeConstraint"></a>Values are restricted to types derived from the declared type and listed in this collection<p>Types listed in this collection that are not derived form the declared type of the annotated model element are ignored</p>
[AllowedTerms](Org.OData.Validation.V1.xml#L150)|\[[QualifiedTermName](Org.OData.Core.V1.md#QualifiedTermName)\]|<a name="AllowedTerms"></a>Annotation path expressions assigned to the annotated term or property are intended to resolve to annotations with one of the listed terms. For forward compatibility, clients should be prepared for the annotation to reference terms besides those listed.

## <a name="AllowedValue"></a>[AllowedValue](Org.OData.Validation.V1.xml#L92)


Property|Type|Description
:-------|:---|:----------
[Value](Org.OData.Validation.V1.xml#L93)|PrimitiveType|An allowed value for the property, parameter, or type definition

## <a name="ConstraintType"></a>[ConstraintType](Org.OData.Validation.V1.xml#L106)


Property|Type|Description
:-------|:---|:----------
[FailureMessage](Org.OData.Validation.V1.xml#L107)|String|Human-readable message that can be shown to end users if the constraint is not fulfilled
[Condition](Org.OData.Validation.V1.xml#L112)|Boolean|Value MUST be a dynamic expression that evaluates to true if and only if the constraint is fulfilled

## <a name="ItemsOfType"></a>[ItemsOfType](Org.OData.Validation.V1.xml#L127)
Entities related via the single- or collection-valued navigation property identified by `path` are also related via the collection-valued navigation property identified by `target`.

Property|Type|Description
:-------|:---|:----------
[path](Org.OData.Validation.V1.xml#L130)|NavigationPropertyPath|A path to a single- or collection-valued navigation property
[target](Org.OData.Validation.V1.xml#L133)|NavigationPropertyPath|A path to a collection-valued navigation property
