# Aggregation Vocabulary

Terms to describe which data in a given entity model can be aggregated, and how.

**Namespace: Org.OData.Aggregation.V1**

<table width="100%" style="border: 1px solid #000000;" border="1">
<tbody><tr><th><strong>Term</strong></th><th><strong>Description</strong></th></tr>
<tr><td>ApplySupported</td>
<td>This structured type or entity container supports the $apply system query option</td></tr>
<tr><td>Groupable</td>
<td>This property can be used in the groupby transformation</td></tr>
<tr><td>Aggregatable</td>
<td>This property can be used in the aggregate transformation</td></tr>
<tr><td>CustomAggregate</td>
<td>Dynamic property that can be used in the aggregate transformation</td></tr>
<tr><td>ContextDefiningProperties</td>
<td>The annotated property or custom aggregate is only well-defined in the context of these properties</td></tr>
<tr><td>LeveledHierarchy</td>
<td>Defines a leveled hierarchy by defining an ordered list of properties in the hierarchy</td></tr>
<tr><td>RecursiveHierarchy</td>
<td>Defines a recursive hierarchy.</td></tr>
<tr><td>AvailableOnAggregates</td>
<td>This action or function is available on aggregated entities if the RequiredProperties are still defined</td></tr>
</tbody></table>

[XML Source](Org.OData.Aggregation.V1.xml)