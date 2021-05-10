# Aggregation Vocabulary
**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Terms to describe which data in a given entity model can be aggregated, and how.


## Terms

Term|Type|Description
:---|:---|:----------
[ApplySupported](Org.OData.Aggregation.V1.xml#L70)|[ApplySupportedType](#ApplySupportedType)|<a name="ApplySupported"></a>This structured type, entity set or entity container supports the $apply system query option<br>An annotation of this term to an entity container propagates to all sets in the container except for those with their own annotation.
[Groupable](Org.OData.Aggregation.V1.xml#L138) *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Groupable"></a>Deprecated in favor of [`ApplySupported/GroupableProperties`](#ApplySupported)
[Aggregatable](Org.OData.Aggregation.V1.xml#L150) *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Aggregatable"></a>Deprecated in favor of [`ApplySupported/AggregatableProperties`](#ApplySupported)
[SupportedAggregationMethods](Org.OData.Aggregation.V1.xml#L162)|\[String\]|<a name="SupportedAggregationMethods"></a>Standard and custom aggregation methods than can be applied to the property. If omitted, all aggregation methods can be applied
[RecommendedAggregationMethod](Org.OData.Aggregation.V1.xml#L168)|String?|<a name="RecommendedAggregationMethod"></a>Recommended method for aggregating values of the property
[CustomAggregate](Org.OData.Aggregation.V1.xml#L174)|String|<a name="CustomAggregate"></a>Dynamic property that can be used in the aggregate transformation<br>This term MUST be applied with a Qualifier, the Qualifier value is the name of the dynamic property. The value of the annotation MUST be the qualified name of a primitive type. The aggregated value will be of that type.
[ContextDefiningProperties](Org.OData.Aggregation.V1.xml#L180)|\[PropertyPath\]|<a name="ContextDefiningProperties"></a>The annotated property or custom aggregate is only well-defined in the context of these properties<br>The context-defining properties need either be part of the result entities, or be restricted to a single value by a pre-filter operation. Examples are postal codes within a country, or monetary amounts whose context is the unit of currency.
[LeveledHierarchy](Org.OData.Aggregation.V1.xml#L187)|\[PropertyPath\]|<a name="LeveledHierarchy"></a>Defines a leveled hierarchy by defining an ordered list of properties in the hierarchy
[RecursiveHierarchy](Org.OData.Aggregation.V1.xml#L191)|[RecursiveHierarchyType](#RecursiveHierarchyType)|<a name="RecursiveHierarchy"></a>Defines a recursive hierarchy.
[AvailableOnAggregates](Org.OData.Aggregation.V1.xml#L251)|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|<a name="AvailableOnAggregates"></a>This action or function is available on aggregated entities if the `RequiredProperties` are still defined


## Functions

### <a name="isroot"></a>[isroot](Org.OData.Aggregation.V1.xml#L211)

Returns true, if and only if the value of the node property of the specified hierarchy is the root of the hierarchy

Parameter|Type|Description
:--------|:---|:----------
**[Entity](Org.OData.Aggregation.V1.xml#L213)**|EntityType|**Binding parameter**
[Hierarchy](Org.OData.Aggregation.V1.xml#L214)|String|
[&rarr;](Org.OData.Aggregation.V1.xml#L215)|Boolean|


### <a name="isdescendant"></a>[isdescendant](Org.OData.Aggregation.V1.xml#L218)

Returns true, if and only if the value of the node property of the specified hierarchy is a descendant of the given parent node with a distance of less than or equal to the optionally specified maximum distance

Parameter|Type|Description
:--------|:---|:----------
**[Entity](Org.OData.Aggregation.V1.xml#L220)**|EntityType|**Binding parameter**
[Hierarchy](Org.OData.Aggregation.V1.xml#L221)|String|
[Node](Org.OData.Aggregation.V1.xml#L222)|PrimitiveType|
[MaxDistance](Org.OData.Aggregation.V1.xml#L223)|Int16?|
[&rarr;](Org.OData.Aggregation.V1.xml#L224)|Boolean|


### <a name="isancestor"></a>[isancestor](Org.OData.Aggregation.V1.xml#L227)

Returns true, if and only if the value of the node property of the specified hierarchy is an ancestor of the given child node with a distance of less than or equal to the optionally specified maximum distance

Parameter|Type|Description
:--------|:---|:----------
**[Entity](Org.OData.Aggregation.V1.xml#L229)**|EntityType|**Binding parameter**
[Hierarchy](Org.OData.Aggregation.V1.xml#L230)|String|
[Node](Org.OData.Aggregation.V1.xml#L231)|PrimitiveType|
[MaxDistance](Org.OData.Aggregation.V1.xml#L232)|Int16?|
[&rarr;](Org.OData.Aggregation.V1.xml#L233)|Boolean|


### <a name="issibling"></a>[issibling](Org.OData.Aggregation.V1.xml#L236)

Returns true, if and only if the value of the node property of the specified hierarchy has the same parent node as the specified node

Parameter|Type|Description
:--------|:---|:----------
**[Entity](Org.OData.Aggregation.V1.xml#L238)**|EntityType|**Binding parameter**
[Hierarchy](Org.OData.Aggregation.V1.xml#L239)|String|
[Node](Org.OData.Aggregation.V1.xml#L240)|PrimitiveType|
[&rarr;](Org.OData.Aggregation.V1.xml#L241)|Boolean|


### <a name="isleaf"></a>[isleaf](Org.OData.Aggregation.V1.xml#L244)

Returns true, if and only if the value of the node property of the specified hierarchy has no descendants

Parameter|Type|Description
:--------|:---|:----------
**[Entity](Org.OData.Aggregation.V1.xml#L246)**|EntityType|**Binding parameter**
[Hierarchy](Org.OData.Aggregation.V1.xml#L247)|String|
[&rarr;](Org.OData.Aggregation.V1.xml#L248)|Boolean|


## <a name="ApplySupportedType"></a>[ApplySupportedType](Org.OData.Aggregation.V1.xml#L79)


Property|Type|Description
:-------|:---|:----------
[Transformations](Org.OData.Aggregation.V1.xml#L80)|\[String\]|Transformations that can be used in `$apply`
[CustomAggregationMethods](Org.OData.Aggregation.V1.xml#L83)|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[Rollup](Org.OData.Aggregation.V1.xml#L86)|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation
[PropertyRestrictions](Org.OData.Aggregation.V1.xml#L89) *(Deprecated)*|Boolean|Deprecated since [`Groupable`](#Groupable) and [`Aggregatable`](#Aggregatable) are deprecated
[GroupableProperties](Org.OData.Aggregation.V1.xml#L100)|\[PropertyPath\]|A non-empty collection indicates that only the listed properties of the annotated target are supported by the `groupby` transformation
[AggregatableProperties](Org.OData.Aggregation.V1.xml#L103)|\[[AggregatablePropertyType](#AggregatablePropertyType)\]|Properties supported by the `aggregate` transformation. Setting this collection implies that `PropertyRestrictions` is true

## <a name="AggregatablePropertyType"></a>[AggregatablePropertyType](Org.OData.Aggregation.V1.xml#L107)


Property|Type|Description
:-------|:---|:----------
[Property](Org.OData.Aggregation.V1.xml#L108)|PropertyPath|Aggregatable property
[SupportedAggregationMethods](Org.OData.Aggregation.V1.xml#L113)|\[String\]|Standard and custom aggregation methods than can be applied to the property. If omitted, all aggregation methods can be applied
[RecommendedAggregationMethod](Org.OData.Aggregation.V1.xml#L118)|String?|Recommended method for aggregating values of the property

## <a name="RollupType"></a>[RollupType](Org.OData.Aggregation.V1.xml#L125)
The number of `rollup` operators allowed in a `groupby` transformation

Member|Value|Description
:-----|----:|:----------
[None](Org.OData.Aggregation.V1.xml#L127)|0|No `rollup` support
[SingleHierarchy](Org.OData.Aggregation.V1.xml#L130)|1|Only one `rollup` operator per `groupby`
[MultipleHierarchies](Org.OData.Aggregation.V1.xml#L133)|2|Full `rollup` support

## <a name="RecursiveHierarchyType"></a>[RecursiveHierarchyType](Org.OData.Aggregation.V1.xml#L195)


Property|Type|Description
:-------|:---|:----------
[NodeProperty](Org.OData.Aggregation.V1.xml#L196)|PropertyPath|Property holding the hierarchy node value
[ParentNavigationProperty](Org.OData.Aggregation.V1.xml#L199)|NavigationPropertyPath|Property for navigating to the parent node
[DistanceFromRootProperty](Org.OData.Aggregation.V1.xml#L202)|PropertyPath?|Property holding the number of edges between the node and the root node
[IsLeafProperty](Org.OData.Aggregation.V1.xml#L205)|PropertyPath?|Property indicating whether the node is a leaf of the hierarchy

## <a name="AvailableOnAggregatesType"></a>[AvailableOnAggregatesType](Org.OData.Aggregation.V1.xml#L254)


Property|Type|Description
:-------|:---|:----------
[RequiredProperties](Org.OData.Aggregation.V1.xml#L255)|\[PropertyPath\]|Properties required to apply this action or function

## <a name="NavigationPropertyAggregationCapabilities"></a>[NavigationPropertyAggregationCapabilities](Org.OData.Aggregation.V1.xml#L260): [NavigationPropertyRestriction](Org.OData.Capabilities.V1.md#NavigationPropertyRestriction) *(Deprecated)*
[`Capabilities.NavigationRestrictions`](Org.OData.Capabilities.V1.md#NavigationRestrictions) that make use of the additional properties in this subtype are deprecated in favor of [`ApplySupported`](#ApplySupported) and [`CustomAggregate`](#CustomAggregate)

## <a name="CustomAggregateType"></a>[CustomAggregateType](Org.OData.Aggregation.V1.xml#L278) *(Deprecated)*
Deprecated since [`NavigationPropertyAggregationCapabilities`](#NavigationPropertyAggregationCapabilities) is also deprecated
