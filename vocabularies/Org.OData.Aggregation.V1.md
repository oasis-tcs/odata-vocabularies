# Aggregation Vocabulary
**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Terms to describe which data in a given entity model can be aggregated, and how.

Term|Type|Description
:---|:---|:----------
[ApplySupported](Org.OData.Aggregation.V1.xml#L60)|[ApplySupportedType](#ApplySupportedType)|<a name="ApplySupported"></a>This structured type or entity container supports the $apply system query option
[Groupable](Org.OData.Aggregation.V1.xml#L94)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Groupable"></a>This property can be used in the groupby transformation
[Aggregatable](Org.OData.Aggregation.V1.xml#L98)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Aggregatable"></a>This property can be used in the aggregate transformation
[CustomAggregate](Org.OData.Aggregation.V1.xml#L102)|String|<a name="CustomAggregate"></a>Dynamic property that can be used in the aggregate transformation
[ContextDefiningProperties](Org.OData.Aggregation.V1.xml#L108)|\[PropertyPath\]|<a name="ContextDefiningProperties"></a>The annotated property or custom aggregate is only well-defined in the context of these properties
[LeveledHierarchy](Org.OData.Aggregation.V1.xml#L116)|\[PropertyPath\]|<a name="LeveledHierarchy"></a>Defines a leveled hierarchy by defining an ordered list of properties in the hierarchy
[RecursiveHierarchy](Org.OData.Aggregation.V1.xml#L120)|[RecursiveHierarchyType](#RecursiveHierarchyType)|<a name="RecursiveHierarchy"></a>Defines a recursive hierarchy.
[AvailableOnAggregates](Org.OData.Aggregation.V1.xml#L185)|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|<a name="AvailableOnAggregates"></a>This action or function is available on aggregated entities if the RequiredProperties are still defined

## <a name="ApplySupportedType"></a>[ApplySupportedType](Org.OData.Aggregation.V1.xml#L65)


Property|Type|Description
:-------|:---|:----------
[Transformations](Org.OData.Aggregation.V1.xml#L66)|\[String\]|Transformations that can be used in $apply
[CustomAggregationMethods](Org.OData.Aggregation.V1.xml#L69)|\[String\]|Qualified names of custom aggregation methods that can be used in aggregate(...with...)
[Rollup](Org.OData.Aggregation.V1.xml#L72)|[RollupType](#RollupType)|The service supports rollup hierarchies in a groupby transformation
[PropertyRestrictions](Org.OData.Aggregation.V1.xml#L75)|Boolean|Only properties tagged as Groupable can be used in the groupby transformation, and only those tagged as Aggregatable can be used in the aggregate transformation

## <a name="RollupType"></a>[RollupType](Org.OData.Aggregation.V1.xml#L81)
The number of rollup operators allowed in a groupby transformation

Member|Value|Description
:-----|----:|:----------
[None](Org.OData.Aggregation.V1.xml#L83)|0|No rollup support
[SingleHierarchy](Org.OData.Aggregation.V1.xml#L86)|1|Only one rollup operator per groupby
[MultipleHierarchies](Org.OData.Aggregation.V1.xml#L89)|2|Full rollup support

## <a name="RecursiveHierarchyType"></a>[RecursiveHierarchyType](Org.OData.Aggregation.V1.xml#L124)


Property|Type|Description
:-------|:---|:----------
[NodeProperty](Org.OData.Aggregation.V1.xml#L125)|PropertyPath|Property holding the hierarchy node value
[ParentNavigationProperty](Org.OData.Aggregation.V1.xml#L128)|NavigationPropertyPath|Property for navigating to the parent node
[DistanceFromRootProperty](Org.OData.Aggregation.V1.xml#L131)|PropertyPath|Property holding the number of edges between the node and the root node
[IsLeafProperty](Org.OData.Aggregation.V1.xml#L134)|PropertyPath|Property indicating whether the node is a leaf of the hierarchy

## <a name="AvailableOnAggregatesType"></a>[AvailableOnAggregatesType](Org.OData.Aggregation.V1.xml#L189)


Property|Type|Description
:-------|:---|:----------
[RequiredProperties](Org.OData.Aggregation.V1.xml#L190)|\[PropertyPath\]|Properties required to apply this action or function
