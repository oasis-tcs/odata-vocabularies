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
[ConformanceLevel](Org.OData.Capabilities.V1.xml#L118)|[ConformanceLevelType](#ConformanceLevelType)|<a name="ConformanceLevel"></a>The conformance level achieved by this service
[SupportedFormats](Org.OData.Capabilities.V1.xml#L135)|\[MediaType\]|<a name="SupportedFormats"></a>Media types of supported formats, including format parameters
[SupportedMetadataFormats](Org.OData.Capabilities.V1.xml#L140)|\[MediaType\]|<a name="SupportedMetadataFormats"></a>Media types of supported formats for $metadata, including format parameters
[AcceptableEncodings](Org.OData.Capabilities.V1.xml#L145)|\[String\]|<a name="AcceptableEncodings"></a>List of acceptable compression methods for ($batch) requests, e.g. gzip
[AsynchronousRequestsSupported](Org.OData.Capabilities.V1.xml#L151)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AsynchronousRequestsSupported"></a>Service supports the asynchronous request preference
[BatchContinueOnErrorSupported](Org.OData.Capabilities.V1.xml#L155)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchContinueOnErrorSupported"></a>Service supports the continue on error preference. Supports $batch requests. Services that apply the BatchContinueOnErrorSupported term should also specify the ContinueOnErrorSupported property from the BatchSupport term.
[IsolationSupported](Org.OData.Capabilities.V1.xml#L160)|[IsolationLevel](#IsolationLevel)|<a name="IsolationSupported"></a>Supported odata.isolation levels
[CrossJoinSupported](Org.OData.Capabilities.V1.xml#L170)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="CrossJoinSupported"></a>Supports cross joins for the entity sets in this container
[CallbackSupported](Org.OData.Capabilities.V1.xml#L174)|[CallbackType](#CallbackType)|<a name="CallbackSupported"></a>Supports callbacks for the specified protocols
[ChangeTracking](Org.OData.Capabilities.V1.xml#L200)|[ChangeTrackingType](#ChangeTrackingType)|<a name="ChangeTracking"></a>Change tracking capabilities of this service or entity set
[CountRestrictions](Org.OData.Capabilities.V1.xml#L221)|[CountRestrictionsType](#CountRestrictionsType)|<a name="CountRestrictions"></a>Restrictions on /$count path suffix and $count=true system query option
[NavigationRestrictions](Org.OData.Capabilities.V1.xml#L236)|[NavigationRestrictionsType](#NavigationRestrictionsType)|<a name="NavigationRestrictions"></a>Restrictions on navigating properties according to OData URL conventions<p>Restrictions specified on an entity set are valid whether the request is directly to the entity set or through a navigation property bound to that entity set. Services can specify a different set of restrictions specific to a path, in which case the more specific restrictions take precedence.</p>
[IndexableByKey](Org.OData.Capabilities.V1.xml#L319)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="IndexableByKey"></a>Supports key values according to OData URL conventions
[TopSupported](Org.OData.Capabilities.V1.xml#L323)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="TopSupported"></a>Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L327)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="SkipSupported"></a>Supports $skip
[ComputeSupported](Org.OData.Capabilities.V1.xml#L331)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="ComputeSupported"></a>Supports $compute
[SelectSupport](Org.OData.Capabilities.V1.xml#L335)|[SelectSupportType](#SelectSupportType)|<a name="SelectSupport"></a>Support for $select and nested query options within $select
[BatchSupported](Org.OData.Capabilities.V1.xml#L368)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchSupported"></a>Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.
[BatchSupport](Org.OData.Capabilities.V1.xml#L373)|[BatchSupportType](#BatchSupportType)|<a name="BatchSupport"></a>Batch Support for the service
[FilterFunctions](Org.OData.Capabilities.V1.xml#L415)|\[String\]|<a name="FilterFunctions"></a>List of functions and operators supported in filter expressions<p>If not specified, null, or empty, all functions and operators may be attempted.</p>
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L421)|[FilterRestrictionsType](#FilterRestrictionsType)|<a name="FilterRestrictions"></a>Restrictions on filter expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L496)|[SortRestrictionsType](#SortRestrictionsType)|<a name="SortRestrictions"></a>Restrictions on orderby expressions
[ExpandRestrictions](Org.OData.Capabilities.V1.xml#L514)|[ExpandRestrictionsType](#ExpandRestrictionsType)|<a name="ExpandRestrictions"></a>Restrictions on expand expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L533)|[SearchRestrictionsType](#SearchRestrictionsType)|<a name="SearchRestrictions"></a>Restrictions on search expressions
[KeyAsSegmentSupported](Org.OData.Capabilities.V1.xml#L565)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="KeyAsSegmentSupported"></a>Supports [key-as-segment convention](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_KeyasSegmentConvention) for addressing entities within a collection
[RelaxedSystemQueryOptionNamesSupported](Org.OData.Capabilities.V1.xml#L572)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="RelaxedSystemQueryOptionNamesSupported"></a>Supports [system query options](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_SystemQueryOptions) case-insensitive and with or without the `$` prefix
[QuerySegmentSupported](Org.OData.Capabilities.V1.xml#L577)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="QuerySegmentSupported"></a>Supports [passing query options in the request body](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_PassingQueryOptionsintheRequestBody)
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L584)|[InsertRestrictionsType](#InsertRestrictionsType)|<a name="InsertRestrictions"></a>Restrictions on insert operations
[DeepInsertSupport](Org.OData.Capabilities.V1.xml#L649)|[DeepInsertSupportType](#DeepInsertSupportType)|<a name="DeepInsertSupport"></a>Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L663)|[UpdateRestrictionsType](#UpdateRestrictionsType)|<a name="UpdateRestrictions"></a>Restrictions on update operations
[DeepUpdateSupport](Org.OData.Capabilities.V1.xml#L715)|[DeepUpdateSupportType](#DeepUpdateSupportType)|<a name="DeepUpdateSupport"></a>Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L729)|[DeleteRestrictionsType](#DeleteRestrictionsType)|<a name="DeleteRestrictions"></a>Restrictions on delete operations
[CollectionPropertyRestrictions](Org.OData.Capabilities.V1.xml#L764)|\[[CollectionPropertyRestrictionsType](#CollectionPropertyRestrictionsType)\]|<a name="CollectionPropertyRestrictions"></a>Describes restrictions on operations applied to collection-valued structural properties
[OperationRestrictions](Org.OData.Capabilities.V1.xml#L810)|\[[OperationRestriction](#OperationRestriction)\]|<a name="OperationRestrictions"></a>Restrictions for function or action operation
[AnnotationValuesInQuerySupported](Org.OData.Capabilities.V1.xml#L828)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AnnotationValuesInQuerySupported"></a>Supports annotation values within system query options
[ModificationQueryOptions](Org.OData.Capabilities.V1.xml#L834)|[ModificationQueryOptionsType](#ModificationQueryOptionsType)|<a name="ModificationQueryOptions"></a>Support for query options with modification requests (insert, update, action invocation)
[ReadRestrictions](Org.OData.Capabilities.V1.xml#L859)|[ReadRestrictionsType](#ReadRestrictionsType)|<a name="ReadRestrictions"></a>Restrictions for retrieving a collection of entities, retrieving a singleton instance, invoking a function
[CustomHeaders](Org.OData.Capabilities.V1.xml#L888)|\[[CustomParameter](#CustomParameter)\]|<a name="CustomHeaders"></a>Custom headers that are supported/required for the annotated resource ([Example](Org.OData.Capabilities.V1.xml#L890))
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L916)|\[[CustomParameter](#CustomParameter)\]|<a name="CustomQueryOptions"></a>Custom query options that are supported/required for the annotated resource ([Example](Org.OData.Capabilities.V1.xml#L920))<p>If the entity container is annotated, the query option is supported/required by all resources in that container.</p>
[MediaLocationUpdateSupported](Org.OData.Capabilities.V1.xml#L973)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="MediaLocationUpdateSupported"></a>Stream property supports update of its media edit URL and/or media read URL

## <a name="ConformanceLevelType"></a>[ConformanceLevelType](Org.OData.Capabilities.V1.xml#L121)


Member|Value|Description
:-----|----:|:----------
[Minimal](Org.OData.Capabilities.V1.xml#L122)|0|Minimal conformance level
[Intermediate](Org.OData.Capabilities.V1.xml#L125)|1|Intermediate conformance level
[Advanced](Org.OData.Capabilities.V1.xml#L128)|2|Advanced conformance level

## <a name="IsolationLevel"></a>[IsolationLevel](Org.OData.Capabilities.V1.xml#L163)


Flag Member|Value|Description
:-----|----:|:----------
[Snapshot](Org.OData.Capabilities.V1.xml#L164)|1|All data returned for a request, including multiple requests within a batch or results retrieved across multiple pages, will be consistent as of a single point in time

## <a name="CallbackType"></a>[CallbackType](Org.OData.Capabilities.V1.xml#L177)
A non-empty collection lists the full set of supported protocols. A empty collection means 'only HTTP is supported'

Property|Type|Description
:-------|:---|:----------
[CallbackProtocols](Org.OData.Capabilities.V1.xml#L178)|\[[CallbackProtocol](#CallbackProtocol)\]|List of supported callback protocols, e.g. `http` or `wss`

## <a name="CallbackProtocol"></a>[CallbackProtocol](Org.OData.Capabilities.V1.xml#L184)


Property|Type|Description
:-------|:---|:----------
[Id](Org.OData.Capabilities.V1.xml#L185)|String|Protocol Identifier
[UrlTemplate](Org.OData.Capabilities.V1.xml#L188)|String|URL Template including parameters. Parameters are enclosed in curly braces {} as defined in RFC6570
[DocumentationUrl](Org.OData.Capabilities.V1.xml#L192)|URL|Human readable description of the meaning of the URL Template parameters

## <a name="ChangeTrackingType"></a>[ChangeTrackingType](Org.OData.Capabilities.V1.xml#L203)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L204)|Boolean|This entity set supports the odata.track-changes preference
[FilterableProperties](Org.OData.Capabilities.V1.xml#L207)|\[PropertyPath\]|Change tracking supports filters on these properties<p>If no properties are specified or FilterableProperties is omitted, clients cannot assume support for filtering on any properties in combination with change tracking.</p>
[ExpandableProperties](Org.OData.Capabilities.V1.xml#L212)|\[NavigationPropertyPath\]|Change tracking supports these properties expanded<p>If no properties are specified or ExpandableProperties is omitted, clients cannot assume support for expanding any properties in combination with change tracking.</p>

## <a name="CountRestrictionsType"></a>[CountRestrictionsType](Org.OData.Capabilities.V1.xml#L224)


Property|Type|Description
:-------|:---|:----------
[Countable](Org.OData.Capabilities.V1.xml#L225)|Boolean|Entities can be counted
[NonCountableProperties](Org.OData.Capabilities.V1.xml#L228)|\[PropertyPath\]|These collection properties do not allow /$count segments
[NonCountableNavigationProperties](Org.OData.Capabilities.V1.xml#L231)|\[NavigationPropertyPath\]|These navigation properties do not allow /$count segments

## <a name="NavigationRestrictionsType"></a>[NavigationRestrictionsType](Org.OData.Capabilities.V1.xml#L241)


Property|Type|Description
:-------|:---|:----------
[Navigability](Org.OData.Capabilities.V1.xml#L242)|[NavigationType](#NavigationType)|Supported Navigability
[RestrictedProperties](Org.OData.Capabilities.V1.xml#L245)|\[[NavigationPropertyRestriction](#NavigationPropertyRestriction)\]|List of navigation properties with restrictions

## <a name="NavigationPropertyRestriction"></a>[NavigationPropertyRestriction](Org.OData.Capabilities.V1.xml#L249)


Property|Type|Description
:-------|:---|:----------
[NavigationProperty](Org.OData.Capabilities.V1.xml#L250)|NavigationPropertyPath|Navigation properties can be navigated
[Navigability](Org.OData.Capabilities.V1.xml#L253)|[NavigationType](#NavigationType)|Navigation properties can be navigated to this level
[FilterFunctions](Org.OData.Capabilities.V1.xml#L256)|\[String\]|List of functions and operators supported in filter expressions<p>If not specified, null, or empty, all functions and operators may be attempted.</p>
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L261)|[FilterRestrictionsType](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L264)|[SearchRestrictionsType](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L267)|[SortRestrictionsType](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](Org.OData.Capabilities.V1.xml#L270)|Boolean|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L273)|Boolean|Supports $skip
[SelectSupport](Org.OData.Capabilities.V1.xml#L276)|[SelectSupportType](#SelectSupportType)|Support for $select
[IndexableByKey](Org.OData.Capabilities.V1.xml#L279)|Boolean|Supports key values according to OData URL conventions
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L282)|[InsertRestrictionsType](#InsertRestrictionsType)|Restrictions on insert operations
[DeepInsertSupport](Org.OData.Capabilities.V1.xml#L285)|[DeepInsertSupportType](#DeepInsertSupportType)|Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L289)|[UpdateRestrictionsType](#UpdateRestrictionsType)|Restrictions on update operations
[DeepUpdateSupport](Org.OData.Capabilities.V1.xml#L292)|[DeepUpdateSupportType](#DeepUpdateSupportType)|Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L296)|[DeleteRestrictionsType](#DeleteRestrictionsType)|Restrictions on delete operations
[OptimisticConcurrencyControl](Org.OData.Capabilities.V1.xml#L299)|Boolean|Data modification (including insert) along this navigation property requires the use of ETags
[ReadRestrictions](Org.OData.Capabilities.V1.xml#L303)|[ReadRestrictionsType](#ReadRestrictionsType)|Restrictions for retrieving entities

## <a name="NavigationType"></a>[NavigationType](Org.OData.Capabilities.V1.xml#L307)


Member|Value|Description
:-----|----:|:----------
[Recursive](Org.OData.Capabilities.V1.xml#L308)|0|Navigation properties can be recursively navigated
[Single](Org.OData.Capabilities.V1.xml#L311)|1|Navigation properties can be navigated to a single level
[None](Org.OData.Capabilities.V1.xml#L314)|2|Navigation properties are not navigable

## <a name="SelectSupportType"></a>[SelectSupportType](Org.OData.Capabilities.V1.xml#L338)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L339)|Boolean|Supports $select
[Expandable](Org.OData.Capabilities.V1.xml#L342)|Boolean|$expand within $select is supported
[Filterable](Org.OData.Capabilities.V1.xml#L345)|Boolean|$filter within $select is supported
[Searchable](Org.OData.Capabilities.V1.xml#L348)|Boolean|$search within $select is supported
[TopSupported](Org.OData.Capabilities.V1.xml#L351)|Boolean|$top within $select is supported
[SkipSupported](Org.OData.Capabilities.V1.xml#L354)|Boolean|$skip within $select is supported
[ComputeSupported](Org.OData.Capabilities.V1.xml#L357)|Boolean|$compute within $select is supported
[Countable](Org.OData.Capabilities.V1.xml#L360)|Boolean|$count within $select is supported
[Sortable](Org.OData.Capabilities.V1.xml#L363)|Boolean|$orderby within $select is supported

## <a name="BatchSupportType"></a>[BatchSupportType](Org.OData.Capabilities.V1.xml#L376)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L377)|Boolean|Service supports requests to $batch
[ContinueOnErrorSupported](Org.OData.Capabilities.V1.xml#L380)|Boolean|Service supports the continue on error preference
[ReferencesInRequestBodiesSupported](Org.OData.Capabilities.V1.xml#L383)|Boolean|Service supports Content-ID referencing in request bodies
[ReferencesAcrossChangeSetsSupported](Org.OData.Capabilities.V1.xml#L386)|Boolean|Service supports Content-ID referencing across change sets
[EtagReferencesSupported](Org.OData.Capabilities.V1.xml#L389)|Boolean|Service supports referencing Etags from previous requests
[RequestDependencyConditionsSupported](Org.OData.Capabilities.V1.xml#L392)|Boolean|Service supports the `if` member in JSON batch requests
[SupportedFormats](Org.OData.Capabilities.V1.xml#L395)|\[MediaType\]|Media types of supported formats for $batch

## <a name="FilterRestrictionsType"></a>[FilterRestrictionsType](Org.OData.Capabilities.V1.xml#L424)


Property|Type|Description
:-------|:---|:----------
[Filterable](Org.OData.Capabilities.V1.xml#L425)|Boolean|$filter is supported
[RequiresFilter](Org.OData.Capabilities.V1.xml#L428)|Boolean|$filter is required
[RequiredProperties](Org.OData.Capabilities.V1.xml#L431)|\[PropertyPath\]|These properties must be specified in the $filter clause (properties of derived types are not allowed here)
[NonFilterableProperties](Org.OData.Capabilities.V1.xml#L435)|\[PropertyPath\]|These structural properties cannot be used in filter expressions
[FilterExpressionRestrictions](Org.OData.Capabilities.V1.xml#L440)|\[[FilterExpressionRestrictionType](#FilterExpressionRestrictionType)\]|These properties only allow a subset of filter expressions. A valid filter expression for a single property can be enclosed in parentheses and combined by `and` with valid expressions for other properties.
[MaxLevels](Org.OData.Capabilities.V1.xml#L444)|Int32|The maximum number of levels (including recursion) that can be traversed in a filter expression. A value of -1 indicates there is no restriction.

## <a name="FilterExpressionRestrictionType"></a>[FilterExpressionRestrictionType](Org.OData.Capabilities.V1.xml#L449)


Property|Type|Description
:-------|:---|:----------
[Property](Org.OData.Capabilities.V1.xml#L450)|PropertyPath|Path to the restricted property
[AllowedExpressions](Org.OData.Capabilities.V1.xml#L453)|[FilterExpressionType](#FilterExpressionType)|Allowed subset of expressions

## <a name="FilterExpressionType"></a>[FilterExpressionType](Org.OData.Capabilities.V1.xml#L457)
**Type:** String



Allowed Value|Description
:------------|:----------
[SingleValue](Org.OData.Capabilities.V1.xml#L460)|Property can be used in a single `eq` clause
[MultiValue](Org.OData.Capabilities.V1.xml#L464)|Property can be used in a single `in` clause
[SingleRange](Org.OData.Capabilities.V1.xml#L468)|Property can be used in at most one `ge` and/or one `le` clause, separated by `and`
[MultiRange](Org.OData.Capabilities.V1.xml#L473)|Property can be compared to a union of one or more closed, half-open, or open intervals<p>The filter expression for this property consists of one or more interval expressions combined by `or`. A single interval expression is either a single comparison of the property and a literal value with `eq`, `le`, `lt`, `ge`, or `gt`, or pair of boundaries combined by `and` and enclosed in parentheses. The lower boundary is either `ge` or `gt`, the upper boundary either `le` or `lt`.</p>
[SearchExpression](Org.OData.Capabilities.V1.xml#L480)|String property can be used as first operand in `startswith`, `endswith`, and `contains` clauses
[MultiRangeOrSearchExpression](Org.OData.Capabilities.V1.xml#L485)|Property can be compared to a union of zero or more closed, half-open, or open intervals plus zero or more simple string patterns<p>The filter expression for this property consists of one or more interval expressions or string comparison functions combined by `or`. See MultiRange for a definition of an interval expression. See SearchExpression for the allowed string comparison functions.</p>

## <a name="SortRestrictionsType"></a>[SortRestrictionsType](Org.OData.Capabilities.V1.xml#L499)


Property|Type|Description
:-------|:---|:----------
[Sortable](Org.OData.Capabilities.V1.xml#L500)|Boolean|$orderby is supported
[AscendingOnlyProperties](Org.OData.Capabilities.V1.xml#L503)|\[PropertyPath\]|These properties can only be used for sorting in Ascending order
[DescendingOnlyProperties](Org.OData.Capabilities.V1.xml#L506)|\[PropertyPath\]|These properties can only be used for sorting in Descending order
[NonSortableProperties](Org.OData.Capabilities.V1.xml#L509)|\[PropertyPath\]|These structural properties cannot be used in orderby expressions

## <a name="ExpandRestrictionsType"></a>[ExpandRestrictionsType](Org.OData.Capabilities.V1.xml#L517)


Property|Type|Description
:-------|:---|:----------
[Expandable](Org.OData.Capabilities.V1.xml#L518)|Boolean|$expand is supported
[StreamsExpandable](Org.OData.Capabilities.V1.xml#L521)|Boolean|$expand is supported for stream properties and media resources
[NonExpandableProperties](Org.OData.Capabilities.V1.xml#L524)|\[NavigationPropertyPath\]|These properties cannot be used in expand expressions
[MaxLevels](Org.OData.Capabilities.V1.xml#L527)|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.

## <a name="SearchRestrictionsType"></a>[SearchRestrictionsType](Org.OData.Capabilities.V1.xml#L536)


Property|Type|Description
:-------|:---|:----------
[Searchable](Org.OData.Capabilities.V1.xml#L537)|Boolean|$search is supported
[UnsupportedExpressions](Org.OData.Capabilities.V1.xml#L540)|[SearchExpressions](#SearchExpressions)|Expressions not supported in $search

## <a name="SearchExpressions"></a>[SearchExpressions](Org.OData.Capabilities.V1.xml#L544)


Flag Member|Value|Description
:-----|----:|:----------
[none](Org.OData.Capabilities.V1.xml#L545)|0|Single search term
[AND](Org.OData.Capabilities.V1.xml#L548)|1|Multiple search terms separated by `AND`
[OR](Org.OData.Capabilities.V1.xml#L551)|2|Multiple search terms separated by `OR`
[NOT](Org.OData.Capabilities.V1.xml#L554)|4|Search terms preceded by `NOT`
[phrase](Org.OData.Capabilities.V1.xml#L557)|8|Search phrases enclosed in double quotes
[group](Org.OData.Capabilities.V1.xml#L560)|16|Precedence grouping of search expressions with parentheses

## <a name="InsertRestrictionsType"></a>[InsertRestrictionsType](Org.OData.Capabilities.V1.xml#L587)


Property|Type|Description
:-------|:---|:----------
[Insertable](Org.OData.Capabilities.V1.xml#L588)|Boolean|Entities can be inserted
[NonInsertableProperties](Org.OData.Capabilities.V1.xml#L591)|\[PropertyPath\]|These structural properties cannot be specified on insert
[NonInsertableNavigationProperties](Org.OData.Capabilities.V1.xml#L594)|\[NavigationPropertyPath\]|These navigation properties do not allow deep inserts
[MaxLevels](Org.OData.Capabilities.V1.xml#L597)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to insert into. A value of -1 indicates there is no restriction.
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L601)|Boolean|Entities of a specific derived type can be created by specifying a type-cast segment
[Permission](Org.OData.Capabilities.V1.xml#L605)|[PermissionType](#PermissionType)|Required scopes to perform the insert
[QueryOptions](Org.OData.Capabilities.V1.xml#L608)|[ModificationQueryOptionsType](#ModificationQueryOptionsType)|Support for query options with insert requests
[CustomHeaders](Org.OData.Capabilities.V1.xml#L611)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L614)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options

## <a name="PermissionType"></a>[PermissionType](Org.OData.Capabilities.V1.xml#L619)


Property|Type|Description
:-------|:---|:----------
[Scheme](Org.OData.Capabilities.V1.xml#L620)|[SecurityScheme](Org.OData.Authorization.V1.md#SecurityScheme)|Auth flow scheme name
[Scopes](Org.OData.Capabilities.V1.xml#L623)|\[[ScopeType](#ScopeType)\]|List of scopes that can provide access to the resource

## <a name="ScopeType"></a>[ScopeType](Org.OData.Capabilities.V1.xml#L628)


Property|Type|Description
:-------|:---|:----------
[Scope](Org.OData.Capabilities.V1.xml#L629)|String|Name of the scope.
[RestrictedProperties](Org.OData.Capabilities.V1.xml#L632)|String|Comma-separated string value of all properties that will be included or excluded when using the scope.<p>Possible string value identifiers when specifying properties are `*`, _PropertyName_, `-`_PropertyName_.<br/>`*` denotes all properties are accessible.<br/>`-`_PropertyName_ excludes that specific property.<br/>_PropertyName_ explicitly provides access to the specific property.<br/>The absence of `RestrictedProperties` denotes all properties are accessible using that scope.</p>

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
[CollectionUpdate](Org.OData.Capabilities.V1.xml#L673)|[CollectionUpdateType](#CollectionUpdateType)|Entities can be upserted
[NonUpdatableNavigationProperties](Org.OData.Capabilities.V1.xml#L676)|\[NavigationPropertyPath\]|These navigation properties do not allow rebinding
[MaxLevels](Org.OData.Capabilities.V1.xml#L679)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection or entity to update. A value of -1 indicates there is no restriction.
[Permission](Org.OData.Capabilities.V1.xml#L683)|[PermissionType](#PermissionType)|Required scopes to perform update
[QueryOptions](Org.OData.Capabilities.V1.xml#L686)|[ModificationQueryOptionsType](#ModificationQueryOptionsType)|Support for query options with update requests
[CustomHeaders](Org.OData.Capabilities.V1.xml#L689)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L692)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options

## <a name="CollectionUpdateType"></a>[CollectionUpdateType](Org.OData.Capabilities.V1.xml#L696)


Property|Type|Description
:-------|:---|:----------
[DeltaUpsertable](Org.OData.Capabilities.V1.xml#L697)|Boolean|Entities can be inserted and updated via a PATCH request with a delta payload
[DeltaDeletable](Org.OData.Capabilities.V1.xml#L701)|Boolean|Entities can be deleted via tombstones in a PATCH request with a delta payload
[FilterSegmentSupported](Org.OData.Capabilities.V1.xml#L705)|Boolean|Entities can be updated via a PATCH request with a `/$filter(...)/$each` segment
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L709)|Boolean|Entities can be updated via a PATCH request with a type-cast segment and a `/$each` segment

## <a name="DeepUpdateSupportType"></a>[DeepUpdateSupportType](Org.OData.Capabilities.V1.xml#L719)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L720)|Boolean|Annotation target supports deep updates
[ContentIDSupported](Org.OData.Capabilities.V1.xml#L723)|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

## <a name="DeleteRestrictionsType"></a>[DeleteRestrictionsType](Org.OData.Capabilities.V1.xml#L732)


Property|Type|Description
:-------|:---|:----------
[Deletable](Org.OData.Capabilities.V1.xml#L733)|Boolean|Entities can be deleted
[NonDeletableNavigationProperties](Org.OData.Capabilities.V1.xml#L736)|\[NavigationPropertyPath\]|These navigation properties do not allow DeleteLink requests
[MaxLevels](Org.OData.Capabilities.V1.xml#L739)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to delete from or the entity to delete. A value of -1 indicates there is no restriction.
[FilterSupported](Org.OData.Capabilities.V1.xml#L743)|Boolean|Entities can be updated via a PATCH request with a `/$filter(...)/$each` segment
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L747)|Boolean|Entities can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[Permission](Org.OData.Capabilities.V1.xml#L751)|[PermissionType](#PermissionType)|Required scopes to perform delete
[CustomHeaders](Org.OData.Capabilities.V1.xml#L754)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L757)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options

## <a name="CollectionPropertyRestrictionsType"></a>[CollectionPropertyRestrictionsType](Org.OData.Capabilities.V1.xml#L768)


Property|Type|Description
:-------|:---|:----------
[CollectionProperty](Org.OData.Capabilities.V1.xml#L769)|PropertyPath|Restricted Collection-valued property
[FilterFunctions](Org.OData.Capabilities.V1.xml#L772)|\[String\]|List of functions and operators supported in filter expressions<p>If not specified, null, or empty, all functions and operators may be attempted.</p>
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L777)|[FilterRestrictionsType](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L780)|[SearchRestrictionsType](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L783)|[SortRestrictionsType](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](Org.OData.Capabilities.V1.xml#L786)|Boolean|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L789)|Boolean|Supports $skip
[SelectSupport](Org.OData.Capabilities.V1.xml#L792)|[SelectSupportType](#SelectSupportType)|Support for $select
[Insertable](Org.OData.Capabilities.V1.xml#L795)|Boolean|Members can be inserted into this collection<p>If additionally annotated with [Core.PositionalInsert](Org.OData.Core.V1.md#PositionalInsert), members can be inserted at a specific position</p>
[Updatable](Org.OData.Capabilities.V1.xml#L800)|Boolean|Members of this ordered collection can be updated by ordinal
[Deletable](Org.OData.Capabilities.V1.xml#L803)|Boolean|Members of this ordered collection can be deleted by ordinal

## <a name="OperationRestriction"></a>[OperationRestriction](Org.OData.Capabilities.V1.xml#L813)


Property|Type|Description
:-------|:---|:----------
[FilterSegmentSupported](Org.OData.Capabilities.V1.xml#L814)|Boolean|Bound action or function can be invoked on a binding parameter path with a `/$filter(...)` segment
[Permission](Org.OData.Capabilities.V1.xml#L818)|[PermissionType](#PermissionType)|List of required scopes to invoke an action or function
[CustomHeaders](Org.OData.Capabilities.V1.xml#L821)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L824)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options

## <a name="ModificationQueryOptionsType"></a>[ModificationQueryOptionsType](Org.OData.Capabilities.V1.xml#L838)


Property|Type|Description
:-------|:---|:----------
[ExpandSupported](Org.OData.Capabilities.V1.xml#L839)|Boolean|Supports $expand with modification requests
[SelectSupported](Org.OData.Capabilities.V1.xml#L842)|Boolean|Supports $select with modification requests
[ComputeSupported](Org.OData.Capabilities.V1.xml#L845)|Boolean|Supports $compute with modification requests
[FilterSupported](Org.OData.Capabilities.V1.xml#L848)|Boolean|Supports $filter with modification requests
[SearchSupported](Org.OData.Capabilities.V1.xml#L851)|Boolean|Supports $search with modification requests
[SortSupported](Org.OData.Capabilities.V1.xml#L854)|Boolean|Supports $orderby with modification requests

## <a name="ReadRestrictionsBase"></a>[*ReadRestrictionsBase*](Org.OData.Capabilities.V1.xml#L863)


**Derived Types:**
- [ReadByKeyRestrictionsType](#ReadByKeyRestrictionsType)
- [ReadRestrictionsType](#ReadRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Readable](Org.OData.Capabilities.V1.xml#L864)|Boolean|Entities can be retrieved
[Permission](Org.OData.Capabilities.V1.xml#L867)|[PermissionType](#PermissionType)|List of required scopes to invoke an action or function
[CustomHeaders](Org.OData.Capabilities.V1.xml#L870)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L873)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options

## <a name="ReadByKeyRestrictionsType"></a>[ReadByKeyRestrictionsType](Org.OData.Capabilities.V1.xml#L877): [ReadRestrictionsBase](#ReadRestrictionsBase)
Restrictions for retrieving an entity by key

Property|Type|Description
:-------|:---|:----------
[*Readable*](Org.OData.Capabilities.V1.xml#L864)|Boolean|Entities can be retrieved
[*Permission*](Org.OData.Capabilities.V1.xml#L867)|[PermissionType](#PermissionType)|List of required scopes to invoke an action or function
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L870)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L873)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options

## <a name="ReadRestrictionsType"></a>[ReadRestrictionsType](Org.OData.Capabilities.V1.xml#L880): [ReadRestrictionsBase](#ReadRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Readable*](Org.OData.Capabilities.V1.xml#L864)|Boolean|Entities can be retrieved
[*Permission*](Org.OData.Capabilities.V1.xml#L867)|[PermissionType](#PermissionType)|List of required scopes to invoke an action or function
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L870)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L873)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[ReadByKeyRestrictions](Org.OData.Capabilities.V1.xml#L881)|[ReadByKeyRestrictionsType](#ReadByKeyRestrictionsType)|Restrictions for retrieving an entity by key<p>Only valid when applied to a collection. If a property of `ReadByKeyRestrictions` is not specified, the corresponding property value of `ReadRestrictions` applies.</p>

## <a name="CustomParameter"></a>[CustomParameter](Org.OData.Capabilities.V1.xml#L951)
A custom parameter is either a header or a query option

The type of a custom parameter is always a string. Restrictions on the parameter values can be expressed by annotating the record expression describing the parameter with terms from the Validation vocabulary, e.g. Validation.Pattern or Validation.AllowedValues.

Property|Type|Description
:-------|:---|:----------
[Name](Org.OData.Capabilities.V1.xml#L955)|String|Name of the custom parameter
[Description](Org.OData.Capabilities.V1.xml#L958)|String|Description of the custom parameter
[DocumentationURL](Org.OData.Capabilities.V1.xml#L961)|URL|URL of related documentation
[Required](Org.OData.Capabilities.V1.xml#L965)|Boolean|true: parameter is required, false or not specified: parameter is optional
[ExampleValues](Org.OData.Capabilities.V1.xml#L968)|\[[PrimitiveExampleValue](Org.OData.Core.V1.md#PrimitiveExampleValue)\]|Example values for the custom parameter
