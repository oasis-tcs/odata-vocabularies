# Validation Vocabulary
**Namespace: [Org.OData.Validation.V1](Org.OData.Validation.V1.xml)**

Terms describing validation rules


## Terms

Term|Type|Description
:---|:---|:----------
[Pattern](./Org.OData.Validation.V1.xml#L67:~:text=<Term%20Name="-,Pattern,-")|String|<a name="Pattern"></a>The pattern that a string property, parameter, or term must match. This SHOULD be a valid regular expression, according to the ECMA 262 regular expression dialect.
[Minimum](./Org.OData.Validation.V1.xml#L72:~:text=<Term%20Name="-,Minimum,-")|PrimitiveType|<a name="Minimum"></a>Minimum value that a property, parameter, or term can have.<br>Can be annotated with:<br>- [Exclusive](#Exclusive)
[Maximum](./Org.OData.Validation.V1.xml#L81:~:text=<Term%20Name="-,Maximum,-")|PrimitiveType|<a name="Maximum"></a>Maximum value that a property, parameter, or term can have.<br>Can be annotated with:<br>- [Exclusive](#Exclusive)
[Exclusive](./Org.OData.Validation.V1.xml#L90:~:text=<Term%20Name="-,Exclusive,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Exclusive"></a>Tags a Minimum or Maximum as exclusive, i.e. an open interval boundary.
[AllowedValues](./Org.OData.Validation.V1.xml#L94:~:text=<Term%20Name="-,AllowedValues,-")|\[[AllowedValue](#AllowedValue)\]|<a name="AllowedValues"></a>A collection of valid values for the annotated property, parameter, or type definition
[MultipleOf](./Org.OData.Validation.V1.xml#L108:~:text=<Term%20Name="-,MultipleOf,-")|Decimal|<a name="MultipleOf"></a>The value of the annotated property, parameter, or term must be an integer multiple of this positive value. For temporal types, the value is measured in seconds.
[Constraint](./Org.OData.Validation.V1.xml#L112:~:text=<Term%20Name="-,Constraint,-")|[ConstraintType](#ConstraintType)|<a name="Constraint"></a>Condition that the annotation target has to fulfill
[ItemsOf](./Org.OData.Validation.V1.xml#L125:~:text=<Term%20Name="-,ItemsOf,-")|\[[ItemsOfType](#ItemsOfType)\]|<a name="ItemsOf"></a>A list of constraints describing that entities related via one navigation property MUST also be related via another, collection-valued navigation property. The same `path` value MUST NOT occur more than once.<br>Example: entity type `Customer` has navigation properties `AllOrders`, `OpenOrders`, and `ClosedOrders`. The term allows to express that items of `OpenOrders` and `ClosedOrders` are also items of the `AllOrders` navigation property, even though they are defined in an `Orders` entity set.
[OpenPropertyTypeConstraint](./Org.OData.Validation.V1.xml#L143:~:text=<Term%20Name="-,OpenPropertyTypeConstraint,-")|\[[TypeSpecification](Org.OData.Core.V1.md#TypeSpecification)\]|<a name="OpenPropertyTypeConstraint"></a>Dynamic properties added to the annotated open structured type are restricted to the listed types.
[DerivedTypeConstraint](./Org.OData.Validation.V1.xml#L147:~:text=<Term%20Name="-,DerivedTypeConstraint,-")|\[[QualifiedTypeName](Org.OData.Core.V1.md#QualifiedTypeName)\]|<a name="DerivedTypeConstraint"></a>Values are restricted to types that are both identical to or derived from the declared type and a type listed in this collection.<br>This allows restricting values to certain sub-trees of an inheritance hierarchy, including hierarchies starting at the [Built-In Abstract Types](https://docs.oasis-open.org/odata/odata-csdl-json/v4.01/odata-csdl-json-v4.01.html#sec_BuiltInAbstractTypes). Types listed in this collection that are not derived from the declared type of the annotated model element are ignored.
[AllowedTerms](./Org.OData.Validation.V1.xml#L152:~:text=<Term%20Name="-,AllowedTerms,-")|\[[QualifiedTermName](Org.OData.Core.V1.md#QualifiedTermName)\]|<a name="AllowedTerms"></a>Annotate a term of type Edm.AnnotationPath, or a property of type Edm.AnnotationPath that is used within a structured term, to restrict the terms that can be targeted by the path.<br>The annotation path expression is intended to end in a path segment with one of the listed terms. For forward compatibility, clients should be prepared for the annotation to reference terms besides those listed.
[ApplicableTerms](./Org.OData.Validation.V1.xml#L158:~:text=<Term%20Name="-,ApplicableTerms,-")|\[[QualifiedTermName](Org.OData.Core.V1.md#QualifiedTermName)\]|<a name="ApplicableTerms"></a>Names of specific terms that are applicable and may be applied in the current context. This annotation does not restrict the use of other terms.
[MaxItems](./Org.OData.Validation.V1.xml#L162:~:text=<Term%20Name="-,MaxItems,-")|Int64|<a name="MaxItems"></a>The annotated collection must have at most the specified number of items.
[MinItems](./Org.OData.Validation.V1.xml#L166:~:text=<Term%20Name="-,MinItems,-")|Int64|<a name="MinItems"></a>The annotated collection must have at least the specified number of items.

## <a name="AllowedValue"></a>[AllowedValue](./Org.OData.Validation.V1.xml#L97:~:text=<ComplexType%20Name="-,AllowedValue,-")


Property|Type|Description
:-------|:---|:----------
[Value](./Org.OData.Validation.V1.xml#L103:~:text=<ComplexType%20Name="-,AllowedValue,-")|PrimitiveType?|An allowed value for the property, parameter, or type definition

**Applicable Annotation Terms:**

- [SymbolicName](Org.OData.Core.V1.md#SymbolicName)

## <a name="ConstraintType"></a>[ConstraintType](./Org.OData.Validation.V1.xml#L115:~:text=<ComplexType%20Name="-,ConstraintType,-")


Property|Type|Description
:-------|:---|:----------
[FailureMessage](./Org.OData.Validation.V1.xml#L116:~:text=<ComplexType%20Name="-,ConstraintType,-")|String?|Human-readable message that can be shown to end users if the constraint is not fulfilled
[Condition](./Org.OData.Validation.V1.xml#L120:~:text=<ComplexType%20Name="-,ConstraintType,-")|Boolean|Value MUST be a dynamic expression that evaluates to true if and only if the constraint is fulfilled

## <a name="ItemsOfType"></a>[ItemsOfType](./Org.OData.Validation.V1.xml#L133:~:text=<ComplexType%20Name="-,ItemsOfType,-")
Entities related via the single- or collection-valued navigation property identified by `path` are also related via the collection-valued navigation property identified by `target`.

Property|Type|Description
:-------|:---|:----------
[path](./Org.OData.Validation.V1.xml#L135:~:text=<ComplexType%20Name="-,ItemsOfType,-")|NavigationPropertyPath|A path to a single- or collection-valued navigation property
[target](./Org.OData.Validation.V1.xml#L138:~:text=<ComplexType%20Name="-,ItemsOfType,-")|NavigationPropertyPath|A path to a collection-valued navigation property
