# Aggregation Vocabulary
**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Terms to describe which data in a given entity model can be aggregated, and how.

Term|Type|Description
----|----|-----------
ApplySupported|[ApplySupportedType](#ApplySupportedType)|This structured type or entity container supports the $apply system query option
Groupable|[Tag](Org.OData.Core.V1.md#Tag)|This property can be used in the groupby transformation
Aggregatable|[Tag](Org.OData.Core.V1.md#Tag)|This property can be used in the aggregate transformation
CustomAggregate|String|Dynamic property that can be used in the aggregate transformation
ContextDefiningProperties|\[PropertyPath\]|The annotated property or custom aggregate is only well-defined in the context of these properties
LeveledHierarchy|\[PropertyPath\]|Defines a leveled hierarchy by defining an ordered list of properties in the hierarchy
RecursiveHierarchy|[RecursiveHierarchyType](#RecursiveHierarchyType)|Defines a recursive hierarchy.
AvailableOnAggregates|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|This action or function is available on aggregated entities if the RequiredProperties are still defined

## <a name="ApplySupportedType"></a>ApplySupportedType


Property|Type|Description
--------|----|-----------
Transformations|\[String\]|Transformations that can be used in $apply
CustomAggregationMethods|\[String\]|Qualified names of custom aggregation methods that can be used in aggregate(...with...)
Rollup|[RollupType](#RollupType)|The service supports rollup hierarchies in a groupby transformation
PropertyRestrictions|Boolean|Only properties tagged as Groupable can be used in the groupby transformation, and only those tagged as Aggregatable can be used in the aggregate transformation

## <a name="RollupType"></a>RollupType
The number of rollup operators allowed in a groupby transformation

Member|Value|Description
------|----:|-----------
None|0|
SingleHierarchy|1|
MultipleHierarchies|2|

## <a name="RecursiveHierarchyType"></a>RecursiveHierarchyType


Property|Type|Description
--------|----|-----------
NodeProperty|PropertyPath|Property holding the hierarchy node value
ParentNavigationProperty|NavigationPropertyPath|Property for navigating to the parent node
DistanceFromRootProperty|PropertyPath|Property holding the number of edges between the node and the root node
IsLeafProperty|PropertyPath|Property indicating whether the node is a leaf of the hierarchy

## <a name="AvailableOnAggregatesType"></a>AvailableOnAggregatesType


Property|Type|Description
--------|----|-----------
RequiredProperties|\[PropertyPath\]|
