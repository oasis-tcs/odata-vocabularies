# Aggregation Vocabulary
**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Terms to describe which data in a given entity model can be aggregated, and how.


## Terms

Term|Type|Description
:---|:---|:----------
[ApplySupported](Org.OData.Aggregation.V1.xml#L76)|[ApplySupportedType](#ApplySupportedType)|<a name="ApplySupported"></a>This structured type or entity container supports the $apply system query option
[Groupable](Org.OData.Aggregation.V1.xml#L134)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Groupable"></a>This property can be used in the `groupby` transformation
[Aggregatable](Org.OData.Aggregation.V1.xml#L138)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Aggregatable"></a>This property can be used in the `aggregate` transformation
[CustomAggregate](Org.OData.Aggregation.V1.xml#L142)|String|<a name="CustomAggregate"></a>Dynamic property that can be used in the `aggregate` transformation<p>This term MUST be applied with a Qualifier, the Qualifier value is the name of the dynamic property. The value of the annotation MUST be the qualified name of a primitive type. The aggregated value will be of that type.</p>
[ContextDefiningProperties](Org.OData.Aggregation.V1.xml#L148)|\[PropertyPath\]|<a name="ContextDefiningProperties"></a>The annotated property or custom aggregate is only well-defined in the context of these properties<p>The context-defining properties need either be part of the result entities, or be restricted to a single value by a pre-filter operation. Examples are postal codes within a country, or monetary amounts whose context is the unit of currency.</p>
[LeveledHierarchy](Org.OData.Aggregation.V1.xml#L156)|\[PropertyPath\]|<a name="LeveledHierarchy"></a>Defines a leveled hierarchy by defining an ordered list of properties in the hierarchy
[RecursiveHierarchy](Org.OData.Aggregation.V1.xml#L161)|[RecursiveHierarchyType](#RecursiveHierarchyType)|<a name="RecursiveHierarchy"></a>Defines a recursive hierarchy.
[AvailableOnAggregates](Org.OData.Aggregation.V1.xml#L240)|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|<a name="AvailableOnAggregates"></a>This action or function is available on aggregated entities if the `RequiredProperties` are still defined


## Functions

Function|Signature|Description
:-------|:--------|:----------
[isroot](Org.OData.Aggregation.V1.xml#L181)|Entity:&nbsp;EntityType, Hierarchy:&nbsp;String &rarr;&nbsp;Boolean|<a name="isroot"></a>Returns true, if and only if the value of the node property of the specified hierarchy is the root of the hierarchy
[isdescendant](Org.OData.Aggregation.V1.xml#L189)|Entity:&nbsp;EntityType, Hierarchy:&nbsp;String, Node:&nbsp;PrimitiveType, MaxDistance:&nbsp;Int16? &rarr;&nbsp;Boolean|<a name="isdescendant"></a>Returns true, if and only if the value of the node property of the specified hierarchy is a descendant of the given parent node with a distance of less than or equal to the optionally specified maximum distance
[isancestor](Org.OData.Aggregation.V1.xml#L206)|Entity:&nbsp;EntityType, Hierarchy:&nbsp;String, Node:&nbsp;PrimitiveType, MaxDistance:&nbsp;Int16? &rarr;&nbsp;Boolean|<a name="isancestor"></a>Returns true, if and only if the value of the node property of the specified hierarchy is an ancestor of the given child node with a distance of less than or equal to the optionally specified maximum distance
[issibling](Org.OData.Aggregation.V1.xml#L223)|Entity:&nbsp;EntityType, Hierarchy:&nbsp;String, Node:&nbsp;PrimitiveType &rarr;&nbsp;Boolean|<a name="issibling"></a>Returns true, if and only if the value of the node property of the specified hierarchy has the same parent node as the specified node
[isleaf](Org.OData.Aggregation.V1.xml#L232)|Entity:&nbsp;EntityType, Hierarchy:&nbsp;String &rarr;&nbsp;Boolean|<a name="isleaf"></a>Returns true, if and only if the value of the node property of the specified hierarchy has no descendants

## <a name="ApplySupportedType"></a>[ApplySupportedType](Org.OData.Aggregation.V1.xml#L81)


Property|Type|Description
:-------|:---|:----------
[Transformations](Org.OData.Aggregation.V1.xml#L82)|\[String\]|Transformations that can be used in `$apply`
[CustomAggregationMethods](Org.OData.Aggregation.V1.xml#L85)|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[Rollup](Org.OData.Aggregation.V1.xml#L89)|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation
[PropertyRestrictions](Org.OData.Aggregation.V1.xml#L92)|Boolean|Only properties marked as `Groupable` can be used in the `groupby` transformation, and only those marked as `Aggregatable` can be used in the `aggregate` transformation
[GroupableProperties](Org.OData.Aggregation.V1.xml#L96)|\[PropertyPath\]|Properties supported by the `groupby` transformation. Setting this collection implies that `PropertyRestrictions` is true
[AggregatableProperties](Org.OData.Aggregation.V1.xml#L99)|\[[AggregatablePropertyType](#AggregatablePropertyType)\]|Properties supported by the `aggregate` transformation. Setting this collection implies that `PropertyRestrictions` is true

## <a name="AggregatablePropertyType"></a>[AggregatablePropertyType](Org.OData.Aggregation.V1.xml#L103)


Property|Type|Description
:-------|:---|:----------
[Property](Org.OData.Aggregation.V1.xml#L104)|PropertyPath|Aggregatable property
[SupportedAggregationMethods](Org.OData.Aggregation.V1.xml#L109)|\[String\]|Standard and custom aggregation methods than can be applied to the property. If omitted, all aggregation methods can be applied
[RecommendedAggregationMethod](Org.OData.Aggregation.V1.xml#L114)|String?|Recommended method for aggregating values of the property

## <a name="RollupType"></a>[RollupType](Org.OData.Aggregation.V1.xml#L121)
The number of `rollup` operators allowed in a `groupby` transformation

Member|Value|Description
:-----|----:|:----------
[None](Org.OData.Aggregation.V1.xml#L123)|0|No `rollup` support
[SingleHierarchy](Org.OData.Aggregation.V1.xml#L126)|1|Only one `rollup` operator per `groupby`
[MultipleHierarchies](Org.OData.Aggregation.V1.xml#L129)|2|Full `rollup` support

## <a name="RecursiveHierarchyType"></a>[RecursiveHierarchyType](Org.OData.Aggregation.V1.xml#L165)


Property|Type|Description
:-------|:---|:----------
[NodeProperty](Org.OData.Aggregation.V1.xml#L166)|PropertyPath|Property holding the hierarchy node value
[ParentNavigationProperty](Org.OData.Aggregation.V1.xml#L169)|NavigationPropertyPath|Property for navigating to the parent node
[DistanceFromRootProperty](Org.OData.Aggregation.V1.xml#L172)|PropertyPath?|Property holding the number of edges between the node and the root node
[IsLeafProperty](Org.OData.Aggregation.V1.xml#L175)|PropertyPath?|Property indicating whether the node is a leaf of the hierarchy

## <a name="AvailableOnAggregatesType"></a>[AvailableOnAggregatesType](Org.OData.Aggregation.V1.xml#L244)


Property|Type|Description
:-------|:---|:----------
[RequiredProperties](Org.OData.Aggregation.V1.xml#L245)|\[PropertyPath\]|Properties required to apply this action or function

## <a name="NavigationPropertyAggregationCapabilities"></a>[NavigationPropertyAggregationCapabilities](Org.OData.Aggregation.V1.xml#L250): [NavigationPropertyRestriction](Org.OData.Capabilities.V1.md#NavigationPropertyRestriction)
Aggregation capabilities on a navigation path

Property|Type|Description
:-------|:---|:----------
[*NavigationProperty*](Org.OData.Capabilities.V1.xml#L250)|NavigationPropertyPath?|Navigation properties can be navigated
[*Navigability*](Org.OData.Capabilities.V1.xml#L253)|[NavigationType?](Org.OData.Capabilities.V1.md#NavigationType)|Supported navigability of this navigation property
[*FilterFunctions*](Org.OData.Capabilities.V1.xml#L256)|\[String\]|List of functions and operators supported in filter expressions<p>If not specified, null, or empty, all functions and operators may be attempted.</p>
[*FilterRestrictions*](Org.OData.Capabilities.V1.xml#L261)|[FilterRestrictionsType?](Org.OData.Capabilities.V1.md#FilterRestrictionsType)|Restrictions on filter expressions
[*SearchRestrictions*](Org.OData.Capabilities.V1.xml#L264)|[SearchRestrictionsType?](Org.OData.Capabilities.V1.md#SearchRestrictionsType)|Restrictions on search expressions
[*SortRestrictions*](Org.OData.Capabilities.V1.xml#L267)|[SortRestrictionsType?](Org.OData.Capabilities.V1.md#SortRestrictionsType)|Restrictions on orderby expressions
[*TopSupported*](Org.OData.Capabilities.V1.xml#L270)|Boolean|Supports $top
[*SkipSupported*](Org.OData.Capabilities.V1.xml#L273)|Boolean|Supports $skip
[*SelectSupport*](Org.OData.Capabilities.V1.xml#L276)|[SelectSupportType?](Org.OData.Capabilities.V1.md#SelectSupportType)|Support for $select
[*IndexableByKey*](Org.OData.Capabilities.V1.xml#L279)|Boolean|Supports key values according to OData URL conventions
[*InsertRestrictions*](Org.OData.Capabilities.V1.xml#L282)|[InsertRestrictionsType?](Org.OData.Capabilities.V1.md#InsertRestrictionsType)|Restrictions on insert operations
[*DeepInsertSupport*](Org.OData.Capabilities.V1.xml#L285)|[DeepInsertSupportType?](Org.OData.Capabilities.V1.md#DeepInsertSupportType)|Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[*UpdateRestrictions*](Org.OData.Capabilities.V1.xml#L289)|[UpdateRestrictionsType?](Org.OData.Capabilities.V1.md#UpdateRestrictionsType)|Restrictions on update operations
[*DeepUpdateSupport*](Org.OData.Capabilities.V1.xml#L292)|[DeepUpdateSupportType?](Org.OData.Capabilities.V1.md#DeepUpdateSupportType)|Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[*DeleteRestrictions*](Org.OData.Capabilities.V1.xml#L296)|[DeleteRestrictionsType?](Org.OData.Capabilities.V1.md#DeleteRestrictionsType)|Restrictions on delete operations
[*OptimisticConcurrencyControl*](Org.OData.Capabilities.V1.xml#L299)|Boolean|Data modification (including insert) along this navigation property requires the use of ETags
[*ReadRestrictions*](Org.OData.Capabilities.V1.xml#L303)|[ReadRestrictionsType?](Org.OData.Capabilities.V1.md#ReadRestrictionsType)|Restrictions for retrieving entities
[ApplySupported](Org.OData.Aggregation.V1.xml#L252)|[ApplySupportedType?](#ApplySupportedType)|Support for `$apply`
[CustomAggregates](Org.OData.Aggregation.V1.xml#L255)|\[[CustomAggregateType](#CustomAggregateType)\]|Supported custom aggregates

## <a name="CustomAggregateType"></a>[CustomAggregateType](Org.OData.Aggregation.V1.xml#L260)


Property|Type|Description
:-------|:---|:----------
[Name](Org.OData.Aggregation.V1.xml#L261)|String|Name of the dynamic property that can be used in the `aggregate` transformation
[Type](Org.OData.Aggregation.V1.xml#L264)|String|Qualified name of a primitive type. The aggregated value will be of that type
