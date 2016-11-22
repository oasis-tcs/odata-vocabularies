# Aggregation Vocabulary

Terms to describe which data in a given entity model can be aggregated, and how.

**Namespace: Org.OData.Aggregation.V1**

Term|Description
----|-----------
ApplySupported|This structured type or entity container supports the $apply system query option
Groupable|This property can be used in the groupby transformation
Aggregatable|This property can be used in the aggregate transformation
CustomAggregate|Dynamic property that can be used in the aggregate transformation
ContextDefiningProperties|The annotated property or custom aggregate is only well-defined in the context of these properties
LeveledHierarchy|Defines a leveled hierarchy by defining an ordered list of properties in the hierarchy
RecursiveHierarchy|Defines a recursive hierarchy.
AvailableOnAggregates|This action or function is available on aggregated entities if the RequiredProperties are still defined

[XML Source](Org.OData.Aggregation.V1.xml)