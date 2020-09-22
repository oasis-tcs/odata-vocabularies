# Aggregation Vocabulary
**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Terms to describe which data in a given entity model can be aggregated, and how.


## Terms

Term|Type|Description
:---|:---|:----------
[ApplySupported](Org.OData.Aggregation.V1.xml#L73)|[ApplySupportedType](#ApplySupportedType)|<a name="ApplySupported"></a>This structured type or entity container supports the $apply system query option
[Groupable](Org.OData.Aggregation.V1.xml#L108)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Groupable"></a>This property can be used in the groupby transformation
[Aggregatable](Org.OData.Aggregation.V1.xml#L112)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Aggregatable"></a>This property can be used in the aggregate transformation
[CustomAggregate](Org.OData.Aggregation.V1.xml#L116)|String|<a name="CustomAggregate"></a>Dynamic property that can be used in the aggregate transformation<p>This term MUST be applied with a Qualifier, the Qualifier value is the name of the dynamic property. The value of the annotation MUST be the qualified name of a primitive type. The aggregated values will be of that type.</p>
[ContextDefiningProperties](Org.OData.Aggregation.V1.xml#L122)|\[PropertyPath\]|<a name="ContextDefiningProperties"></a>The annotated property or custom aggregate is only well-defined in the context of these properties<p>The context-defining properties need either be part of the result entities, or be restricted to a single value by a pre-filter operation. Examples are postal codes within a country, or monetary amounts whose context is the unit of currency.</p>
[LeveledHierarchy](Org.OData.Aggregation.V1.xml#L130)|\[PropertyPath\]|<a name="LeveledHierarchy"></a>Defines a leveled hierarchy by defining an ordered list of properties in the hierarchy
[RecursiveHierarchy](Org.OData.Aggregation.V1.xml#L135)|[RecursiveHierarchyType](#RecursiveHierarchyType)|<a name="RecursiveHierarchy"></a>Defines a recursive hierarchy.
[AvailableOnAggregates](Org.OData.Aggregation.V1.xml#L200)|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|<a name="AvailableOnAggregates"></a>This action or function is available on aggregated entities if the RequiredProperties are still defined


## Functions

Function|Signature|Description
:-------|:--------|:----------
[isroot](Org.OData.Aggregation.V1.xml#L155)|Entity:&nbsp;EntityType, Hierarchy:&nbsp;String &rarr;&nbsp;Boolean|<a name="isroot"></a>Returns true, if and only if the value of the node property of the specified hierarchy is the root of the hierarchy
[isdescendant](Org.OData.Aggregation.V1.xml#L163)|Entity:&nbsp;EntityType, Hierarchy:&nbsp;String, Node:&nbsp;PrimitiveType, MaxDistance:&nbsp;Int16 &rarr;&nbsp;Boolean|<a name="isdescendant"></a>Returns true, if and only if the value of the node property of the specified hierarchy is a descendant of the given parent node with a distance of less than or equal to the optionally specified maximum distance
[isancestor](Org.OData.Aggregation.V1.xml#L173)|Entity:&nbsp;EntityType, Hierarchy:&nbsp;String, Node:&nbsp;PrimitiveType, MaxDistance:&nbsp;Int16 &rarr;&nbsp;Boolean|<a name="isancestor"></a>Returns true, if and only if the value of the node property of the specified hierarchy is an ancestor of the given child node with a distance of less than or equal to the optionally specified maximum distance
[issibling](Org.OData.Aggregation.V1.xml#L183)|Entity:&nbsp;EntityType, Hierarchy:&nbsp;String, Node:&nbsp;PrimitiveType &rarr;&nbsp;Boolean|<a name="issibling"></a>Returns true, if and only if the value of the node property of the specified hierarchy has the same parent node as the specified node
[isleaf](Org.OData.Aggregation.V1.xml#L192)|Entity:&nbsp;EntityType, Hierarchy:&nbsp;String &rarr;&nbsp;Boolean|<a name="isleaf"></a>Returns true, if and only if the value of the node property of the specified hierarchy has no descendants

## <a name="ApplySupportedType"></a>[ApplySupportedType](Org.OData.Aggregation.V1.xml#L78)


Property|Type|Description
:-------|:---|:----------
[Transformations](Org.OData.Aggregation.V1.xml#L79)|\[String\]|Transformations that can be used in $apply
[CustomAggregationMethods](Org.OData.Aggregation.V1.xml#L82)|\[String\]|Qualified names of custom aggregation methods that can be used in aggregate(...with...)
[Rollup](Org.OData.Aggregation.V1.xml#L86)|[RollupType](#RollupType)|The service supports rollup hierarchies in a groupby transformation
[PropertyRestrictions](Org.OData.Aggregation.V1.xml#L89)|Boolean|Only properties tagged as Groupable can be used in the groupby transformation, and only those tagged as Aggregatable can be used in the aggregate transformation

## <a name="RollupType"></a>[RollupType](Org.OData.Aggregation.V1.xml#L95)
The number of rollup operators allowed in a groupby transformation

Member|Value|Description
:-----|----:|:----------
[None](Org.OData.Aggregation.V1.xml#L97)|0|No rollup support
[SingleHierarchy](Org.OData.Aggregation.V1.xml#L100)|1|Only one rollup operator per groupby
[MultipleHierarchies](Org.OData.Aggregation.V1.xml#L103)|2|Full rollup support

## <a name="RecursiveHierarchyType"></a>[RecursiveHierarchyType](Org.OData.Aggregation.V1.xml#L139)


Property|Type|Description
:-------|:---|:----------
[NodeProperty](Org.OData.Aggregation.V1.xml#L140)|PropertyPath|Property holding the hierarchy node value
[ParentNavigationProperty](Org.OData.Aggregation.V1.xml#L143)|NavigationPropertyPath|Property for navigating to the parent node
[DistanceFromRootProperty](Org.OData.Aggregation.V1.xml#L146)|PropertyPath|Property holding the number of edges between the node and the root node
[IsLeafProperty](Org.OData.Aggregation.V1.xml#L149)|PropertyPath|Property indicating whether the node is a leaf of the hierarchy

## <a name="AvailableOnAggregatesType"></a>[AvailableOnAggregatesType](Org.OData.Aggregation.V1.xml#L204)


Property|Type|Description
:-------|:---|:----------
[RequiredProperties](Org.OData.Aggregation.V1.xml#L205)|\[PropertyPath\]|Properties required to apply this action or function

## <a name="NavigationPropertyRestriction"></a>[NavigationPropertyRestriction](Org.OData.Aggregation.V1.xml#L210): [NavigationPropertyRestriction](Org.OData.Capabilities.V1.md#NavigationPropertyRestriction)
Aggregation restrictions on a navigation path

This type derives from type NavigationPropertyRestriction in the Capabilities vocabulary and therefore additionally includes all properties from that type.

Property|Type|Description
:-------|:---|:----------
[ApplySupported](Org.OData.Aggregation.V1.xml#L213)|[ApplySupportedType](#ApplySupportedType)|Support for $apply
[CustomAggregates](Org.OData.Aggregation.V1.xml#L216)|\[String\]|Supported custom aggregates identified by their qualifier
[GroupableProperties](Org.OData.Aggregation.V1.xml#L219)|\[String\]|Properties supported by the groupby transformation
[AggregatableProperties](Org.OData.Aggregation.V1.xml#L222)|\[String\]|Properties supported by the aggregate transformation
