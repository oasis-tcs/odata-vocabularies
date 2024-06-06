# Aggregation Vocabulary
**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Terms to describe which data in a given entity model can be aggregated, and how.

Related to the specification document [OData-Data-Agg-v4.0](http://docs.oasis-open.org/odata/odata-data-aggregation-ext/v4.0/odata-data-aggregation-ext-v4.0.html).


## Terms

Term|Type|Description
:---|:---|:----------
[ApplySupported](./Org.OData.Aggregation.V1.xml#L82:~:text=<Term%20Name="-,ApplySupported,-")|[ApplySupportedType](#ApplySupportedType)|<a name="ApplySupported"></a>This entity set or collection supports the `$apply` system query option
[ApplySupportedDefaults](./Org.OData.Aggregation.V1.xml#L88:~:text=<Term%20Name="-,ApplySupportedDefaults,-")|[ApplySupportedBase](#ApplySupportedBase)|<a name="ApplySupportedDefaults"></a>Default support of the `$apply` system query option for all collection-valued resources in the container<br><p>Annotating term <a href="#ApplySupported"><code>ApplySupported</code></a> for a specific collection-valued resource overrides the default support with the specified properties using PATCH semantics:</p> <ul> <li>Primitive or collection-valued properties specified in <code>ApplySupported</code> replace the corresponding properties specified in <code>ApplySupportedDefaults</code></li> <li>Complex-valued properties specified in <code>ApplySupported</code> override the corresponding properties specified in <code>ApplySupportedDefaults</code> using PATCH semantics recursively</li> <li>Properties specified neither in <code>ApplySupported</code> nor in <code>ApplySupportedDefaults</code> have their default value</li> </ul> 
[Groupable](./Org.OData.Aggregation.V1.xml#L305:~:text=<Term%20Name="-,Groupable,-") *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Groupable"></a>Deprecated in favor of [`ApplySupported/GroupableProperties`](#ApplySupported)
[Aggregatable](./Org.OData.Aggregation.V1.xml#L317:~:text=<Term%20Name="-,Aggregatable,-") *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Aggregatable"></a>Deprecated in favor of [`ApplySupported/AggregatableProperties`](#ApplySupported)
[CustomAggregate](./Org.OData.Aggregation.V1.xml#L329:~:text=<Term%20Name="-,CustomAggregate,-")|String|<a name="CustomAggregate"></a>Dynamic property that can be used in the `aggregate` transformation<br>This term MUST be applied with a Qualifier, the Qualifier value is the name of the dynamic property. The value of the annotation MUST be the qualified name of a primitive type. The aggregated value will be of that type.
[ContextDefiningProperties](./Org.OData.Aggregation.V1.xml#L335:~:text=<Term%20Name="-,ContextDefiningProperties,-")|\[PropertyPath\]|<a name="ContextDefiningProperties"></a>The annotated property or custom aggregate is only well-defined in the context of these properties<br>The context-defining properties need either be part of the result entities, or be restricted to a single value by a pre-filter operation. Examples are postal codes within a country, or monetary amounts whose context is the unit of currency.
[LeveledHierarchy](./Org.OData.Aggregation.V1.xml#L342:~:text=<Term%20Name="-,LeveledHierarchy,-")|\[PropertyPath\]|<a name="LeveledHierarchy"></a>Defines a leveled hierarchy (OData-Data-Agg-v4.0, section 5.5.1)
[RecursiveHierarchy](./Org.OData.Aggregation.V1.xml#L346:~:text=<Term%20Name="-,RecursiveHierarchy,-")|[RecursiveHierarchyType](#RecursiveHierarchyType)|<a name="RecursiveHierarchy"></a>Defines a recursive hierarchy (OData-Data-Agg-v4.0, section 5.5.2)
[UpPath](./Org.OData.Aggregation.V1.xml#L519:~:text=<Term%20Name="-,UpPath,-")|\[String\]|<a name="UpPath"></a>The string values of the node identifiers in a path from the annotated node to a start node in a traversal of a recursive hierarchy<br>This instance annotation occurs in the result set after a `traverse` transformation (OData-Data-Agg-v4.0, section 6.2.2.2). A use case for this is traversal with multiple parents, when this annotation takes as value one parent node identifier followed by one grandparent node identifier and so on.
[AvailableOnAggregates](./Org.OData.Aggregation.V1.xml#L528:~:text=<Term%20Name="-,AvailableOnAggregates,-")|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|<a name="AvailableOnAggregates"></a>This function is available on aggregated entities if the `RequiredProperties` are still defined


## Functions

<a name="isnode"></a>
### [isnode](./Org.OData.Aggregation.V1.xml#L371:~:text=<Function%20Name="-,isnode,-")

Is the entity a node of the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`)? (See OData-Data-Agg-v4.0, section 5.5.2.1)

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L374:~:text=<Function%20Name="-,isnode,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L377:~:text=<Function%20Name="-,isnode,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L378:~:text=<Function%20Name="-,isnode,-")|PrimitiveType?|Node identifier of the putative node
[&rarr;](./Org.OData.Aggregation.V1.xml#L381:~:text=<Function%20Name="-,isnode,-")|Boolean?|


<a name="isroot"></a>
### [isroot](./Org.OData.Aggregation.V1.xml#L384:~:text=<Function%20Name="-,isroot,-")

Is the entity a root node of the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`)?

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L387:~:text=<Function%20Name="-,isroot,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L390:~:text=<Function%20Name="-,isroot,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L391:~:text=<Function%20Name="-,isroot,-")|PrimitiveType?|Node identifier of the putative root
[&rarr;](./Org.OData.Aggregation.V1.xml#L394:~:text=<Function%20Name="-,isroot,-")|Boolean?|


<a name="isdescendant"></a>
### [isdescendant](./Org.OData.Aggregation.V1.xml#L397:~:text=<Function%20Name="-,isdescendant,-")

Is the entity a descendant node of the ancestor node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`) with at most the specified distance? (See OData-Data-Agg-v4.0, section 5.5.2.1)

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L400:~:text=<Function%20Name="-,isdescendant,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L403:~:text=<Function%20Name="-,isdescendant,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L404:~:text=<Function%20Name="-,isdescendant,-")|PrimitiveType?|Node identifier of the putative descendant
[Ancestor](./Org.OData.Aggregation.V1.xml#L407:~:text=<Function%20Name="-,isdescendant,-")|PrimitiveType?|Node identifier of the ancestor node
*[MaxDistance](./Org.OData.Aggregation.V1.xml#L410:~:text=<Function%20Name="-,isdescendant,-")*|Int16|*Optional parameter*
*[IncludeSelf](./Org.OData.Aggregation.V1.xml#L418:~:text=<Function%20Name="-,isdescendant,-")*|Boolean|*Optional parameter:* Whether to include the node itself in the result
[&rarr;](./Org.OData.Aggregation.V1.xml#L426:~:text=<Function%20Name="-,isdescendant,-")|Boolean?|


<a name="isancestor"></a>
### [isancestor](./Org.OData.Aggregation.V1.xml#L429:~:text=<Function%20Name="-,isancestor,-")

Is the entity an ancestor node of the descendant node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`) with at most the specified distance? (See OData-Data-Agg-v4.0, section 5.5.2.1)

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L432:~:text=<Function%20Name="-,isancestor,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L435:~:text=<Function%20Name="-,isancestor,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L436:~:text=<Function%20Name="-,isancestor,-")|PrimitiveType?|Node identifier of the putative ancestor
[Descendant](./Org.OData.Aggregation.V1.xml#L439:~:text=<Function%20Name="-,isancestor,-")|PrimitiveType?|Node identifier of the descendant node
*[MaxDistance](./Org.OData.Aggregation.V1.xml#L442:~:text=<Function%20Name="-,isancestor,-")*|Int16|*Optional parameter*
*[IncludeSelf](./Org.OData.Aggregation.V1.xml#L450:~:text=<Function%20Name="-,isancestor,-")*|Boolean|*Optional parameter:* Whether to include the node itself in the result
[&rarr;](./Org.OData.Aggregation.V1.xml#L458:~:text=<Function%20Name="-,isancestor,-")|Boolean?|


<a name="issibling"></a>
### [issibling](./Org.OData.Aggregation.V1.xml#L461:~:text=<Function%20Name="-,issibling,-")

Is the entity a sibling node of the other node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`)? (See OData-Data-Agg-v4.0, section 5.5.2.1)

A node is not a sibling of itself. If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L464:~:text=<Function%20Name="-,issibling,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L467:~:text=<Function%20Name="-,issibling,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L468:~:text=<Function%20Name="-,issibling,-")|PrimitiveType?|Node identifier of the putative sibling
[Other](./Org.OData.Aggregation.V1.xml#L471:~:text=<Function%20Name="-,issibling,-")|PrimitiveType?|Node identifier of the other node
[&rarr;](./Org.OData.Aggregation.V1.xml#L474:~:text=<Function%20Name="-,issibling,-")|Boolean?|


<a name="isleaf"></a>
### [isleaf](./Org.OData.Aggregation.V1.xml#L477:~:text=<Function%20Name="-,isleaf,-")

Is the entity a leaf node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`)? (See OData-Data-Agg-v4.0, section 5.5.2.1)

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L480:~:text=<Function%20Name="-,isleaf,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L483:~:text=<Function%20Name="-,isleaf,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L484:~:text=<Function%20Name="-,isleaf,-")|PrimitiveType?|Node identifier of the putative leaf
[&rarr;](./Org.OData.Aggregation.V1.xml#L487:~:text=<Function%20Name="-,isleaf,-")|Boolean?|


<a name="rollupnode"></a>
### [rollupnode](./Org.OData.Aggregation.V1.xml#L490:~:text=<Function%20Name="-,rollupnode,-")

During `rolluprecursive` for a hierarchy node, this function returns the node

This function may only occur in the second parameter of a `groupby` transformation whose first parameter
contains `rolluprecursive(...)`. It is evaluated as part of the transformation `R(x)` in the "`rolluprecursive` algorithm"
(OData-Data-Agg-v4.0, section 6.3). Its behavior is undefined outside of this algorithm.
```
Sales?$apply=groupby((rolluprecursive(...)), filter(SalesOrganization eq Aggregation.rollupnode())/aggregate(...))
```
constructs a rollup that contains aggregates per hierarchy node while excluding descendants from the aggregation.

Parameter|Type|Description
:--------|:---|:----------
*[Position](./Org.OData.Aggregation.V1.xml#L501:~:text=<Function%20Name="-,rollupnode,-")*|Int16|*Optional parameter:* Position N among the `rolluprecursive` operators in the first argument of `groupby`<br>Every instance in the output set of a `groupby` transformation with M `rolluprecursive` operators has M relationships to M nodes in M recursive hierarchies. This function returns the node x with path r to the root in relationship number N. If several such `groupby` transformations are nested, this function refers to the innermost one.
[&rarr;](./Org.OData.Aggregation.V1.xml#L516:~:text=<Function%20Name="-,rollupnode,-")|EntityType|


<a name="ApplySupportedBase"></a>
## [ApplySupportedBase](./Org.OData.Aggregation.V1.xml#L99:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")


Services that do not fully implement a certain aggregation-related functionality may document
          this by annotating the [`ApplySupported`](#ApplySupported) or [`ApplySupportedDefaults`](#ApplySupportedDefaults)
          annotation with a description.

**Derived Types:**
- [ApplySupportedType](#ApplySupportedType)

Property|Type|Description
:-------|:---|:----------
[Transformations](./Org.OData.Aggregation.V1.xml#L105:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[[Transformation](#Transformation)\]|Transformations that can be used in `$apply`
[CustomAggregationMethods](./Org.OData.Aggregation.V1.xml#L108:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[Rollup](./Org.OData.Aggregation.V1.xml#L111:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation
[From](./Org.OData.Aggregation.V1.xml#L114:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|Boolean|The service supports the `from` keyword in an `aggregate` transformation

<a name="ApplySupportedType"></a>
## [ApplySupportedType](./Org.OData.Aggregation.V1.xml#L118:~:text=<ComplexType%20Name="-,ApplySupportedType,-"): [ApplySupportedBase](#ApplySupportedBase)


Property|Type|Description
:-------|:---|:----------
[*Transformations*](./Org.OData.Aggregation.V1.xml#L105:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[[Transformation](#Transformation)\]|Transformations that can be used in `$apply`
[*CustomAggregationMethods*](./Org.OData.Aggregation.V1.xml#L108:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[*Rollup*](./Org.OData.Aggregation.V1.xml#L111:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation
[*From*](./Org.OData.Aggregation.V1.xml#L114:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|Boolean|The service supports the `from` keyword in an `aggregate` transformation
[PropertyRestrictions](./Org.OData.Aggregation.V1.xml#L119:~:text=<ComplexType%20Name="-,ApplySupportedType,-") *(Deprecated)*|Boolean|Deprecated since [`Groupable`](#Groupable) and [`Aggregatable`](#Aggregatable) are deprecated
[GroupableProperties](./Org.OData.Aggregation.V1.xml#L130:~:text=<ComplexType%20Name="-,ApplySupportedType,-")|\[AnyPropertyPath\]|A non-empty collection indicates that only the listed properties of the annotated target are supported by the `groupby` transformation
[AggregatableProperties](./Org.OData.Aggregation.V1.xml#L133:~:text=<ComplexType%20Name="-,ApplySupportedType,-")|\[[AggregatablePropertyType](#AggregatablePropertyType)\]|A non-empty collection indicates that only the listed properties of the annotated target can be used in the `aggregate` transformation, optionally restricted to the specified aggregation methods

<a name="AggregatablePropertyType"></a>
## [AggregatablePropertyType](./Org.OData.Aggregation.V1.xml#L137:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")


Property|Type|Description
:-------|:---|:----------
[Property](./Org.OData.Aggregation.V1.xml#L138:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|PropertyPath|Aggregatable property
[SupportedAggregationMethods](./Org.OData.Aggregation.V1.xml#L143:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|\[[AggregationMethod](#AggregationMethod)\]|Standard and custom aggregation methods that can be applied to the property. If omitted, all aggregation methods can be applied
[RecommendedAggregationMethod](./Org.OData.Aggregation.V1.xml#L148:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|[AggregationMethod?](#AggregationMethod)|Recommended method for aggregating values of the property

<a name="Transformation"></a>
## [Transformation](./Org.OData.Aggregation.V1.xml#L155:~:text=<TypeDefinition%20Name="-,Transformation,-")
**Type:** String

A transformation that can be used in `$apply`

Allowed Value|Description
:------------|:----------
[aggregate](./Org.OData.Aggregation.V1.xml#L159:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.2.1
[groupby](./Org.OData.Aggregation.V1.xml#L163:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.2.3
[concat](./Org.OData.Aggregation.V1.xml#L167:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.2.2
[identity](./Org.OData.Aggregation.V1.xml#L171:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.4.1
[filter](./Org.OData.Aggregation.V1.xml#L175:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.2
[search](./Org.OData.Aggregation.V1.xml#L179:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.4
[nest](./Org.OData.Aggregation.V1.xml#L183:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.5.2
[addnested](./Org.OData.Aggregation.V1.xml#L187:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.4.3
[join](./Org.OData.Aggregation.V1.xml#L191:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.5.1
[outerjoin](./Org.OData.Aggregation.V1.xml#L195:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.5.1
[compute](./Org.OData.Aggregation.V1.xml#L199:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.4.2
[bottomcount](./Org.OData.Aggregation.V1.xml#L203:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.1.1
[bottomsum](./Org.OData.Aggregation.V1.xml#L207:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.1.3
[bottompercent](./Org.OData.Aggregation.V1.xml#L211:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.1.2
[topcount](./Org.OData.Aggregation.V1.xml#L215:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.1.1
[topsum](./Org.OData.Aggregation.V1.xml#L219:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.1.3
[toppercent](./Org.OData.Aggregation.V1.xml#L223:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.1.2
[orderby](./Org.OData.Aggregation.V1.xml#L227:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.3
[top](./Org.OData.Aggregation.V1.xml#L231:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.6
[skip](./Org.OData.Aggregation.V1.xml#L235:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.5
[ancestors](./Org.OData.Aggregation.V1.xml#L239:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 6.2.1
[descendants](./Org.OData.Aggregation.V1.xml#L243:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 6.2.1
[traverse](./Org.OData.Aggregation.V1.xml#L247:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 6.2.2

<a name="AggregationMethod"></a>
## [AggregationMethod](./Org.OData.Aggregation.V1.xml#L255:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")
**Type:** String

Standard or custom aggregation method

Custom aggregation methods MUST use a namespace-qualified name, that is contain at least one dot. 

Allowed Value|Description
:------------|:----------
[sum](./Org.OData.Aggregation.V1.xml#L264:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Can be applied to numeric values to return the sum of the non-null values, or null if there are no non-null values or the input set is empty
[min](./Org.OData.Aggregation.V1.xml#L268:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Can be applied to values with a totally ordered domain to return the smallest of the non-null values, or null if there are no non-null values or the input set is empty
[max](./Org.OData.Aggregation.V1.xml#L272:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Can be applied to values with a totally ordered domain to return the largest of the non-null values, or null if there are no non-null values or the input set is empty
[average](./Org.OData.Aggregation.V1.xml#L276:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Can be applied to numeric values to return the sum of the non-null values divided by the count of the non-null values, or null if there are no non-null values or the input set is empty
[countdistinct](./Org.OData.Aggregation.V1.xml#L280:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Counts the distinct values, omitting any null values<br>For navigation properties, it counts the distinct entities in the union of all entities related to entities in the input set. For collection-valued primitive properties, it counts the distinct items in the union of all collection values in the input set.

<a name="RollupType"></a>
## [RollupType](./Org.OData.Aggregation.V1.xml#L292:~:text=<EnumType%20Name="-,RollupType,-")
The number of `rollup` or `rolluprecursive` operators allowed in a `groupby` transformation

Member|Value|Description
:-----|----:|:----------
[None](./Org.OData.Aggregation.V1.xml#L294:~:text=<EnumType%20Name="-,RollupType,-")|0|No support for `rollup` or `rolluprecursive`
[SingleHierarchy](./Org.OData.Aggregation.V1.xml#L297:~:text=<EnumType%20Name="-,RollupType,-")|1|Only one `rollup` or `rolluprecursive` operator per `groupby`
[MultipleHierarchies](./Org.OData.Aggregation.V1.xml#L300:~:text=<EnumType%20Name="-,RollupType,-")|2|Full support for `rollup` and `rolluprecursive`

<a name="RecursiveHierarchyType"></a>
## [RecursiveHierarchyType](./Org.OData.Aggregation.V1.xml#L350:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")


Property|Type|Description
:-------|:---|:----------
[NodeProperty](./Org.OData.Aggregation.V1.xml#L351:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|PropertyPath|Primitive property holding the node identifier
[ParentNavigationProperty](./Org.OData.Aggregation.V1.xml#L354:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|NavigationPropertyPath|Property for navigating to the parent node(s). Its type MUST be the entity type annotated with this term, and it MUST be collection-valued or nullable single-valued.

<a name="HierarchyQualifier"></a>
## [HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L359:~:text=<TypeDefinition%20Name="-,HierarchyQualifier,-")
**Type:** String

Qualifier of a [`RecursiveHierarchy`](#RecursiveHierarchy) annotation

Every recursive hierarchy function defined in this vocabulary has
- a parameter `HierarchyQualifier` of this type and
- a parameter `HierarchyNodes` that is a collection of entities of a common type without multiple occurrences of the same entity.

`HierarchyQualifier` is the qualifier of a `RecursiveHierarchy` annotation on the entity type of the collection
given by the `HierarchyNodes` parameter. This specifies a recursive hierarchy that is evaluated by the function.

<a name="AvailableOnAggregatesType"></a>
## [AvailableOnAggregatesType](./Org.OData.Aggregation.V1.xml#L531:~:text=<ComplexType%20Name="-,AvailableOnAggregatesType,-")


Property|Type|Description
:-------|:---|:----------
[RequiredProperties](./Org.OData.Aggregation.V1.xml#L532:~:text=<ComplexType%20Name="-,AvailableOnAggregatesType,-")|\[PropertyPath\]|Properties required to apply this function

<a name="NavigationPropertyAggregationCapabilities"></a>
## [NavigationPropertyAggregationCapabilities](./Org.OData.Aggregation.V1.xml#L537:~:text=<ComplexType%20Name="-,NavigationPropertyAggregationCapabilities,-"): [NavigationPropertyRestriction](Org.OData.Capabilities.V1.md#NavigationPropertyRestriction) *(Deprecated)*
[`Capabilities.NavigationRestrictions`](Org.OData.Capabilities.V1.md#NavigationRestrictions) that make use of the additional properties in this subtype are deprecated in favor of [`ApplySupported`](#ApplySupported) and [`CustomAggregate`](#CustomAggregate)

<a name="CustomAggregateType"></a>
## [CustomAggregateType](./Org.OData.Aggregation.V1.xml#L555:~:text=<ComplexType%20Name="-,CustomAggregateType,-") *(Deprecated)*
Deprecated since [`NavigationPropertyAggregationCapabilities`](#NavigationPropertyAggregationCapabilities) is also deprecated
