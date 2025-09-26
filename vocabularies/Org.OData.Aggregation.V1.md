# Aggregation Vocabulary
**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Terms to describe which data in a given entity model can be aggregated, and how.

Related to the specification document [OData-Data-Agg-v4.0](http://docs.oasis-open.org/odata/odata-data-aggregation-ext/v4.0/odata-data-aggregation-ext-v4.0.html).


## Terms

Term|Type|Description
:---|:---|:----------
[ApplySupported](Org.OData.Aggregation.V1.xml#L83)|[ApplySupportedType](#ApplySupportedType)|<a name="ApplySupported"></a>This entity set or collection supports the `$apply` system query option
[ApplySupportedDefaults](Org.OData.Aggregation.V1.xml#L89)|[ApplySupportedBase](#ApplySupportedBase)|<a name="ApplySupportedDefaults"></a>Default support of the `$apply` system query option for all collection-valued resources in the container<br><p>Annotating term <a href="#ApplySupported"><code>ApplySupported</code></a> for a specific collection-valued resource overrides the default support with the specified properties using PATCH semantics:</p> <ul> <li>Primitive or collection-valued properties specified in <code>ApplySupported</code> replace the corresponding properties specified in <code>ApplySupportedDefaults</code></li> <li>Complex-valued properties specified in <code>ApplySupported</code> override the corresponding properties specified in <code>ApplySupportedDefaults</code> using PATCH semantics recursively</li> <li>Properties specified neither in <code>ApplySupported</code> nor in <code>ApplySupportedDefaults</code> have their default value</li> </ul> 
[Groupable](Org.OData.Aggregation.V1.xml#L312) *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Groupable"></a>Deprecated in favor of [`ApplySupported/GroupableProperties`](#ApplySupported)
[Aggregatable](Org.OData.Aggregation.V1.xml#L324) *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Aggregatable"></a>Deprecated in favor of [`ApplySupported/AggregatableProperties`](#ApplySupported)
[CustomAggregate](Org.OData.Aggregation.V1.xml#L336)|String|<a name="CustomAggregate"></a>Dynamic property that can be used in the `aggregate` transformation<br>This term MUST be applied with a Qualifier, the Qualifier value is the name of the dynamic property. The value of the annotation MUST be the qualified name of a primitive type. The aggregated value will be of that type.
[ContextDefiningProperties](Org.OData.Aggregation.V1.xml#L342)|\[PropertyPath\]|<a name="ContextDefiningProperties"></a>The annotated property or custom aggregate is only well-defined in the context of these properties<br>The context-defining properties need either be part of the result entities, or be restricted to a single value by a pre-filter operation. Examples are postal codes within a country, or monetary amounts whose context is the unit of currency.
[RecursiveHierarchy](Org.OData.Aggregation.V1.xml#L355)|[RecursiveHierarchyType](#RecursiveHierarchyType)|<a name="RecursiveHierarchy"></a>Defines a recursive hierarchy (OData-Data-Agg-v4.0, section 5.5.2)
[AvailableOnAggregates](Org.OData.Aggregation.V1.xml#L539)|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|<a name="AvailableOnAggregates"></a>This function is available on aggregated entities if the `RequiredProperties` are still defined


## Functions

<a name="isnode"></a>
### [isnode](Org.OData.Aggregation.V1.xml#L380)

Is the entity a node of the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`)? (See OData-Data-Agg-v4.0, section 5.5.2.1)

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](Org.OData.Aggregation.V1.xml#L383)|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](Org.OData.Aggregation.V1.xml#L386)|[HierarchyQualifier](#HierarchyQualifier)|
[Node](Org.OData.Aggregation.V1.xml#L387)|PrimitiveType?|Node identifier of the putative node
[&rarr;](Org.OData.Aggregation.V1.xml#L390)|Boolean?|


<a name="isroot"></a>
### [isroot](Org.OData.Aggregation.V1.xml#L393)

Is the entity a root node of the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`)?

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](Org.OData.Aggregation.V1.xml#L396)|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](Org.OData.Aggregation.V1.xml#L399)|[HierarchyQualifier](#HierarchyQualifier)|
[Node](Org.OData.Aggregation.V1.xml#L400)|PrimitiveType?|Node identifier of the putative root
[&rarr;](Org.OData.Aggregation.V1.xml#L403)|Boolean?|


<a name="isdescendant"></a>
### [isdescendant](Org.OData.Aggregation.V1.xml#L406)

Is the entity a descendant node of the ancestor node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`) with at most the specified distance? (See OData-Data-Agg-v4.0, section 5.5.2.1)

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](Org.OData.Aggregation.V1.xml#L409)|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](Org.OData.Aggregation.V1.xml#L412)|[HierarchyQualifier](#HierarchyQualifier)|
[Node](Org.OData.Aggregation.V1.xml#L413)|PrimitiveType?|Node identifier of the putative descendant
[Ancestor](Org.OData.Aggregation.V1.xml#L416)|PrimitiveType?|Node identifier of the ancestor node
*[MaxDistance](Org.OData.Aggregation.V1.xml#L419)*|Int16|*Optional parameter*
*[IncludeSelf](Org.OData.Aggregation.V1.xml#L427)*|Boolean|*Optional parameter:* Whether to include the node itself in the result
[&rarr;](Org.OData.Aggregation.V1.xml#L435)|Boolean?|


<a name="isancestor"></a>
### [isancestor](Org.OData.Aggregation.V1.xml#L438)

Is the entity an ancestor node of the descendant node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`) with at most the specified distance? (See OData-Data-Agg-v4.0, section 5.5.2.1)

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](Org.OData.Aggregation.V1.xml#L441)|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](Org.OData.Aggregation.V1.xml#L444)|[HierarchyQualifier](#HierarchyQualifier)|
[Node](Org.OData.Aggregation.V1.xml#L445)|PrimitiveType?|Node identifier of the putative ancestor
[Descendant](Org.OData.Aggregation.V1.xml#L448)|PrimitiveType?|Node identifier of the descendant node
*[MaxDistance](Org.OData.Aggregation.V1.xml#L451)*|Int16|*Optional parameter*
*[IncludeSelf](Org.OData.Aggregation.V1.xml#L459)*|Boolean|*Optional parameter:* Whether to include the node itself in the result
[&rarr;](Org.OData.Aggregation.V1.xml#L467)|Boolean?|


<a name="issibling"></a>
### [issibling](Org.OData.Aggregation.V1.xml#L470)

Is the entity a sibling node of the other node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`)? (See OData-Data-Agg-v4.0, section 5.5.2.1)

A node is not a sibling of itself. If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](Org.OData.Aggregation.V1.xml#L473)|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](Org.OData.Aggregation.V1.xml#L476)|[HierarchyQualifier](#HierarchyQualifier)|
[Node](Org.OData.Aggregation.V1.xml#L477)|PrimitiveType?|Node identifier of the putative sibling
[Other](Org.OData.Aggregation.V1.xml#L480)|PrimitiveType?|Node identifier of the other node
[&rarr;](Org.OData.Aggregation.V1.xml#L483)|Boolean?|


<a name="isleaf"></a>
### [isleaf](Org.OData.Aggregation.V1.xml#L486)

Is the entity a leaf node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`)? (See OData-Data-Agg-v4.0, section 5.5.2.1)

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](Org.OData.Aggregation.V1.xml#L489)|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](Org.OData.Aggregation.V1.xml#L492)|[HierarchyQualifier](#HierarchyQualifier)|
[Node](Org.OData.Aggregation.V1.xml#L493)|PrimitiveType?|Node identifier of the putative leaf
[&rarr;](Org.OData.Aggregation.V1.xml#L496)|Boolean?|


<a name="ApplySupportedBase"></a>
## [ApplySupportedBase](Org.OData.Aggregation.V1.xml#L100)


Services that do not fully implement a certain aggregation-related functionality may document
          this by annotating the [`ApplySupported`](#ApplySupported) or [`ApplySupportedDefaults`](#ApplySupportedDefaults)
          annotation with a description.

**Derived Types:**
- [ApplySupportedType](#ApplySupportedType)

Property|Type|Description
:-------|:---|:----------
[Transformations](Org.OData.Aggregation.V1.xml#L106)|\[[Transformation](#Transformation)\]|Transformations that can be used in `$apply`
[CustomAggregationMethods](Org.OData.Aggregation.V1.xml#L109)|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`

<a name="ApplySupportedType"></a>
## [ApplySupportedType](Org.OData.Aggregation.V1.xml#L121): [ApplySupportedBase](#ApplySupportedBase)


Property|Type|Description
:-------|:---|:----------
[*Transformations*](Org.OData.Aggregation.V1.xml#L106)|\[[Transformation](#Transformation)\]|Transformations that can be used in `$apply`
[*CustomAggregationMethods*](Org.OData.Aggregation.V1.xml#L109)|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[PropertyRestrictions](Org.OData.Aggregation.V1.xml#L122) *(Deprecated)*|Boolean|Deprecated since [`Groupable`](#Groupable) and [`Aggregatable`](#Aggregatable) are deprecated
[GroupableProperties](Org.OData.Aggregation.V1.xml#L133)|\[AnyPropertyPath\]|A non-empty collection indicates that only the listed properties of the annotated target are supported by the `groupby` transformation
[AggregatableProperties](Org.OData.Aggregation.V1.xml#L136)|\[[AggregatablePropertyType](#AggregatablePropertyType)\]|A non-empty collection indicates that only the listed properties of the annotated target can be used in the `aggregate` transformation, optionally restricted to the specified aggregation methods

<a name="AggregatablePropertyType"></a>
## [AggregatablePropertyType](Org.OData.Aggregation.V1.xml#L140)


Property|Type|Description
:-------|:---|:----------
[Property](Org.OData.Aggregation.V1.xml#L141)|PropertyPath|Aggregatable property
[SupportedAggregationMethods](Org.OData.Aggregation.V1.xml#L146)|\[[AggregationMethod](#AggregationMethod)\]|Standard and custom aggregation methods that can be applied to the property. If omitted, all aggregation methods can be applied
[RecommendedAggregationMethod](Org.OData.Aggregation.V1.xml#L151)|[AggregationMethod?](#AggregationMethod)|Recommended method for aggregating values of the property

<a name="Transformation"></a>
## [Transformation](Org.OData.Aggregation.V1.xml#L158)
**Type:** String

A transformation that can be used in `$apply`

Allowed Value|Description
:------------|:----------
[aggregate](Org.OData.Aggregation.V1.xml#L162)|OData-Data-Agg-v4.0, section 3.2.1
[groupby](Org.OData.Aggregation.V1.xml#L166)|OData-Data-Agg-v4.0, section 3.2.3
[concat](Org.OData.Aggregation.V1.xml#L170)|OData-Data-Agg-v4.0, section 3.2.2
[identity](Org.OData.Aggregation.V1.xml#L174)|OData-Data-Agg-v4.0, section 3.4.1
[filter](Org.OData.Aggregation.V1.xml#L178)|OData-Data-Agg-v4.0, section 3.3.2
[search](Org.OData.Aggregation.V1.xml#L182)|OData-Data-Agg-v4.0, section 3.3.4
[join](Org.OData.Aggregation.V1.xml#L196)|OData-Data-Agg-v4.0, section 3.5.1
[outerjoin](Org.OData.Aggregation.V1.xml#L200)|OData-Data-Agg-v4.0, section 3.5.1
[compute](Org.OData.Aggregation.V1.xml#L204)|OData-Data-Agg-v4.0, section 3.4.2
[bottomcount](Org.OData.Aggregation.V1.xml#L208)|OData-Data-Agg-v4.0, section 3.3.1.1
[bottomsum](Org.OData.Aggregation.V1.xml#L212)|OData-Data-Agg-v4.0, section 3.3.1.3
[bottompercent](Org.OData.Aggregation.V1.xml#L216)|OData-Data-Agg-v4.0, section 3.3.1.2
[topcount](Org.OData.Aggregation.V1.xml#L220)|OData-Data-Agg-v4.0, section 3.3.1.1
[topsum](Org.OData.Aggregation.V1.xml#L224)|OData-Data-Agg-v4.0, section 3.3.1.3
[toppercent](Org.OData.Aggregation.V1.xml#L228)|OData-Data-Agg-v4.0, section 3.3.1.2
[orderby](Org.OData.Aggregation.V1.xml#L232)|OData-Data-Agg-v4.0, section 3.3.3
[top](Org.OData.Aggregation.V1.xml#L236)|OData-Data-Agg-v4.0, section 3.3.6
[skip](Org.OData.Aggregation.V1.xml#L240)|OData-Data-Agg-v4.0, section 3.3.5
[ancestors](Org.OData.Aggregation.V1.xml#L244)|OData-Data-Agg-v4.0, section 6.2.1
[descendants](Org.OData.Aggregation.V1.xml#L248)|OData-Data-Agg-v4.0, section 6.2.1
[traverse](Org.OData.Aggregation.V1.xml#L252)|OData-Data-Agg-v4.0, section 6.2.2

<a name="AggregationMethod"></a>
## [AggregationMethod](Org.OData.Aggregation.V1.xml#L260)
**Type:** String

Standard or custom aggregation method

Custom aggregation methods MUST use a namespace-qualified name, that is contain at least one dot. 

Allowed Value|Description
:------------|:----------
[sum](Org.OData.Aggregation.V1.xml#L269)|Can be applied to numeric values to return the sum of the non-null values, or null if there are no non-null values or the input set is empty
[min](Org.OData.Aggregation.V1.xml#L273)|Can be applied to values with a totally ordered domain to return the smallest of the non-null values, or null if there are no non-null values or the input set is empty
[max](Org.OData.Aggregation.V1.xml#L277)|Can be applied to values with a totally ordered domain to return the largest of the non-null values, or null if there are no non-null values or the input set is empty
[average](Org.OData.Aggregation.V1.xml#L281)|Can be applied to numeric values to return the sum of the non-null values divided by the count of the non-null values, or null if there are no non-null values or the input set is empty
[countdistinct](Org.OData.Aggregation.V1.xml#L285)|Counts the distinct values, omitting any null values<br>For navigation properties, it counts the distinct entities in the union of all entities related to entities in the input set. For collection-valued primitive properties, it counts the distinct items in the union of all collection values in the input set.

<a name="RecursiveHierarchyType"></a>
## [RecursiveHierarchyType](Org.OData.Aggregation.V1.xml#L359)


Property|Type|Description
:-------|:---|:----------
[NodeProperty](Org.OData.Aggregation.V1.xml#L360)|PropertyPath|Primitive property holding the node identifier
[ParentNavigationProperty](Org.OData.Aggregation.V1.xml#L363)|NavigationPropertyPath|Property for navigating to the parent node(s). Its type MUST be the entity type annotated with this term, and it MUST be collection-valued or nullable single-valued.

<a name="HierarchyQualifier"></a>
## [HierarchyQualifier](Org.OData.Aggregation.V1.xml#L368)
**Type:** String

Qualifier of a [`RecursiveHierarchy`](#RecursiveHierarchy) annotation

Every recursive hierarchy function defined in this vocabulary has
- a parameter `HierarchyQualifier` of this type and
- a parameter `HierarchyNodes` that is a collection of entities of a common type without multiple occurrences of the same entity.

`HierarchyQualifier` is the qualifier of a `RecursiveHierarchy` annotation on the entity type of the collection
given by the `HierarchyNodes` parameter. This specifies a recursive hierarchy that is evaluated by the function.

<a name="AvailableOnAggregatesType"></a>
## [AvailableOnAggregatesType](Org.OData.Aggregation.V1.xml#L542)


Property|Type|Description
:-------|:---|:----------
[RequiredProperties](Org.OData.Aggregation.V1.xml#L543)|\[PropertyPath\]|Properties required to apply this function

<a name="NavigationPropertyAggregationCapabilities"></a>
## [NavigationPropertyAggregationCapabilities](Org.OData.Aggregation.V1.xml#L548): [NavigationPropertyRestriction](Org.OData.Capabilities.V1.md#NavigationPropertyRestriction) *(Deprecated)*
[`Capabilities.NavigationRestrictions`](Org.OData.Capabilities.V1.md#NavigationRestrictions) that make use of the additional properties in this subtype are deprecated in favor of [`ApplySupported`](#ApplySupported) and [`CustomAggregate`](#CustomAggregate)

<a name="CustomAggregateType"></a>
## [CustomAggregateType](Org.OData.Aggregation.V1.xml#L566) *(Deprecated)*
Deprecated since [`NavigationPropertyAggregationCapabilities`](#NavigationPropertyAggregationCapabilities) is also deprecated
