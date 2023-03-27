# Aggregation Vocabulary
**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Terms to describe which data in a given entity model can be aggregated, and how.


## Terms

Term|Type|Description
:---|:---|:----------
[ApplySupported](./Org.OData.Aggregation.V1.xml#L78:~:text=<Term%20Name="-,ApplySupported,-")|[ApplySupportedType](#ApplySupportedType)|<a name="ApplySupported"></a>This entity set or collection supports the `$apply` system query option
[ApplySupportedDefaults](./Org.OData.Aggregation.V1.xml#L84:~:text=<Term%20Name="-,ApplySupportedDefaults,-")|[ApplySupportedBase](#ApplySupportedBase)|<a name="ApplySupportedDefaults"></a>Default support of the `$apply` system query option for all collection-valued resources in the container<br>Annotating term [`ApplySupported`](#ApplySupported) for a specific collection-valued resource overrides the default support with the specified properties using PATCH semantics:<br/>- Primitive or collection-valued properties specified in `ApplySupported` replace the corresponding properties specified in `ApplySupportedDefaults`<br/>- Complex-valued properties specified in `ApplySupported` override the corresponding properties specified in `ApplySupportedDefaults` using PATCH semantics recursively<br/>- Properties specified neither in `ApplySupported` nor in `ApplySupportedDefaults` have their default value
[Groupable](./Org.OData.Aggregation.V1.xml#L286:~:text=<Term%20Name="-,Groupable,-") *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Groupable"></a>Deprecated in favor of [`ApplySupported/GroupableProperties`](#ApplySupported)
[Aggregatable](./Org.OData.Aggregation.V1.xml#L298:~:text=<Term%20Name="-,Aggregatable,-") *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Aggregatable"></a>Deprecated in favor of [`ApplySupported/AggregatableProperties`](#ApplySupported)
[CustomAggregate](./Org.OData.Aggregation.V1.xml#L310:~:text=<Term%20Name="-,CustomAggregate,-")|String|<a name="CustomAggregate"></a>Dynamic property that can be used in the `aggregate` transformation<br>This term MUST be applied with a Qualifier, the Qualifier value is the name of the dynamic property. The value of the annotation MUST be the qualified name of a primitive type. The aggregated value will be of that type.
[ContextDefiningProperties](./Org.OData.Aggregation.V1.xml#L316:~:text=<Term%20Name="-,ContextDefiningProperties,-")|\[PropertyPath\]|<a name="ContextDefiningProperties"></a>The annotated property or custom aggregate is only well-defined in the context of these properties<br>The context-defining properties need either be part of the result entities, or be restricted to a single value by a pre-filter operation. Examples are postal codes within a country, or monetary amounts whose context is the unit of currency.
[LeveledHierarchy](./Org.OData.Aggregation.V1.xml#L323:~:text=<Term%20Name="-,LeveledHierarchy,-")|\[PropertyPath\]|<a name="LeveledHierarchy"></a>Defines a leveled hierarchy [OData-Aggr, section 5.5.1]
[RecursiveHierarchy](./Org.OData.Aggregation.V1.xml#L327:~:text=<Term%20Name="-,RecursiveHierarchy,-")|[RecursiveHierarchyType](#RecursiveHierarchyType)|<a name="RecursiveHierarchy"></a>Defines a recursive hierarchy [OData-Aggr, section 5.5.2]
[AvailableOnAggregates](./Org.OData.Aggregation.V1.xml#L486:~:text=<Term%20Name="-,AvailableOnAggregates,-")|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|<a name="AvailableOnAggregates"></a>This action or function is available on aggregated entities if the `RequiredProperties` are still defined


## Functions

<a name="isroot"></a>
### [isroot](./Org.OData.Aggregation.V1.xml#L352:~:text=<Function%20Name="-,isroot,-")

Is the node a root of the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`)?

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L355:~:text=<Function%20Name="-,isroot,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L358:~:text=<Function%20Name="-,isroot,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L359:~:text=<Function%20Name="-,isroot,-")|PrimitiveType?|Node identifier of the putative root
[&rarr;](./Org.OData.Aggregation.V1.xml#L362:~:text=<Function%20Name="-,isroot,-")|Boolean?|


<a name="isdescendant"></a>
### [isdescendant](./Org.OData.Aggregation.V1.xml#L365:~:text=<Function%20Name="-,isdescendant,-")

Is the node a descendant of the ancestor node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`) with at most the specified distance?

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L368:~:text=<Function%20Name="-,isdescendant,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L371:~:text=<Function%20Name="-,isdescendant,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L372:~:text=<Function%20Name="-,isdescendant,-")|PrimitiveType?|Node identifier of the putative descendant
[Ancestor](./Org.OData.Aggregation.V1.xml#L375:~:text=<Function%20Name="-,isdescendant,-")|PrimitiveType?|Node identifier of the ancestor node
*[MaxDistance](./Org.OData.Aggregation.V1.xml#L378:~:text=<Function%20Name="-,isdescendant,-")*|Int16|*Optional parameter*
*[IncludeSelf](./Org.OData.Aggregation.V1.xml#L386:~:text=<Function%20Name="-,isdescendant,-")*|Boolean|*Optional parameter:* Whether the node is considered a descendant of itself
[&rarr;](./Org.OData.Aggregation.V1.xml#L394:~:text=<Function%20Name="-,isdescendant,-")|Boolean?|


<a name="isancestor"></a>
### [isancestor](./Org.OData.Aggregation.V1.xml#L397:~:text=<Function%20Name="-,isancestor,-")

Is the node an ancestor of the descendant node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`) with at most the specified distance?

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L400:~:text=<Function%20Name="-,isancestor,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L403:~:text=<Function%20Name="-,isancestor,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L404:~:text=<Function%20Name="-,isancestor,-")|PrimitiveType?|Node identifier of the putative ancestor
[Descendant](./Org.OData.Aggregation.V1.xml#L407:~:text=<Function%20Name="-,isancestor,-")|PrimitiveType?|Node identifier of the descendant node
*[MaxDistance](./Org.OData.Aggregation.V1.xml#L410:~:text=<Function%20Name="-,isancestor,-")*|Int16|*Optional parameter*
*[IncludeSelf](./Org.OData.Aggregation.V1.xml#L418:~:text=<Function%20Name="-,isancestor,-")*|Boolean|*Optional parameter:* Whether the node is considered an ancestor of itself
[&rarr;](./Org.OData.Aggregation.V1.xml#L426:~:text=<Function%20Name="-,isancestor,-")|Boolean?|


<a name="issibling"></a>
### [issibling](./Org.OData.Aggregation.V1.xml#L429:~:text=<Function%20Name="-,issibling,-")

Returns true if the node has the same parent as the other node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`) or both are roots

A node is not a sibling of itself. If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L432:~:text=<Function%20Name="-,issibling,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L435:~:text=<Function%20Name="-,issibling,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L436:~:text=<Function%20Name="-,issibling,-")|PrimitiveType?|Node identifier of the putative sibling
[Other](./Org.OData.Aggregation.V1.xml#L439:~:text=<Function%20Name="-,issibling,-")|PrimitiveType?|Node identifier of the other node
[&rarr;](./Org.OData.Aggregation.V1.xml#L442:~:text=<Function%20Name="-,issibling,-")|Boolean?|


<a name="isleaf"></a>
### [isleaf](./Org.OData.Aggregation.V1.xml#L445:~:text=<Function%20Name="-,isleaf,-")

Is the node a leaf in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`)?

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L448:~:text=<Function%20Name="-,isleaf,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L451:~:text=<Function%20Name="-,isleaf,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L452:~:text=<Function%20Name="-,isleaf,-")|PrimitiveType?|Node identifier of the putative leaf
[&rarr;](./Org.OData.Aggregation.V1.xml#L455:~:text=<Function%20Name="-,isleaf,-")|Boolean?|


<a name="excludingdescendants"></a>
### [excludingdescendants](./Org.OData.Aggregation.V1.xml#L458:~:text=<Function%20Name="-,excludingdescendants,-")

During `rolluprecursive` for a hierarchy node, this function marks instances that are related to the node itself rather than a descendant

This function may only occur in the second parameter of a `groupby` transformation whose first parameter
          contains `rolluprecursive(...)`. It is evaluated as part of the transformation `R(x)` in the "`rolluprecursive` algorithm"
          [OData-Aggr, section 3.5.3]. Its behavior is undefined outside of this algorithm.

          `groupby((rolluprecursive(...)), filter(Aggregation.excludingdescendants())/aggregate(...))` constructs a rollup
          that contains aggregates per hierarchy node while excluding descendants from the aggregation.

Parameter|Type|Description
:--------|:---|:----------
**[Instance](./Org.OData.Aggregation.V1.xml#L468:~:text=<Function%20Name="-,excludingdescendants,-")**|EntityType|**Binding parameter**
*[Position](./Org.OData.Aggregation.V1.xml#L469:~:text=<Function%20Name="-,excludingdescendants,-")*|Int16|*Optional parameter:* Position N among the `rolluprecursive` operators in the first argument of `groupby`<br>Every instance in the output set of a `groupby` transformation with M `rolluprecursive` operators has M relationships to M nodes in M recursive hierarchies. This function returns true if relationship number N relates the instance given in the binding parameter to the node itself rather than a descendant.
[&rarr;](./Org.OData.Aggregation.V1.xml#L483:~:text=<Function%20Name="-,excludingdescendants,-")|Boolean|


<a name="ApplySupportedBase"></a>
## [ApplySupportedBase](./Org.OData.Aggregation.V1.xml#L99:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")


**Derived Types:**
- [ApplySupportedType](#ApplySupportedType)

Property|Type|Description
:-------|:---|:----------
[Transformations](./Org.OData.Aggregation.V1.xml#L100:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[[Transformation](#Transformation)\]|Transformations that can be used in `$apply`
[CustomAggregationMethods](./Org.OData.Aggregation.V1.xml#L103:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[Rollup](./Org.OData.Aggregation.V1.xml#L106:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation
[From](./Org.OData.Aggregation.V1.xml#L109:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|Boolean|The service supports the `from` keyword in an `aggregate` transformation

<a name="ApplySupportedType"></a>
## [ApplySupportedType](./Org.OData.Aggregation.V1.xml#L113:~:text=<ComplexType%20Name="-,ApplySupportedType,-"): [ApplySupportedBase](#ApplySupportedBase)


Property|Type|Description
:-------|:---|:----------
[*Transformations*](./Org.OData.Aggregation.V1.xml#L100:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[[Transformation](#Transformation)\]|Transformations that can be used in `$apply`
[*CustomAggregationMethods*](./Org.OData.Aggregation.V1.xml#L103:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[*Rollup*](./Org.OData.Aggregation.V1.xml#L106:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation
[*From*](./Org.OData.Aggregation.V1.xml#L109:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|Boolean|The service supports the `from` keyword in an `aggregate` transformation
[PropertyRestrictions](./Org.OData.Aggregation.V1.xml#L114:~:text=<ComplexType%20Name="-,ApplySupportedType,-") *(Deprecated)*|Boolean|Deprecated since [`Groupable`](#Groupable) and [`Aggregatable`](#Aggregatable) are deprecated
[GroupableProperties](./Org.OData.Aggregation.V1.xml#L125:~:text=<ComplexType%20Name="-,ApplySupportedType,-")|\[AnyPropertyPath\]|A non-empty collection indicates that only the listed properties of the annotated target are supported by the `groupby` transformation
[AggregatableProperties](./Org.OData.Aggregation.V1.xml#L128:~:text=<ComplexType%20Name="-,ApplySupportedType,-")|\[[AggregatablePropertyType](#AggregatablePropertyType)\]|A non-empty collection indicates that only the listed properties of the annotated target can be used in the `aggregate` transformation, optionally restricted to the specified aggregation methods
[IsRecursiveHierarchy](./Org.OData.Aggregation.V1.xml#L131:~:text=<ComplexType%20Name="-,ApplySupportedType,-")|Boolean|Can be set to `false` to restrict the [`RecursiveHierarchy`](#RecursiveHierarchy) annotations (irrespective of their qualifier) to certain collections of a given type

<a name="AggregatablePropertyType"></a>
## [AggregatablePropertyType](./Org.OData.Aggregation.V1.xml#L135:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")


Property|Type|Description
:-------|:---|:----------
[Property](./Org.OData.Aggregation.V1.xml#L136:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|PropertyPath|Aggregatable property
[SupportedAggregationMethods](./Org.OData.Aggregation.V1.xml#L141:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|\[[AggregationMethod](#AggregationMethod)\]|Standard and custom aggregation methods that can be applied to the property. If omitted, all aggregation methods can be applied
[RecommendedAggregationMethod](./Org.OData.Aggregation.V1.xml#L146:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|[AggregationMethod?](#AggregationMethod)|Recommended method for aggregating values of the property

<a name="Transformation"></a>
## [Transformation](./Org.OData.Aggregation.V1.xml#L153:~:text=<TypeDefinition%20Name="-,Transformation,-")
**Type:** String

A transformation that can be used in `$apply`

Allowed Value|Description
:------------|:----------
[aggregate](./Org.OData.Aggregation.V1.xml#L157:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[groupby](./Org.OData.Aggregation.V1.xml#L160:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[concat](./Org.OData.Aggregation.V1.xml#L163:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[identity](./Org.OData.Aggregation.V1.xml#L166:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[filter](./Org.OData.Aggregation.V1.xml#L169:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[orderby](./Org.OData.Aggregation.V1.xml#L172:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[nest](./Org.OData.Aggregation.V1.xml#L175:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[addnested](./Org.OData.Aggregation.V1.xml#L178:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[transformnested](./Org.OData.Aggregation.V1.xml#L181:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[join](./Org.OData.Aggregation.V1.xml#L184:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[outerjoin](./Org.OData.Aggregation.V1.xml#L187:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[search](./Org.OData.Aggregation.V1.xml#L190:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[compute](./Org.OData.Aggregation.V1.xml#L193:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[bottomcount](./Org.OData.Aggregation.V1.xml#L196:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[bottomsum](./Org.OData.Aggregation.V1.xml#L199:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[bottompercent](./Org.OData.Aggregation.V1.xml#L202:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[topcount](./Org.OData.Aggregation.V1.xml#L205:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[topsum](./Org.OData.Aggregation.V1.xml#L208:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[toppercent](./Org.OData.Aggregation.V1.xml#L211:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[top](./Org.OData.Aggregation.V1.xml#L214:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[skip](./Org.OData.Aggregation.V1.xml#L217:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[orderby](./Org.OData.Aggregation.V1.xml#L220:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[ancestors](./Org.OData.Aggregation.V1.xml#L223:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[descendants](./Org.OData.Aggregation.V1.xml#L226:~:text=<TypeDefinition%20Name="-,Transformation,-")|
[traverse](./Org.OData.Aggregation.V1.xml#L229:~:text=<TypeDefinition%20Name="-,Transformation,-")|

<a name="AggregationMethod"></a>
## [AggregationMethod](./Org.OData.Aggregation.V1.xml#L236:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")
**Type:** String

Standard or custom aggregation method

Custom aggregation methods MUST use a namespace-qualified name, that is contain at least one dot. 

Allowed Value|Description
:------------|:----------
[sum](./Org.OData.Aggregation.V1.xml#L245:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Can be applied to numeric values to return the sum of the non-null values, or null if there are no non-null values or the input set is empty
[min](./Org.OData.Aggregation.V1.xml#L249:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Can be applied to values with a totally ordered domain to return the smallest of the non-null values, or null if there are no non-null values or the input set is empty
[max](./Org.OData.Aggregation.V1.xml#L253:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Can be applied to values with a totally ordered domain to return the largest of the non-null values, or null if there are no non-null values or the input set is empty
[average](./Org.OData.Aggregation.V1.xml#L257:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Can be applied to numeric values to return the sum of the non-null values divided by the count of the non-null values, or null if there are no non-null values or the input set is empty
[countdistinct](./Org.OData.Aggregation.V1.xml#L261:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Counts the distinct values, omitting any null values<br>For navigation properties, it counts the distinct entities in the union of all entities related to entities in the input set. For collection-valued primitive properties, it counts the distinct items in the union of all collection values in the input set.

<a name="RollupType"></a>
## [RollupType](./Org.OData.Aggregation.V1.xml#L273:~:text=<EnumType%20Name="-,RollupType,-")
The number of `rollup` or `rolluprecursive` operators allowed in a `groupby` transformation

Member|Value|Description
:-----|----:|:----------
[None](./Org.OData.Aggregation.V1.xml#L275:~:text=<EnumType%20Name="-,RollupType,-")|0|No support for `rollup` or `rolluprecursive`
[SingleHierarchy](./Org.OData.Aggregation.V1.xml#L278:~:text=<EnumType%20Name="-,RollupType,-")|1|Only one `rollup` or `rolluprecursive` operator per `groupby`
[MultipleHierarchies](./Org.OData.Aggregation.V1.xml#L281:~:text=<EnumType%20Name="-,RollupType,-")|2|Full support for `rollup` and `rolluprecursive`

<a name="RecursiveHierarchyType"></a>
## [RecursiveHierarchyType](./Org.OData.Aggregation.V1.xml#L331:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")


Property|Type|Description
:-------|:---|:----------
[NodeProperty](./Org.OData.Aggregation.V1.xml#L332:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|PropertyPath|Primitive property holding the hierarchy node identifier
[ParentNavigationProperty](./Org.OData.Aggregation.V1.xml#L335:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|NavigationPropertyPath|Property for navigating to the parent node. Its type MUST be the entity type annotated with this term, and it MUST be single-valued and nullable.

<a name="HierarchyQualifier"></a>
## [HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L340:~:text=<TypeDefinition%20Name="-,HierarchyQualifier,-")
**Type:** String

Qualifier of a [`RecursiveHierarchy`](#RecursiveHierarchy) annotation

Every recursive hierarchy function defined in this vocabulary has
- a parameter `HierarchyQualifier` of this type and
- a parameter `HierarchyNodes` that is a collection of entities of a common type without multiple occurrences of the same entity.

`HierarchyQualifier` is the qualifier of a `RecursiveHierarchy` annotation on the entity type of the collection
given by the `HierarchyNodes` parameter. This specifies a recursive hierarchy that is evaluated by the function.

<a name="AvailableOnAggregatesType"></a>
## [AvailableOnAggregatesType](./Org.OData.Aggregation.V1.xml#L489:~:text=<ComplexType%20Name="-,AvailableOnAggregatesType,-")


Property|Type|Description
:-------|:---|:----------
[RequiredProperties](./Org.OData.Aggregation.V1.xml#L490:~:text=<ComplexType%20Name="-,AvailableOnAggregatesType,-")|\[PropertyPath\]|Properties required to apply this action or function

<a name="NavigationPropertyAggregationCapabilities"></a>
## [NavigationPropertyAggregationCapabilities](./Org.OData.Aggregation.V1.xml#L495:~:text=<ComplexType%20Name="-,NavigationPropertyAggregationCapabilities,-"): [NavigationPropertyRestriction](Org.OData.Capabilities.V1.md#NavigationPropertyRestriction) *(Deprecated)*
[`Capabilities.NavigationRestrictions`](Org.OData.Capabilities.V1.md#NavigationRestrictions) that make use of the additional properties in this subtype are deprecated in favor of [`ApplySupported`](#ApplySupported) and [`CustomAggregate`](#CustomAggregate)

<a name="CustomAggregateType"></a>
## [CustomAggregateType](./Org.OData.Aggregation.V1.xml#L513:~:text=<ComplexType%20Name="-,CustomAggregateType,-") *(Deprecated)*
Deprecated since [`NavigationPropertyAggregationCapabilities`](#NavigationPropertyAggregationCapabilities) is also deprecated
