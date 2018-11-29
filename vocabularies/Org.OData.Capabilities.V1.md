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
[CountRestrictions](Org.OData.Capabilities.V1.xml#L214)|[CountRestrictionsType](#CountRestrictionsType)|<a name="CountRestrictions"></a>Restrictions on /$count path suffix and $count=true system query option
[NavigationRestrictions](Org.OData.Capabilities.V1.xml#L229)|[NavigationRestrictionsType](#NavigationRestrictionsType)|<a name="NavigationRestrictions"></a>Restrictions on navigating properties according to OData URL conventions<p>Restrictions specified on an entity set are valid whether the request is directly to the entity set or through a navigation property bound to that entity set. Services can specify a different set of restrictions specific to a path, in which case the more specific restrictions take precedence.</p>
[IndexableByKey](Org.OData.Capabilities.V1.xml#L301)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="IndexableByKey"></a>Supports key values according to OData URL conventions
[TopSupported](Org.OData.Capabilities.V1.xml#L305)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="TopSupported"></a>Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L308)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="SkipSupported"></a>Supports $skip
[BatchSupported](Org.OData.Capabilities.V1.xml#L312)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchSupported"></a>Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.
[BatchSupport](Org.OData.Capabilities.V1.xml#L317)|[BatchSupportType](#BatchSupportType)|<a name="BatchSupport"></a>Batch Support for the service
[FilterFunctions](Org.OData.Capabilities.V1.xml#L359)|\[String\]|<a name="FilterFunctions"></a>List of functions and operators supported in $filter
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L363)|[FilterRestrictionsType](#FilterRestrictionsType)|<a name="FilterRestrictions"></a>Restrictions on filter expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L438)|[SortRestrictionsType](#SortRestrictionsType)|<a name="SortRestrictions"></a>Restrictions on orderby expressions
[ExpandRestrictions](Org.OData.Capabilities.V1.xml#L456)|[ExpandRestrictionsType](#ExpandRestrictionsType)|<a name="ExpandRestrictions"></a>Restrictions on expand expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L472)|[SearchRestrictionsType](#SearchRestrictionsType)|<a name="SearchRestrictions"></a>Restrictions on search expressions
[KeyAsSegmentSupported](Org.OData.Capabilities.V1.xml#L504)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="KeyAsSegmentSupported"></a>Supports [key-as-segment convention](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_KeyasSegmentConvention) for addressing entities within a collection
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L511)|[InsertRestrictionsType](#InsertRestrictionsType)|<a name="InsertRestrictions"></a>Restrictions on insert operations
[DeepInsertSupport](Org.OData.Capabilities.V1.xml#L530)|[DeepInsertSupportType](#DeepInsertSupportType)|<a name="DeepInsertSupport"></a>Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L544)|[UpdateRestrictionsType](#UpdateRestrictionsType)|<a name="UpdateRestrictions"></a>Restrictions on update operations
[DeepUpdateSupport](Org.OData.Capabilities.V1.xml#L563)|[DeepUpdateSupportType](#DeepUpdateSupportType)|<a name="DeepUpdateSupport"></a>Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L577)|[DeleteRestrictionsType](#DeleteRestrictionsType)|<a name="DeleteRestrictions"></a>Restrictions on delete operations
[CollectionPropertyRestrictions](Org.OData.Capabilities.V1.xml#L595)|\[[CollectionPropertyRestrictionsType](#CollectionPropertyRestrictionsType)\]|<a name="CollectionPropertyRestrictions"></a>Describes restrictions on operations applied to collection-valued structural properties
[AnnotationValuesInQuerySupported](Org.OData.Capabilities.V1.xml#L633)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AnnotationValuesInQuerySupported"></a>Supports annotation values within system query options
[ModificationQueryOptions](Org.OData.Capabilities.V1.xml#L639)|[ModificationQueryOptionsType](#ModificationQueryOptionsType)|<a name="ModificationQueryOptions"></a>Support for query options with modification requests (insert, update, action invocation)

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
[FilterableProperties](Org.OData.Capabilities.V1.xml#L204)|\[PropertyPath\]|Change tracking supports filters on these properties
[ExpandableProperties](Org.OData.Capabilities.V1.xml#L207)|\[NavigationPropertyPath\]|Change tracking supports these properties expanded

## <a name="CountRestrictionsType"></a>[CountRestrictionsType](Org.OData.Capabilities.V1.xml#L217)


Property|Type|Description
:-------|:---|:----------
[Countable](Org.OData.Capabilities.V1.xml#L218)|Boolean|Entities can be counted
[NonCountableProperties](Org.OData.Capabilities.V1.xml#L221)|\[PropertyPath\]|These collection properties do not allow /$count segments
[NonCountableNavigationProperties](Org.OData.Capabilities.V1.xml#L224)|\[NavigationPropertyPath\]|These navigation properties do not allow /$count segments

## <a name="NavigationRestrictionsType"></a>[NavigationRestrictionsType](Org.OData.Capabilities.V1.xml#L234)


Property|Type|Description
:-------|:---|:----------
[Navigability](Org.OData.Capabilities.V1.xml#L235)|[NavigationType](#NavigationType)|Supported Navigability
[RestrictedProperties](Org.OData.Capabilities.V1.xml#L238)|\[[NavigationPropertyRestriction](#NavigationPropertyRestriction)\]|List of navigation properties with restrictions

## <a name="NavigationPropertyRestriction"></a>[NavigationPropertyRestriction](Org.OData.Capabilities.V1.xml#L242)


Property|Type|Description
:-------|:---|:----------
[NavigationProperty](Org.OData.Capabilities.V1.xml#L243)|NavigationPropertyPath|Navigation properties can be navigated
[Navigability](Org.OData.Capabilities.V1.xml#L246)|[NavigationType](#NavigationType)|Navigation properties can be navigated to this level
[FilterFunctions](Org.OData.Capabilities.V1.xml#L249)|\[String\]|List of functions and operators supported in filter expressions. If null, all functions and operators may be attempted.
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L253)|[FilterRestrictionsType](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L256)|[SearchRestrictionsType](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L259)|[SortRestrictionsType](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](Org.OData.Capabilities.V1.xml#L262)|[Tag](Org.OData.Core.V1.md#Tag)|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L265)|[Tag](Org.OData.Core.V1.md#Tag)|Supports $skip
[IndexableByKey](Org.OData.Capabilities.V1.xml#L268)|[Tag](Org.OData.Core.V1.md#Tag)|Supports key values according to OData URL conventions
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L271)|[InsertRestrictionsType](#InsertRestrictionsType)|Restrictions on insert operations
[DeepInsertSupport](Org.OData.Capabilities.V1.xml#L274)|[DeepInsertSupportType](#DeepInsertSupportType)|Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L278)|[UpdateRestrictionsType](#UpdateRestrictionsType)|Restrictions on update operations
[DeepUpdateSupport](Org.OData.Capabilities.V1.xml#L281)|[DeepUpdateSupportType](#DeepUpdateSupportType)|Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L285)|[DeleteRestrictionsType](#DeleteRestrictionsType)|Restrictions on delete operations

## <a name="NavigationType"></a>[NavigationType](Org.OData.Capabilities.V1.xml#L289)


Member|Value|Description
:-----|----:|:----------
[Recursive](Org.OData.Capabilities.V1.xml#L290)|0|Navigation properties can be recursively navigated
[Single](Org.OData.Capabilities.V1.xml#L293)|1|Navigation properties can be navigated to a single level
[None](Org.OData.Capabilities.V1.xml#L296)|2|Navigation properties are not navigable

## <a name="BatchSupportType"></a>[BatchSupportType](Org.OData.Capabilities.V1.xml#L320)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L321)|Boolean|Service supports requests to $batch
[ContinueOnErrorSupported](Org.OData.Capabilities.V1.xml#L324)|Boolean|Service supports the continue on error preference
[ReferencesInRequestBodiesSupported](Org.OData.Capabilities.V1.xml#L327)|Boolean|Service supports Content-ID referencing in request bodies
[ReferencesAcrossChangeSetsSupported](Org.OData.Capabilities.V1.xml#L330)|Boolean|Service supports Content-ID referencing across change sets
[EtagReferencesSupported](Org.OData.Capabilities.V1.xml#L333)|Boolean|Service supports referencing Etags from previous requests
[RequestDependencyConditionsSupported](Org.OData.Capabilities.V1.xml#L336)|Boolean|Service supports the `if` member in JSON batch requests
[SupportedFormats](Org.OData.Capabilities.V1.xml#L339)|\[MediaType\]|Media types of supported formats for $batch

## <a name="FilterRestrictionsType"></a>[FilterRestrictionsType](Org.OData.Capabilities.V1.xml#L366)


Property|Type|Description
:-------|:---|:----------
[Filterable](Org.OData.Capabilities.V1.xml#L367)|Boolean|$filter is supported
[RequiresFilter](Org.OData.Capabilities.V1.xml#L370)|Boolean|$filter is required
[RequiredProperties](Org.OData.Capabilities.V1.xml#L373)|\[PropertyPath\]|These properties must be specified in the $filter clause (properties of derived types are not allowed here)
[NonFilterableProperties](Org.OData.Capabilities.V1.xml#L377)|\[PropertyPath\]|These structural properties cannot be used in filter expressions
[FilterExpressionRestrictions](Org.OData.Capabilities.V1.xml#L382)|\[[FilterExpressionRestrictionType](#FilterExpressionRestrictionType)\]|These properties only allow a subset of filter expressions. A valid filter expression for a single property can be enclosed in parentheses and combined by `and` with valid expressions for other properties.
[MaxLevels](Org.OData.Capabilities.V1.xml#L386)|Int32|The maximum number of levels (including recursion) that can be traversed in a filter expression. A value of -1 indicates there is no restriction.

## <a name="FilterExpressionRestrictionType"></a>[FilterExpressionRestrictionType](Org.OData.Capabilities.V1.xml#L391)


Property|Type|Description
:-------|:---|:----------
[Property](Org.OData.Capabilities.V1.xml#L392)|PropertyPath|Path to the restricted property
[AllowedExpressions](Org.OData.Capabilities.V1.xml#L395)|[FilterExpressionType](#FilterExpressionType)|Allowed subset of expressions

## <a name="FilterExpressionType"></a>[FilterExpressionType](Org.OData.Capabilities.V1.xml#L399)
**Type:** String



Allowed Value|Description
:------------|:----------
[SingleValue](Org.OData.Capabilities.V1.xml#L402)|Property can be used in a single `eq` clause
[MultiValue](Org.OData.Capabilities.V1.xml#L406)|Property can be used in a single `in` clause
[SingleRange](Org.OData.Capabilities.V1.xml#L410)|Property can be used in at most one `ge` and/or one `le` clause, separated by `and`
[SearchExpression](Org.OData.Capabilities.V1.xml#L415)|String property can be used as first operand in `startswith`, `endswith`, and `contains` clauses
[MultiRange](Org.OData.Capabilities.V1.xml#L420)|Property can be compared to a union of one or more closed, half-open, or open intervals<p>The filter expression for this property consists of one or more interval expressions combined by `or`. A single interval expression is either a single comparison of the property and a literal value with `eq`, `le`, `lt`, `ge`, or `gt`, or pair of boundaries combined by `and` and enclosed in parentheses. The lower boundary is either `ge` or `gt`, the upper boundary either `le` or `lt`.</p>
[MultiRangeOrSearchExpression](Org.OData.Capabilities.V1.xml#L427)|Property can be compared to a union of zero or more closed, half-open, or open intervals plus zero or more simple string patterns<p>The filter expression for this property consists of one or more interval expressions or string comparison functions combined by `or`. See MultiRange for a definition of an interval expression. See SearchExpression for the allowed string comparison functions.</p>

## <a name="SortRestrictionsType"></a>[SortRestrictionsType](Org.OData.Capabilities.V1.xml#L441)


Property|Type|Description
:-------|:---|:----------
[Sortable](Org.OData.Capabilities.V1.xml#L442)|Boolean|$orderby is supported
[AscendingOnlyProperties](Org.OData.Capabilities.V1.xml#L445)|\[PropertyPath\]|These properties can only be used for sorting in Ascending order
[DescendingOnlyProperties](Org.OData.Capabilities.V1.xml#L448)|\[PropertyPath\]|These properties can only be used for sorting in Descending order
[NonSortableProperties](Org.OData.Capabilities.V1.xml#L451)|\[PropertyPath\]|These structural properties cannot be used in orderby expressions

## <a name="ExpandRestrictionsType"></a>[ExpandRestrictionsType](Org.OData.Capabilities.V1.xml#L459)


Property|Type|Description
:-------|:---|:----------
[Expandable](Org.OData.Capabilities.V1.xml#L460)|Boolean|$expand is supported
[NonExpandableProperties](Org.OData.Capabilities.V1.xml#L463)|\[NavigationPropertyPath\]|These properties cannot be used in expand expressions
[MaxLevels](Org.OData.Capabilities.V1.xml#L466)|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.

## <a name="SearchRestrictionsType"></a>[SearchRestrictionsType](Org.OData.Capabilities.V1.xml#L475)


Property|Type|Description
:-------|:---|:----------
[Searchable](Org.OData.Capabilities.V1.xml#L476)|Boolean|$search is supported
[UnsupportedExpressions](Org.OData.Capabilities.V1.xml#L479)|[SearchExpressions](#SearchExpressions)|Expressions not supported in $search

## <a name="SearchExpressions"></a>[SearchExpressions](Org.OData.Capabilities.V1.xml#L483)


Flag Member|Value|Description
:-----|----:|:----------
[none](Org.OData.Capabilities.V1.xml#L484)|0|Single search term
[AND](Org.OData.Capabilities.V1.xml#L487)|1|Multiple search terms separated by `AND`
[OR](Org.OData.Capabilities.V1.xml#L490)|2|Multiple search terms separated by `OR`
[NOT](Org.OData.Capabilities.V1.xml#L493)|4|Search terms preceded by `NOT`
[phrase](Org.OData.Capabilities.V1.xml#L496)|8|Search phrases enclosed in double quotes
[group](Org.OData.Capabilities.V1.xml#L499)|16|Precedence grouping of search expressions with parentheses

## <a name="InsertRestrictionsType"></a>[InsertRestrictionsType](Org.OData.Capabilities.V1.xml#L514)


Property|Type|Description
:-------|:---|:----------
[Insertable](Org.OData.Capabilities.V1.xml#L515)|Boolean|Entities can be inserted
[NonInsertableNavigationProperties](Org.OData.Capabilities.V1.xml#L518)|\[NavigationPropertyPath\]|These navigation properties do not allow deep inserts
[MaxLevels](Org.OData.Capabilities.V1.xml#L521)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to insert into. A value of -1 indicates there is no restriction.
[QueryOptions](Org.OData.Capabilities.V1.xml#L525)|[ModificationQueryOptionsType](#ModificationQueryOptionsType)|Support for query options with insert requests

## <a name="DeepInsertSupportType"></a>[DeepInsertSupportType](Org.OData.Capabilities.V1.xml#L534)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L535)|Boolean|Annotation target supports deep inserts
[ContentIDSupported](Org.OData.Capabilities.V1.xml#L538)|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

## <a name="UpdateRestrictionsType"></a>[UpdateRestrictionsType](Org.OData.Capabilities.V1.xml#L547)


Property|Type|Description
:-------|:---|:----------
[Updatable](Org.OData.Capabilities.V1.xml#L548)|Boolean|Entities can be updated
[NonUpdatableNavigationProperties](Org.OData.Capabilities.V1.xml#L551)|\[NavigationPropertyPath\]|These navigation properties do not allow rebinding
[MaxLevels](Org.OData.Capabilities.V1.xml#L554)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection or entity to update. A value of -1 indicates there is no restriction.
[QueryOptions](Org.OData.Capabilities.V1.xml#L558)|[ModificationQueryOptionsType](#ModificationQueryOptionsType)|Support for query options with update requests

## <a name="DeepUpdateSupportType"></a>[DeepUpdateSupportType](Org.OData.Capabilities.V1.xml#L567)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L568)|Boolean|Annotation target supports deep updates
[ContentIDSupported](Org.OData.Capabilities.V1.xml#L571)|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

## <a name="DeleteRestrictionsType"></a>[DeleteRestrictionsType](Org.OData.Capabilities.V1.xml#L580)


Property|Type|Description
:-------|:---|:----------
[Deletable](Org.OData.Capabilities.V1.xml#L581)|Boolean|Entities can be deleted
[NonDeletableNavigationProperties](Org.OData.Capabilities.V1.xml#L584)|\[NavigationPropertyPath\]|These navigation properties do not allow DeleteLink requests
[MaxLevels](Org.OData.Capabilities.V1.xml#L587)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to delete from or the entity to delete. A value of -1 indicates there is no restriction.

## <a name="CollectionPropertyRestrictionsType"></a>[CollectionPropertyRestrictionsType](Org.OData.Capabilities.V1.xml#L599)


Property|Type|Description
:-------|:---|:----------
[CollectionProperty](Org.OData.Capabilities.V1.xml#L600)|PropertyPath|Restricted Collection-valued property
[FilterFunctions](Org.OData.Capabilities.V1.xml#L603)|\[String\]|List of functions and operators supported in filter expressions. If null, all functions and operators may be attempted
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L607)|[FilterRestrictionsType](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L610)|[SearchRestrictionsType](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L613)|[SortRestrictionsType](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](Org.OData.Capabilities.V1.xml#L616)|[Tag](Org.OData.Core.V1.md#Tag)|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L619)|[Tag](Org.OData.Core.V1.md#Tag)|Supports $skip
[Insertable](Org.OData.Capabilities.V1.xml#L622)|Boolean|This collection supports positional inserts
[Updatable](Org.OData.Capabilities.V1.xml#L625)|Boolean|Members of this ordered collection can be updated by ordinal
[Deletable](Org.OData.Capabilities.V1.xml#L628)|Boolean|Members of this ordered collection can be deleted by ordinal

## <a name="ModificationQueryOptionsType"></a>[ModificationQueryOptionsType](Org.OData.Capabilities.V1.xml#L643)


Property|Type|Description
:-------|:---|:----------
[ExpandSupported](Org.OData.Capabilities.V1.xml#L644)|Boolean|Supports $expand with modification requests
[SelectSupported](Org.OData.Capabilities.V1.xml#L647)|Boolean|Supports $select with modification requests
[ComputeSupported](Org.OData.Capabilities.V1.xml#L650)|Boolean|Supports $compute with modification requests
[FilterSupported](Org.OData.Capabilities.V1.xml#L653)|Boolean|Supports $filter with modification requests
[SearchSupported](Org.OData.Capabilities.V1.xml#L656)|Boolean|Supports $search with modification requests
[SortSupported](Org.OData.Capabilities.V1.xml#L659)|Boolean|Supports $orderby with modification requests
