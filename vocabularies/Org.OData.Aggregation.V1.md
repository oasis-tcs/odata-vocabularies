# Aggregation Vocabulary
**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Terms to describe which data in a given entity model can be aggregated, and how.

Related to the specfication document [OData-Data-Agg-v4.0](../../odata-specs/odata-data-aggregation-ext/odata-data-aggregation-ext.md).


## Terms

Term|Type|Description
:---|:---|:----------
[ApplySupported](./Org.OData.Aggregation.V1.xml#L81:~:text=<Term%20Name="-,ApplySupported,-")|[ApplySupportedType](#ApplySupportedType)|<a name="ApplySupported"></a>This entity set or collection supports the `$apply` system query option
[ApplySupportedDefaults](./Org.OData.Aggregation.V1.xml#L87:~:text=<Term%20Name="-,ApplySupportedDefaults,-")|[ApplySupportedBase](#ApplySupportedBase)|<a name="ApplySupportedDefaults"></a>Default support of the `$apply` system query option for all collection-valued resources in the container<br>Annotating term [`ApplySupported`](#ApplySupported) for a specific collection-valued resource overrides the default support with the specified properties using PATCH semantics:<br/>- Primitive or collection-valued properties specified in `ApplySupported` replace the corresponding properties specified in `ApplySupportedDefaults`<br/>- Complex-valued properties specified in `ApplySupported` override the corresponding properties specified in `ApplySupportedDefaults` using PATCH semantics recursively<br/>- Properties specified neither in `ApplySupported` nor in `ApplySupportedDefaults` have their default value
[Groupable](./Org.OData.Aggregation.V1.xml#L308:~:text=<Term%20Name="-,Groupable,-") *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Groupable"></a>Deprecated in favor of [`ApplySupported/GroupableProperties`](#ApplySupported)
[Aggregatable](./Org.OData.Aggregation.V1.xml#L320:~:text=<Term%20Name="-,Aggregatable,-") *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Aggregatable"></a>Deprecated in favor of [`ApplySupported/AggregatableProperties`](#ApplySupported)
[CustomAggregate](./Org.OData.Aggregation.V1.xml#L332:~:text=<Term%20Name="-,CustomAggregate,-")|String|<a name="CustomAggregate"></a>Dynamic property that can be used in the `aggregate` transformation<br>This term MUST be applied with a Qualifier, the Qualifier value is the name of the dynamic property. The value of the annotation MUST be the qualified name of a primitive type. The aggregated value will be of that type.
[ContextDefiningProperties](./Org.OData.Aggregation.V1.xml#L338:~:text=<Term%20Name="-,ContextDefiningProperties,-")|\[PropertyPath\]|<a name="ContextDefiningProperties"></a>The annotated property or custom aggregate is only well-defined in the context of these properties<br>The context-defining properties need either be part of the result entities, or be restricted to a single value by a pre-filter operation. Examples are postal codes within a country, or monetary amounts whose context is the unit of currency.
[LeveledHierarchy](./Org.OData.Aggregation.V1.xml#L345:~:text=<Term%20Name="-,LeveledHierarchy,-")|\[PropertyPath\]|<a name="LeveledHierarchy"></a>Defines a leveled hierarchy [OData-Data-Agg-v4.0, section 5.5.1]
[RecursiveHierarchy](./Org.OData.Aggregation.V1.xml#L349:~:text=<Term%20Name="-,RecursiveHierarchy,-")|[RecursiveHierarchyType](#RecursiveHierarchyType)|<a name="RecursiveHierarchy"></a>Defines a recursive hierarchy [OData-Data-Agg-v4.0, section 5.5.2]
[UpNode](./Org.OData.Aggregation.V1.xml#L510:~:text=<Term%20Name="-,UpNode,-")|EntityType?|<a name="UpNode"></a>The next node in a path from the annotated node to the root<br>This instance annotation occurs in the result set after a hierarchical transformation and the annotation value is again annotated with `UpNode` until a root is reached. A use case for this is traversal or recursive rollup with multiple parents, when this annotation takes as value one parent node.
[AvailableOnAggregates](./Org.OData.Aggregation.V1.xml#L520:~:text=<Term%20Name="-,AvailableOnAggregates,-")|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|<a name="AvailableOnAggregates"></a>This action or function is available on aggregated entities if the `RequiredProperties` are still defined


## Functions

<a name="isroot"></a>
### [isroot](./Org.OData.Aggregation.V1.xml#L374:~:text=<Function%20Name="-,isroot,-")

Is the node a root of the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`)?

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L377:~:text=<Function%20Name="-,isroot,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L380:~:text=<Function%20Name="-,isroot,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L381:~:text=<Function%20Name="-,isroot,-")|PrimitiveType?|Node identifier of the putative root
[&rarr;](./Org.OData.Aggregation.V1.xml#L384:~:text=<Function%20Name="-,isroot,-")|Boolean?|


<a name="isdescendant"></a>
### [isdescendant](./Org.OData.Aggregation.V1.xml#L387:~:text=<Function%20Name="-,isdescendant,-")

Is the node a descendant of the ancestor node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`) with at most the specified distance?

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L390:~:text=<Function%20Name="-,isdescendant,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L393:~:text=<Function%20Name="-,isdescendant,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L394:~:text=<Function%20Name="-,isdescendant,-")|PrimitiveType?|Node identifier of the putative descendant
[Ancestor](./Org.OData.Aggregation.V1.xml#L397:~:text=<Function%20Name="-,isdescendant,-")|PrimitiveType?|Node identifier of the ancestor node
*[MaxDistance](./Org.OData.Aggregation.V1.xml#L400:~:text=<Function%20Name="-,isdescendant,-")*|Int16|*Optional parameter*
*[IncludeSelf](./Org.OData.Aggregation.V1.xml#L408:~:text=<Function%20Name="-,isdescendant,-")*|Boolean|*Optional parameter:* Whether the node is considered a descendant of itself
[&rarr;](./Org.OData.Aggregation.V1.xml#L416:~:text=<Function%20Name="-,isdescendant,-")|Boolean?|


<a name="isancestor"></a>
### [isancestor](./Org.OData.Aggregation.V1.xml#L419:~:text=<Function%20Name="-,isancestor,-")

Is the node an ancestor of the descendant node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`) with at most the specified distance?

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L422:~:text=<Function%20Name="-,isancestor,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L425:~:text=<Function%20Name="-,isancestor,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L426:~:text=<Function%20Name="-,isancestor,-")|PrimitiveType?|Node identifier of the putative ancestor
[Descendant](./Org.OData.Aggregation.V1.xml#L429:~:text=<Function%20Name="-,isancestor,-")|PrimitiveType?|Node identifier of the descendant node
*[MaxDistance](./Org.OData.Aggregation.V1.xml#L432:~:text=<Function%20Name="-,isancestor,-")*|Int16|*Optional parameter*
*[IncludeSelf](./Org.OData.Aggregation.V1.xml#L440:~:text=<Function%20Name="-,isancestor,-")*|Boolean|*Optional parameter:* Whether the node is considered an ancestor of itself
[&rarr;](./Org.OData.Aggregation.V1.xml#L448:~:text=<Function%20Name="-,isancestor,-")|Boolean?|


<a name="issibling"></a>
### [issibling](./Org.OData.Aggregation.V1.xml#L451:~:text=<Function%20Name="-,issibling,-")

Returns true if the node has the same parent as the other node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`) or both are roots

A node is not a sibling of itself. If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L454:~:text=<Function%20Name="-,issibling,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L457:~:text=<Function%20Name="-,issibling,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L458:~:text=<Function%20Name="-,issibling,-")|PrimitiveType?|Node identifier of the putative sibling
[Other](./Org.OData.Aggregation.V1.xml#L461:~:text=<Function%20Name="-,issibling,-")|PrimitiveType?|Node identifier of the other node
[&rarr;](./Org.OData.Aggregation.V1.xml#L464:~:text=<Function%20Name="-,issibling,-")|Boolean?|


<a name="isleaf"></a>
### [isleaf](./Org.OData.Aggregation.V1.xml#L467:~:text=<Function%20Name="-,isleaf,-")

Is the node a leaf in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`)?

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L470:~:text=<Function%20Name="-,isleaf,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L473:~:text=<Function%20Name="-,isleaf,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L474:~:text=<Function%20Name="-,isleaf,-")|PrimitiveType?|Node identifier of the putative leaf
[&rarr;](./Org.OData.Aggregation.V1.xml#L477:~:text=<Function%20Name="-,isleaf,-")|Boolean?|


<a name="rollupnode"></a>
### [rollupnode](./Org.OData.Aggregation.V1.xml#L480:~:text=<Function%20Name="-,rollupnode,-")

During `rolluprecursive` for a hierarchy node, this function returns the node

This function may only occur in the second parameter of a `groupby` transformation whose first parameter
contains `rolluprecursive(...)`. It is evaluated as part of the transformation `R(x,r)` in the "`rolluprecursive` algorithm"
[OData-Data-Agg-v4.0, section 6.3]. Its behavior is undefined outside of this algorithm.
```
Sales?$apply=groupby((rolluprecursive(...)), filter(SalesOrganization eq Aggregation.rollupnode())/aggregate(...))
```
constructs a rollup that contains aggregates per hierarchy node while excluding descendants from the aggregation.

Parameter|Type|Description
:--------|:---|:----------
**[Instance](./Org.OData.Aggregation.V1.xml#L491:~:text=<Function%20Name="-,rollupnode,-")**|EntityType|**Binding parameter**
*[Position](./Org.OData.Aggregation.V1.xml#L492:~:text=<Function%20Name="-,rollupnode,-")*|Int16|*Optional parameter:* Position N among the `rolluprecursive` operators in the first argument of `groupby`<br>Every instance in the output set of a `groupby` transformation with M `rolluprecursive` operators has M relationships to M nodes in M recursive hierarchies. This function returns the node x with path r to the root in relationship number N. If several such `groupby` transformations are nested, this function refers to the innermost one.
[&rarr;](./Org.OData.Aggregation.V1.xml#L507:~:text=<Function%20Name="-,rollupnode,-")|Boolean|


<a name="ApplySupportedBase"></a>
## [ApplySupportedBase](./Org.OData.Aggregation.V1.xml#L102:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")


Services that do not fully implement a certain aggregation-related functionality may document
          this by annotating the [`ApplySupported`](#ApplySupported) or [`ApplySupportedDefaults`](#ApplySupportedDefaults)
          annotation with a description.

**Derived Types:**
- [ApplySupportedType](#ApplySupportedType)

Property|Type|Description
:-------|:---|:----------
[Transformations](./Org.OData.Aggregation.V1.xml#L108:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[[Transformation](#Transformation)\]|Transformations that can be used in `$apply`
[CustomAggregationMethods](./Org.OData.Aggregation.V1.xml#L111:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[Rollup](./Org.OData.Aggregation.V1.xml#L114:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation
[From](./Org.OData.Aggregation.V1.xml#L117:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|Boolean|The service supports the `from` keyword in an `aggregate` transformation

<a name="ApplySupportedType"></a>
## [ApplySupportedType](./Org.OData.Aggregation.V1.xml#L121:~:text=<ComplexType%20Name="-,ApplySupportedType,-"): [ApplySupportedBase](#ApplySupportedBase)


Property|Type|Description
:-------|:---|:----------
[*Transformations*](./Org.OData.Aggregation.V1.xml#L108:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[[Transformation](#Transformation)\]|Transformations that can be used in `$apply`
[*CustomAggregationMethods*](./Org.OData.Aggregation.V1.xml#L111:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[*Rollup*](./Org.OData.Aggregation.V1.xml#L114:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation
[*From*](./Org.OData.Aggregation.V1.xml#L117:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|Boolean|The service supports the `from` keyword in an `aggregate` transformation
[PropertyRestrictions](./Org.OData.Aggregation.V1.xml#L122:~:text=<ComplexType%20Name="-,ApplySupportedType,-") *(Deprecated)*|Boolean|Deprecated since [`Groupable`](#Groupable) and [`Aggregatable`](#Aggregatable) are deprecated
[GroupableProperties](./Org.OData.Aggregation.V1.xml#L133:~:text=<ComplexType%20Name="-,ApplySupportedType,-")|\[AnyPropertyPath\]|A non-empty collection indicates that only the listed properties of the annotated target are supported by the `groupby` transformation
[AggregatableProperties](./Org.OData.Aggregation.V1.xml#L136:~:text=<ComplexType%20Name="-,ApplySupportedType,-")|\[[AggregatablePropertyType](#AggregatablePropertyType)\]|A non-empty collection indicates that only the listed properties of the annotated target can be used in the `aggregate` transformation, optionally restricted to the specified aggregation methods

<a name="AggregatablePropertyType"></a>
## [AggregatablePropertyType](./Org.OData.Aggregation.V1.xml#L140:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")


Property|Type|Description
:-------|:---|:----------
[Property](./Org.OData.Aggregation.V1.xml#L141:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|PropertyPath|Aggregatable property
[SupportedAggregationMethods](./Org.OData.Aggregation.V1.xml#L146:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|\[[AggregationMethod](#AggregationMethod)\]|Standard and custom aggregation methods that can be applied to the property. If omitted, all aggregation methods can be applied
[RecommendedAggregationMethod](./Org.OData.Aggregation.V1.xml#L151:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|[AggregationMethod?](#AggregationMethod)|Recommended method for aggregating values of the property

<a name="Transformation"></a>
## [Transformation](./Org.OData.Aggregation.V1.xml#L158:~:text=<TypeDefinition%20Name="-,Transformation,-")
**Type:** String

A transformation that can be used in `$apply`

Allowed Value|Description
:------------|:----------
[aggregate](./Org.OData.Aggregation.V1.xml#L162:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.2.1
[groupby](./Org.OData.Aggregation.V1.xml#L166:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.2.3
[concat](./Org.OData.Aggregation.V1.xml#L170:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.2.2
[identity](./Org.OData.Aggregation.V1.xml#L174:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.3.3
[filter](./Org.OData.Aggregation.V1.xml#L178:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.3.2
[search](./Org.OData.Aggregation.V1.xml#L182:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.3.5
[nest](./Org.OData.Aggregation.V1.xml#L186:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.4.3
[addnested](./Org.OData.Aggregation.V1.xml#L190:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.4.4
[join](./Org.OData.Aggregation.V1.xml#L194:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.4.2
[outerjoin](./Org.OData.Aggregation.V1.xml#L198:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.4.2
[compute](./Org.OData.Aggregation.V1.xml#L202:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.4.1
[bottomcount](./Org.OData.Aggregation.V1.xml#L206:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.3.1.1
[bottomsum](./Org.OData.Aggregation.V1.xml#L210:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.3.1.3
[bottompercent](./Org.OData.Aggregation.V1.xml#L214:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.3.1.2
[topcount](./Org.OData.Aggregation.V1.xml#L218:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.3.1.1
[topsum](./Org.OData.Aggregation.V1.xml#L222:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.3.1.3
[toppercent](./Org.OData.Aggregation.V1.xml#L226:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.3.1.2
[orderby](./Org.OData.Aggregation.V1.xml#L230:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.3.4
[top](./Org.OData.Aggregation.V1.xml#L234:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.3.7
[skip](./Org.OData.Aggregation.V1.xml#L238:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 3.3.6
[ancestors](./Org.OData.Aggregation.V1.xml#L242:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 6.2.1
[descendants](./Org.OData.Aggregation.V1.xml#L246:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 6.2.2
[traverse](./Org.OData.Aggregation.V1.xml#L250:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0 section 6.2.3

<a name="AggregationMethod"></a>
## [AggregationMethod](./Org.OData.Aggregation.V1.xml#L258:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")
**Type:** String

Standard or custom aggregation method

Custom aggregation methods MUST use a namespace-qualified name, that is contain at least one dot. 

Allowed Value|Description
:------------|:----------
[sum](./Org.OData.Aggregation.V1.xml#L267:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Can be applied to numeric values to return the sum of the non-null values, or null if there are no non-null values or the input set is empty
[min](./Org.OData.Aggregation.V1.xml#L271:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Can be applied to values with a totally ordered domain to return the smallest of the non-null values, or null if there are no non-null values or the input set is empty
[max](./Org.OData.Aggregation.V1.xml#L275:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Can be applied to values with a totally ordered domain to return the largest of the non-null values, or null if there are no non-null values or the input set is empty
[average](./Org.OData.Aggregation.V1.xml#L279:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Can be applied to numeric values to return the sum of the non-null values divided by the count of the non-null values, or null if there are no non-null values or the input set is empty
[countdistinct](./Org.OData.Aggregation.V1.xml#L283:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Counts the distinct values, omitting any null values<br>For navigation properties, it counts the distinct entities in the union of all entities related to entities in the input set. For collection-valued primitive properties, it counts the distinct items in the union of all collection values in the input set.

<a name="RollupType"></a>
## [RollupType](./Org.OData.Aggregation.V1.xml#L295:~:text=<EnumType%20Name="-,RollupType,-")
The number of `rollup` or `rolluprecursive` operators allowed in a `groupby` transformation

Member|Value|Description
:-----|----:|:----------
[None](./Org.OData.Aggregation.V1.xml#L297:~:text=<EnumType%20Name="-,RollupType,-")|0|No support for `rollup` or `rolluprecursive`
[SingleHierarchy](./Org.OData.Aggregation.V1.xml#L300:~:text=<EnumType%20Name="-,RollupType,-")|1|Only one `rollup` or `rolluprecursive` operator per `groupby`
[MultipleHierarchies](./Org.OData.Aggregation.V1.xml#L303:~:text=<EnumType%20Name="-,RollupType,-")|2|Full support for `rollup` and `rolluprecursive`

<a name="RecursiveHierarchyType"></a>
## [RecursiveHierarchyType](./Org.OData.Aggregation.V1.xml#L353:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")


Property|Type|Description
:-------|:---|:----------
[NodeProperty](./Org.OData.Aggregation.V1.xml#L354:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|PropertyPath|Primitive property holding the hierarchy node identifier
[ParentNavigationProperty](./Org.OData.Aggregation.V1.xml#L357:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|NavigationPropertyPath|Property for navigating to the parent node. Its type MUST be the entity type annotated with this term, and it MUST be single-valued and nullable.

<a name="HierarchyQualifier"></a>
## [HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L362:~:text=<TypeDefinition%20Name="-,HierarchyQualifier,-")
**Type:** String

Qualifier of a [`RecursiveHierarchy`](#RecursiveHierarchy) annotation

Every recursive hierarchy function defined in this vocabulary has
- a parameter `HierarchyQualifier` of this type and
- a parameter `HierarchyNodes` that is a collection of entities of a common type without multiple occurrences of the same entity.

`HierarchyQualifier` is the qualifier of a `RecursiveHierarchy` annotation on the entity type of the collection
given by the `HierarchyNodes` parameter. This specifies a recursive hierarchy that is evaluated by the function.

<a name="AvailableOnAggregatesType"></a>
## [AvailableOnAggregatesType](./Org.OData.Aggregation.V1.xml#L523:~:text=<ComplexType%20Name="-,AvailableOnAggregatesType,-")


Property|Type|Description
:-------|:---|:----------
[RequiredProperties](./Org.OData.Aggregation.V1.xml#L524:~:text=<ComplexType%20Name="-,AvailableOnAggregatesType,-")|\[PropertyPath\]|Properties required to apply this action or function

<a name="NavigationPropertyAggregationCapabilities"></a>
## [NavigationPropertyAggregationCapabilities](./Org.OData.Aggregation.V1.xml#L529:~:text=<ComplexType%20Name="-,NavigationPropertyAggregationCapabilities,-"): [NavigationPropertyRestriction](Org.OData.Capabilities.V1.md#NavigationPropertyRestriction) *(Deprecated)*
[`Capabilities.NavigationRestrictions`](Org.OData.Capabilities.V1.md#NavigationRestrictions) that make use of the additional properties in this subtype are deprecated in favor of [`ApplySupported`](#ApplySupported) and [`CustomAggregate`](#CustomAggregate)

<a name="CustomAggregateType"></a>
## [CustomAggregateType](./Org.OData.Aggregation.V1.xml#L547:~:text=<ComplexType%20Name="-,CustomAggregateType,-") *(Deprecated)*
Deprecated since [`NavigationPropertyAggregationCapabilities`](#NavigationPropertyAggregationCapabilities) is also deprecated
