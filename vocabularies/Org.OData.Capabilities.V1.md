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
[ConformanceLevel](Org.OData.Capabilities.V1.xml#L115)|[ConformanceLevelType](#ConformanceLevelType)|<a name="ConformanceLevel"></a>The conformance level achieved by this service
[SupportedFormats](Org.OData.Capabilities.V1.xml#L132)|\[MediaType\]|<a name="SupportedFormats"></a>Media types of supported formats, including format parameters
[SupportedMetadataFormats](Org.OData.Capabilities.V1.xml#L137)|\[MediaType\]|<a name="SupportedMetadataFormats"></a>Media types of supported formats for $metadata, including format parameters
[AcceptableEncodings](Org.OData.Capabilities.V1.xml#L142)|\[String\]|<a name="AcceptableEncodings"></a>List of acceptable compression methods for ($batch) requests, e.g. gzip
[AsynchronousRequestsSupported](Org.OData.Capabilities.V1.xml#L148)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AsynchronousRequestsSupported"></a>Service supports the asynchronous request preference
[BatchContinueOnErrorSupported](Org.OData.Capabilities.V1.xml#L152)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchContinueOnErrorSupported"></a>Service supports the continue on error preference. Supports $batch requests. Services that apply the BatchContinueOnErrorSupported term should also specify the ContinueOnErrorSupported property from the BatchSupport term.
[IsolationSupported](Org.OData.Capabilities.V1.xml#L157)|[IsolationLevel](#IsolationLevel)|<a name="IsolationSupported"></a>Supported odata.isolation levels
[CrossJoinSupported](Org.OData.Capabilities.V1.xml#L167)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="CrossJoinSupported"></a>Supports cross joins for the entity sets in this container
[CallbackSupported](Org.OData.Capabilities.V1.xml#L171)|[CallbackType](#CallbackType)|<a name="CallbackSupported"></a>Supports callbacks for the specified protocols
[ChangeTracking](Org.OData.Capabilities.V1.xml#L197)|[ChangeTrackingType](#ChangeTrackingType)|<a name="ChangeTracking"></a>Change tracking capabilities of this service or entity set
[CountRestrictions](Org.OData.Capabilities.V1.xml#L218)|[CountRestrictionsType](#CountRestrictionsType)|<a name="CountRestrictions"></a>Restrictions on /$count path suffix and $count=true system query option
[NavigationRestrictions](Org.OData.Capabilities.V1.xml#L233)|[NavigationRestrictionsType](#NavigationRestrictionsType)|<a name="NavigationRestrictions"></a>Restrictions on navigating properties according to OData URL conventions<p>Restrictions specified on an entity set are valid whether the request is directly to the entity set or through a navigation property bound to that entity set. Services can specify a different set of restrictions specific to a path, in which case the more specific restrictions take precedence.</p>
[IndexableByKey](Org.OData.Capabilities.V1.xml#L312)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="IndexableByKey"></a>Supports key values according to OData URL conventions
[TopSupported](Org.OData.Capabilities.V1.xml#L316)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="TopSupported"></a>Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L320)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="SkipSupported"></a>Supports $skip
[SelectSupport](Org.OData.Capabilities.V1.xml#L324)|[SelectSupportType](#SelectSupportType)|<a name="SelectSupport"></a>Support for $select and nested query options within $select
[BatchSupported](Org.OData.Capabilities.V1.xml#L357)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchSupported"></a>Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.
[BatchSupport](Org.OData.Capabilities.V1.xml#L362)|[BatchSupportType](#BatchSupportType)|<a name="BatchSupport"></a>Batch Support for the service
[FilterFunctions](Org.OData.Capabilities.V1.xml#L404)|\[String\]|<a name="FilterFunctions"></a>List of functions and operators supported in $filter
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L408)|[FilterRestrictionsType](#FilterRestrictionsType)|<a name="FilterRestrictions"></a>Restrictions on filter expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L483)|[SortRestrictionsType](#SortRestrictionsType)|<a name="SortRestrictions"></a>Restrictions on orderby expressions
[ExpandRestrictions](Org.OData.Capabilities.V1.xml#L501)|[ExpandRestrictionsType](#ExpandRestrictionsType)|<a name="ExpandRestrictions"></a>Restrictions on expand expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L517)|[SearchRestrictionsType](#SearchRestrictionsType)|<a name="SearchRestrictions"></a>Restrictions on search expressions
[KeyAsSegmentSupported](Org.OData.Capabilities.V1.xml#L549)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="KeyAsSegmentSupported"></a>Supports [key-as-segment convention](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_KeyasSegmentConvention) for addressing entities within a collection
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L556)|[InsertRestrictionsType](#InsertRestrictionsType)|<a name="InsertRestrictions"></a>Restrictions on insert operations
[DeepInsertSupport](Org.OData.Capabilities.V1.xml#L581)|[DeepInsertSupportType](#DeepInsertSupportType)|<a name="DeepInsertSupport"></a>Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L595)|[UpdateRestrictionsType](#UpdateRestrictionsType)|<a name="UpdateRestrictions"></a>Restrictions on update operations
[DeepUpdateSupport](Org.OData.Capabilities.V1.xml#L620)|[DeepUpdateSupportType](#DeepUpdateSupportType)|<a name="DeepUpdateSupport"></a>Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L634)|[DeleteRestrictionsType](#DeleteRestrictionsType)|<a name="DeleteRestrictions"></a>Restrictions on delete operations
[CollectionPropertyRestrictions](Org.OData.Capabilities.V1.xml#L658)|\[[CollectionPropertyRestrictionsType](#CollectionPropertyRestrictionsType)\]|<a name="CollectionPropertyRestrictions"></a>Describes restrictions on operations applied to collection-valued structural properties
[AnnotationValuesInQuerySupported](Org.OData.Capabilities.V1.xml#L699)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AnnotationValuesInQuerySupported"></a>Supports annotation values within system query options
[ModificationQueryOptions](Org.OData.Capabilities.V1.xml#L705)|[ModificationQueryOptionsType](#ModificationQueryOptionsType)|<a name="ModificationQueryOptions"></a>Support for query options with modification requests (insert, update, action invocation)
[ReadRestrictions](Org.OData.Capabilities.V1.xml#L730)|[ReadRestrictionsType](#ReadRestrictionsType)|<a name="ReadRestrictions"></a>Restrictions on read operations: retrieve a collection, retrieve a single instance, invoke a function
[CustomHeaders](Org.OData.Capabilities.V1.xml#L748)|\[[CustomParameter](#CustomParameter)\]|<a name="CustomHeaders"></a>Custom headers that are supported/required for the annotated resource ([Example](Org.OData.Capabilities.V1.xml#L750))
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L776)|\[[CustomParameter](#CustomParameter)\]|<a name="CustomQueryOptions"></a>Custom query options that are supported/required for the annotated resource ([Example](Org.OData.Capabilities.V1.xml#L780))<p>If the entity container is annotated, the query option is supported/required by all resources in that container.</p>
[MediaLocationUpdateSupported](Org.OData.Capabilities.V1.xml#L833)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="MediaLocationUpdateSupported"></a>Stream property supports update of its media edit URL and/or media read URL

## <a name="ConformanceLevelType"></a>[ConformanceLevelType](Org.OData.Capabilities.V1.xml#L118)


Member|Value|Description
:-----|----:|:----------
[Minimal](Org.OData.Capabilities.V1.xml#L119)|0|Minimal conformance level
[Intermediate](Org.OData.Capabilities.V1.xml#L122)|1|Intermediate conformance level
[Advanced](Org.OData.Capabilities.V1.xml#L125)|2|Advanced conformance level

## <a name="IsolationLevel"></a>[IsolationLevel](Org.OData.Capabilities.V1.xml#L160)


Flag Member|Value|Description
:-----|----:|:----------
[Snapshot](Org.OData.Capabilities.V1.xml#L161)|1|All data returned for a request, including multiple requests within a batch or results retrieved across multiple pages, will be consistent as of a single point in time

## <a name="CallbackType"></a>[CallbackType](Org.OData.Capabilities.V1.xml#L174)
A non-empty collection lists the full set of supported protocols. A empty collection means 'only HTTP is supported'

Property|Type|Description
:-------|:---|:----------
[CallbackProtocols](Org.OData.Capabilities.V1.xml#L175)|\[[CallbackProtocol](#CallbackProtocol)\]|List of supported callback protocols, e.g. `http` or `wss`

## <a name="CallbackProtocol"></a>[CallbackProtocol](Org.OData.Capabilities.V1.xml#L181)


Property|Type|Description
:-------|:---|:----------
[Id](Org.OData.Capabilities.V1.xml#L182)|String|Protocol Identifier
[UrlTemplate](Org.OData.Capabilities.V1.xml#L185)|String|URL Template including parameters. Parameters are enclosed in curly braces {} as defined in RFC6570
[DocumentationUrl](Org.OData.Capabilities.V1.xml#L189)|URL|Human readable description of the meaning of the URL Template parameters

## <a name="ChangeTrackingType"></a>[ChangeTrackingType](Org.OData.Capabilities.V1.xml#L200)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L201)|Boolean|This entity set supports the odata.track-changes preference
[FilterableProperties](Org.OData.Capabilities.V1.xml#L204)|\[PropertyPath\]|Change tracking supports filters on these properties<p>If no properties are specified or FilterableProperties is omitted, clients cannot assume support for filtering on any properties in combination with change tracking.</p>
[ExpandableProperties](Org.OData.Capabilities.V1.xml#L209)|\[NavigationPropertyPath\]|Change tracking supports these properties expanded<p>If no properties are specified or ExpandableProperties is omitted, clients cannot assume support for expanding any properties in combination with change tracking.</p>

## <a name="CountRestrictionsType"></a>[CountRestrictionsType](Org.OData.Capabilities.V1.xml#L221)


Property|Type|Description
:-------|:---|:----------
[Countable](Org.OData.Capabilities.V1.xml#L222)|Boolean|Entities can be counted
[NonCountableProperties](Org.OData.Capabilities.V1.xml#L225)|\[PropertyPath\]|These collection properties do not allow /$count segments
[NonCountableNavigationProperties](Org.OData.Capabilities.V1.xml#L228)|\[NavigationPropertyPath\]|These navigation properties do not allow /$count segments

## <a name="NavigationRestrictionsType"></a>[NavigationRestrictionsType](Org.OData.Capabilities.V1.xml#L238)


Property|Type|Description
:-------|:---|:----------
[Navigability](Org.OData.Capabilities.V1.xml#L239)|[NavigationType](#NavigationType)|Supported Navigability
[RestrictedProperties](Org.OData.Capabilities.V1.xml#L242)|\[[NavigationPropertyRestriction](#NavigationPropertyRestriction)\]|List of navigation properties with restrictions

## <a name="NavigationPropertyRestriction"></a>[NavigationPropertyRestriction](Org.OData.Capabilities.V1.xml#L246)


Property|Type|Description
:-------|:---|:----------
[NavigationProperty](Org.OData.Capabilities.V1.xml#L247)|NavigationPropertyPath|Navigation properties can be navigated
[Navigability](Org.OData.Capabilities.V1.xml#L250)|[NavigationType](#NavigationType)|Navigation properties can be navigated to this level
[FilterFunctions](Org.OData.Capabilities.V1.xml#L253)|\[String\]|List of functions and operators supported in filter expressions. If null, all functions and operators may be attempted.
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L257)|[FilterRestrictionsType](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L260)|[SearchRestrictionsType](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L263)|[SortRestrictionsType](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](Org.OData.Capabilities.V1.xml#L266)|Boolean|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L269)|Boolean|Supports $skip
[SelectSupport](Org.OData.Capabilities.V1.xml#L272)|[SelectSupportType](#SelectSupportType)|Support for $select
[IndexableByKey](Org.OData.Capabilities.V1.xml#L275)|Boolean|Supports key values according to OData URL conventions
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L278)|[InsertRestrictionsType](#InsertRestrictionsType)|Restrictions on insert operations
[DeepInsertSupport](Org.OData.Capabilities.V1.xml#L281)|[DeepInsertSupportType](#DeepInsertSupportType)|Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L285)|[UpdateRestrictionsType](#UpdateRestrictionsType)|Restrictions on update operations
[DeepUpdateSupport](Org.OData.Capabilities.V1.xml#L288)|[DeepUpdateSupportType](#DeepUpdateSupportType)|Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L292)|[DeleteRestrictionsType](#DeleteRestrictionsType)|Restrictions on delete operations
[OptimisticConcurrencyControl](Org.OData.Capabilities.V1.xml#L295)|Boolean|Data modification (including insert) along this navigation property requires the use of ETags

## <a name="NavigationType"></a>[NavigationType](Org.OData.Capabilities.V1.xml#L300)


Member|Value|Description
:-----|----:|:----------
[Recursive](Org.OData.Capabilities.V1.xml#L301)|0|Navigation properties can be recursively navigated
[Single](Org.OData.Capabilities.V1.xml#L304)|1|Navigation properties can be navigated to a single level
[None](Org.OData.Capabilities.V1.xml#L307)|2|Navigation properties are not navigable

## <a name="SelectSupportType"></a>[SelectSupportType](Org.OData.Capabilities.V1.xml#L327)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L328)|Boolean|Supports $select
[Expandable](Org.OData.Capabilities.V1.xml#L331)|Boolean|$expand within $select is supported
[Filterable](Org.OData.Capabilities.V1.xml#L334)|Boolean|$filter within $select is supported
[Searchable](Org.OData.Capabilities.V1.xml#L337)|Boolean|$search within $select is supported
[TopSupported](Org.OData.Capabilities.V1.xml#L340)|Boolean|$top within $select is supported
[SkipSupported](Org.OData.Capabilities.V1.xml#L343)|Boolean|$skip within $select is supported
[ComputeSupported](Org.OData.Capabilities.V1.xml#L346)|Boolean|$compute within $select is supported
[Countable](Org.OData.Capabilities.V1.xml#L349)|Boolean|$count within $select is supported
[Sortable](Org.OData.Capabilities.V1.xml#L352)|Boolean|$orderby within $select is supported

## <a name="BatchSupportType"></a>[BatchSupportType](Org.OData.Capabilities.V1.xml#L365)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L366)|Boolean|Service supports requests to $batch
[ContinueOnErrorSupported](Org.OData.Capabilities.V1.xml#L369)|Boolean|Service supports the continue on error preference
[ReferencesInRequestBodiesSupported](Org.OData.Capabilities.V1.xml#L372)|Boolean|Service supports Content-ID referencing in request bodies
[ReferencesAcrossChangeSetsSupported](Org.OData.Capabilities.V1.xml#L375)|Boolean|Service supports Content-ID referencing across change sets
[EtagReferencesSupported](Org.OData.Capabilities.V1.xml#L378)|Boolean|Service supports referencing Etags from previous requests
[RequestDependencyConditionsSupported](Org.OData.Capabilities.V1.xml#L381)|Boolean|Service supports the `if` member in JSON batch requests
[SupportedFormats](Org.OData.Capabilities.V1.xml#L384)|\[MediaType\]|Media types of supported formats for $batch

## <a name="FilterRestrictionsType"></a>[FilterRestrictionsType](Org.OData.Capabilities.V1.xml#L411)


Property|Type|Description
:-------|:---|:----------
[Filterable](Org.OData.Capabilities.V1.xml#L412)|Boolean|$filter is supported
[RequiresFilter](Org.OData.Capabilities.V1.xml#L415)|Boolean|$filter is required
[RequiredProperties](Org.OData.Capabilities.V1.xml#L418)|\[PropertyPath\]|These properties must be specified in the $filter clause (properties of derived types are not allowed here)
[NonFilterableProperties](Org.OData.Capabilities.V1.xml#L422)|\[PropertyPath\]|These structural properties cannot be used in filter expressions
[FilterExpressionRestrictions](Org.OData.Capabilities.V1.xml#L427)|\[[FilterExpressionRestrictionType](#FilterExpressionRestrictionType)\]|These properties only allow a subset of filter expressions. A valid filter expression for a single property can be enclosed in parentheses and combined by `and` with valid expressions for other properties.
[MaxLevels](Org.OData.Capabilities.V1.xml#L431)|Int32|The maximum number of levels (including recursion) that can be traversed in a filter expression. A value of -1 indicates there is no restriction.

## <a name="FilterExpressionRestrictionType"></a>[FilterExpressionRestrictionType](Org.OData.Capabilities.V1.xml#L436)


Property|Type|Description
:-------|:---|:----------
[Property](Org.OData.Capabilities.V1.xml#L437)|PropertyPath|Path to the restricted property
[AllowedExpressions](Org.OData.Capabilities.V1.xml#L440)|[FilterExpressionType](#FilterExpressionType)|Allowed subset of expressions

## <a name="FilterExpressionType"></a>[FilterExpressionType](Org.OData.Capabilities.V1.xml#L444)
**Type:** String



Allowed Value|Description
:------------|:----------
[SingleValue](Org.OData.Capabilities.V1.xml#L447)|Property can be used in a single `eq` clause
[MultiValue](Org.OData.Capabilities.V1.xml#L451)|Property can be used in a single `in` clause
[SingleRange](Org.OData.Capabilities.V1.xml#L455)|Property can be used in at most one `ge` and/or one `le` clause, separated by `and`
[MultiRange](Org.OData.Capabilities.V1.xml#L460)|Property can be compared to a union of one or more closed, half-open, or open intervals<p>The filter expression for this property consists of one or more interval expressions combined by `or`. A single interval expression is either a single comparison of the property and a literal value with `eq`, `le`, `lt`, `ge`, or `gt`, or pair of boundaries combined by `and` and enclosed in parentheses. The lower boundary is either `ge` or `gt`, the upper boundary either `le` or `lt`.</p>
[SearchExpression](Org.OData.Capabilities.V1.xml#L467)|String property can be used as first operand in `startswith`, `endswith`, and `contains` clauses
[MultiRangeOrSearchExpression](Org.OData.Capabilities.V1.xml#L472)|Property can be compared to a union of zero or more closed, half-open, or open intervals plus zero or more simple string patterns<p>The filter expression for this property consists of one or more interval expressions or string comparison functions combined by `or`. See MultiRange for a definition of an interval expression. See SearchExpression for the allowed string comparison functions.</p>

## <a name="SortRestrictionsType"></a>[SortRestrictionsType](Org.OData.Capabilities.V1.xml#L486)


Property|Type|Description
:-------|:---|:----------
[Sortable](Org.OData.Capabilities.V1.xml#L487)|Boolean|$orderby is supported
[AscendingOnlyProperties](Org.OData.Capabilities.V1.xml#L490)|\[PropertyPath\]|These properties can only be used for sorting in Ascending order
[DescendingOnlyProperties](Org.OData.Capabilities.V1.xml#L493)|\[PropertyPath\]|These properties can only be used for sorting in Descending order
[NonSortableProperties](Org.OData.Capabilities.V1.xml#L496)|\[PropertyPath\]|These structural properties cannot be used in orderby expressions

## <a name="ExpandRestrictionsType"></a>[ExpandRestrictionsType](Org.OData.Capabilities.V1.xml#L504)


Property|Type|Description
:-------|:---|:----------
[Expandable](Org.OData.Capabilities.V1.xml#L505)|Boolean|$expand is supported
[NonExpandableProperties](Org.OData.Capabilities.V1.xml#L508)|\[NavigationPropertyPath\]|These properties cannot be used in expand expressions
[MaxLevels](Org.OData.Capabilities.V1.xml#L511)|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.

## <a name="SearchRestrictionsType"></a>[SearchRestrictionsType](Org.OData.Capabilities.V1.xml#L520)


Property|Type|Description
:-------|:---|:----------
[Searchable](Org.OData.Capabilities.V1.xml#L521)|Boolean|$search is supported
[UnsupportedExpressions](Org.OData.Capabilities.V1.xml#L524)|[SearchExpressions](#SearchExpressions)|Expressions not supported in $search

## <a name="SearchExpressions"></a>[SearchExpressions](Org.OData.Capabilities.V1.xml#L528)


Flag Member|Value|Description
:-----|----:|:----------
[none](Org.OData.Capabilities.V1.xml#L529)|0|Single search term
[AND](Org.OData.Capabilities.V1.xml#L532)|1|Multiple search terms separated by `AND`
[OR](Org.OData.Capabilities.V1.xml#L535)|2|Multiple search terms separated by `OR`
[NOT](Org.OData.Capabilities.V1.xml#L538)|4|Search terms preceded by `NOT`
[phrase](Org.OData.Capabilities.V1.xml#L541)|8|Search phrases enclosed in double quotes
[group](Org.OData.Capabilities.V1.xml#L544)|16|Precedence grouping of search expressions with parentheses

## <a name="InsertRestrictionsType"></a>[InsertRestrictionsType](Org.OData.Capabilities.V1.xml#L559)


Property|Type|Description
:-------|:---|:----------
[Insertable](Org.OData.Capabilities.V1.xml#L560)|Boolean|Entities can be inserted
[NonInsertableNavigationProperties](Org.OData.Capabilities.V1.xml#L563)|\[NavigationPropertyPath\]|These navigation properties do not allow deep inserts
[MaxLevels](Org.OData.Capabilities.V1.xml#L566)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to insert into. A value of -1 indicates there is no restriction.
[QueryOptions](Org.OData.Capabilities.V1.xml#L570)|[ModificationQueryOptionsType](#ModificationQueryOptionsType)|Support for query options with insert requests
[CustomHeaders](Org.OData.Capabilities.V1.xml#L573)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L576)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options

## <a name="DeepInsertSupportType"></a>[DeepInsertSupportType](Org.OData.Capabilities.V1.xml#L585)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L586)|Boolean|Annotation target supports deep inserts
[ContentIDSupported](Org.OData.Capabilities.V1.xml#L589)|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

## <a name="UpdateRestrictionsType"></a>[UpdateRestrictionsType](Org.OData.Capabilities.V1.xml#L598)


Property|Type|Description
:-------|:---|:----------
[Updatable](Org.OData.Capabilities.V1.xml#L599)|Boolean|Entities can be updated
[NonUpdatableNavigationProperties](Org.OData.Capabilities.V1.xml#L602)|\[NavigationPropertyPath\]|These navigation properties do not allow rebinding
[MaxLevels](Org.OData.Capabilities.V1.xml#L605)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection or entity to update. A value of -1 indicates there is no restriction.
[QueryOptions](Org.OData.Capabilities.V1.xml#L609)|[ModificationQueryOptionsType](#ModificationQueryOptionsType)|Support for query options with update requests
[CustomHeaders](Org.OData.Capabilities.V1.xml#L612)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L615)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options

## <a name="DeepUpdateSupportType"></a>[DeepUpdateSupportType](Org.OData.Capabilities.V1.xml#L624)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L625)|Boolean|Annotation target supports deep updates
[ContentIDSupported](Org.OData.Capabilities.V1.xml#L628)|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

## <a name="DeleteRestrictionsType"></a>[DeleteRestrictionsType](Org.OData.Capabilities.V1.xml#L637)


Property|Type|Description
:-------|:---|:----------
[Deletable](Org.OData.Capabilities.V1.xml#L638)|Boolean|Entities can be deleted
[NonDeletableNavigationProperties](Org.OData.Capabilities.V1.xml#L641)|\[NavigationPropertyPath\]|These navigation properties do not allow DeleteLink requests
[MaxLevels](Org.OData.Capabilities.V1.xml#L644)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to delete from or the entity to delete. A value of -1 indicates there is no restriction.
[CustomHeaders](Org.OData.Capabilities.V1.xml#L648)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L651)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options

## <a name="CollectionPropertyRestrictionsType"></a>[CollectionPropertyRestrictionsType](Org.OData.Capabilities.V1.xml#L662)


Property|Type|Description
:-------|:---|:----------
[CollectionProperty](Org.OData.Capabilities.V1.xml#L663)|PropertyPath|Restricted Collection-valued property
[FilterFunctions](Org.OData.Capabilities.V1.xml#L666)|\[String\]|List of functions and operators supported in filter expressions. If null, all functions and operators may be attempted
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L670)|[FilterRestrictionsType](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L673)|[SearchRestrictionsType](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L676)|[SortRestrictionsType](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](Org.OData.Capabilities.V1.xml#L679)|Boolean|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L682)|Boolean|Supports $skip
[SelectSupport](Org.OData.Capabilities.V1.xml#L685)|[SelectSupportType](#SelectSupportType)|Support for $select
[Insertable](Org.OData.Capabilities.V1.xml#L688)|Boolean|This collection supports positional inserts
[Updatable](Org.OData.Capabilities.V1.xml#L691)|Boolean|Members of this ordered collection can be updated by ordinal
[Deletable](Org.OData.Capabilities.V1.xml#L694)|Boolean|Members of this ordered collection can be deleted by ordinal

## <a name="ModificationQueryOptionsType"></a>[ModificationQueryOptionsType](Org.OData.Capabilities.V1.xml#L709)


Property|Type|Description
:-------|:---|:----------
[ExpandSupported](Org.OData.Capabilities.V1.xml#L710)|Boolean|Supports $expand with modification requests
[SelectSupported](Org.OData.Capabilities.V1.xml#L713)|Boolean|Supports $select with modification requests
[ComputeSupported](Org.OData.Capabilities.V1.xml#L716)|Boolean|Supports $compute with modification requests
[FilterSupported](Org.OData.Capabilities.V1.xml#L719)|Boolean|Supports $filter with modification requests
[SearchSupported](Org.OData.Capabilities.V1.xml#L722)|Boolean|Supports $search with modification requests
[SortSupported](Org.OData.Capabilities.V1.xml#L725)|Boolean|Supports $orderby with modification requests

## <a name="ReadRestrictionsType"></a>[ReadRestrictionsType](Org.OData.Capabilities.V1.xml#L734)


Property|Type|Description
:-------|:---|:----------
[Readable](Org.OData.Capabilities.V1.xml#L735)|Boolean|Entities can be retrieved<p>This is only meaningful if the annotation is applied to an entity set or singleton.</p>
[CustomHeaders](Org.OData.Capabilities.V1.xml#L740)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L743)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options

## <a name="CustomParameter"></a>[CustomParameter](Org.OData.Capabilities.V1.xml#L811)
A custom parameter is either a header or a query option

The type of a custom parameter is always a string. Restrictions on the parameter values can be expressed by annotating the record expression describing the parameter with terms from the Validation vocabulary, e.g. Validation.Pattern or Validation.AllowedValues.

Property|Type|Description
:-------|:---|:----------
[Name](Org.OData.Capabilities.V1.xml#L815)|String|Name of the custom parameter
[Description](Org.OData.Capabilities.V1.xml#L818)|String|Description of the custom parameter
[DocumentationURL](Org.OData.Capabilities.V1.xml#L821)|URL|URL of related documentation
[Required](Org.OData.Capabilities.V1.xml#L825)|Boolean|true: parameter is required, false or not specified: parameter is optional
[ExampleValues](Org.OData.Capabilities.V1.xml#L828)|\[[PrimitiveExampleValue](Org.OData.Core.V1.md#PrimitiveExampleValue)\]|Example values for the custom parameter
