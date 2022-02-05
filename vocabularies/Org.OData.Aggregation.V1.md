# Aggregation Vocabulary
**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Terms to describe which data in a given entity model can be aggregated, and how.


## Terms

Term|Type|Description
:---|:---|:----------
[ApplySupported](./Org.OData.Aggregation.V1.xml#L75:~:text=<Term%20Name="-,ApplySupported,-")|[ApplySupportedType](#ApplySupportedType)|<a name="ApplySupported"></a>This entity set or collection supports the `$apply` system query option
[ApplySupportedDefaults](./Org.OData.Aggregation.V1.xml#L81:~:text=<Term%20Name="-,ApplySupportedDefaults,-")|[ApplySupportedBase](#ApplySupportedBase)|<a name="ApplySupportedDefaults"></a>Default support of the `$apply` system query option for all collection-valued resources in the container<br>Annotating term [`ApplySupported`](#ApplySupported) for a specific collection-valued resource overrides the default support with the specified properties using PATCH semantics:<br/>- Primitive or collection-valued properties specified in `ApplySupported` replace the corresponding properties specified in `ApplySupportedDefaults`<br/>- Complex-valued properties specified in `ApplySupported` override the corresponding properties specified in `ApplySupportedDefaults` using PATCH semantics recursively<br/>- Properties specified neither in `ApplySupported` nor in `ApplySupportedDefaults` have their default value
[Groupable](./Org.OData.Aggregation.V1.xml#L158:~:text=<Term%20Name="-,Groupable,-") *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Groupable"></a>Deprecated in favor of [`ApplySupported/GroupableProperties`](#ApplySupported)
[Aggregatable](./Org.OData.Aggregation.V1.xml#L170:~:text=<Term%20Name="-,Aggregatable,-") *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Aggregatable"></a>Deprecated in favor of [`ApplySupported/AggregatableProperties`](#ApplySupported)
[CustomAggregate](./Org.OData.Aggregation.V1.xml#L182:~:text=<Term%20Name="-,CustomAggregate,-")|String|<a name="CustomAggregate"></a>Dynamic property that can be used in the `aggregate` transformation<br>This term MUST be applied with a Qualifier, the Qualifier value is the name of the dynamic property. The value of the annotation MUST be the qualified name of a primitive type. The aggregated value will be of that type.
[ContextDefiningProperties](./Org.OData.Aggregation.V1.xml#L188:~:text=<Term%20Name="-,ContextDefiningProperties,-")|\[PropertyPath\]|<a name="ContextDefiningProperties"></a>The annotated property or custom aggregate is only well-defined in the context of these properties<br>The context-defining properties need either be part of the result entities, or be restricted to a single value by a pre-filter operation. Examples are postal codes within a country, or monetary amounts whose context is the unit of currency.
[LeveledHierarchy](./Org.OData.Aggregation.V1.xml#L195:~:text=<Term%20Name="-,LeveledHierarchy,-")|\[PropertyPath\]|<a name="LeveledHierarchy"></a>Defines a leveled hierarchy by defining an ordered list of properties in the hierarchy
[RecursiveHierarchy](./Org.OData.Aggregation.V1.xml#L199:~:text=<Term%20Name="-,RecursiveHierarchy,-")|[RecursiveHierarchyType](#RecursiveHierarchyType)|<a name="RecursiveHierarchy"></a>Defines a recursive hierarchy.
[AvailableOnAggregates](./Org.OData.Aggregation.V1.xml#L450:~:text=<Term%20Name="-,AvailableOnAggregates,-")|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|<a name="AvailableOnAggregates"></a>This action or function is available on aggregated entities if the `RequiredProperties` are still defined


## Functions

### <a name="isroot"></a>[isroot](./Org.OData.Aggregation.V1.xml#L224:~:text=<Function%20Name="-,isroot,-")

Is the node a root of the specified hierarchy?

If a node value passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L227:~:text=<Function%20Name="-,isroot,-")|\[EntityType\]|A collection, given through a path expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L230:~:text=<Function%20Name="-,isroot,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L231:~:text=<Function%20Name="-,isroot,-")|PrimitiveType?|Node value of the putative root
[&rarr;](./Org.OData.Aggregation.V1.xml#L234:~:text=<Function%20Name="-,isroot,-")|Boolean?|


### <a name="isdescendant"></a>[isdescendant](./Org.OData.Aggregation.V1.xml#L237:~:text=<Function%20Name="-,isdescendant,-")

Is the node a descendant in the specified hierarchy of the ancestor node with at most the specified distance?

If a node value passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L240:~:text=<Function%20Name="-,isdescendant,-")|\[EntityType\]|A collection, given through a path expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L243:~:text=<Function%20Name="-,isdescendant,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L244:~:text=<Function%20Name="-,isdescendant,-")|PrimitiveType?|Node value of the putative descendant
[Ancestor](./Org.OData.Aggregation.V1.xml#L247:~:text=<Function%20Name="-,isdescendant,-")|PrimitiveType?|Node value of the ancestor node
*[MaxDistance](./Org.OData.Aggregation.V1.xml#L250:~:text=<Function%20Name="-,isdescendant,-")*|Int16|*Optional parameter*
*[IncludeSelf](./Org.OData.Aggregation.V1.xml#L258:~:text=<Function%20Name="-,isdescendant,-")*|Boolean|*Optional parameter:* Whether the node is considered a descendant of itself
[&rarr;](./Org.OData.Aggregation.V1.xml#L266:~:text=<Function%20Name="-,isdescendant,-")|Boolean?|


### <a name="isdescendant"></a>[isdescendant](./Org.OData.Aggregation.V1.xml#L269)

Is the node a descendant in the specified hierarchy of one of the nodes in the binding parameter with at most the specified distance?

This overload can be used in a `filter` transformation to determine the descendants of a subset of the input set.
```
$apply=filter($these/$filter(startswith(Name,'US'))
  /Aggregation.isdescendant(
    NodePropertyPath='ID',
    HierarchyNodes=@hierarchyNodes,
    HierarchyQualifier='SalesOrgHierarchy',
    Node=@nodeValue,
    IncludeSelf=true)
)&@hierarchyNodes=$root/SalesOrganizations
&@nodeValue=ID
```
If a node value passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
**[Nodes](./Org.OData.Aggregation.V1.xml#L286)**|\[EntityType\]|**Binding parameter**
[NodePropertyPath](./Org.OData.Aggregation.V1.xml#L287)|String|Property path in the binding parameter's entity type that addresses the node value
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L290)|\[EntityType\]|A collection, given through a path expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L293)|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L294)|PrimitiveType?|Node value of the putative descendant
*[MaxDistance](./Org.OData.Aggregation.V1.xml#L297)*|Int16|*Optional parameter*
*[IncludeSelf](./Org.OData.Aggregation.V1.xml#L305)*|Boolean|*Optional parameter:* Whether the node is considered a descendant of itself
[&rarr;](./Org.OData.Aggregation.V1.xml#L313)|Boolean?|


### <a name="isancestor"></a>[isancestor](./Org.OData.Aggregation.V1.xml#L316:~:text=<Function%20Name="-,isancestor,-")

Is the node an ancestor in the specified hierarchy of the descendant node with at most the specified distance?

If a node value passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L319:~:text=<Function%20Name="-,isancestor,-")|\[EntityType\]|A collection, given through a path expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L322:~:text=<Function%20Name="-,isancestor,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L323:~:text=<Function%20Name="-,isancestor,-")|PrimitiveType?|Node value of the putative ancestor
[Descendant](./Org.OData.Aggregation.V1.xml#L326:~:text=<Function%20Name="-,isancestor,-")|PrimitiveType?|Node value of the descendant node
*[MaxDistance](./Org.OData.Aggregation.V1.xml#L329:~:text=<Function%20Name="-,isancestor,-")*|Int16|*Optional parameter*
*[IncludeSelf](./Org.OData.Aggregation.V1.xml#L337:~:text=<Function%20Name="-,isancestor,-")*|Boolean|*Optional parameter:* Whether the node is considered an ancestor of itself
[&rarr;](./Org.OData.Aggregation.V1.xml#L345:~:text=<Function%20Name="-,isancestor,-")|Boolean?|


### <a name="isancestor"></a>[isancestor](./Org.OData.Aggregation.V1.xml#L348)

Is the node an ancestor in the specified hierarchy of one of the nodes in the binding parameter with at most the specified distance?

If a node value passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
**[Nodes](./Org.OData.Aggregation.V1.xml#L351)**|\[EntityType\]|**Binding parameter**
[NodePropertyPath](./Org.OData.Aggregation.V1.xml#L352)|String|Property path in the binding parameter's entity type that addresses the node value
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L355)|\[EntityType\]|A collection, given through a path expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L358)|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L359)|PrimitiveType?|Node value of the putative ancestor
*[MaxDistance](./Org.OData.Aggregation.V1.xml#L362)*|Int16|*Optional parameter*
*[IncludeSelf](./Org.OData.Aggregation.V1.xml#L370)*|Boolean|*Optional parameter:* Whether the node is considered an ancestor of itself
[&rarr;](./Org.OData.Aggregation.V1.xml#L378)|Boolean?|


### <a name="issibling"></a>[issibling](./Org.OData.Aggregation.V1.xml#L381:~:text=<Function%20Name="-,issibling,-")

Returns true if the node has the same parent in the specified hierarchy as the other node or both are roots

A node is not a sibling of itself. If a node value passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L384:~:text=<Function%20Name="-,issibling,-")|\[EntityType\]|A collection, given through a path expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L387:~:text=<Function%20Name="-,issibling,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L388:~:text=<Function%20Name="-,issibling,-")|PrimitiveType?|Node value of the putative sibling
[Other](./Org.OData.Aggregation.V1.xml#L391:~:text=<Function%20Name="-,issibling,-")|PrimitiveType?|Node value of the other node
[&rarr;](./Org.OData.Aggregation.V1.xml#L394:~:text=<Function%20Name="-,issibling,-")|Boolean?|


### <a name="preorder"></a>[preorder](./Org.OData.Aggregation.V1.xml#L397:~:text=<Function%20Name="-,preorder,-")

Returns the rank in preorder in the specified hierarchy of a single node among the nodes in the binding parameter

This function is only meant to be used in an `$orderby` clause or `orderby` transformation,
          its return value is opaque and only used for ordering.

Parameter|Type|Description
:--------|:---|:----------
**[Nodes](./Org.OData.Aggregation.V1.xml#L403:~:text=<Function%20Name="-,preorder,-")**|\[EntityType\]|**Binding parameter**
[NodePropertyPath](./Org.OData.Aggregation.V1.xml#L404:~:text=<Function%20Name="-,preorder,-")|String|Property path in the binding parameter's entity type that addresses the node value
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L407:~:text=<Function%20Name="-,preorder,-")|\[EntityType\]|A collection, given through a path expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L410:~:text=<Function%20Name="-,preorder,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L411:~:text=<Function%20Name="-,preorder,-")|PrimitiveType?|Node value of the single node
[&rarr;](./Org.OData.Aggregation.V1.xml#L414:~:text=<Function%20Name="-,preorder,-")|String?|


### <a name="postorder"></a>[postorder](./Org.OData.Aggregation.V1.xml#L417:~:text=<Function%20Name="-,postorder,-")

Returns the rank in postorder in the specified hierarchy of a single node among the nodes in the binding parameter

This function is only meant to be used in an `$orderby` clause or `orderby` transformation,
          its return value is opaque and only used for ordering.

Parameter|Type|Description
:--------|:---|:----------
**[Nodes](./Org.OData.Aggregation.V1.xml#L423:~:text=<Function%20Name="-,postorder,-")**|\[EntityType\]|**Binding parameter**
[NodePropertyPath](./Org.OData.Aggregation.V1.xml#L424:~:text=<Function%20Name="-,postorder,-")|String|Property path in the binding parameter's entity type that addresses the node value
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L427:~:text=<Function%20Name="-,postorder,-")|\[EntityType\]|A collection, given through a path expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L430:~:text=<Function%20Name="-,postorder,-")|[HierarchyQualifier](#HierarchyQualifier)|
[NodePropertyPath](./Org.OData.Aggregation.V1.xml#L431:~:text=<Function%20Name="-,postorder,-")|String|Property path in the entity type of `Nodes` that addresses the node value
[&rarr;](./Org.OData.Aggregation.V1.xml#L434:~:text=<Function%20Name="-,postorder,-")|String?|


### <a name="isleaf"></a>[isleaf](./Org.OData.Aggregation.V1.xml#L437:~:text=<Function%20Name="-,isleaf,-")

Is the node a leaf in the specified hierarchy?

If a node value passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L440:~:text=<Function%20Name="-,isleaf,-")|\[EntityType\]|A collection, given through a path expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L443:~:text=<Function%20Name="-,isleaf,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L444:~:text=<Function%20Name="-,isleaf,-")|PrimitiveType?|Node value of the putative leaf
[&rarr;](./Org.OData.Aggregation.V1.xml#L447:~:text=<Function%20Name="-,isleaf,-")|Boolean?|


## <a name="ApplySupportedBase"></a>[ApplySupportedBase](./Org.OData.Aggregation.V1.xml#L96:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")


**Derived Types:**
- [ApplySupportedType](#ApplySupportedType)

Property|Type|Description
:-------|:---|:----------
[Transformations](./Org.OData.Aggregation.V1.xml#L97:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Transformations that can be used in `$apply`
[CustomAggregationMethods](./Org.OData.Aggregation.V1.xml#L100:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[Rollup](./Org.OData.Aggregation.V1.xml#L103:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation

## <a name="ApplySupportedType"></a>[ApplySupportedType](./Org.OData.Aggregation.V1.xml#L107:~:text=<ComplexType%20Name="-,ApplySupportedType,-"): [ApplySupportedBase](#ApplySupportedBase)


Property|Type|Description
:-------|:---|:----------
[*Transformations*](./Org.OData.Aggregation.V1.xml#L97:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Transformations that can be used in `$apply`
[*CustomAggregationMethods*](./Org.OData.Aggregation.V1.xml#L100:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[*Rollup*](./Org.OData.Aggregation.V1.xml#L103:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation
[PropertyRestrictions](./Org.OData.Aggregation.V1.xml#L108:~:text=<ComplexType%20Name="-,ApplySupportedType,-") *(Deprecated)*|Boolean|Deprecated since [`Groupable`](#Groupable) and [`Aggregatable`](#Aggregatable) are deprecated
[GroupableProperties](./Org.OData.Aggregation.V1.xml#L119:~:text=<ComplexType%20Name="-,ApplySupportedType,-")|\[PropertyPath\]|A non-empty collection indicates that only the listed properties of the annotated target are supported by the `groupby` transformation
[AggregatableProperties](./Org.OData.Aggregation.V1.xml#L122:~:text=<ComplexType%20Name="-,ApplySupportedType,-")|\[[AggregatablePropertyType](#AggregatablePropertyType)\]|A non-empty collection indicates that only the listed properties of the annotated target can be used in the `aggregate` transformation, optionally restricted to the specified aggregation methods

## <a name="AggregatablePropertyType"></a>[AggregatablePropertyType](./Org.OData.Aggregation.V1.xml#L126:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")


Property|Type|Description
:-------|:---|:----------
[Property](./Org.OData.Aggregation.V1.xml#L127:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|PropertyPath|Aggregatable property
[SupportedAggregationMethods](./Org.OData.Aggregation.V1.xml#L132:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|\[String\]|Standard and custom aggregation methods than can be applied to the property. If omitted, all aggregation methods can be applied
[RecommendedAggregationMethod](./Org.OData.Aggregation.V1.xml#L137:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|String?|Recommended method for aggregating values of the property

## <a name="RollupType"></a>[RollupType](./Org.OData.Aggregation.V1.xml#L145:~:text=<EnumType%20Name="-,RollupType,-")
The number of `rollup` or `rollupall` operators allowed in a `groupby` transformation

Member|Value|Description
:-----|----:|:----------
[None](./Org.OData.Aggregation.V1.xml#L147:~:text=<EnumType%20Name="-,RollupType,-")|0|No support for `rollup` or `rollupall`
[SingleHierarchy](./Org.OData.Aggregation.V1.xml#L150:~:text=<EnumType%20Name="-,RollupType,-")|1|Only one `rollup` or `rollupall` operator per `groupby`
[MultipleHierarchies](./Org.OData.Aggregation.V1.xml#L153:~:text=<EnumType%20Name="-,RollupType,-")|2|Full support for `rollup` and `rollupall`

## <a name="RecursiveHierarchyType"></a>[RecursiveHierarchyType](./Org.OData.Aggregation.V1.xml#L203:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")


Property|Type|Description
:-------|:---|:----------
[NodeProperty](./Org.OData.Aggregation.V1.xml#L204:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|PropertyPath|Property holding the hierarchy node value
[ParentNavigationProperty](./Org.OData.Aggregation.V1.xml#L207:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|NavigationPropertyPath|Property for navigating to the parent node. Its type MUST be the entity type annotated with this term, and it MUST be single-valued and nullable.

## <a name="HierarchyQualifier"></a>[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L212:~:text=<TypeDefinition%20Name="-,HierarchyQualifier,-")
**Type:** String

Qualifier of a [`RecursiveHierarchy`](#RecursiveHierarchy) annotation

Every recursive hierarchy function defined in this vocabulary has
- a parameter `HierarchyQualifier` of this type and
- a parameter `HierarchyNodes` that is a collection of entities.

`HierarchyQualifier` is the qualifier of a `RecursiveHierarchy` annotation on the entity type of the collection
given by the `HierarchyNodes` parameter. This specifies a recursive hierarchy that is evaluated by the function.

## <a name="AvailableOnAggregatesType"></a>[AvailableOnAggregatesType](./Org.OData.Aggregation.V1.xml#L453:~:text=<ComplexType%20Name="-,AvailableOnAggregatesType,-")


Property|Type|Description
:-------|:---|:----------
[RequiredProperties](./Org.OData.Aggregation.V1.xml#L454:~:text=<ComplexType%20Name="-,AvailableOnAggregatesType,-")|\[PropertyPath\]|Properties required to apply this action or function

## <a name="NavigationPropertyAggregationCapabilities"></a>[NavigationPropertyAggregationCapabilities](./Org.OData.Aggregation.V1.xml#L459:~:text=<ComplexType%20Name="-,NavigationPropertyAggregationCapabilities,-"): [NavigationPropertyRestriction](Org.OData.Capabilities.V1.md#NavigationPropertyRestriction) *(Deprecated)*
[`Capabilities.NavigationRestrictions`](Org.OData.Capabilities.V1.md#NavigationRestrictions) that make use of the additional properties in this subtype are deprecated in favor of [`ApplySupported`](#ApplySupported) and [`CustomAggregate`](#CustomAggregate)

## <a name="CustomAggregateType"></a>[CustomAggregateType](./Org.OData.Aggregation.V1.xml#L477:~:text=<ComplexType%20Name="-,CustomAggregateType,-") *(Deprecated)*
Deprecated since [`NavigationPropertyAggregationCapabilities`](#NavigationPropertyAggregationCapabilities) is also deprecated
