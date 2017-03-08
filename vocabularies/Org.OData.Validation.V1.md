# Validation Vocabulary
**Namespace: [Org.OData.Validation.V1](Org.OData.Validation.V1.xml)**

Terms describing validation rules

Term|Type|Description
:---|:---|:----------
[Pattern](Org.OData.Validation.V1.xml#L60)|String|<a name="Pattern"></a>The pattern that a string property, parameter, or term must match. This SHOULD be a valid regular expression, according to the ECMA 262 regular expression dialect.
[Minimum](Org.OData.Validation.V1.xml#L66)|Decimal|<a name="Minimum"></a>Minimum value that a property, parameter, or term can have.
[Maximum](Org.OData.Validation.V1.xml#L70)|Decimal|<a name="Maximum"></a>Maximum value that a property, parameter, or term can have.
[Exclusive](Org.OData.Validation.V1.xml#L74)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Exclusive"></a>Tags a Minimum or Maximum as exclusive, i.e. an open interval boundary.
[AllowedValues](Org.OData.Validation.V1.xml#L78)|\[[AllowedValue](#AllowedValue)\]|<a name="AllowedValues"></a>A collection of valid values for the annotated property, parameter, or type definition
[MultipleOf](Org.OData.Validation.V1.xml#L88)|Decimal|<a name="MultipleOf"></a>The value of the annotated property, parameter, or term must be an integer multiple of this positive value. For temporal types, the value is measured in seconds.
[ItemsOf](Org.OData.Validation.V1.xml#L93)|\[[ItemsOfType](#ItemsOfType)\]|<a name="ItemsOf"></a>A list of constraints describing that entities related via one navigation property MUST also be related via another, collection-valued navigation property.<p>The same `path` value can occur multiple times, meaning that the related entities MUST be related via any of the `target` navigation properties.  The target can be any collection-valued navigation property. If the target is a containment navigation property then the constraint defines where the entity lives. <br>For example, if an entity type `Customer` has navigation properties `AllOrders`, `OpenOrders`, and `ClosedOrders`, it may be useful to define that items of `OpenOrders` and `ClosedOrders` are also items of the `AllOrders` navigation property, even though they are defined in an `Orders` entity set.</p>

## <a name="AllowedValue"></a>[AllowedValue](Org.OData.Validation.V1.xml#L82)


Property|Type|Description
:-------|:---|:----------
[Value](Org.OData.Validation.V1.xml#L83)|PrimitiveType|An allowed value for the property, parameter, or type definition

## <a name="ItemsOfType"></a>[ItemsOfType](Org.OData.Validation.V1.xml#L104)
Entities related via the single- or collection-valued navigation property identified by `path` are also related via the collection-valued navigation property identified by `target`.

Property|Type|Description
:-------|:---|:----------
[path](Org.OData.Validation.V1.xml#L107)|NavigationPropertyPath|A path to a single- or collection-valued navigation property
[target](Org.OData.Validation.V1.xml#L110)|NavigationPropertyPath|A path to a or collection-valued navigation property
