# Aggregation Vocabulary
**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Terms to describe which data in a given entity model can be aggregated, and how.


## Terms

Term|Type|Description
:---|:---|:----------
[ApplySupported](Org.OData.Aggregation.V1.xml#L73)|[ApplySupportedType](#ApplySupportedType)|<a name="ApplySupported"></a>This structured type, entity set or entity container supports the $apply system query option<p>An annotation of this term to an entity container propagates to all sets in the container except for those with their own annotation.</p>
[Groupable](Org.OData.Aggregation.V1.xml#L143) *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Groupable"></a>Deprecated in favor of [`ApplySupported/GroupableProperties`](#ApplySupported)
[Aggregatable](Org.OData.Aggregation.V1.xml#L155) *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Aggregatable"></a>Deprecated in favor of [`ApplySupported/AggregatableProperties`](#ApplySupported)
[CustomAggregate](Org.OData.Aggregation.V1.xml#L167)|String|<a name="CustomAggregate"></a>Dynamic property that can be used in the `aggregate` transformation<p>This term MUST be applied with a Qualifier, the Qualifier value is the name of the dynamic property. The value of the annotation MUST be the qualified name of a primitive type. The aggregated value will be of that type.</p>
[ContextDefiningProperties](Org.OData.Aggregation.V1.xml#L174)|\[PropertyPath\]|<a name="ContextDefiningProperties"></a>The annotated property or custom aggregate is only well-defined in the context of these properties<p>The context-defining properties need either be part of the result entities, or be restricted to a single value by a pre-filter operation. Examples are postal codes within a country, or monetary amounts whose context is the unit of currency.</p>
[LeveledHierarchy](Org.OData.Aggregation.V1.xml#L182)|\[PropertyPath\]|<a name="LeveledHierarchy"></a>Defines a leveled hierarchy by defining an ordered list of properties in the hierarchy
[RecursiveHierarchy](Org.OData.Aggregation.V1.xml#L187)|[RecursiveHierarchyType](#RecursiveHierarchyType)|<a name="RecursiveHierarchy"></a>Defines a recursive hierarchy.
[AvailableOnAggregates](Org.OData.Aggregation.V1.xml#L252)|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|<a name="AvailableOnAggregates"></a>This action or function is available on aggregated entities if the `RequiredProperties` are still defined


## Functions

Function|Signature|Description
:-------|:--------|:----------
[isroot](Org.OData.Aggregation.V1.xml#L207)|Entity:&nbsp;EntityType, Hierarchy:&nbsp;String &rarr;&nbsp;Boolean|<a name="isroot"></a>Returns true, if and only if the value of the node property of the specified hierarchy is the root of the hierarchy
[isdescendant](Org.OData.Aggregation.V1.xml#L215)|Entity:&nbsp;EntityType, Hierarchy:&nbsp;String, Node:&nbsp;PrimitiveType, MaxDistance:&nbsp;Int16? &rarr;&nbsp;Boolean|<a name="isdescendant"></a>Returns true, if and only if the value of the node property of the specified hierarchy is a descendant of the given parent node with a distance of less than or equal to the optionally specified maximum distance
[isancestor](Org.OData.Aggregation.V1.xml#L225)|Entity:&nbsp;EntityType, Hierarchy:&nbsp;String, Node:&nbsp;PrimitiveType, MaxDistance:&nbsp;Int16? &rarr;&nbsp;Boolean|<a name="isancestor"></a>Returns true, if and only if the value of the node property of the specified hierarchy is an ancestor of the given child node with a distance of less than or equal to the optionally specified maximum distance
[issibling](Org.OData.Aggregation.V1.xml#L235)|Entity:&nbsp;EntityType, Hierarchy:&nbsp;String, Node:&nbsp;PrimitiveType &rarr;&nbsp;Boolean|<a name="issibling"></a>Returns true, if and only if the value of the node property of the specified hierarchy has the same parent node as the specified node
[isleaf](Org.OData.Aggregation.V1.xml#L244)|Entity:&nbsp;EntityType, Hierarchy:&nbsp;String &rarr;&nbsp;Boolean|<a name="isleaf"></a>Returns true, if and only if the value of the node property of the specified hierarchy has no descendants

## <a name="ApplySupportedType"></a>[ApplySupportedType](Org.OData.Aggregation.V1.xml#L82)


Property|Type|Description
:-------|:---|:----------
[Transformations](Org.OData.Aggregation.V1.xml#L83)|\[String\]|Transformations that can be used in `$apply`
[CustomAggregationMethods](Org.OData.Aggregation.V1.xml#L86)|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[Rollup](Org.OData.Aggregation.V1.xml#L90)|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation
[PropertyRestrictions](Org.OData.Aggregation.V1.xml#L93) *(Deprecated)*|Boolean|Deprecated since [`Groupable`](#Groupable) and [`Aggregatable`](#Aggregatable) are deprecated
[GroupableProperties](Org.OData.Aggregation.V1.xml#L105)|\[PropertyPath\]|Properties supported by the `groupby` transformation. Setting this collection implies that `PropertyRestrictions` is true
[AggregatableProperties](Org.OData.Aggregation.V1.xml#L108)|\[[AggregatablePropertyType](#AggregatablePropertyType)\]|Properties supported by the `aggregate` transformation. Setting this collection implies that `PropertyRestrictions` is true

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

## <a name="RecursiveHierarchyType"></a>[RecursiveHierarchyType](Org.OData.Aggregation.V1.xml#L191)


Property|Type|Description
:-------|:---|:----------
[NodeProperty](Org.OData.Aggregation.V1.xml#L192)|PropertyPath|Property holding the hierarchy node value
[ParentNavigationProperty](Org.OData.Aggregation.V1.xml#L195)|NavigationPropertyPath|Property for navigating to the parent node
[DistanceFromRootProperty](Org.OData.Aggregation.V1.xml#L198)|PropertyPath?|Property holding the number of edges between the node and the root node
[IsLeafProperty](Org.OData.Aggregation.V1.xml#L201)|PropertyPath?|Property indicating whether the node is a leaf of the hierarchy

## <a name="AvailableOnAggregatesType"></a>[AvailableOnAggregatesType](Org.OData.Aggregation.V1.xml#L256)


Property|Type|Description
:-------|:---|:----------
[RequiredProperties](Org.OData.Aggregation.V1.xml#L257)|\[PropertyPath\]|Properties required to apply this action or function

## <a name="NavigationPropertyAggregationCapabilities"></a>[NavigationPropertyAggregationCapabilities](Org.OData.Aggregation.V1.xml#L262): [NavigationPropertyRestriction](Org.OData.Capabilities.V1.md#NavigationPropertyRestriction) *(Deprecated)*
[`Capabilities.NavigationRestrictions`](Org.OData.Capabilities.V1.md#NavigationRestrictions) that make use of the additional properties in this subtype are deprecated in favor of [`ApplySupported`](#ApplySupported) and [`CustomAggregate`](#CustomAggregate)

## <a name="CustomAggregateType"></a>[CustomAggregateType](Org.OData.Aggregation.V1.xml#L280)


Property|Type|Description
:-------|:---|:----------
[Name](Org.OData.Aggregation.V1.xml#L281)|String|Name of the dynamic property that can be used in the `aggregate` transformation
[Type](Org.OData.Aggregation.V1.xml#L284)|String|Qualified name of a primitive type. The aggregated value will be of that type
