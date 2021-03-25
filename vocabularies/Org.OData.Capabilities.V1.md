# Capabilities Vocabulary
**Namespace: [Org.OData.Capabilities.V1](Org.OData.Capabilities.V1.xml)**

Terms describing capabilities of a service


There are some capabilities which are strongly recommended for services to support even
though they are optional. Support for $top and $skip is a good example as
supporting these query options helps with performance of a service and are essential. Such
capabilities are assumed to be default capabilities of an OData service even in
the case that a capabilities annotation doesn’t exist. Capabilities annotations are
mainly expected to be used to explicitly specify that a service doesn’t support such
capabilities. Capabilities annotations can as well be used to declaratively
specify the support of such capabilities.

On the other hand, there are some capabilities that a service may choose to support or
not support and in varying degrees. $filter and $orderby are such good examples.
This vocabulary aims to define terms to specify support or no support for such
capabilities.

A service is assumed to support by default the following capabilities even though an
annotation doesn’t exist:
- Countability ($count)
- Client pageability ($top, $skip)
- Expandability ($expand)
- Indexability by key
- Batch support ($batch)
- Navigability of navigation properties

A service is expected to support the following capabilities. If not supported, the
service is expected to call out the restrictions using annotations:
- Filterability ($filter)
- Sortability ($orderby)
- Queryability of top level entity sets
- Query functions

A client cannot assume that a service supports certain capabilities. A client can try, but
it needs to be prepared to handle an error in case the following capabilities are not
supported:
- Insertability
- Updatability
- Deletability
        


## Terms

