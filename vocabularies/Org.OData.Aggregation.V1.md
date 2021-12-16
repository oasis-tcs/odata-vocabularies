# Aggregation Vocabulary
**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Terms to describe which data in a given entity model can be aggregated, and how.


## Terms

Term|Type|Description
:---|:---|:----------
[ApplySupported](./Org.OData.Aggregation.V1.xml#L71:~:text=<Term%20Name="-,ApplySupported,-")|[ApplySupportedType](#ApplySupportedType)|<a name="ApplySupported"></a>This entity set or collection supports the `$apply` system query option
[ApplySupportedDefaults](./Org.OData.Aggregation.V1.xml#L77:~:text=<Term%20Name="-,ApplySupportedDefaults,-")|[ApplySupportedBase](#ApplySupportedBase)|<a name="ApplySupportedDefaults"></a>Default support of the `$apply` system query option for all collection-valued resources in the container<br>Annotating term [`ApplySupported`](#ApplySupported) for a specific collection-valued resource overrides the default support with the specified properties using PATCH semantics:<br/>- Primitive or collection-valued properties specified in `ApplySupported` replace the corresponding properties specified in `ApplySupportedDefaults`<br/>- Complex-valued properties specified in `ApplySupported` override the corresponding properties specified in `ApplySupportedDefaults` using PATCH semantics recursively<br/>- Properties specified neither in `ApplySupported` nor in `ApplySupportedDefaults` have their default value
[Groupable](./Org.OData.Aggregation.V1.xml#L153:~:text=<Term%20Name="-,Groupable,-") *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Groupable"></a>Deprecated in favor of [`ApplySupported/GroupableProperties`](#ApplySupported)
[Aggregatable](./Org.OData.Aggregation.V1.xml#L165:~:text=<Term%20Name="-,Aggregatable,-") *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Aggregatable"></a>Deprecated in favor of [`ApplySupported/AggregatableProperties`](#ApplySupported)
[CustomAggregate](./Org.OData.Aggregation.V1.xml#L177:~:text=<Term%20Name="-,CustomAggregate,-")|String|<a name="CustomAggregate"></a>Dynamic property that can be used in the `aggregate` transformation<br>This term MUST be applied with a Qualifier, the Qualifier value is the name of the dynamic property. The value of the annotation MUST be the qualified name of a primitive type. The aggregated value will be of that type.
[ContextDefiningProperties](./Org.OData.Aggregation.V1.xml#L183:~:text=<Term%20Name="-,ContextDefiningProperties,-")|\[PropertyPath\]|<a name="ContextDefiningProperties"></a>The annotated property or custom aggregate is only well-defined in the context of these properties<br>The context-defining properties need either be part of the result entities, or be restricted to a single value by a pre-filter operation. Examples are postal codes within a country, or monetary amounts whose context is the unit of currency.
[IsUndefined](./Org.OData.Aggregation.V1.xml#L190:~:text=<Term%20Name="-,IsUndefined,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="IsUndefined"></a>This instance annotation occurs in the output set of a `groupby` transformation where a grouping property is undefined.<br>This allows the consumer to distinguish between a group where the property is undefined from a group contributed by `$rollup` that represents the aggregation over that property: ``` [{"Country": "US", "Total": 55000}, {"Country": "US", "State@Aggregation.IsUndefined": true, "Total": 100}, {"Country": "US", "State": "WA", "Total": 1000}, ...] ```
[LeveledHierarchy](./Org.OData.Aggregation.V1.xml#L203:~:text=<Term%20Name="-,LeveledHierarchy,-")|\[PropertyPath\]|<a name="LeveledHierarchy"></a>Defines a leveled hierarchy by defining an ordered list of properties in the hierarchy
[RecursiveHierarchy](./Org.OData.Aggregation.V1.xml#L207:~:text=<Term%20Name="-,RecursiveHierarchy,-")|[RecursiveHierarchyType](#RecursiveHierarchyType)|<a name="RecursiveHierarchy"></a>Defines a recursive hierarchy.
[AvailableOnAggregates](./Org.OData.Aggregation.V1.xml#L267:~:text=<Term%20Name="-,AvailableOnAggregates,-")|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|<a name="AvailableOnAggregates"></a>This action or function is available on aggregated entities if the `RequiredProperties` are still defined


## Functions

### <a name="isroot"></a>[isroot](./Org.OData.Aggregation.V1.xml#L227:~:text=<Function%20Name="-,isroot,-")

Returns true, if and only if the value of the node property of the specified hierarchy is the root of the hierarchy

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L229:~:text=<Function%20Name="-,isroot,-")**|EntityType|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L230:~:text=<Function%20Name="-,isroot,-")|String|
[&rarr;](./Org.OData.Aggregation.V1.xml#L231:~:text=<Function%20Name="-,isroot,-")|Boolean|


### <a name="isdescendant"></a>[isdescendant](./Org.OData.Aggregation.V1.xml#L234:~:text=<Function%20Name="-,isdescendant,-")

Returns true, if and only if the value of the node property of the specified hierarchy is a descendant of the given parent node with a distance of less than or equal to the optionally specified maximum distance

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L236:~:text=<Function%20Name="-,isdescendant,-")**|EntityType|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L237:~:text=<Function%20Name="-,isdescendant,-")|String|
[Node](./Org.OData.Aggregation.V1.xml#L238:~:text=<Function%20Name="-,isdescendant,-")|PrimitiveType|
[MaxDistance](./Org.OData.Aggregation.V1.xml#L239:~:text=<Function%20Name="-,isdescendant,-")|Int16?|
[&rarr;](./Org.OData.Aggregation.V1.xml#L240:~:text=<Function%20Name="-,isdescendant,-")|Boolean|


### <a name="isancestor"></a>[isancestor](./Org.OData.Aggregation.V1.xml#L243:~:text=<Function%20Name="-,isancestor,-")

Returns true, if and only if the value of the node property of the specified hierarchy is an ancestor of the given child node with a distance of less than or equal to the optionally specified maximum distance

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L245:~:text=<Function%20Name="-,isancestor,-")**|EntityType|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L246:~:text=<Function%20Name="-,isancestor,-")|String|
[Node](./Org.OData.Aggregation.V1.xml#L247:~:text=<Function%20Name="-,isancestor,-")|PrimitiveType|
[MaxDistance](./Org.OData.Aggregation.V1.xml#L248:~:text=<Function%20Name="-,isancestor,-")|Int16?|
[&rarr;](./Org.OData.Aggregation.V1.xml#L249:~:text=<Function%20Name="-,isancestor,-")|Boolean|


### <a name="issibling"></a>[issibling](./Org.OData.Aggregation.V1.xml#L252:~:text=<Function%20Name="-,issibling,-")

Returns true, if and only if the value of the node property of the specified hierarchy has the same parent node as the specified node

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L254:~:text=<Function%20Name="-,issibling,-")**|EntityType|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L255:~:text=<Function%20Name="-,issibling,-")|String|
[Node](./Org.OData.Aggregation.V1.xml#L256:~:text=<Function%20Name="-,issibling,-")|PrimitiveType|
[&rarr;](./Org.OData.Aggregation.V1.xml#L257:~:text=<Function%20Name="-,issibling,-")|Boolean|


### <a name="isleaf"></a>[isleaf](./Org.OData.Aggregation.V1.xml#L260:~:text=<Function%20Name="-,isleaf,-")

Returns true, if and only if the value of the node property of the specified hierarchy has no descendants

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L262:~:text=<Function%20Name="-,isleaf,-")**|EntityType|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L263:~:text=<Function%20Name="-,isleaf,-")|String|
[&rarr;](./Org.OData.Aggregation.V1.xml#L264:~:text=<Function%20Name="-,isleaf,-")|Boolean|


## <a name="ApplySupportedBase"></a>[ApplySupportedBase](./Org.OData.Aggregation.V1.xml#L92:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")


**Derived Types:**
- [ApplySupportedType](#ApplySupportedType)

Property|Type|Description
:-------|:---|:----------
[Transformations](./Org.OData.Aggregation.V1.xml#L93:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Transformations that can be used in `$apply`
[CustomAggregationMethods](./Org.OData.Aggregation.V1.xml#L96:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[Rollup](./Org.OData.Aggregation.V1.xml#L99:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation

## <a name="ApplySupportedType"></a>[ApplySupportedType](./Org.OData.Aggregation.V1.xml#L103:~:text=<ComplexType%20Name="-,ApplySupportedType,-"): [ApplySupportedBase](#ApplySupportedBase)


Property|Type|Description
:-------|:---|:----------
[*Transformations*](./Org.OData.Aggregation.V1.xml#L93:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Transformations that can be used in `$apply`
[*CustomAggregationMethods*](./Org.OData.Aggregation.V1.xml#L96:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[*Rollup*](./Org.OData.Aggregation.V1.xml#L99:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation
[PropertyRestrictions](./Org.OData.Aggregation.V1.xml#L104:~:text=<ComplexType%20Name="-,ApplySupportedType,-") *(Deprecated)*|Boolean|Deprecated since [`Groupable`](#Groupable) and [`Aggregatable`](#Aggregatable) are deprecated
[GroupableProperties](./Org.OData.Aggregation.V1.xml#L115:~:text=<ComplexType%20Name="-,ApplySupportedType,-")|\[PropertyPath\]|A non-empty collection indicates that only the listed properties of the annotated target are supported by the `groupby` transformation
[AggregatableProperties](./Org.OData.Aggregation.V1.xml#L118:~:text=<ComplexType%20Name="-,ApplySupportedType,-")|\[[AggregatablePropertyType](#AggregatablePropertyType)\]|A non-empty collection indicates that only the listed properties of the annotated target can be used in the `aggregate` transformation, optionally restricted to the specified aggregation methods

## <a name="AggregatablePropertyType"></a>[AggregatablePropertyType](./Org.OData.Aggregation.V1.xml#L122:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")


Property|Type|Description
:-------|:---|:----------
[Property](./Org.OData.Aggregation.V1.xml#L123:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|PropertyPath|Aggregatable property
[SupportedAggregationMethods](./Org.OData.Aggregation.V1.xml#L128:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|\[String\]|Standard and custom aggregation methods than can be applied to the property. If omitted, all aggregation methods can be applied
[RecommendedAggregationMethod](./Org.OData.Aggregation.V1.xml#L133:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|String?|Recommended method for aggregating values of the property

## <a name="RollupType"></a>[RollupType](./Org.OData.Aggregation.V1.xml#L140:~:text=<EnumType%20Name="-,RollupType,-")
The number of `rollup` operators allowed in a `groupby` transformation

Member|Value|Description
:-----|----:|:----------
[None](./Org.OData.Aggregation.V1.xml#L142:~:text=<EnumType%20Name="-,RollupType,-")|0|No `rollup` support
[SingleHierarchy](./Org.OData.Aggregation.V1.xml#L145:~:text=<EnumType%20Name="-,RollupType,-")|1|Only one `rollup` operator per `groupby`
[MultipleHierarchies](./Org.OData.Aggregation.V1.xml#L148:~:text=<EnumType%20Name="-,RollupType,-")|2|Full `rollup` support

## <a name="RecursiveHierarchyType"></a>[RecursiveHierarchyType](./Org.OData.Aggregation.V1.xml#L211:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")


Property|Type|Description
:-------|:---|:----------
[NodeProperty](./Org.OData.Aggregation.V1.xml#L212:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|PropertyPath|Property holding the hierarchy node value
[ParentNavigationProperty](./Org.OData.Aggregation.V1.xml#L215:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|NavigationPropertyPath|Property for navigating to the parent node
[DistanceFromRootProperty](./Org.OData.Aggregation.V1.xml#L218:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|PropertyPath?|Property holding the number of edges between the node and the root node
[IsLeafProperty](./Org.OData.Aggregation.V1.xml#L221:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|PropertyPath?|Property indicating whether the node is a leaf of the hierarchy

## <a name="AvailableOnAggregatesType"></a>[AvailableOnAggregatesType](./Org.OData.Aggregation.V1.xml#L270:~:text=<ComplexType%20Name="-,AvailableOnAggregatesType,-")


Property|Type|Description
:-------|:---|:----------
[RequiredProperties](./Org.OData.Aggregation.V1.xml#L271:~:text=<ComplexType%20Name="-,AvailableOnAggregatesType,-")|\[PropertyPath\]|Properties required to apply this action or function

## <a name="NavigationPropertyAggregationCapabilities"></a>[NavigationPropertyAggregationCapabilities](./Org.OData.Aggregation.V1.xml#L276:~:text=<ComplexType%20Name="-,NavigationPropertyAggregationCapabilities,-"): [NavigationPropertyRestriction](Org.OData.Capabilities.V1.md#NavigationPropertyRestriction) *(Deprecated)*
[`Capabilities.NavigationRestrictions`](Org.OData.Capabilities.V1.md#NavigationRestrictions) that make use of the additional properties in this subtype are deprecated in favor of [`ApplySupported`](#ApplySupported) and [`CustomAggregate`](#CustomAggregate)

## <a name="CustomAggregateType"></a>[CustomAggregateType](./Org.OData.Aggregation.V1.xml#L294:~:text=<ComplexType%20Name="-,CustomAggregateType,-") *(Deprecated)*
Deprecated since [`NavigationPropertyAggregationCapabilities`](#NavigationPropertyAggregationCapabilities) is also deprecated
