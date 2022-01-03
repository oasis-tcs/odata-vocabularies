# Aggregation Vocabulary
**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Terms to describe which data in a given entity model can be aggregated, and how.


## Terms

Term|Type|Description
:---|:---|:----------
[ApplySupported](./Org.OData.Aggregation.V1.xml#L72:~:text=<Term%20Name="-,ApplySupported,-")|[ApplySupportedType](#ApplySupportedType)|<a name="ApplySupported"></a>This entity set or collection supports the `$apply` system query option
[ApplySupportedDefaults](./Org.OData.Aggregation.V1.xml#L78:~:text=<Term%20Name="-,ApplySupportedDefaults,-")|[ApplySupportedBase](#ApplySupportedBase)|<a name="ApplySupportedDefaults"></a>Default support of the `$apply` system query option for all collection-valued resources in the container<br>Annotating term [`ApplySupported`](#ApplySupported) for a specific collection-valued resource overrides the default support with the specified properties using PATCH semantics:<br/>- Primitive or collection-valued properties specified in `ApplySupported` replace the corresponding properties specified in `ApplySupportedDefaults`<br/>- Complex-valued properties specified in `ApplySupported` override the corresponding properties specified in `ApplySupportedDefaults` using PATCH semantics recursively<br/>- Properties specified neither in `ApplySupported` nor in `ApplySupportedDefaults` have their default value
[Groupable](./Org.OData.Aggregation.V1.xml#L155:~:text=<Term%20Name="-,Groupable,-") *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Groupable"></a>Deprecated in favor of [`ApplySupported/GroupableProperties`](#ApplySupported)
[Aggregatable](./Org.OData.Aggregation.V1.xml#L167:~:text=<Term%20Name="-,Aggregatable,-") *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Aggregatable"></a>Deprecated in favor of [`ApplySupported/AggregatableProperties`](#ApplySupported)
[CustomAggregate](./Org.OData.Aggregation.V1.xml#L179:~:text=<Term%20Name="-,CustomAggregate,-")|String|<a name="CustomAggregate"></a>Dynamic property that can be used in the `aggregate` transformation<br>This term MUST be applied with a Qualifier, the Qualifier value is the name of the dynamic property. The value of the annotation MUST be the qualified name of a primitive type. The aggregated value will be of that type.
[ContextDefiningProperties](./Org.OData.Aggregation.V1.xml#L185:~:text=<Term%20Name="-,ContextDefiningProperties,-")|\[PropertyPath\]|<a name="ContextDefiningProperties"></a>The annotated property or custom aggregate is only well-defined in the context of these properties<br>The context-defining properties need either be part of the result entities, or be restricted to a single value by a pre-filter operation. Examples are postal codes within a country, or monetary amounts whose context is the unit of currency.
[LeveledHierarchy](./Org.OData.Aggregation.V1.xml#L192:~:text=<Term%20Name="-,LeveledHierarchy,-")|\[PropertyPath\]|<a name="LeveledHierarchy"></a>Defines a leveled hierarchy by defining an ordered list of properties in the hierarchy
[RecursiveHierarchy](./Org.OData.Aggregation.V1.xml#L196:~:text=<Term%20Name="-,RecursiveHierarchy,-")|[RecursiveHierarchyType](#RecursiveHierarchyType)|<a name="RecursiveHierarchy"></a>Defines a recursive hierarchy.
[AvailableOnAggregates](./Org.OData.Aggregation.V1.xml#L309:~:text=<Term%20Name="-,AvailableOnAggregates,-")|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|<a name="AvailableOnAggregates"></a>This action or function is available on aggregated entities if the `RequiredProperties` are still defined


## Functions

### <a name="move"></a>[move](./Org.OData.Aggregation.V1.xml#L226:~:text=<Function%20Name="-,move,-")

Returns an entity in the specified entity set with the same structure as the binding parameter, or null if no such entity exists

The binding parameter "moves into" the specified entity set. This can be used to specify
a recursive hierarchy from a "directory" of hierarchies, for use in the hierarchy
functions defined in this vocabulary, for example:
```
GET ~/Sales?$filter=SalesOrganization
 /Aggregation.move(EntitySet=@PathExpression)
 /Aggregation.isdescendant(Hierarchy='SalesOrgHierarchy',Node='EMEA')
&@PathExpression=$root/SalesOrgHierarchyDirectory('Regional')/Nodes
```

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L239:~:text=<Function%20Name="-,move,-")**|EntityType?|**Binding parameter**
[EntitySet](./Org.OData.Aggregation.V1.xml#L240:~:text=<Function%20Name="-,move,-")|\[EntityType\]|A named or implicit entity set, specified with a path expression
[&rarr;](./Org.OData.Aggregation.V1.xml#L243:~:text=<Function%20Name="-,move,-")|EntityType?|


### <a name="move"></a>[move](./Org.OData.Aggregation.V1.xml#L245)

Like `move(Edm.EntityType)`, but applied to each entity in a collection

This can be used as a set transformation before a hierarchical transformation in `$apply`, for example:
```
GET ~/SalesOrganizations?$apply=
 Aggregation.move(EntitySet=@PathExpression)
 /descendants(SalesOrgHierarchy,filter(Name eq 'EMEA'))
&@PathExpression=$root/SalesOrgHierarchyDirectory('Regional')/Nodes
```

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L256)**|\[EntityType\]|**Binding parameter**
[EntitySet](./Org.OData.Aggregation.V1.xml#L257)|\[EntityType\]|A named or implicit entity set, specified with a path expression
[&rarr;](./Org.OData.Aggregation.V1.xml#L260)|\[EntityType\]|


### <a name="isroot"></a>[isroot](./Org.OData.Aggregation.V1.xml#L263:~:text=<Function%20Name="-,isroot,-")

Is the entity the root of the specified hierarchy?

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L265:~:text=<Function%20Name="-,isroot,-")**|EntityType|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L266:~:text=<Function%20Name="-,isroot,-")|[HierarchyQualifier](#HierarchyQualifier)|
[&rarr;](./Org.OData.Aggregation.V1.xml#L267:~:text=<Function%20Name="-,isroot,-")|Boolean|


### <a name="isdescendant"></a>[isdescendant](./Org.OData.Aggregation.V1.xml#L270:~:text=<Function%20Name="-,isdescendant,-")

Is the entity a descendant in the specified hierarchy of the parent node, optionally with at most the specified distance?

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L272:~:text=<Function%20Name="-,isdescendant,-")**|EntityType|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L273:~:text=<Function%20Name="-,isdescendant,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L274:~:text=<Function%20Name="-,isdescendant,-")|PrimitiveType|Parent node
[MaxDistance](./Org.OData.Aggregation.V1.xml#L277:~:text=<Function%20Name="-,isdescendant,-")|Int16?|
[&rarr;](./Org.OData.Aggregation.V1.xml#L278:~:text=<Function%20Name="-,isdescendant,-")|Boolean|


### <a name="isancestor"></a>[isancestor](./Org.OData.Aggregation.V1.xml#L281:~:text=<Function%20Name="-,isancestor,-")

Is the entity an ancestor in the specified hierarchy of the child node, optionally with at most the specified distance?

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L283:~:text=<Function%20Name="-,isancestor,-")**|EntityType|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L284:~:text=<Function%20Name="-,isancestor,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L285:~:text=<Function%20Name="-,isancestor,-")|PrimitiveType|Child node
[MaxDistance](./Org.OData.Aggregation.V1.xml#L288:~:text=<Function%20Name="-,isancestor,-")|Int16?|
[&rarr;](./Org.OData.Aggregation.V1.xml#L289:~:text=<Function%20Name="-,isancestor,-")|Boolean|


### <a name="issibling"></a>[issibling](./Org.OData.Aggregation.V1.xml#L292:~:text=<Function%20Name="-,issibling,-")

Does the entity have the same parent node in the specified hierarchy as the sibling node?

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L294:~:text=<Function%20Name="-,issibling,-")**|EntityType|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L295:~:text=<Function%20Name="-,issibling,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L296:~:text=<Function%20Name="-,issibling,-")|PrimitiveType|Sibling node
[&rarr;](./Org.OData.Aggregation.V1.xml#L299:~:text=<Function%20Name="-,issibling,-")|Boolean|


### <a name="isleaf"></a>[isleaf](./Org.OData.Aggregation.V1.xml#L302:~:text=<Function%20Name="-,isleaf,-")

Is the entity without descendants in the specified hierarchy?

Parameter|Type|Description
:--------|:---|:----------
**[Entity](./Org.OData.Aggregation.V1.xml#L304:~:text=<Function%20Name="-,isleaf,-")**|EntityType|**Binding parameter**
[Hierarchy](./Org.OData.Aggregation.V1.xml#L305:~:text=<Function%20Name="-,isleaf,-")|[HierarchyQualifier](#HierarchyQualifier)|
[&rarr;](./Org.OData.Aggregation.V1.xml#L306:~:text=<Function%20Name="-,isleaf,-")|Boolean|


## <a name="ApplySupportedBase"></a>[ApplySupportedBase](./Org.OData.Aggregation.V1.xml#L93:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")


**Derived Types:**
- [ApplySupportedType](#ApplySupportedType)

Property|Type|Description
:-------|:---|:----------
[Transformations](./Org.OData.Aggregation.V1.xml#L94:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Transformations that can be used in `$apply`
[CustomAggregationMethods](./Org.OData.Aggregation.V1.xml#L97:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[Rollup](./Org.OData.Aggregation.V1.xml#L100:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation

## <a name="ApplySupportedType"></a>[ApplySupportedType](./Org.OData.Aggregation.V1.xml#L104:~:text=<ComplexType%20Name="-,ApplySupportedType,-"): [ApplySupportedBase](#ApplySupportedBase)


Property|Type|Description
:-------|:---|:----------
[*Transformations*](./Org.OData.Aggregation.V1.xml#L94:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Transformations that can be used in `$apply`
[*CustomAggregationMethods*](./Org.OData.Aggregation.V1.xml#L97:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[*Rollup*](./Org.OData.Aggregation.V1.xml#L100:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation
[PropertyRestrictions](./Org.OData.Aggregation.V1.xml#L105:~:text=<ComplexType%20Name="-,ApplySupportedType,-") *(Deprecated)*|Boolean|Deprecated since [`Groupable`](#Groupable) and [`Aggregatable`](#Aggregatable) are deprecated
[GroupableProperties](./Org.OData.Aggregation.V1.xml#L116:~:text=<ComplexType%20Name="-,ApplySupportedType,-")|\[PropertyPath\]|A non-empty collection indicates that only the listed properties of the annotated target are supported by the `groupby` transformation
[AggregatableProperties](./Org.OData.Aggregation.V1.xml#L119:~:text=<ComplexType%20Name="-,ApplySupportedType,-")|\[[AggregatablePropertyType](#AggregatablePropertyType)\]|A non-empty collection indicates that only the listed properties of the annotated target can be used in the `aggregate` transformation, optionally restricted to the specified aggregation methods

## <a name="AggregatablePropertyType"></a>[AggregatablePropertyType](./Org.OData.Aggregation.V1.xml#L123:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")


Property|Type|Description
:-------|:---|:----------
[Property](./Org.OData.Aggregation.V1.xml#L124:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|PropertyPath|Aggregatable property
[SupportedAggregationMethods](./Org.OData.Aggregation.V1.xml#L129:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|\[String\]|Standard and custom aggregation methods than can be applied to the property. If omitted, all aggregation methods can be applied
[RecommendedAggregationMethod](./Org.OData.Aggregation.V1.xml#L134:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|String?|Recommended method for aggregating values of the property

## <a name="RollupType"></a>[RollupType](./Org.OData.Aggregation.V1.xml#L142:~:text=<EnumType%20Name="-,RollupType,-")
The number of `rollup` or `rollupall` operators allowed in a `groupby` transformation

Member|Value|Description
:-----|----:|:----------
[None](./Org.OData.Aggregation.V1.xml#L144:~:text=<EnumType%20Name="-,RollupType,-")|0|No support for `rollup` or `rollupall`
[SingleHierarchy](./Org.OData.Aggregation.V1.xml#L147:~:text=<EnumType%20Name="-,RollupType,-")|1|Only one `rollup` or `rollupall` operator per `groupby`
[MultipleHierarchies](./Org.OData.Aggregation.V1.xml#L150:~:text=<EnumType%20Name="-,RollupType,-")|2|Full support for `rollup` and `rollupall`

## <a name="RecursiveHierarchyType"></a>[RecursiveHierarchyType](./Org.OData.Aggregation.V1.xml#L200:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")


Property|Type|Description
:-------|:---|:----------
[NodeProperty](./Org.OData.Aggregation.V1.xml#L201:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|PropertyPath|Property holding the hierarchy node value
[ParentNavigationProperty](./Org.OData.Aggregation.V1.xml#L204:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|NavigationPropertyPath|Property for navigating to the parent node
[DistanceFromRootProperty](./Org.OData.Aggregation.V1.xml#L207:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|PropertyPath?|Property holding the number of edges between the node and the root node
[IsLeafProperty](./Org.OData.Aggregation.V1.xml#L210:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|PropertyPath?|Property indicating whether the node is a leaf of the hierarchy

## <a name="HierarchyQualifier"></a>[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L215:~:text=<TypeDefinition%20Name="-,HierarchyQualifier,-")
**Type:** String

Qualifier of a [`RecursiveHierarchy`](#RecursiveHierarchy) annotation

In functions defined in this vocabulary, a parameter of this type
          identifies a `RecursiveHierarchy` annotation on the entity type of the function's binding parameter.
          The `RecursiveHierarchy/ParentNavigationProperty` from this annotation defines a hierarchy in the binding parameter's entity set,
          and this hierarchy is evaluated by the function.
          Nodes in the hierarchy are identified by the primitive value of their `RecursiveHierarchy/NodeProperty`.

## <a name="AvailableOnAggregatesType"></a>[AvailableOnAggregatesType](./Org.OData.Aggregation.V1.xml#L312:~:text=<ComplexType%20Name="-,AvailableOnAggregatesType,-")


Property|Type|Description
:-------|:---|:----------
[RequiredProperties](./Org.OData.Aggregation.V1.xml#L313:~:text=<ComplexType%20Name="-,AvailableOnAggregatesType,-")|\[PropertyPath\]|Properties required to apply this action or function

## <a name="NavigationPropertyAggregationCapabilities"></a>[NavigationPropertyAggregationCapabilities](./Org.OData.Aggregation.V1.xml#L318:~:text=<ComplexType%20Name="-,NavigationPropertyAggregationCapabilities,-"): [NavigationPropertyRestriction](Org.OData.Capabilities.V1.md#NavigationPropertyRestriction) *(Deprecated)*
[`Capabilities.NavigationRestrictions`](Org.OData.Capabilities.V1.md#NavigationRestrictions) that make use of the additional properties in this subtype are deprecated in favor of [`ApplySupported`](#ApplySupported) and [`CustomAggregate`](#CustomAggregate)

## <a name="CustomAggregateType"></a>[CustomAggregateType](./Org.OData.Aggregation.V1.xml#L336:~:text=<ComplexType%20Name="-,CustomAggregateType,-") *(Deprecated)*
Deprecated since [`NavigationPropertyAggregationCapabilities`](#NavigationPropertyAggregationCapabilities) is also deprecated