Term|Type|Description
:---|:---|:----------
[ConformanceLevel](Org.OData.Capabilities.V1.xml#L115)|[ConformanceLevelType?](#ConformanceLevelType)|<a name="ConformanceLevel"></a>The conformance level achieved by this service
[SupportedFormats](Org.OData.Capabilities.V1.xml#L132)|\[MediaType\]|<a name="SupportedFormats"></a>Media types of supported formats, including format parameters
[SupportedMetadataFormats](Org.OData.Capabilities.V1.xml#L137)|\[MediaType\]|<a name="SupportedMetadataFormats"></a>Media types of supported formats for $metadata, including format parameters
[AcceptableEncodings](Org.OData.Capabilities.V1.xml#L142)|\[String\]|<a name="AcceptableEncodings"></a>List of acceptable compression methods for ($batch) requests, e.g. gzip
[AsynchronousRequestsSupported](Org.OData.Capabilities.V1.xml#L148)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AsynchronousRequestsSupported"></a>Service supports the asynchronous request preference
[BatchContinueOnErrorSupported](Org.OData.Capabilities.V1.xml#L152)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchContinueOnErrorSupported"></a>Service supports the continue on error preference. Supports $batch requests. Services that apply the BatchContinueOnErrorSupported term should also specify the ContinueOnErrorSupported property from the BatchSupport term.
[IsolationSupported](Org.OData.Capabilities.V1.xml#L156)|[IsolationLevel?](#IsolationLevel)|<a name="IsolationSupported"></a>Supported odata.isolation levels
[CrossJoinSupported](Org.OData.Capabilities.V1.xml#L165)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="CrossJoinSupported"></a>Supports cross joins for the entity sets in this container
[CallbackSupported](Org.OData.Capabilities.V1.xml#L169)|[CallbackType?](#CallbackType)|<a name="CallbackSupported"></a>Supports callbacks for the specified protocols
[ChangeTracking](Org.OData.Capabilities.V1.xml#L191)|[ChangeTrackingType?](#ChangeTrackingType)|<a name="ChangeTracking"></a>Change tracking capabilities of this service or entity set
[CountRestrictions](Org.OData.Capabilities.V1.xml#L210)|[CountRestrictionsType?](#CountRestrictionsType)|<a name="CountRestrictions"></a>Restrictions on /$count path suffix and $count=true system query option
[NavigationRestrictions](Org.OData.Capabilities.V1.xml#L225)|[NavigationRestrictionsType?](#NavigationRestrictionsType)|<a name="NavigationRestrictions"></a>Restrictions on navigating properties according to OData URL conventions<br>Restrictions specified on an entity set are valid whether the request is directly to the entity set or through a navigation property bound to that entity set. Services can specify a different set of restrictions specific to a path, in which case the more specific restrictions take precedence.
[IndexableByKey](Org.OData.Capabilities.V1.xml#L303)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="IndexableByKey"></a>Supports key values according to OData URL conventions
[TopSupported](Org.OData.Capabilities.V1.xml#L307)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="TopSupported"></a>Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L311)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="SkipSupported"></a>Supports $skip
[ComputeSupported](Org.OData.Capabilities.V1.xml#L315)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="ComputeSupported"></a>Supports $compute
[SelectSupport](Org.OData.Capabilities.V1.xml#L319)|[SelectSupportType](#SelectSupportType)|<a name="SelectSupport"></a>Support for $select and nested query options within $select
[BatchSupported](Org.OData.Capabilities.V1.xml#L355)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchSupported"></a>Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.
[BatchSupport](Org.OData.Capabilities.V1.xml#L359)|[BatchSupportType?](#BatchSupportType)|<a name="BatchSupport"></a>Batch Support for the service
[FilterFunctions](Org.OData.Capabilities.V1.xml#L405)|\[String\]|<a name="FilterFunctions"></a>List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L410)|[FilterRestrictionsType?](#FilterRestrictionsType)|<a name="FilterRestrictions"></a>Restrictions on filter expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L479)|[SortRestrictionsType?](#SortRestrictionsType)|<a name="SortRestrictions"></a>Restrictions on orderby expressions
[ExpandRestrictions](Org.OData.Capabilities.V1.xml#L502)|[ExpandRestrictionsType?](#ExpandRestrictionsType)|<a name="ExpandRestrictions"></a>Restrictions on expand expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L529)|[SearchRestrictionsType?](#SearchRestrictionsType)|<a name="SearchRestrictions"></a>Restrictions on search expressions
[KeyAsSegmentSupported](Org.OData.Capabilities.V1.xml#L566)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="KeyAsSegmentSupported"></a>Supports [key-as-segment convention](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_KeyasSegmentConvention) for addressing entities within a collection
[QuerySegmentSupported](Org.OData.Capabilities.V1.xml#L570)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="QuerySegmentSupported"></a>Supports [passing query options in the request body](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_PassingQueryOptionsintheRequestBody)
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L576)|[InsertRestrictionsType?](#InsertRestrictionsType)|<a name="InsertRestrictions"></a>Restrictions on insert operations
[DeepInsertSupport](Org.OData.Capabilities.V1.xml#L650)|[DeepInsertSupportType?](#DeepInsertSupportType)|<a name="DeepInsertSupport"></a>Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L662)|[UpdateRestrictionsType?](#UpdateRestrictionsType)|<a name="UpdateRestrictions"></a>Restrictions on update operations
[DeepUpdateSupport](Org.OData.Capabilities.V1.xml#L743)|[DeepUpdateSupportType?](#DeepUpdateSupportType)|<a name="DeepUpdateSupport"></a>Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L755)|[DeleteRestrictionsType?](#DeleteRestrictionsType)|<a name="DeleteRestrictions"></a>Restrictions on delete operations
[CollectionPropertyRestrictions](Org.OData.Capabilities.V1.xml#L794)|\[[CollectionPropertyRestrictionsType](#CollectionPropertyRestrictionsType)\]|<a name="CollectionPropertyRestrictions"></a>Describes restrictions on operations applied to collection-valued structural properties
[OperationRestrictions](Org.OData.Capabilities.V1.xml#L835)|[OperationRestrictionsType](#OperationRestrictionsType)|<a name="OperationRestrictions"></a>Restrictions for function or action operation
[AnnotationValuesInQuerySupported](Org.OData.Capabilities.V1.xml#L852)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AnnotationValuesInQuerySupported"></a>Supports annotation values within system query options
[ModificationQueryOptions](Org.OData.Capabilities.V1.xml#L856)|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|<a name="ModificationQueryOptions"></a>Support for query options with modification requests (insert, update, action invocation)
[ReadRestrictions](Org.OData.Capabilities.V1.xml#L880)|[ReadRestrictionsType?](#ReadRestrictionsType)|<a name="ReadRestrictions"></a>Restrictions for retrieving a collection of entities, retrieving a singleton instance.
[CustomHeaders](Org.OData.Capabilities.V1.xml#L915)|\[[CustomParameter](#CustomParameter)\]|<a name="CustomHeaders"></a>Custom headers that are supported/required for the annotated resource ([Example](Org.OData.Capabilities.V1.xml#L917))
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L941)|\[[CustomParameter](#CustomParameter)\]|<a name="CustomQueryOptions"></a>Custom query options that are supported/required for the annotated resource ([Example](Org.OData.Capabilities.V1.xml#L944))<br>If the entity container is annotated, the query option is supported/required by all resources in that container.
[MediaLocationUpdateSupported](Org.OData.Capabilities.V1.xml#L993)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="MediaLocationUpdateSupported"></a>Stream property supports update of its media edit URL and/or media read URL

## <a name="ConformanceLevelType"></a>[ConformanceLevelType](Org.OData.Capabilities.V1.xml#L118)


Member|Value|Description
:-----|----:|:----------
[Minimal](Org.OData.Capabilities.V1.xml#L119)|0|Minimal conformance level
[Intermediate](Org.OData.Capabilities.V1.xml#L122)|1|Intermediate conformance level
[Advanced](Org.OData.Capabilities.V1.xml#L125)|2|Advanced conformance level

## <a name="IsolationLevel"></a>[IsolationLevel](Org.OData.Capabilities.V1.xml#L159)


Flag Member|Value|Description
:-----|----:|:----------
[Snapshot](Org.OData.Capabilities.V1.xml#L160)|1|All data returned for a request, including multiple requests within a batch or results retrieved across multiple pages, will be consistent as of a single point in time

## <a name="CallbackType"></a>[CallbackType](Org.OData.Capabilities.V1.xml#L172)
A non-empty collection lists the full set of supported protocols. A empty collection means 'only HTTP is supported'

Property|Type|Description
:-------|:---|:----------
[CallbackProtocols](Org.OData.Capabilities.V1.xml#L173)|\[[CallbackProtocol](#CallbackProtocol)\]|List of supported callback protocols, e.g. `http` or `wss`

## <a name="CallbackProtocol"></a>[CallbackProtocol](Org.OData.Capabilities.V1.xml#L178)


Property|Type|Description
:-------|:---|:----------
[Id](Org.OData.Capabilities.V1.xml#L179)|String?|Protocol Identifier
[UrlTemplate](Org.OData.Capabilities.V1.xml#L182)|String?|URL Template including parameters. Parameters are enclosed in curly braces {} as defined in RFC6570
[DocumentationUrl](Org.OData.Capabilities.V1.xml#L185)|URL?|Human readable description of the meaning of the URL Template parameters

## <a name="ChangeTrackingType"></a>[ChangeTrackingType](Org.OData.Capabilities.V1.xml#L194)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L195)|Boolean|This entity set supports the odata.track-changes preference
[FilterableProperties](Org.OData.Capabilities.V1.xml#L198)|\[PropertyPath\]|Change tracking supports filters on these properties<br>If no properties are specified or FilterableProperties is omitted, clients cannot assume support for filtering on any properties in combination with change tracking.
[ExpandableProperties](Org.OData.Capabilities.V1.xml#L202)|\[NavigationPropertyPath\]|Change tracking supports these properties expanded<br>If no properties are specified or ExpandableProperties is omitted, clients cannot assume support for expanding any properties in combination with change tracking.

## <a name="CountRestrictionsType"></a>[CountRestrictionsType](Org.OData.Capabilities.V1.xml#L213)


Property|Type|Description
:-------|:---|:----------
[Countable](Org.OData.Capabilities.V1.xml#L214)|Boolean|Entities can be counted (only valid if targeting an entity set)
[NonCountableProperties](Org.OData.Capabilities.V1.xml#L217)|\[PropertyPath\]|Members of these collection properties cannot be counted
[NonCountableNavigationProperties](Org.OData.Capabilities.V1.xml#L220)|\[NavigationPropertyPath\]|Members of these navigation properties cannot be counted

## <a name="NavigationRestrictionsType"></a>[NavigationRestrictionsType](Org.OData.Capabilities.V1.xml#L229)


Property|Type|Description
:-------|:---|:----------
[Navigability](Org.OData.Capabilities.V1.xml#L230)|[NavigationType?](#NavigationType)|Default navigability for all navigation properties of the annotation target. Individual navigation properties can override this value via `RestrictedProperties/Navigability`.
[RestrictedProperties](Org.OData.Capabilities.V1.xml#L233)|\[[NavigationPropertyRestriction](#NavigationPropertyRestriction)\]|List of navigation properties with restrictions

## <a name="NavigationPropertyRestriction"></a>[NavigationPropertyRestriction](Org.OData.Capabilities.V1.xml#L237)


Property|Type|Description
:-------|:---|:----------
[NavigationProperty](Org.OData.Capabilities.V1.xml#L238)|NavigationPropertyPath?|Navigation properties can be navigated
[Navigability](Org.OData.Capabilities.V1.xml#L241)|[NavigationType?](#NavigationType)|Supported navigability of this navigation property
[FilterFunctions](Org.OData.Capabilities.V1.xml#L244)|\[String\]|List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L248)|[FilterRestrictionsType?](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L251)|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L254)|[SortRestrictionsType?](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](Org.OData.Capabilities.V1.xml#L257)|Boolean|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L260)|Boolean|Supports $skip
[SelectSupport](Org.OData.Capabilities.V1.xml#L263)|[SelectSupportType?](#SelectSupportType)|Support for $select
[IndexableByKey](Org.OData.Capabilities.V1.xml#L266)|Boolean|Supports key values according to OData URL conventions
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L269)|[InsertRestrictionsType?](#InsertRestrictionsType)|Restrictions on insert operations
[DeepInsertSupport](Org.OData.Capabilities.V1.xml#L272)|[DeepInsertSupportType?](#DeepInsertSupportType)|Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L275)|[UpdateRestrictionsType?](#UpdateRestrictionsType)|Restrictions on update operations
[DeepUpdateSupport](Org.OData.Capabilities.V1.xml#L278)|[DeepUpdateSupportType?](#DeepUpdateSupportType)|Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L281)|[DeleteRestrictionsType?](#DeleteRestrictionsType)|Restrictions on delete operations
[OptimisticConcurrencyControl](Org.OData.Capabilities.V1.xml#L284)|Boolean|Data modification (including insert) along this navigation property requires the use of ETags
[ReadRestrictions](Org.OData.Capabilities.V1.xml#L287)|[ReadRestrictionsType?](#ReadRestrictionsType)|Restrictions for retrieving entities

## <a name="NavigationType"></a>[NavigationType](Org.OData.Capabilities.V1.xml#L291)


Member|Value|Description
:-----|----:|:----------
[Recursive](Org.OData.Capabilities.V1.xml#L292)|0|Navigation properties can be recursively navigated
[Single](Org.OData.Capabilities.V1.xml#L295)|1|Navigation properties can be navigated to a single level
[None](Org.OData.Capabilities.V1.xml#L298)|2|Navigation properties are not navigable

## <a name="SelectSupportType"></a>[SelectSupportType](Org.OData.Capabilities.V1.xml#L322)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L323)|Boolean|Supports $select
[InstanceAnnotationsSupported](Org.OData.Capabilities.V1.xml#L326)|Boolean|Supports instance annotations in $select list
[Expandable](Org.OData.Capabilities.V1.xml#L329)|Boolean|$expand within $select is supported
[Filterable](Org.OData.Capabilities.V1.xml#L332)|Boolean|$filter within $select is supported
[Searchable](Org.OData.Capabilities.V1.xml#L335)|Boolean|$search within $select is supported
[TopSupported](Org.OData.Capabilities.V1.xml#L338)|Boolean|$top within $select is supported
[SkipSupported](Org.OData.Capabilities.V1.xml#L341)|Boolean|$skip within $select is supported
[ComputeSupported](Org.OData.Capabilities.V1.xml#L344)|Boolean|$compute within $select is supported
[Countable](Org.OData.Capabilities.V1.xml#L347)|Boolean|$count within $select is supported
[Sortable](Org.OData.Capabilities.V1.xml#L350)|Boolean|$orderby within $select is supported

## <a name="BatchSupportType"></a>[BatchSupportType](Org.OData.Capabilities.V1.xml#L362)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L369)|Boolean|Service supports requests to $batch
[ContinueOnErrorSupported](Org.OData.Capabilities.V1.xml#L372)|Boolean|Service supports the continue on error preference
[ReferencesInRequestBodiesSupported](Org.OData.Capabilities.V1.xml#L375)|Boolean|Service supports Content-ID referencing in request bodies
[ReferencesAcrossChangeSetsSupported](Org.OData.Capabilities.V1.xml#L378)|Boolean|Service supports Content-ID referencing across change sets
[EtagReferencesSupported](Org.OData.Capabilities.V1.xml#L381)|Boolean|Service supports referencing Etags from previous requests
[RequestDependencyConditionsSupported](Org.OData.Capabilities.V1.xml#L384)|Boolean|Service supports the `if` member in JSON batch requests
[SupportedFormats](Org.OData.Capabilities.V1.xml#L387)|\[MediaType\]|Media types of supported formats for $batch

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)
- [LongDescription](Org.OData.Core.V1.md#LongDescription)

## <a name="FilterRestrictionsType"></a>[FilterRestrictionsType](Org.OData.Capabilities.V1.xml#L413)


Property|Type|Description
:-------|:---|:----------
[Filterable](Org.OData.Capabilities.V1.xml#L419)|Boolean|$filter is supported
[RequiresFilter](Org.OData.Capabilities.V1.xml#L422)|Boolean|$filter is required
[RequiredProperties](Org.OData.Capabilities.V1.xml#L425)|\[PropertyPath\]|These properties must be specified in the $filter clause (properties of derived types are not allowed here)
[NonFilterableProperties](Org.OData.Capabilities.V1.xml#L428)|\[PropertyPath\]|These structural properties cannot be used in filter expressions
[FilterExpressionRestrictions](Org.OData.Capabilities.V1.xml#L431)|\[[FilterExpressionRestrictionType](#FilterExpressionRestrictionType)\]|These properties only allow a subset of filter expressions. A valid filter expression for a single property can be enclosed in parentheses and combined by `and` with valid expressions for other properties.
[MaxLevels](Org.OData.Capabilities.V1.xml#L434)|Int32|The maximum number of levels (including recursion) that can be traversed in a filter expression. A value of -1 indicates there is no restriction.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

## <a name="FilterExpressionRestrictionType"></a>[FilterExpressionRestrictionType](Org.OData.Capabilities.V1.xml#L438)


Property|Type|Description
:-------|:---|:----------
[Property](Org.OData.Capabilities.V1.xml#L439)|PropertyPath?|Path to the restricted property
[AllowedExpressions](Org.OData.Capabilities.V1.xml#L442)|[FilterExpressionType?](#FilterExpressionType)|Allowed subset of expressions

## <a name="FilterExpressionType"></a>[FilterExpressionType](Org.OData.Capabilities.V1.xml#L446)
**Type:** String



Allowed Value|Description
:------------|:----------
[SingleValue](Org.OData.Capabilities.V1.xml#L449)|Property can be used in a single `eq` clause
[MultiValue](Org.OData.Capabilities.V1.xml#L453)|Property can be used in multiple `eq` and `in` clauses, combined by `or` (which is logically equivalent to a single `in` clause)
[SingleRange](Org.OData.Capabilities.V1.xml#L457)|Property can be used in at most one `ge` and/or one `le` clause, separated by `and`
[MultiRange](Org.OData.Capabilities.V1.xml#L461)|Property can be compared to a union of one or more closed, half-open, or open intervals<br>The filter expression for this property consists of one or more interval expressions combined by `or`. A single interval expression is either a single comparison of the property and a literal value with `eq`, `le`, `lt`, `ge`, or `gt`, or pair of boundaries combined by `and` and enclosed in parentheses. The lower boundary is either `ge` or `gt`, the upper boundary either `le` or `lt`.
[SearchExpression](Org.OData.Capabilities.V1.xml#L466)|String property can be used as first operand in `startswith`, `endswith`, and `contains` clauses
[MultiRangeOrSearchExpression](Org.OData.Capabilities.V1.xml#L470)|Property can be compared to a union of zero or more closed, half-open, or open intervals plus zero or more simple string patterns<br>The filter expression for this property consists of one or more interval expressions or string comparison functions combined by `or`. See MultiRange for a definition of an interval expression. See SearchExpression for the allowed string comparison functions.

## <a name="SortRestrictionsType"></a>[SortRestrictionsType](Org.OData.Capabilities.V1.xml#L482)


Property|Type|Description
:-------|:---|:----------
[Sortable](Org.OData.Capabilities.V1.xml#L488)|Boolean|$orderby is supported
[AscendingOnlyProperties](Org.OData.Capabilities.V1.xml#L491)|\[PropertyPath\]|These properties can only be used for sorting in Ascending order
[DescendingOnlyProperties](Org.OData.Capabilities.V1.xml#L494)|\[PropertyPath\]|These properties can only be used for sorting in Descending order
[NonSortableProperties](Org.OData.Capabilities.V1.xml#L497)|\[PropertyPath\]|These structural properties cannot be used in orderby expressions

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

## <a name="ExpandRestrictionsType"></a>[ExpandRestrictionsType](Org.OData.Capabilities.V1.xml#L505)


Property|Type|Description
:-------|:---|:----------
[Expandable](Org.OData.Capabilities.V1.xml#L511)|Boolean|$expand is supported
[StreamsExpandable](Org.OData.Capabilities.V1.xml#L514)|Boolean|$expand is supported for stream properties and media resources
[NonExpandableProperties](Org.OData.Capabilities.V1.xml#L517)|\[NavigationPropertyPath\]|These properties cannot be used in expand expressions
[NonExpandableStreamProperties](Org.OData.Capabilities.V1.xml#L520)|\[PropertyPath\]|These stream properties cannot be used in expand expressions
[MaxLevels](Org.OData.Capabilities.V1.xml#L524)|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

## <a name="SearchRestrictionsType"></a>[SearchRestrictionsType](Org.OData.Capabilities.V1.xml#L532)


Property|Type|Description
:-------|:---|:----------
[Searchable](Org.OData.Capabilities.V1.xml#L538)|Boolean|$search is supported
[UnsupportedExpressions](Org.OData.Capabilities.V1.xml#L541)|[SearchExpressions](#SearchExpressions)|Expressions not supported in $search

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

## <a name="SearchExpressions"></a>[SearchExpressions](Org.OData.Capabilities.V1.xml#L545)


Flag Member|Value|Description
:-----|----:|:----------
[none](Org.OData.Capabilities.V1.xml#L546)|0|Single search term
[AND](Org.OData.Capabilities.V1.xml#L549)|1|Multiple search terms separated by `AND`
[OR](Org.OData.Capabilities.V1.xml#L552)|2|Multiple search terms separated by `OR`
[NOT](Org.OData.Capabilities.V1.xml#L555)|4|Search terms preceded by `NOT`
[phrase](Org.OData.Capabilities.V1.xml#L558)|8|Search phrases enclosed in double quotes
[group](Org.OData.Capabilities.V1.xml#L561)|16|Precedence grouping of search expressions with parentheses

## <a name="InsertRestrictionsType"></a>[InsertRestrictionsType](Org.OData.Capabilities.V1.xml#L580)


Property|Type|Description
:-------|:---|:----------
[Insertable](Org.OData.Capabilities.V1.xml#L581)|Boolean|Entities can be inserted
[NonInsertableProperties](Org.OData.Capabilities.V1.xml#L584)|\[PropertyPath\]|These structural properties cannot be specified on insert
[NonInsertableNavigationProperties](Org.OData.Capabilities.V1.xml#L587)|\[NavigationPropertyPath\]|These navigation properties do not allow deep inserts
[RequiredProperties](Org.OData.Capabilities.V1.xml#L590)|\[PropertyPath\]|These structural properties must be specified on insert
[MaxLevels](Org.OData.Capabilities.V1.xml#L593)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to insert into. A value of -1 indicates there is no restriction.
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L596)|Boolean|Entities of a specific derived type can be created by specifying a type-cast segment
[Permissions](Org.OData.Capabilities.V1.xml#L599)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the insert.
[QueryOptions](Org.OData.Capabilities.V1.xml#L602)|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with insert requests
[CustomHeaders](Org.OData.Capabilities.V1.xml#L605)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L608)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](Org.OData.Capabilities.V1.xml#L611)|String?|A brief description of the request
[LongDescription](Org.OData.Capabilities.V1.xml#L615)|String?|A lengthy description of the request

## <a name="PermissionType"></a>[PermissionType](Org.OData.Capabilities.V1.xml#L621)


Property|Type|Description
:-------|:---|:----------
[SchemeName](Org.OData.Capabilities.V1.xml#L622)|[SchemeName](Org.OData.Authorization.V1.md#SchemeName)|Authorization flow scheme name
[Scopes](Org.OData.Capabilities.V1.xml#L625)|\[[ScopeType](#ScopeType)\]|List of scopes that can provide access to the resource

## <a name="ScopeType"></a>[ScopeType](Org.OData.Capabilities.V1.xml#L630)


Property|Type|Description
:-------|:---|:----------
[Scope](Org.OData.Capabilities.V1.xml#L631)|String|Name of the scope.
[RestrictedProperties](Org.OData.Capabilities.V1.xml#L634)|String?|Comma-separated string value of all properties that will be included or excluded when using the scope.<br>Possible string value identifiers when specifying properties are `*`, _PropertyName_, `-`_PropertyName_.<br/>`*` denotes all properties are accessible.<br/>`-`_PropertyName_ excludes that specific property.<br/>_PropertyName_ explicitly provides access to the specific property.<br/>The absence of `RestrictedProperties` denotes all properties are accessible using that scope.

## <a name="DeepInsertSupportType"></a>[DeepInsertSupportType](Org.OData.Capabilities.V1.xml#L653)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L654)|Boolean|Annotation target supports deep inserts
[ContentIDSupported](Org.OData.Capabilities.V1.xml#L657)|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

## <a name="UpdateRestrictionsType"></a>[UpdateRestrictionsType](Org.OData.Capabilities.V1.xml#L666)


Property|Type|Description
:-------|:---|:----------
[Updatable](Org.OData.Capabilities.V1.xml#L667)|Boolean|Entities can be updated
[Upsertable](Org.OData.Capabilities.V1.xml#L670)|Boolean|Entities can be upserted
[DeltaUpdateSupported](Org.OData.Capabilities.V1.xml#L673)|Boolean|Entities can be inserted, updated, and deleted via a PATCH request with a delta payload
[UpdateMethod](Org.OData.Capabilities.V1.xml#L676)|[HttpMethod?](#HttpMethod)|Supported HTTP Methods (PUT or PATCH) for updating an entity. If null, PATCH SHOULD be supported and PUT MAY be supported.
[FilterSegmentSupported](Org.OData.Capabilities.V1.xml#L679)|Boolean|Members of collections can be updated via a PATCH request with a `/$filter(...)/$each` segment
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L682)|Boolean|Members of collections can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[NonUpdatableProperties](Org.OData.Capabilities.V1.xml#L685)|\[PropertyPath\]|These structural properties cannot be specified on update
[NonUpdatableNavigationProperties](Org.OData.Capabilities.V1.xml#L688)|\[NavigationPropertyPath\]|These navigation properties do not allow rebinding
[RequiredProperties](Org.OData.Capabilities.V1.xml#L691)|\[PropertyPath\]|These structural properties must be specified on update
[MaxLevels](Org.OData.Capabilities.V1.xml#L694)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection or entity to update. A value of -1 indicates there is no restriction.
[Permissions](Org.OData.Capabilities.V1.xml#L697)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the update.
[QueryOptions](Org.OData.Capabilities.V1.xml#L700)|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with update requests
[CustomHeaders](Org.OData.Capabilities.V1.xml#L703)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L706)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](Org.OData.Capabilities.V1.xml#L709)|String?|A brief description of the request
[LongDescription](Org.OData.Capabilities.V1.xml#L713)|String?|A lengthy description of the request

## <a name="HttpMethod"></a>[HttpMethod](Org.OData.Capabilities.V1.xml#L719)


Flag Member|Value|Description
:-----|----:|:----------
[GET](Org.OData.Capabilities.V1.xml#L720)|1|The HTTP GET Method
[PATCH](Org.OData.Capabilities.V1.xml#L723)|2|The HTTP PATCH Method
[PUT](Org.OData.Capabilities.V1.xml#L726)|4|The HTTP PUT Method
[POST](Org.OData.Capabilities.V1.xml#L729)|8|The HTTP POST Method
[DELETE](Org.OData.Capabilities.V1.xml#L732)|16|The HTTP DELETE Method
[OPTIONS](Org.OData.Capabilities.V1.xml#L735)|32|The HTTP OPTIONS Method
[HEAD](Org.OData.Capabilities.V1.xml#L738)|64|The HTTP HEAD Method

## <a name="DeepUpdateSupportType"></a>[DeepUpdateSupportType](Org.OData.Capabilities.V1.xml#L746)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L747)|Boolean|Annotation target supports deep updates
[ContentIDSupported](Org.OData.Capabilities.V1.xml#L750)|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

## <a name="DeleteRestrictionsType"></a>[DeleteRestrictionsType](Org.OData.Capabilities.V1.xml#L759)


Property|Type|Description
:-------|:---|:----------
[Deletable](Org.OData.Capabilities.V1.xml#L760)|Boolean|Entities can be deleted
[NonDeletableNavigationProperties](Org.OData.Capabilities.V1.xml#L763)|\[NavigationPropertyPath\]|These navigation properties do not allow DeleteLink requests
[MaxLevels](Org.OData.Capabilities.V1.xml#L766)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to delete from or the entity to delete. A value of -1 indicates there is no restriction.
[FilterSegmentSupported](Org.OData.Capabilities.V1.xml#L769)|Boolean|Members of collections can be updated via a PATCH request with a `/$filter(...)/$each` segment
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L772)|Boolean|Members of collections can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[Permissions](Org.OData.Capabilities.V1.xml#L775)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the delete.
[CustomHeaders](Org.OData.Capabilities.V1.xml#L778)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L781)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](Org.OData.Capabilities.V1.xml#L784)|String?|A brief description of the request
[LongDescription](Org.OData.Capabilities.V1.xml#L788)|String?|A lengthy description of the request

## <a name="CollectionPropertyRestrictionsType"></a>[CollectionPropertyRestrictionsType](Org.OData.Capabilities.V1.xml#L797)


Property|Type|Description
:-------|:---|:----------
[CollectionProperty](Org.OData.Capabilities.V1.xml#L798)|PropertyPath?|Restricted Collection-valued property
[FilterFunctions](Org.OData.Capabilities.V1.xml#L801)|\[String\]|List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L805)|[FilterRestrictionsType?](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L808)|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L811)|[SortRestrictionsType?](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](Org.OData.Capabilities.V1.xml#L814)|Boolean|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L817)|Boolean|Supports $skip
[SelectSupport](Org.OData.Capabilities.V1.xml#L820)|[SelectSupportType?](#SelectSupportType)|Support for $select
[Insertable](Org.OData.Capabilities.V1.xml#L823)|Boolean|Members can be inserted into this collection<br>If additionally annotated with [Core.PositionalInsert](Org.OData.Core.V1.md#PositionalInsert), members can be inserted at a specific position
[Updatable](Org.OData.Capabilities.V1.xml#L827)|Boolean|Members of this ordered collection can be updated by ordinal
[Deletable](Org.OData.Capabilities.V1.xml#L830)|Boolean|Members of this ordered collection can be deleted by ordinal

## <a name="OperationRestrictionsType"></a>[OperationRestrictionsType](Org.OData.Capabilities.V1.xml#L838)


Property|Type|Description
:-------|:---|:----------
[FilterSegmentSupported](Org.OData.Capabilities.V1.xml#L839)|Boolean|Bound action or function can be invoked on a collection-valued binding parameter path with a `/$filter(...)` segment
[Permissions](Org.OData.Capabilities.V1.xml#L842)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to invoke an action or function
[CustomHeaders](Org.OData.Capabilities.V1.xml#L845)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L848)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options

## <a name="ModificationQueryOptionsType"></a>[ModificationQueryOptionsType](Org.OData.Capabilities.V1.xml#L859)


Property|Type|Description
:-------|:---|:----------
[ExpandSupported](Org.OData.Capabilities.V1.xml#L860)|Boolean|Supports $expand with modification requests
[SelectSupported](Org.OData.Capabilities.V1.xml#L863)|Boolean|Supports $select with modification requests
[ComputeSupported](Org.OData.Capabilities.V1.xml#L866)|Boolean|Supports $compute with modification requests
[FilterSupported](Org.OData.Capabilities.V1.xml#L869)|Boolean|Supports $filter with modification requests
[SearchSupported](Org.OData.Capabilities.V1.xml#L872)|Boolean|Supports $search with modification requests
[SortSupported](Org.OData.Capabilities.V1.xml#L875)|Boolean|Supports $orderby with modification requests

## <a name="ReadRestrictionsBase"></a>[*ReadRestrictionsBase*](Org.OData.Capabilities.V1.xml#L883)


**Derived Types:**
- [ReadByKeyRestrictionsType](#ReadByKeyRestrictionsType)
- [ReadRestrictionsType](#ReadRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Readable](Org.OData.Capabilities.V1.xml#L884)|Boolean|Entities can be retrieved
[Permissions](Org.OData.Capabilities.V1.xml#L887)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[CustomHeaders](Org.OData.Capabilities.V1.xml#L890)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L893)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](Org.OData.Capabilities.V1.xml#L896)|String?|A brief description of the request
[LongDescription](Org.OData.Capabilities.V1.xml#L900)|String?|A lengthy description of the request

## <a name="ReadByKeyRestrictionsType"></a>[ReadByKeyRestrictionsType](Org.OData.Capabilities.V1.xml#L905): [ReadRestrictionsBase](#ReadRestrictionsBase)
Restrictions for retrieving an entity by key

Property|Type|Description
:-------|:---|:----------
[*Readable*](Org.OData.Capabilities.V1.xml#L884)|Boolean|Entities can be retrieved
[*Permissions*](Org.OData.Capabilities.V1.xml#L887)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L890)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L893)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L896)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L900)|String?|A lengthy description of the request

## <a name="ReadRestrictionsType"></a>[ReadRestrictionsType](Org.OData.Capabilities.V1.xml#L908): [ReadRestrictionsBase](#ReadRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Readable*](Org.OData.Capabilities.V1.xml#L884)|Boolean|Entities can be retrieved
[*Permissions*](Org.OData.Capabilities.V1.xml#L887)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L890)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L893)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L896)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L900)|String?|A lengthy description of the request
[ReadByKeyRestrictions](Org.OData.Capabilities.V1.xml#L909)|[ReadByKeyRestrictionsType?](#ReadByKeyRestrictionsType)|Restrictions for retrieving an entity by key<br>Only valid when applied to a collection. If a property of `ReadByKeyRestrictions` is not specified, the corresponding property value of `ReadRestrictions` applies.

## <a name="CustomParameter"></a>[CustomParameter](Org.OData.Capabilities.V1.xml#L972)
A custom parameter is either a header or a query option

The type of a custom parameter is always a string. Restrictions on the parameter values can be expressed by annotating the record expression describing the parameter with terms from the Validation vocabulary, e.g. Validation.Pattern or Validation.AllowedValues.

Property|Type|Description
:-------|:---|:----------
[Name](Org.OData.Capabilities.V1.xml#L975)|String|Name of the custom parameter
[Description](Org.OData.Capabilities.V1.xml#L978)|String?|Description of the custom parameter
[DocumentationURL](Org.OData.Capabilities.V1.xml#L981)|URL?|URL of related documentation
[Required](Org.OData.Capabilities.V1.xml#L985)|Boolean|true: parameter is required, false or not specified: parameter is optional
[ExampleValues](Org.OData.Capabilities.V1.xml#L988)|\[[PrimitiveExampleValue](Org.OData.Core.V1.md#PrimitiveExampleValue)\]|Example values for the custom parameter
