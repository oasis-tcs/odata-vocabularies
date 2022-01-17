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
[AvailableOnAggregates](./Org.OData.Aggregation.V1.xml#L404:~:text=<Term%20Name="-,AvailableOnAggregates,-")|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|<a name="AvailableOnAggregates"></a>This action or function is available on aggregated entities if the `RequiredProperties` are still defined


## Functions

### <a name="isroot"></a>[isroot](./Org.OData.Aggregation.V1.xml#L247:~:text=<Function%20Name="-,isroot,-")

Is the entity the root of the specified hierarchy?

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L249:~:text=<Function%20Name="-,isroot,-")**|EntityType?|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L250:~:text=<Function%20Name="-,isroot,-")|[HierarchyQualifier](#HierarchyQualifier)|
[&rarr;](./Org.OData.Aggregation.V1.xml#L251:~:text=<Function%20Name="-,isroot,-")|Boolean?|


### <a name="isroot"></a>[isroot](./Org.OData.Aggregation.V1.xml#L253)

Is the entity the root of the specified hierarchy?

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L255)**|EntityType?|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L256)|[HierarchyQualifier](#HierarchyQualifier)|
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L257)|\[EntityType\]|
[NodeProperty](./Org.OData.Aggregation.V1.xml#L258)|[HierarchyNode](#HierarchyNode)|
[&rarr;](./Org.OData.Aggregation.V1.xml#L259)|Boolean?|


### <a name="isdescendant"></a>[isdescendant](./Org.OData.Aggregation.V1.xml#L262:~:text=<Function%20Name="-,isdescendant,-")

Is the entity a descendant in the specified hierarchy of the parent node with at most the specified distance?

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L264:~:text=<Function%20Name="-,isdescendant,-")**|EntityType?|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L265:~:text=<Function%20Name="-,isdescendant,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L266:~:text=<Function%20Name="-,isdescendant,-")|PrimitiveType|Node value of parent node
*[MaxDistance](./Org.OData.Aggregation.V1.xml#L269:~:text=<Function%20Name="-,isdescendant,-")*|Int16?|*Optional parameter*
*[IncludeParent](./Org.OData.Aggregation.V1.xml#L277:~:text=<Function%20Name="-,isdescendant,-")*|Boolean?|*Optional parameter:* Whether the entity is considered a descendant of itself
[&rarr;](./Org.OData.Aggregation.V1.xml#L285:~:text=<Function%20Name="-,isdescendant,-")|Boolean?|


### <a name="isdescendant"></a>[isdescendant](./Org.OData.Aggregation.V1.xml#L287)

Is the entity a descendant in the specified hierarchy of the parent node with at most the specified distance?

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L289)**|EntityType?|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L290)|[HierarchyQualifier](#HierarchyQualifier)|
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L291)|\[EntityType\]|
[NodeProperty](./Org.OData.Aggregation.V1.xml#L292)|[HierarchyNode](#HierarchyNode)|
[Node](./Org.OData.Aggregation.V1.xml#L293)|PrimitiveType|Node value of parent node
*[MaxDistance](./Org.OData.Aggregation.V1.xml#L296)*|Int16?|*Optional parameter*
*[IncludeParent](./Org.OData.Aggregation.V1.xml#L304)*|Boolean?|*Optional parameter:* Whether the entity is considered a descendant of itself
[&rarr;](./Org.OData.Aggregation.V1.xml#L312)|Boolean?|


### <a name="isancestor"></a>[isancestor](./Org.OData.Aggregation.V1.xml#L315:~:text=<Function%20Name="-,isancestor,-")

Is the entity an ancestor in the specified hierarchy of the child node with at most the specified distance?

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L317:~:text=<Function%20Name="-,isancestor,-")**|EntityType?|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L318:~:text=<Function%20Name="-,isancestor,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L319:~:text=<Function%20Name="-,isancestor,-")|PrimitiveType|Node value of child node
*[MaxDistance](./Org.OData.Aggregation.V1.xml#L322:~:text=<Function%20Name="-,isancestor,-")*|Int16?|*Optional parameter*
*[IncludeChild](./Org.OData.Aggregation.V1.xml#L330:~:text=<Function%20Name="-,isancestor,-")*|Boolean?|*Optional parameter:* Whether the entity is considered an ancestor of itself
[&rarr;](./Org.OData.Aggregation.V1.xml#L338:~:text=<Function%20Name="-,isancestor,-")|Boolean?|


### <a name="isancestor"></a>[isancestor](./Org.OData.Aggregation.V1.xml#L340)

Is the entity an ancestor in the specified hierarchy of the child node with at most the specified distance?

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L342)**|EntityType?|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L343)|[HierarchyQualifier](#HierarchyQualifier)|
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L344)|\[EntityType\]|
[NodeProperty](./Org.OData.Aggregation.V1.xml#L345)|[HierarchyNode](#HierarchyNode)|
[Node](./Org.OData.Aggregation.V1.xml#L346)|PrimitiveType|Node value of child node
*[MaxDistance](./Org.OData.Aggregation.V1.xml#L349)*|Int16?|*Optional parameter*
*[IncludeChild](./Org.OData.Aggregation.V1.xml#L357)*|Boolean?|*Optional parameter:* Whether the entity is considered an ancestor of itself
[&rarr;](./Org.OData.Aggregation.V1.xml#L365)|Boolean?|


### <a name="issibling"></a>[issibling](./Org.OData.Aggregation.V1.xml#L368:~:text=<Function%20Name="-,issibling,-")

Does the entity have the same parent node in the specified hierarchy as the sibling node?

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L370:~:text=<Function%20Name="-,issibling,-")**|EntityType?|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L371:~:text=<Function%20Name="-,issibling,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L372:~:text=<Function%20Name="-,issibling,-")|PrimitiveType|Node value of sibling node
[&rarr;](./Org.OData.Aggregation.V1.xml#L375:~:text=<Function%20Name="-,issibling,-")|Boolean?|


### <a name="issibling"></a>[issibling](./Org.OData.Aggregation.V1.xml#L377)

Does the entity have the same parent node in the specified hierarchy as the sibling node?

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L379)**|EntityType?|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L380)|[HierarchyQualifier](#HierarchyQualifier)|
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L381)|\[EntityType\]|
[NodeProperty](./Org.OData.Aggregation.V1.xml#L382)|[HierarchyNode](#HierarchyNode)|
[Node](./Org.OData.Aggregation.V1.xml#L383)|PrimitiveType|Node value of sibling node
[&rarr;](./Org.OData.Aggregation.V1.xml#L386)|Boolean?|


### <a name="isleaf"></a>[isleaf](./Org.OData.Aggregation.V1.xml#L389:~:text=<Function%20Name="-,isleaf,-")

Is the entity without descendants in the specified hierarchy?

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L391:~:text=<Function%20Name="-,isleaf,-")**|EntityType?|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L392:~:text=<Function%20Name="-,isleaf,-")|[HierarchyQualifier](#HierarchyQualifier)|
[&rarr;](./Org.OData.Aggregation.V1.xml#L393:~:text=<Function%20Name="-,isleaf,-")|Boolean?|


### <a name="isleaf"></a>[isleaf](./Org.OData.Aggregation.V1.xml#L395)

Is the entity without descendants in the specified hierarchy?

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L397)**|EntityType?|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L398)|[HierarchyQualifier](#HierarchyQualifier)|
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L399)|\[EntityType\]|
[NodeProperty](./Org.OData.Aggregation.V1.xml#L400)|[HierarchyNode](#HierarchyNode)|
[&rarr;](./Org.OData.Aggregation.V1.xml#L401)|Boolean?|


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
[ParentNavigationProperty](./Org.OData.Aggregation.V1.xml#L207:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|NavigationPropertyPath|Property for navigating to the parent node
[DistanceFromRootProperty](./Org.OData.Aggregation.V1.xml#L210:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|PropertyPath?|Property holding the number of edges between the node and the root node
[IsLeafProperty](./Org.OData.Aggregation.V1.xml#L213:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|PropertyPath?|Property indicating whether the node is a leaf of the hierarchy

## <a name="HierarchyQualifier"></a>[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L218:~:text=<TypeDefinition%20Name="-,HierarchyQualifier,-")
**Type:** String

Qualifier of a [`RecursiveHierarchy`](#RecursiveHierarchy) annotation

Every recursive hierarchy function defined in this vocabulary has a parameter of this type.
This is the qualifier of a `RecursiveHierarchy` annotation on the entity type of
- the function's binding parameter or
- the entity set specified by the `HierarchyNodes` parameter, if this is present.

The `RecursiveHierarchy/ParentNavigationProperty` from this annotation defines a hierarchy on the
binding parameter's entity set or on `HierarchyNodes` if present. This hierarchy is evaluated by the function.
Nodes in the hierarchy are identified by the primitive value of their `RecursiveHierarchy/NodeProperty`.
If the binding parameter is null, the function returns null.

## <a name="HierarchyNode"></a>[HierarchyNode](./Org.OData.Aggregation.V1.xml#L233:~:text=<TypeDefinition%20Name="-,HierarchyNode,-")
**Type:** String

Property path identifying the node in a recursive hierarchy

Every recursive hierarchy function defined in this vocabulary has
- an overload with a parameter `NodeProperty` of this type plus a `HierarchyNodes` parameter and
- an overload without these two parameters.

In the overload with these parameters, both the entity given in the function's binding parameter
and its `HierarchyNodes` parameter must have a structural property
with the name given in the `NodeProperty` parameter; this is the property containing the entity's node value in the hierarchy.
The entity need not belong to `HierarchyNodes`, only its node value is compared to the node values in `HierarchyNodes`.

## <a name="AvailableOnAggregatesType"></a>[AvailableOnAggregatesType](./Org.OData.Aggregation.V1.xml#L407:~:text=<ComplexType%20Name="-,AvailableOnAggregatesType,-")


Property|Type|Description
:-------|:---|:----------
[RequiredProperties](./Org.OData.Aggregation.V1.xml#L408:~:text=<ComplexType%20Name="-,AvailableOnAggregatesType,-")|\[PropertyPath\]|Properties required to apply this action or function

## <a name="NavigationPropertyAggregationCapabilities"></a>[NavigationPropertyAggregationCapabilities](./Org.OData.Aggregation.V1.xml#L413:~:text=<ComplexType%20Name="-,NavigationPropertyAggregationCapabilities,-"): [NavigationPropertyRestriction](Org.OData.Capabilities.V1.md#NavigationPropertyRestriction) *(Deprecated)*
[`Capabilities.NavigationRestrictions`](Org.OData.Capabilities.V1.md#NavigationRestrictions) that make use of the additional properties in this subtype are deprecated in favor of [`ApplySupported`](#ApplySupported) and [`CustomAggregate`](#CustomAggregate)

## <a name="CustomAggregateType"></a>[CustomAggregateType](./Org.OData.Aggregation.V1.xml#L431:~:text=<ComplexType%20Name="-,CustomAggregateType,-") *(Deprecated)*
Deprecated since [`NavigationPropertyAggregationCapabilities`](#NavigationPropertyAggregationCapabilities) is also deprecated
