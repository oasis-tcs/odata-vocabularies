# Aggregation Vocabulary
**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Terms to describe which data in a given entity model can be aggregated, and how.


## Terms

Term|Type|Description
:---|:---|:----------
[ApplySupported](Org.OData.Aggregation.V1.xml#L71)|[ApplySupportedType](#ApplySupportedType)|<a name="ApplySupported"></a>This entity set or collection supports the `$apply` system query option
[ApplySupportedDefaults](Org.OData.Aggregation.V1.xml#L77)|[ApplySupportedBase](#ApplySupportedBase)|<a name="ApplySupportedDefaults"></a>Default support of the `$apply` system query option for all collection-valued resources in the container. Annotating term `ApplySupported` for a specific collection-valued resource overrides the default setting
[Groupable](Org.OData.Aggregation.V1.xml#L143) *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Groupable"></a>Deprecated in favor of [`ApplySupported/GroupableProperties`](#ApplySupported)
[Aggregatable](Org.OData.Aggregation.V1.xml#L155) *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Aggregatable"></a>Deprecated in favor of [`ApplySupported/AggregatableProperties`](#ApplySupported)
[CustomAggregate](Org.OData.Aggregation.V1.xml#L167)|String|<a name="CustomAggregate"></a>Dynamic property that can be used in the `aggregate` transformation<br>This term MUST be applied with a Qualifier, the Qualifier value is the name of the dynamic property. The value of the annotation MUST be the qualified name of a primitive type. The aggregated value will be of that type.
[ContextDefiningProperties](Org.OData.Aggregation.V1.xml#L173)|\[PropertyPath\]|<a name="ContextDefiningProperties"></a>The annotated property or custom aggregate is only well-defined in the context of these properties<br>The context-defining properties need either be part of the result entities, or be restricted to a single value by a pre-filter operation. Examples are postal codes within a country, or monetary amounts whose context is the unit of currency.
[LeveledHierarchy](Org.OData.Aggregation.V1.xml#L180)|\[PropertyPath\]|<a name="LeveledHierarchy"></a>Defines a leveled hierarchy by defining an ordered list of properties in the hierarchy
[RecursiveHierarchy](Org.OData.Aggregation.V1.xml#L184)|[RecursiveHierarchyType](#RecursiveHierarchyType)|<a name="RecursiveHierarchy"></a>Defines a recursive hierarchy.
[AvailableOnAggregates](Org.OData.Aggregation.V1.xml#L275)|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|<a name="AvailableOnAggregates"></a>This action or function is available on aggregated entities if the `RequiredProperties` are still defined


## Functions

### <a name="isroot"></a>[isroot](Org.OData.Aggregation.V1.xml#L204)

Returns true for a given entity, if and only if the value of the node property of the specified hierarchy annotation is the root of the hierarchy in the given entity set of hierarchy nodes

Parameter|Type|Description
:--------|:---|:----------
**[Entity](Org.OData.Aggregation.V1.xml#L206)**|EntityType|**Binding parameter**
[Nodes](Org.OData.Aggregation.V1.xml#L207)|String|Name of the entity set holding the nodes of the recursive hierarchy
[Hierarchy](Org.OData.Aggregation.V1.xml#L210)|String|Qualifier to identify the `RecursiveHierarchy` annotation applied to the type of the entity set referenced in `Nodes`
[&rarr;](Org.OData.Aggregation.V1.xml#L213)|Boolean|


### <a name="isdescendant"></a>[isdescendant](Org.OData.Aggregation.V1.xml#L216)

Returns true for a given entity, if and only if the value of the node property of the specified hierarchy annotation is a descendant of the given parent node in the given entity set of hierarchy nodes with a distance of less than or equal to the optionally specified maximum distance

Parameter|Type|Description
:--------|:---|:----------
**[Entity](Org.OData.Aggregation.V1.xml#L218)**|EntityType|**Binding parameter**
[Nodes](Org.OData.Aggregation.V1.xml#L219)|String|Name of the entity set holding the nodes of the recursive hierarchy
[Hierarchy](Org.OData.Aggregation.V1.xml#L222)|String|Qualifier to identify the `RecursiveHierarchy` annotation applied to the type of the entity set referenced in `Nodes`
[Node](Org.OData.Aggregation.V1.xml#L225)|PrimitiveType|Parent node value
[MaxDistance](Org.OData.Aggregation.V1.xml#L228)|Int16?|
[&rarr;](Org.OData.Aggregation.V1.xml#L229)|Boolean|


### <a name="isancestor"></a>[isancestor](Org.OData.Aggregation.V1.xml#L232)

Returns true for a given entity, if and only if the value of the node property of the specified hierarchy annotation is an ancestor of the given child node in the given entity set of hierarchy nodes with a distance of less than or equal to the optionally specified maximum distance

Parameter|Type|Description
:--------|:---|:----------
**[Entity](Org.OData.Aggregation.V1.xml#L234)**|EntityType|**Binding parameter**
[Nodes](Org.OData.Aggregation.V1.xml#L235)|String|Name of the entity set holding the nodes of the recursive hierarchy
[Hierarchy](Org.OData.Aggregation.V1.xml#L238)|String|Qualifier to identify the `RecursiveHierarchy` annotation applied to the type of the entity set referenced in `Nodes`
[Node](Org.OData.Aggregation.V1.xml#L241)|PrimitiveType|Child node value
[MaxDistance](Org.OData.Aggregation.V1.xml#L244)|Int16?|
[&rarr;](Org.OData.Aggregation.V1.xml#L245)|Boolean|


### <a name="issibling"></a>[issibling](Org.OData.Aggregation.V1.xml#L248)

Returns true for a given entity, if and only if the value of the node property of the specified hierarchy annotation has the same parent node as the specified node in the given entity set of hierarchy nodes

Parameter|Type|Description
:--------|:---|:----------
**[Entity](Org.OData.Aggregation.V1.xml#L250)**|EntityType|**Binding parameter**
[Nodes](Org.OData.Aggregation.V1.xml#L251)|String|Name of the entity set holding the nodes of the recursive hierarchy
[Hierarchy](Org.OData.Aggregation.V1.xml#L254)|String|Qualifier to identify the `RecursiveHierarchy` annotation applied to the type of the entity set referenced in `Nodes`
[Node](Org.OData.Aggregation.V1.xml#L257)|PrimitiveType|Sibling node value
[&rarr;](Org.OData.Aggregation.V1.xml#L260)|Boolean|


### <a name="isleaf"></a>[isleaf](Org.OData.Aggregation.V1.xml#L263)

Returns true for a given entity, if and only if the value of the node property of the specified hierarchy annotation has no descendants in the given entity set of hierarchy nodes

Parameter|Type|Description
:--------|:---|:----------
**[Entity](Org.OData.Aggregation.V1.xml#L265)**|EntityType|**Binding parameter**
[Nodes](Org.OData.Aggregation.V1.xml#L266)|String|Name of the entity set holding the nodes of the recursive hierarchy
[Hierarchy](Org.OData.Aggregation.V1.xml#L269)|String|Qualifier to identify the `RecursiveHierarchy` annotation applied to the type of the entity set referenced in `Nodes`
[&rarr;](Org.OData.Aggregation.V1.xml#L272)|Boolean|


## <a name="ApplySupportedBase"></a>[ApplySupportedBase](Org.OData.Aggregation.V1.xml#L82)


**Derived Types:**
- [ApplySupportedType](#ApplySupportedType)

Property|Type|Description
:-------|:---|:----------
[Transformations](Org.OData.Aggregation.V1.xml#L83)|\[String\]|Transformations that can be used in `$apply`
[CustomAggregationMethods](Org.OData.Aggregation.V1.xml#L86)|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[Rollup](Org.OData.Aggregation.V1.xml#L89)|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation

## <a name="ApplySupportedType"></a>[ApplySupportedType](Org.OData.Aggregation.V1.xml#L93): [ApplySupportedBase](#ApplySupportedBase)


Property|Type|Description
:-------|:---|:----------
[*Transformations*](Org.OData.Aggregation.V1.xml#L83)|\[String\]|Transformations that can be used in `$apply`
[*CustomAggregationMethods*](Org.OData.Aggregation.V1.xml#L86)|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[*Rollup*](Org.OData.Aggregation.V1.xml#L89)|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation
[PropertyRestrictions](Org.OData.Aggregation.V1.xml#L94) *(Deprecated)*|Boolean|Deprecated since [`Groupable`](#Groupable) and [`Aggregatable`](#Aggregatable) are deprecated
[GroupableProperties](Org.OData.Aggregation.V1.xml#L105)|\[PropertyPath\]|A non-empty collection indicates that only the listed properties of the annotated target are supported by the `groupby` transformation
[AggregatableProperties](Org.OData.Aggregation.V1.xml#L108)|\[[AggregatablePropertyType](#AggregatablePropertyType)\]|A non-empty collection indicates that only the listed properties of the annotated target can be used in the `aggregate` transformation, optionally restricted to the specified aggregation methods

## <a name="AggregatablePropertyType"></a>[AggregatablePropertyType](Org.OData.Aggregation.V1.xml#L112)


Property|Type|Description
:-------|:---|:----------
[Property](Org.OData.Aggregation.V1.xml#L113)|PropertyPath|Aggregatable property
[SupportedAggregationMethods](Org.OData.Aggregation.V1.xml#L118)|\[String\]|Standard and custom aggregation methods than can be applied to the property. If omitted, all aggregation methods can be applied
[RecommendedAggregationMethod](Org.OData.Aggregation.V1.xml#L123)|String?|Recommended method for aggregating values of the property

## <a name="RollupType"></a>[RollupType](Org.OData.Aggregation.V1.xml#L130)
The number of `rollup` operators allowed in a `groupby` transformation

Member|Value|Description
:-----|----:|:----------
[None](Org.OData.Aggregation.V1.xml#L132)|0|No `rollup` support
[SingleHierarchy](Org.OData.Aggregation.V1.xml#L135)|1|Only one `rollup` operator per `groupby`
[MultipleHierarchies](Org.OData.Aggregation.V1.xml#L138)|2|Full `rollup` support

## <a name="RecursiveHierarchyType"></a>[RecursiveHierarchyType](Org.OData.Aggregation.V1.xml#L188)


Property|Type|Description
:-------|:---|:----------
[NodeProperty](Org.OData.Aggregation.V1.xml#L189)|PropertyPath|Property holding the hierarchy node value
[ParentNavigationProperty](Org.OData.Aggregation.V1.xml#L192)|NavigationPropertyPath|Property for navigating to the parent node
[DistanceFromRootProperty](Org.OData.Aggregation.V1.xml#L195)|PropertyPath?|Property holding the number of edges between the node and the root node
[IsLeafProperty](Org.OData.Aggregation.V1.xml#L198)|PropertyPath?|Property indicating whether the node is a leaf of the hierarchy

## <a name="AvailableOnAggregatesType"></a>[AvailableOnAggregatesType](Org.OData.Aggregation.V1.xml#L278)


Property|Type|Description
:-------|:---|:----------
[RequiredProperties](Org.OData.Aggregation.V1.xml#L279)|\[PropertyPath\]|Properties required to apply this action or function

## <a name="NavigationPropertyAggregationCapabilities"></a>[NavigationPropertyAggregationCapabilities](Org.OData.Aggregation.V1.xml#L284): [NavigationPropertyRestriction](Org.OData.Capabilities.V1.md#NavigationPropertyRestriction) *(Deprecated)*
[`Capabilities.NavigationRestrictions`](Org.OData.Capabilities.V1.md#NavigationRestrictions) that make use of the additional properties in this subtype are deprecated in favor of [`ApplySupported`](#ApplySupported) and [`CustomAggregate`](#CustomAggregate)

## <a name="CustomAggregateType"></a>[CustomAggregateType](Org.OData.Aggregation.V1.xml#L302) *(Deprecated)*
Deprecated since [`NavigationPropertyAggregationCapabilities`](#NavigationPropertyAggregationCapabilities) is also deprecated
