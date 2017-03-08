# Capabilities Vocabulary
**Namespace: [Org.OData.Capabilities.V1](Org.OData.Capabilities.V1.xml)**

Terms describing capabilities of a service

There are some capabilities which are strongly recommended for services to support even
though they are optional. Support for $top and $skip is a good example as
supporting these query options helps with performance of a service and are essential. Such
capabilities are assumed to be default capabilities of an OData service even in
the case that a capabilities annotation doesn&rsquo;t exist. Capabilities annotations are
mainly expected to be used to explicitly specify that a service doesn&rsquo;t support such
capabilities. Capabilities annotations can as well be used to declaratively
specify the support of such capabilities.

On the other hand, there are some capabilities that a service may choose to support or
not support and in varying degrees. $filter and $orderby are such good examples.
This vocabulary aims to define terms to specify support or no support for such
capabilities.

A service is assumed to support by default the following capabilities even though an
annotation doesn&rsquo;t exist:
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
        

Term|Type|Description
:---|:---|:----------
[ConformanceLevel](Org.OData.Capabilities.V1.xml#L105)|[ConformanceLevelType](#ConformanceLevelType)|<a name="ConformanceLevel"></a>The conformance level achieved by this service
[SupportedFormats](Org.OData.Capabilities.V1.xml#L122)|\[MediaType\]|<a name="SupportedFormats"></a>Media types of supported formats, including format parameters
[SupportedMetadataFormats](Org.OData.Capabilities.V1.xml#L127)|\[MediaType\]|<a name="SupportedMetadataFormats"></a>Media types of supported formats for $metadata, including format parameters
[AcceptableEncodings](Org.OData.Capabilities.V1.xml#L132)|\[String\]|<a name="AcceptableEncodings"></a>List of acceptable compression methods for ($batch) requests, e.g. gzip
[AsynchronousRequestsSupported](Org.OData.Capabilities.V1.xml#L138)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AsynchronousRequestsSupported"></a>Service supports the asynchronous request preference
[BatchContinueOnErrorSupported](Org.OData.Capabilities.V1.xml#L142)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchContinueOnErrorSupported"></a>Service supports the continue on error preference. Supports $batch requests. Services that apply the BatchContinueOnErrorSupported term should also specify the ContinueOnErrorSupported property from the BatchSupport term.
[IsolationSupported](Org.OData.Capabilities.V1.xml#L147)|[IsolationLevel](#IsolationLevel)|<a name="IsolationSupported"></a>Supported odata.isolation levels
[CrossJoinSupported](Org.OData.Capabilities.V1.xml#L157)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="CrossJoinSupported"></a>Supports cross joins for the entity sets in this container
[CallbackSupported](Org.OData.Capabilities.V1.xml#L161)|[CallbackType](#CallbackType)|<a name="CallbackSupported"></a>Supports callbacks for the specified protocols
[ChangeTracking](Org.OData.Capabilities.V1.xml#L185)|[ChangeTrackingType](#ChangeTrackingType)|<a name="ChangeTracking"></a>Change tracking capabilities of this service or entity set
[CountRestrictions](Org.OData.Capabilities.V1.xml#L202)|[CountRestrictionsType](#CountRestrictionsType)|<a name="CountRestrictions"></a>Restrictions on /$count path suffix and $count=true system query option
[NavigationRestrictions](Org.OData.Capabilities.V1.xml#L217)|[NavigationRestrictionsType](#NavigationRestrictionsType)|<a name="NavigationRestrictions"></a>Restrictions on navigating properties according to OData URL conventions
[IndexableByKey](Org.OData.Capabilities.V1.xml#L248)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="IndexableByKey"></a>Supports key values according to OData URL conventions
[TopSupported](Org.OData.Capabilities.V1.xml#L252)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="TopSupported"></a>Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L255)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="SkipSupported"></a>Supports $skip
[BatchSupported](Org.OData.Capabilities.V1.xml#L259)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchSupported"></a>Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.
[BatchSupport](Org.OData.Capabilities.V1.xml#L264)|[BatchSupportType](#BatchSupportType)|<a name="BatchSupport"></a>Batch Support for the service
[FilterFunctions](Org.OData.Capabilities.V1.xml#L285)|\[String\]|<a name="FilterFunctions"></a>List of functions and operators supported in $filter
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L289)|[FilterRestrictionsType](#FilterRestrictionsType)|<a name="FilterRestrictions"></a>Restrictions on $filter expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L344)|[SortRestrictionsType](#SortRestrictionsType)|<a name="SortRestrictions"></a>Restrictions on $orderby expressions
[ExpandRestrictions](Org.OData.Capabilities.V1.xml#L362)|[ExpandRestrictionsType](#ExpandRestrictionsType)|<a name="ExpandRestrictions"></a>Restrictions on $expand expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L374)|[SearchRestrictionsType](#SearchRestrictionsType)|<a name="SearchRestrictions"></a>Restrictions on $search expressions
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L408)|[InsertRestrictionsType](#InsertRestrictionsType)|<a name="InsertRestrictions"></a>Restrictions on insert operations
[DeepInsertSupport](Org.OData.Capabilities.V1.xml#L420)|[DeepInsertSupportType](#DeepInsertSupportType)|<a name="DeepInsertSupport"></a>Deep Insert Support for the service
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L433)|[UpdateRestrictionsType](#UpdateRestrictionsType)|<a name="UpdateRestrictions"></a>Restrictions on update operations
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L445)|[DeleteRestrictionsType](#DeleteRestrictionsType)|<a name="DeleteRestrictions"></a>Restrictions on delete operations

## <a name="ConformanceLevelType"></a>[ConformanceLevelType](Org.OData.Capabilities.V1.xml#L108)


Member|Value|Description
:-----|----:|:----------
[Minimal](Org.OData.Capabilities.V1.xml#L109)|0|Minimal conformance level
[Intermediate](Org.OData.Capabilities.V1.xml#L112)|1|Intermediate conformance level
[Advanced](Org.OData.Capabilities.V1.xml#L115)|2|Advanced conformance level

## <a name="IsolationLevel"></a>[IsolationLevel](Org.OData.Capabilities.V1.xml#L150)


Flag Member|Value|Description
:-----|----:|:----------
[Snapshot](Org.OData.Capabilities.V1.xml#L151)|1|All data returned for a request, including multiple requests within a batch or results retrieved across multiple pages, will be consistent as of a single point in time

## <a name="CallbackType"></a>[CallbackType](Org.OData.Capabilities.V1.xml#L164)
A non-empty collection lists the full set of supported protocols. A empty collection means 'only HTTP is supported'

Property|Type|Description
:-------|:---|:----------
[CallbackProtocols](Org.OData.Capabilities.V1.xml#L165)|\[[CallbackProtocol](#CallbackProtocol)\]|List of supported callback protocols, e.g. `http` or `wss`

## <a name="CallbackProtocol"></a>[CallbackProtocol](Org.OData.Capabilities.V1.xml#L171)


Property|Type|Description
:-------|:---|:----------
[Id](Org.OData.Capabilities.V1.xml#L172)|String|Protocol Identifier
[UrlTemplate](Org.OData.Capabilities.V1.xml#L175)|String|URL Template including parameters. Parameters are enclosed in curly braces {} as defined in RFC6570
[DocumentationUrl](Org.OData.Capabilities.V1.xml#L179)|URL|Human readable description of the meaning of the URL Template parameters

## <a name="ChangeTrackingType"></a>[ChangeTrackingType](Org.OData.Capabilities.V1.xml#L188)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L189)|Boolean|This entity set supports the odata.track-changes preference
[FilterableProperties](Org.OData.Capabilities.V1.xml#L192)|\[PropertyPath\]|Change tracking supports filters on these properties
[ExpandableProperties](Org.OData.Capabilities.V1.xml#L195)|\[NavigationPropertyPath\]|Change tracking supports these properties expanded

## <a name="CountRestrictionsType"></a>[CountRestrictionsType](Org.OData.Capabilities.V1.xml#L205)


Property|Type|Description
:-------|:---|:----------
[Countable](Org.OData.Capabilities.V1.xml#L206)|Boolean|Entities can be counted
[NonCountableProperties](Org.OData.Capabilities.V1.xml#L209)|\[PropertyPath\]|These collection properties do not allow /$count segments
[NonCountableNavigationProperties](Org.OData.Capabilities.V1.xml#L212)|\[NavigationPropertyPath\]|These navigation properties do not allow /$count segments

## <a name="NavigationRestrictionsType"></a>[NavigationRestrictionsType](Org.OData.Capabilities.V1.xml#L220)


Property|Type|Description
:-------|:---|:----------
[Navigability](Org.OData.Capabilities.V1.xml#L221)|[NavigationType](#NavigationType)|Supported Navigability
[RestrictedProperties](Org.OData.Capabilities.V1.xml#L224)|\[[NavigationPropertyRestriction](#NavigationPropertyRestriction)\]|List of navigation properties with restrictions

## <a name="NavigationPropertyRestriction"></a>[NavigationPropertyRestriction](Org.OData.Capabilities.V1.xml#L228)


Property|Type|Description
:-------|:---|:----------
[NavigationProperty](Org.OData.Capabilities.V1.xml#L229)|NavigationPropertyPath|Navigation properties can be navigated
[Navigability](Org.OData.Capabilities.V1.xml#L232)|[NavigationType](#NavigationType)|Navigation properties can be navigated to this level

## <a name="NavigationType"></a>[NavigationType](Org.OData.Capabilities.V1.xml#L236)


Member|Value|Description
:-----|----:|:----------
[Recursive](Org.OData.Capabilities.V1.xml#L237)|0|Navigation properties can be recursively navigated
[Single](Org.OData.Capabilities.V1.xml#L240)|1|Navigation properties can be navigated to a single level
[None](Org.OData.Capabilities.V1.xml#L243)|2|Navigation properties are not navigable

## <a name="BatchSupportType"></a>[BatchSupportType](Org.OData.Capabilities.V1.xml#L267)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L268)|Boolean|Service supports requests to $batch
[ContinueOnErrorSupported](Org.OData.Capabilities.V1.xml#L271)|Boolean|Service supports the continue on error preference
[ReferencesInRequestBodiesSupported](Org.OData.Capabilities.V1.xml#L274)|Boolean|Service supports Content-ID referencing in request bodies
[ReferencesAcrossChangeSetsSupported](Org.OData.Capabilities.V1.xml#L277)|Boolean|Service supports Content-ID referencing across change sets
[EtagReferencesSupported](Org.OData.Capabilities.V1.xml#L280)|Boolean|Service supports referencing Etags from previous requests

## <a name="FilterRestrictionsType"></a>[FilterRestrictionsType](Org.OData.Capabilities.V1.xml#L292)


Property|Type|Description
:-------|:---|:----------
[Filterable](Org.OData.Capabilities.V1.xml#L293)|Boolean|$filter is supported
[RequiresFilter](Org.OData.Capabilities.V1.xml#L296)|Boolean|$filter is required
[RequiredProperties](Org.OData.Capabilities.V1.xml#L299)|\[PropertyPath\]|These properties must be specified in the $filter clause (properties of derived types are not allowed here)
[NonFilterableProperties](Org.OData.Capabilities.V1.xml#L303)|\[AnyPropertyPath\]|These structural or navigation properties cannot be used in $filter expressions
[FilterExpressionRestrictions](Org.OData.Capabilities.V1.xml#L308)|\[[FilterExpressionRestrictionType](#FilterExpressionRestrictionType)\]|These properties only allow a subset of expressions

## <a name="FilterExpressionRestrictionType"></a>[FilterExpressionRestrictionType](Org.OData.Capabilities.V1.xml#L312)


Property|Type|Description
:-------|:---|:----------
[Property](Org.OData.Capabilities.V1.xml#L313)|PropertyPath|Path to the restricted property
[AllowedExpressions](Org.OData.Capabilities.V1.xml#L316)|[FilterExpressionType](#FilterExpressionType)|Allowed subset of expressions

## <a name="FilterExpressionType"></a>[FilterExpressionType](Org.OData.Capabilities.V1.xml#L320)
**Type:** String


Allowed Value|Description
:------------|:----------
[SingleValue](Org.OData.Capabilities.V1.xml#L323)|Property can be used in a single eq clause
[MultiValue](Org.OData.Capabilities.V1.xml#L327)|Property can be used in a single in clause
[SingleRange](Org.OData.Capabilities.V1.xml#L331)|Property can be used in at most one ge and/or one le clause, separated by and
[SearchExpression](Org.OData.Capabilities.V1.xml#L335)|String property can be used as first operand in startswith, endswith, and contains clauses

## <a name="SortRestrictionsType"></a>[SortRestrictionsType](Org.OData.Capabilities.V1.xml#L347)


Property|Type|Description
:-------|:---|:----------
[Sortable](Org.OData.Capabilities.V1.xml#L348)|Boolean|$orderby is supported
[AscendingOnlyProperties](Org.OData.Capabilities.V1.xml#L351)|\[PropertyPath\]|These properties can only be used for sorting in Ascending order
[DescendingOnlyProperties](Org.OData.Capabilities.V1.xml#L354)|\[PropertyPath\]|These properties can only be used for sorting in Descending order
[NonSortableProperties](Org.OData.Capabilities.V1.xml#L357)|\[AnyPropertyPath\]|These structural or navigation properties cannot be used in $orderby expressions

## <a name="ExpandRestrictionsType"></a>[ExpandRestrictionsType](Org.OData.Capabilities.V1.xml#L365)


Property|Type|Description
:-------|:---|:----------
[Expandable](Org.OData.Capabilities.V1.xml#L366)|Boolean|$expand is supported
[NonExpandableProperties](Org.OData.Capabilities.V1.xml#L369)|\[NavigationPropertyPath\]|These properties cannot be used in $expand expressions

## <a name="SearchRestrictionsType"></a>[SearchRestrictionsType](Org.OData.Capabilities.V1.xml#L377)


Property|Type|Description
:-------|:---|:----------
[Searchable](Org.OData.Capabilities.V1.xml#L378)|Boolean|$search is supported
[UnsupportedExpressions](Org.OData.Capabilities.V1.xml#L381)|[SearchExpressions](#SearchExpressions)|Expressions not supported in $search

## <a name="SearchExpressions"></a>[SearchExpressions](Org.OData.Capabilities.V1.xml#L385)


Flag Member|Value|Description
:-----|----:|:----------
[none](Org.OData.Capabilities.V1.xml#L386)|0|Single search term
[AND](Org.OData.Capabilities.V1.xml#L389)|1|Multiple search terms separated by AND
[OR](Org.OData.Capabilities.V1.xml#L392)|2|Multiple search terms separated by OR
[NOT](Org.OData.Capabilities.V1.xml#L395)|4|Search terms preceded by NOT
[phrase](Org.OData.Capabilities.V1.xml#L398)|8|Search phrases enclosed in double quotes
[group](Org.OData.Capabilities.V1.xml#L401)|16|Precedence grouping of search expressions with parentheses

## <a name="InsertRestrictionsType"></a>[InsertRestrictionsType](Org.OData.Capabilities.V1.xml#L411)


Property|Type|Description
:-------|:---|:----------
[Insertable](Org.OData.Capabilities.V1.xml#L412)|Boolean|Entities can be inserted
[NonInsertableNavigationProperties](Org.OData.Capabilities.V1.xml#L415)|\[NavigationPropertyPath\]|These navigation properties do not allow deep inserts

## <a name="DeepInsertSupportType"></a>[DeepInsertSupportType](Org.OData.Capabilities.V1.xml#L423)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L424)|Boolean|Service supports deep inserts
[ContentIDSupported](Org.OData.Capabilities.V1.xml#L427)|Boolean|Service supports accepting and returning nested entities annotated with the contentID instance annotation.

## <a name="UpdateRestrictionsType"></a>[UpdateRestrictionsType](Org.OData.Capabilities.V1.xml#L436)


Property|Type|Description
:-------|:---|:----------
[Updatable](Org.OData.Capabilities.V1.xml#L437)|Boolean|Entities can be updated
[NonUpdatableNavigationProperties](Org.OData.Capabilities.V1.xml#L440)|\[NavigationPropertyPath\]|These navigation properties do not allow rebinding

## <a name="DeleteRestrictionsType"></a>[DeleteRestrictionsType](Org.OData.Capabilities.V1.xml#L448)


Property|Type|Description
:-------|:---|:----------
[Deletable](Org.OData.Capabilities.V1.xml#L449)|Boolean|Entities can be deleted
[NonDeletableNavigationProperties](Org.OData.Capabilities.V1.xml#L452)|\[NavigationPropertyPath\]|These navigation properties do not allow DeleteLink requests
