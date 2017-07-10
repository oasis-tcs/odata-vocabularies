# Aggregation Vocabulary
**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Terms to describe which data in a given entity model can be aggregated, and how.

Term|Type|Description
:---|:---|:----------
[ApplySupported](Org.OData.Aggregation.V1.xml#L70)|[ApplySupportedType](#ApplySupportedType)|<a name="ApplySupported"></a>This structured type or entity container supports the $apply system query option
[Groupable](Org.OData.Aggregation.V1.xml#L104)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Groupable"></a>This property can be used in the groupby transformation
[Aggregatable](Org.OData.Aggregation.V1.xml#L108)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Aggregatable"></a>This property can be used in the aggregate transformation
[CustomAggregate](Org.OData.Aggregation.V1.xml#L112)|String|<a name="CustomAggregate"></a>Dynamic property that can be used in the aggregate transformation<p>This term MUST be applied with a Qualifier, the Qualifier value is the name of the dynamic property. The value of the annotation MUST be the qualified name of a primitive type. The aggregated values will be of that type.</p>
[ContextDefiningProperties](Org.OData.Aggregation.V1.xml#L118)|\[PropertyPath\]|<a name="ContextDefiningProperties"></a>The annotated property or custom aggregate is only well-defined in the context of these properties<p>The context-defining properties need either be part of the result entities, or be restricted to a single value by a pre-filter operation. Examples are postal codes within a country, or monetary amounts whose context is the unit of currency.</p>
[LeveledHierarchy](Org.OData.Aggregation.V1.xml#L126)|\[PropertyPath\]|<a name="LeveledHierarchy"></a>Defines a leveled hierarchy by defining an ordered list of properties in the hierarchy
[RecursiveHierarchy](Org.OData.Aggregation.V1.xml#L130)|[RecursiveHierarchyType](#RecursiveHierarchyType)|<a name="RecursiveHierarchy"></a>Defines a recursive hierarchy.
[AvailableOnAggregates](Org.OData.Aggregation.V1.xml#L195)|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|<a name="AvailableOnAggregates"></a>This action or function is available on aggregated entities if the RequiredProperties are still defined

## <a name="ApplySupportedType"></a>[ApplySupportedType](Org.OData.Aggregation.V1.xml#L75)


Property|Type|Description
:-------|:---|:----------
[Transformations](Org.OData.Aggregation.V1.xml#L76)|\[String\]|Transformations that can be used in $apply
[CustomAggregationMethods](Org.OData.Aggregation.V1.xml#L79)|\[String\]|Qualified names of custom aggregation methods that can be used in aggregate(...with...)
[Rollup](Org.OData.Aggregation.V1.xml#L82)|[RollupType](#RollupType)|The service supports rollup hierarchies in a groupby transformation
[PropertyRestrictions](Org.OData.Aggregation.V1.xml#L85)|Boolean|Only properties tagged as Groupable can be used in the groupby transformation, and only those tagged as Aggregatable can be used in the aggregate transformation

## <a name="RollupType"></a>[RollupType](Org.OData.Aggregation.V1.xml#L91)
The number of rollup operators allowed in a groupby transformation

Member|Value|Description
:-----|----:|:----------
[None](Org.OData.Aggregation.V1.xml#L93)|0|No rollup support
[SingleHierarchy](Org.OData.Aggregation.V1.xml#L96)|1|Only one rollup operator per groupby
[MultipleHierarchies](Org.OData.Aggregation.V1.xml#L99)|2|Full rollup support

## <a name="RecursiveHierarchyType"></a>[RecursiveHierarchyType](Org.OData.Aggregation.V1.xml#L134)


Property|Type|Description
:-------|:---|:----------
[NodeProperty](Org.OData.Aggregation.V1.xml#L135)|PropertyPath|Property holding the hierarchy node value
[ParentNavigationProperty](Org.OData.Aggregation.V1.xml#L138)|NavigationPropertyPath|Property for navigating to the parent node
[DistanceFromRootProperty](Org.OData.Aggregation.V1.xml#L141)|PropertyPath|Property holding the number of edges between the node and the root node
[IsLeafProperty](Org.OData.Aggregation.V1.xml#L144)|PropertyPath|Property indicating whether the node is a leaf of the hierarchy

## <a name="AvailableOnAggregatesType"></a>[AvailableOnAggregatesType](Org.OData.Aggregation.V1.xml#L199)


Property|Type|Description
:-------|:---|:----------
[RequiredProperties](Org.OData.Aggregation.V1.xml#L200)|\[PropertyPath\]|Properties required to apply this action or function
