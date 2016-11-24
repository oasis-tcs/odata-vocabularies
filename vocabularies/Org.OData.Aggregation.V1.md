# Aggregation Vocabulary

Terms to describe which data in a given entity model can be aggregated, and how.

**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Term|Type|Description
----|----|-----------
ApplySupported|[ApplySupportedType](#ApplySupportedType)|This structured type or entity container supports the $apply system query option
Groupable|[Tag](./Org.OData.Core.V1.md#Tag)|This property can be used in the groupby transformation
Aggregatable|[Tag](./Org.OData.Core.V1.md#Tag)|This property can be used in the aggregate transformation
CustomAggregate|*String*|Dynamic property that can be used in the aggregate transformation
ContextDefiningProperties|\[*PropertyPath*\]|The annotated property or custom aggregate is only well-defined in the context of these properties
LeveledHierarchy|\[*PropertyPath*\]|Defines a leveled hierarchy by defining an ordered list of properties in the hierarchy
RecursiveHierarchy|[RecursiveHierarchyType](#RecursiveHierarchyType)|Defines a recursive hierarchy.
AvailableOnAggregates|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|This action or function is available on aggregated entities if the RequiredProperties are still defined


## <a name="ApplySupportedType"></a>ApplySupportedType


## <a name="RollupType"></a>RollupType

The number of rollup operators allowed in a groupby transformation
## <a name="RecursiveHierarchyType"></a>RecursiveHierarchyType


## <a name="AvailableOnAggregatesType"></a>AvailableOnAggregatesType

