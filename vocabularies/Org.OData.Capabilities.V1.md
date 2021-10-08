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
[ConformanceLevel](./Org.OData.Capabilities.V1.xml#L115:~:text=<Term%20Name="-,ConformanceLevel,-")|[ConformanceLevelType](#ConformanceLevelType)|<a name="ConformanceLevel"></a>The conformance level achieved by this service
[SupportedFormats](./Org.OData.Capabilities.V1.xml#L132:~:text=<Term%20Name="-,SupportedFormats,-")|\[MediaType\]|<a name="SupportedFormats"></a>Media types of supported formats, including format parameters
[SupportedMetadataFormats](./Org.OData.Capabilities.V1.xml#L137:~:text=<Term%20Name="-,SupportedMetadataFormats,-")|\[MediaType\]|<a name="SupportedMetadataFormats"></a>Media types of supported formats for $metadata, including format parameters
[AcceptableEncodings](./Org.OData.Capabilities.V1.xml#L142:~:text=<Term%20Name="-,AcceptableEncodings,-")|\[String\]|<a name="AcceptableEncodings"></a>List of acceptable compression methods for ($batch) requests, e.g. gzip
[AsynchronousRequestsSupported](./Org.OData.Capabilities.V1.xml#L148:~:text=<Term%20Name="-,AsynchronousRequestsSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AsynchronousRequestsSupported"></a>Service supports the asynchronous request preference
[BatchContinueOnErrorSupported](./Org.OData.Capabilities.V1.xml#L152:~:text=<Term%20Name="-,BatchContinueOnErrorSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchContinueOnErrorSupported"></a>Service supports the continue on error preference. Supports $batch requests. Services that apply the BatchContinueOnErrorSupported term should also specify the ContinueOnErrorSupported property from the BatchSupport term.
[IsolationSupported](./Org.OData.Capabilities.V1.xml#L156:~:text=<Term%20Name="-,IsolationSupported,-")|[IsolationLevel](#IsolationLevel)|<a name="IsolationSupported"></a>Supported odata.isolation levels
[CrossJoinSupported](./Org.OData.Capabilities.V1.xml#L165:~:text=<Term%20Name="-,CrossJoinSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="CrossJoinSupported"></a>Supports cross joins for the entity sets in this container
[CallbackSupported](./Org.OData.Capabilities.V1.xml#L169:~:text=<Term%20Name="-,CallbackSupported,-")|[CallbackType](#CallbackType)|<a name="CallbackSupported"></a>Supports callbacks for the specified protocols
[ChangeTracking](./Org.OData.Capabilities.V1.xml#L191:~:text=<Term%20Name="-,ChangeTracking,-")|[ChangeTrackingType](#ChangeTrackingType)|<a name="ChangeTracking"></a>Change tracking capabilities of this service or entity set
[CountRestrictions](./Org.OData.Capabilities.V1.xml#L210:~:text=<Term%20Name="-,CountRestrictions,-")|[CountRestrictionsType](#CountRestrictionsType)|<a name="CountRestrictions"></a>Restrictions on /$count path suffix and $count=true system query option
[NavigationRestrictions](./Org.OData.Capabilities.V1.xml#L225:~:text=<Term%20Name="-,NavigationRestrictions,-")|[NavigationRestrictionsType](#NavigationRestrictionsType)|<a name="NavigationRestrictions"></a>Restrictions on navigating properties according to OData URL conventions<br>Restrictions specified on an entity set are valid whether the request is directly to the entity set or through a navigation property bound to that entity set. Services can specify a different set of restrictions specific to a path, in which case the more specific restrictions take precedence.
[IndexableByKey](./Org.OData.Capabilities.V1.xml#L364:~:text=<Term%20Name="-,IndexableByKey,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="IndexableByKey"></a>Supports key values according to OData URL conventions
[TopSupported](./Org.OData.Capabilities.V1.xml#L368:~:text=<Term%20Name="-,TopSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="TopSupported"></a>Supports $top
[SkipSupported](./Org.OData.Capabilities.V1.xml#L372:~:text=<Term%20Name="-,SkipSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="SkipSupported"></a>Supports $skip
[ComputeSupported](./Org.OData.Capabilities.V1.xml#L376:~:text=<Term%20Name="-,ComputeSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="ComputeSupported"></a>Supports $compute
[SelectSupport](./Org.OData.Capabilities.V1.xml#L380:~:text=<Term%20Name="-,SelectSupport,-")|[SelectSupportType](#SelectSupportType)|<a name="SelectSupport"></a>Support for $select and nested query options within $select
[BatchSupported](./Org.OData.Capabilities.V1.xml#L416:~:text=<Term%20Name="-,BatchSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchSupported"></a>Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.
[BatchSupport](./Org.OData.Capabilities.V1.xml#L420:~:text=<Term%20Name="-,BatchSupport,-")|[BatchSupportType](#BatchSupportType)|<a name="BatchSupport"></a>Batch Support for the service
[FilterFunctions](./Org.OData.Capabilities.V1.xml#L466:~:text=<Term%20Name="-,FilterFunctions,-")|\[String\]|<a name="FilterFunctions"></a>List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](./Org.OData.Capabilities.V1.xml#L471:~:text=<Term%20Name="-,FilterRestrictions,-")|[FilterRestrictionsType](#FilterRestrictionsType)|<a name="FilterRestrictions"></a>Restrictions on filter expressions
[SortRestrictions](./Org.OData.Capabilities.V1.xml#L540:~:text=<Term%20Name="-,SortRestrictions,-")|[SortRestrictionsType](#SortRestrictionsType)|<a name="SortRestrictions"></a>Restrictions on orderby expressions
[ExpandRestrictions](./Org.OData.Capabilities.V1.xml#L563:~:text=<Term%20Name="-,ExpandRestrictions,-")|[ExpandRestrictionsType](#ExpandRestrictionsType)|<a name="ExpandRestrictions"></a>Restrictions on expand expressions
[SearchRestrictions](./Org.OData.Capabilities.V1.xml#L590:~:text=<Term%20Name="-,SearchRestrictions,-")|[SearchRestrictionsType](#SearchRestrictionsType)|<a name="SearchRestrictions"></a>Restrictions on search expressions
[KeyAsSegmentSupported](./Org.OData.Capabilities.V1.xml#L627:~:text=<Term%20Name="-,KeyAsSegmentSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="KeyAsSegmentSupported"></a>Supports [key-as-segment convention](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_KeyasSegmentConvention) for addressing entities within a collection
[QuerySegmentSupported](./Org.OData.Capabilities.V1.xml#L631:~:text=<Term%20Name="-,QuerySegmentSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="QuerySegmentSupported"></a>Supports [passing query options in the request body](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_PassingQueryOptionsintheRequestBody)
[InsertRestrictions](./Org.OData.Capabilities.V1.xml#L637:~:text=<Term%20Name="-,InsertRestrictions,-")|[InsertRestrictionsType](#InsertRestrictionsType)|<a name="InsertRestrictions"></a>Restrictions on insert operations
[NavigationInsertRestrictions](./Org.OData.Capabilities.V1.xml#L641:~:text=<Term%20Name="-,NavigationInsertRestrictions,-")|\[[NavigationInsertRestrictionsType](#NavigationInsertRestrictionsType)\]|<a name="NavigationInsertRestrictions"></a>Restrictions on insertions into an entity collection addressed via a navigation property<br>The value of this annotation is a collection of entries that differ in their [`NavigationProperty`](#NavigationInsertRestrictionsType).
[DeepInsertSupport](./Org.OData.Capabilities.V1.xml#L723:~:text=<Term%20Name="-,DeepInsertSupport,-")|[DeepInsertSupportType?](#DeepInsertSupportType)|<a name="DeepInsertSupport"></a>Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](./Org.OData.Capabilities.V1.xml#L736:~:text=<Term%20Name="-,UpdateRestrictions,-")|[UpdateRestrictionsType](#UpdateRestrictionsType)|<a name="UpdateRestrictions"></a>Restrictions on update operations
[DeepUpdateSupport](./Org.OData.Capabilities.V1.xml#L817:~:text=<Term%20Name="-,DeepUpdateSupport,-")|[DeepUpdateSupportType](#DeepUpdateSupportType)|<a name="DeepUpdateSupport"></a>Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](./Org.OData.Capabilities.V1.xml#L830:~:text=<Term%20Name="-,DeleteRestrictions,-")|[DeleteRestrictionsType](#DeleteRestrictionsType)|<a name="DeleteRestrictions"></a>Restrictions on delete operations
[CollectionPropertyRestrictions](./Org.OData.Capabilities.V1.xml#L869:~:text=<Term%20Name="-,CollectionPropertyRestrictions,-")|\[[CollectionPropertyRestrictionsType](#CollectionPropertyRestrictionsType)\]|<a name="CollectionPropertyRestrictions"></a>Describes restrictions on operations applied to collection-valued structural properties
[OperationRestrictions](./Org.OData.Capabilities.V1.xml#L911:~:text=<Term%20Name="-,OperationRestrictions,-")|[OperationRestrictionsType](#OperationRestrictionsType)|<a name="OperationRestrictions"></a>Restrictions for function or action operation
[AnnotationValuesInQuerySupported](./Org.OData.Capabilities.V1.xml#L928:~:text=<Term%20Name="-,AnnotationValuesInQuerySupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AnnotationValuesInQuerySupported"></a>Supports annotation values within system query options
[ModificationQueryOptions](./Org.OData.Capabilities.V1.xml#L932:~:text=<Term%20Name="-,ModificationQueryOptions,-")|[ModificationQueryOptionsType](#ModificationQueryOptionsType)|<a name="ModificationQueryOptions"></a>Support for query options with modification requests (insert, update, action invocation)
[ReadRestrictions](./Org.OData.Capabilities.V1.xml#L956:~:text=<Term%20Name="-,ReadRestrictions,-")|[ReadRestrictionsType](#ReadRestrictionsType)|<a name="ReadRestrictions"></a>Restrictions for retrieving a collection of entities, retrieving a singleton instance.
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L992:~:text=<Term%20Name="-,CustomHeaders,-")|\[[CustomParameter](#CustomParameter)\]|<a name="CustomHeaders"></a>Custom headers that are supported/required for the annotated resource ([Example](./Org.OData.Capabilities.V1.xml#L994))
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L1018:~:text=<Term%20Name="-,CustomQueryOptions,-")|\[[CustomParameter](#CustomParameter)\]|<a name="CustomQueryOptions"></a>Custom query options that are supported/required for the annotated resource ([Example](./Org.OData.Capabilities.V1.xml#L1021))<br>If the entity container is annotated, the query option is supported/required by all resources in that container.
[MediaLocationUpdateSupported](./Org.OData.Capabilities.V1.xml#L1070:~:text=<Term%20Name="-,MediaLocationUpdateSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="MediaLocationUpdateSupported"></a>Stream property supports update of its media edit URL and/or media read URL

## <a name="ConformanceLevelType"></a>[ConformanceLevelType](./Org.OData.Capabilities.V1.xml#L118:~:text=<EnumType%20Name="-,ConformanceLevelType,-")


Member|Value|Description
:-----|----:|:----------
[Minimal](./Org.OData.Capabilities.V1.xml#L119:~:text=<EnumType%20Name="-,ConformanceLevelType,-")|0|Minimal conformance level
[Intermediate](./Org.OData.Capabilities.V1.xml#L122:~:text=<EnumType%20Name="-,ConformanceLevelType,-")|1|Intermediate conformance level
[Advanced](./Org.OData.Capabilities.V1.xml#L125:~:text=<EnumType%20Name="-,ConformanceLevelType,-")|2|Advanced conformance level

## <a name="IsolationLevel"></a>[IsolationLevel](./Org.OData.Capabilities.V1.xml#L159:~:text=<EnumType%20Name="-,IsolationLevel,-")


Flag Member|Value|Description
:-----|----:|:----------
[Snapshot](./Org.OData.Capabilities.V1.xml#L160:~:text=<EnumType%20Name="-,IsolationLevel,-")|1|All data returned for a request, including multiple requests within a batch or results retrieved across multiple pages, will be consistent as of a single point in time

## <a name="CallbackType"></a>[CallbackType](./Org.OData.Capabilities.V1.xml#L172:~:text=<ComplexType%20Name="-,CallbackType,-")
A non-empty collection lists the full set of supported protocols. A empty collection means 'only HTTP is supported'

Property|Type|Description
:-------|:---|:----------
[CallbackProtocols](./Org.OData.Capabilities.V1.xml#L173:~:text=<ComplexType%20Name="-,CallbackType,-")|\[[CallbackProtocol](#CallbackProtocol)\]|List of supported callback protocols, e.g. `http` or `wss`

## <a name="CallbackProtocol"></a>[CallbackProtocol](./Org.OData.Capabilities.V1.xml#L178:~:text=<ComplexType%20Name="-,CallbackProtocol,-")


Property|Type|Description
:-------|:---|:----------
[Id](./Org.OData.Capabilities.V1.xml#L179:~:text=<ComplexType%20Name="-,CallbackProtocol,-")|String?|Protocol Identifier
[UrlTemplate](./Org.OData.Capabilities.V1.xml#L182:~:text=<ComplexType%20Name="-,CallbackProtocol,-")|String?|URL Template including parameters. Parameters are enclosed in curly braces {} as defined in RFC6570
[DocumentationUrl](./Org.OData.Capabilities.V1.xml#L185:~:text=<ComplexType%20Name="-,CallbackProtocol,-")|URL?|Human readable description of the meaning of the URL Template parameters

## <a name="ChangeTrackingType"></a>[ChangeTrackingType](./Org.OData.Capabilities.V1.xml#L194:~:text=<ComplexType%20Name="-,ChangeTrackingType,-")


Property|Type|Description
:-------|:---|:----------
[Supported](./Org.OData.Capabilities.V1.xml#L195:~:text=<ComplexType%20Name="-,ChangeTrackingType,-")|Boolean|This entity set supports the odata.track-changes preference
[FilterableProperties](./Org.OData.Capabilities.V1.xml#L198:~:text=<ComplexType%20Name="-,ChangeTrackingType,-")|\[PropertyPath\]|Change tracking supports filters on these properties<br>If no properties are specified or FilterableProperties is omitted, clients cannot assume support for filtering on any properties in combination with change tracking.
[ExpandableProperties](./Org.OData.Capabilities.V1.xml#L202:~:text=<ComplexType%20Name="-,ChangeTrackingType,-")|\[NavigationPropertyPath\]|Change tracking supports these properties expanded<br>If no properties are specified or ExpandableProperties is omitted, clients cannot assume support for expanding any properties in combination with change tracking.

## <a name="CountRestrictionsType"></a>[CountRestrictionsType](./Org.OData.Capabilities.V1.xml#L213:~:text=<ComplexType%20Name="-,CountRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[Countable](./Org.OData.Capabilities.V1.xml#L214:~:text=<ComplexType%20Name="-,CountRestrictionsType,-")|Boolean|Entities can be counted (only valid if targeting an entity set)
[NonCountableProperties](./Org.OData.Capabilities.V1.xml#L217:~:text=<ComplexType%20Name="-,CountRestrictionsType,-")|\[PropertyPath\]|Members of these collection properties cannot be counted
[NonCountableNavigationProperties](./Org.OData.Capabilities.V1.xml#L220:~:text=<ComplexType%20Name="-,CountRestrictionsType,-")|\[NavigationPropertyPath\]|Members of these navigation properties cannot be counted

## <a name="NavigationRestrictionsType"></a>[NavigationRestrictionsType](./Org.OData.Capabilities.V1.xml#L229:~:text=<ComplexType%20Name="-,NavigationRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[Navigability](./Org.OData.Capabilities.V1.xml#L230:~:text=<ComplexType%20Name="-,NavigationRestrictionsType,-")|[NavigationType?](#NavigationType)|Default navigability for all navigation properties of the annotation target. Individual navigation properties can override this value via `RestrictedProperties/Navigability`.
[RestrictedProperties](./Org.OData.Capabilities.V1.xml#L233:~:text=<ComplexType%20Name="-,NavigationRestrictionsType,-")|\[[NavigationPropertyRestriction](#NavigationPropertyRestriction)\]|List of navigation properties with restrictions

## <a name="NavigationPropertyRestriction"></a>[NavigationPropertyRestriction](./Org.OData.Capabilities.V1.xml#L237:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")


Property|Type|Description
:-------|:---|:----------
[NavigationProperty](./Org.OData.Capabilities.V1.xml#L251:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|NavigationPropertyPath?|Navigation properties can be navigated
[Navigability](./Org.OData.Capabilities.V1.xml#L254:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|[NavigationType?](#NavigationType)|Supported navigability of this navigation property
[FilterFunctions](./Org.OData.Capabilities.V1.xml#L257:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|\[String\]|List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](./Org.OData.Capabilities.V1.xml#L261:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|[FilterRestrictionsType?](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](./Org.OData.Capabilities.V1.xml#L264:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](./Org.OData.Capabilities.V1.xml#L267:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|[SortRestrictionsType?](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](./Org.OData.Capabilities.V1.xml#L270:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|Boolean|Supports $top
[SkipSupported](./Org.OData.Capabilities.V1.xml#L273:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|Boolean|Supports $skip
[SelectSupport](./Org.OData.Capabilities.V1.xml#L276:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|[SelectSupportType?](#SelectSupportType)|Support for $select
[IndexableByKey](./Org.OData.Capabilities.V1.xml#L279:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|Boolean|Supports key values according to OData URL conventions
[InsertRestrictions](./Org.OData.Capabilities.V1.xml#L282:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-") *(Deprecated)*|[InsertRestrictionsType?](#InsertRestrictionsType)|Deprecated in favor of [`InsertRestrictions`](#InsertRestrictions)
[DeepInsertSupport](./Org.OData.Capabilities.V1.xml#L293:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-") *(Deprecated)*|[DeepInsertSupportType?](#DeepInsertSupportType)|Deprecated in favor of [`DeepInsertSupport`](#DeepInsertSupport)
[UpdateRestrictions](./Org.OData.Capabilities.V1.xml#L304:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-") *(Deprecated)*|[UpdateRestrictionsType?](#UpdateRestrictionsType)|Deprecated in favor of [`UpdateRestrictions`](#UpdateRestrictions)
[DeepUpdateSupport](./Org.OData.Capabilities.V1.xml#L315:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-") *(Deprecated)*|[DeepUpdateSupportType?](#DeepUpdateSupportType)|Deprecated in favor of [`DeepUpdateSupport`](#DeepUpdateSupport)
[DeleteRestrictions](./Org.OData.Capabilities.V1.xml#L326:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-") *(Deprecated)*|[DeleteRestrictionsType?](#DeleteRestrictionsType)|Deprecated in favor of [`DeleteRestrictions`](#DeleteRestrictions)
[OptimisticConcurrencyControl](./Org.OData.Capabilities.V1.xml#L337:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|Boolean|Data modification (including insert) along this navigation property requires the use of ETags
[ReadRestrictions](./Org.OData.Capabilities.V1.xml#L340:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-") *(Deprecated)*|[ReadRestrictionsType?](#ReadRestrictionsType)|Deprecated in favor of [`ReadRestrictions`](#ReadRestrictions)

## <a name="NavigationType"></a>[NavigationType](./Org.OData.Capabilities.V1.xml#L352:~:text=<EnumType%20Name="-,NavigationType,-")


Member|Value|Description
:-----|----:|:----------
[Recursive](./Org.OData.Capabilities.V1.xml#L353:~:text=<EnumType%20Name="-,NavigationType,-")|0|Navigation properties can be recursively navigated
[Single](./Org.OData.Capabilities.V1.xml#L356:~:text=<EnumType%20Name="-,NavigationType,-")|1|Navigation properties can be navigated to a single level
[None](./Org.OData.Capabilities.V1.xml#L359:~:text=<EnumType%20Name="-,NavigationType,-")|2|Navigation properties are not navigable

## <a name="SelectSupportType"></a>[SelectSupportType](./Org.OData.Capabilities.V1.xml#L383:~:text=<ComplexType%20Name="-,SelectSupportType,-")


Property|Type|Description
:-------|:---|:----------
[Supported](./Org.OData.Capabilities.V1.xml#L384:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|Supports $select
[InstanceAnnotationsSupported](./Org.OData.Capabilities.V1.xml#L387:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|Supports instance annotations in $select list
[Expandable](./Org.OData.Capabilities.V1.xml#L390:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|$expand within $select is supported
[Filterable](./Org.OData.Capabilities.V1.xml#L393:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|$filter within $select is supported
[Searchable](./Org.OData.Capabilities.V1.xml#L396:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|$search within $select is supported
[TopSupported](./Org.OData.Capabilities.V1.xml#L399:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|$top within $select is supported
[SkipSupported](./Org.OData.Capabilities.V1.xml#L402:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|$skip within $select is supported
[ComputeSupported](./Org.OData.Capabilities.V1.xml#L405:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|$compute within $select is supported
[Countable](./Org.OData.Capabilities.V1.xml#L408:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|$count within $select is supported
[Sortable](./Org.OData.Capabilities.V1.xml#L411:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|$orderby within $select is supported

## <a name="BatchSupportType"></a>[BatchSupportType](./Org.OData.Capabilities.V1.xml#L423:~:text=<ComplexType%20Name="-,BatchSupportType,-")


Property|Type|Description
:-------|:---|:----------
[Supported](./Org.OData.Capabilities.V1.xml#L430:~:text=<ComplexType%20Name="-,BatchSupportType,-")|Boolean|Service supports requests to $batch
[ContinueOnErrorSupported](./Org.OData.Capabilities.V1.xml#L433:~:text=<ComplexType%20Name="-,BatchSupportType,-")|Boolean|Service supports the continue on error preference
[ReferencesInRequestBodiesSupported](./Org.OData.Capabilities.V1.xml#L436:~:text=<ComplexType%20Name="-,BatchSupportType,-")|Boolean|Service supports Content-ID referencing in request bodies
[ReferencesAcrossChangeSetsSupported](./Org.OData.Capabilities.V1.xml#L439:~:text=<ComplexType%20Name="-,BatchSupportType,-")|Boolean|Service supports Content-ID referencing across change sets
[EtagReferencesSupported](./Org.OData.Capabilities.V1.xml#L442:~:text=<ComplexType%20Name="-,BatchSupportType,-")|Boolean|Service supports referencing Etags from previous requests
[RequestDependencyConditionsSupported](./Org.OData.Capabilities.V1.xml#L445:~:text=<ComplexType%20Name="-,BatchSupportType,-")|Boolean|Service supports the `if` member in JSON batch requests
[SupportedFormats](./Org.OData.Capabilities.V1.xml#L448:~:text=<ComplexType%20Name="-,BatchSupportType,-")|\[MediaType\]|Media types of supported formats for $batch

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)
- [LongDescription](Org.OData.Core.V1.md#LongDescription)

## <a name="FilterRestrictionsType"></a>[FilterRestrictionsType](./Org.OData.Capabilities.V1.xml#L474:~:text=<ComplexType%20Name="-,FilterRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[Filterable](./Org.OData.Capabilities.V1.xml#L480:~:text=<ComplexType%20Name="-,FilterRestrictionsType,-")|Boolean|$filter is supported
[RequiresFilter](./Org.OData.Capabilities.V1.xml#L483:~:text=<ComplexType%20Name="-,FilterRestrictionsType,-")|Boolean|$filter is required
[RequiredProperties](./Org.OData.Capabilities.V1.xml#L486:~:text=<ComplexType%20Name="-,FilterRestrictionsType,-")|\[PropertyPath\]|These properties must be specified in the $filter clause (properties of derived types are not allowed here)
[NonFilterableProperties](./Org.OData.Capabilities.V1.xml#L489:~:text=<ComplexType%20Name="-,FilterRestrictionsType,-")|\[PropertyPath\]|These structural properties cannot be used in filter expressions
[FilterExpressionRestrictions](./Org.OData.Capabilities.V1.xml#L492:~:text=<ComplexType%20Name="-,FilterRestrictionsType,-")|\[[FilterExpressionRestrictionType](#FilterExpressionRestrictionType)\]|These properties only allow a subset of filter expressions. A valid filter expression for a single property can be enclosed in parentheses and combined by `and` with valid expressions for other properties.
[MaxLevels](./Org.OData.Capabilities.V1.xml#L495:~:text=<ComplexType%20Name="-,FilterRestrictionsType,-")|Int32|The maximum number of levels (including recursion) that can be traversed in a filter expression. A value of -1 indicates there is no restriction.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

## <a name="FilterExpressionRestrictionType"></a>[FilterExpressionRestrictionType](./Org.OData.Capabilities.V1.xml#L499:~:text=<ComplexType%20Name="-,FilterExpressionRestrictionType,-")


Property|Type|Description
:-------|:---|:----------
[Property](./Org.OData.Capabilities.V1.xml#L500:~:text=<ComplexType%20Name="-,FilterExpressionRestrictionType,-")|PropertyPath?|Path to the restricted property
[AllowedExpressions](./Org.OData.Capabilities.V1.xml#L503:~:text=<ComplexType%20Name="-,FilterExpressionRestrictionType,-")|[FilterExpressionType?](#FilterExpressionType)|Allowed subset of expressions

## <a name="FilterExpressionType"></a>[FilterExpressionType](./Org.OData.Capabilities.V1.xml#L507:~:text=<TypeDefinition%20Name="-,FilterExpressionType,-")
**Type:** String



Allowed Value|Description
:------------|:----------
[SingleValue](./Org.OData.Capabilities.V1.xml#L510:~:text=<TypeDefinition%20Name="-,FilterExpressionType,-")|Property can be used in a single `eq` clause
[MultiValue](./Org.OData.Capabilities.V1.xml#L514:~:text=<TypeDefinition%20Name="-,FilterExpressionType,-")|Property can be used in multiple `eq` and `in` clauses, combined by `or` (which is logically equivalent to a single `in` clause)
[SingleRange](./Org.OData.Capabilities.V1.xml#L518:~:text=<TypeDefinition%20Name="-,FilterExpressionType,-")|Property can be used in at most one `ge` and/or one `le` clause, separated by `and`
[MultiRange](./Org.OData.Capabilities.V1.xml#L522:~:text=<TypeDefinition%20Name="-,FilterExpressionType,-")|Property can be compared to a union of one or more closed, half-open, or open intervals<br>The filter expression for this property consists of one or more interval expressions combined by `or`. A single interval expression is either a single comparison of the property and a literal value with `eq`, `le`, `lt`, `ge`, or `gt`, or pair of boundaries combined by `and` and enclosed in parentheses. The lower boundary is either `ge` or `gt`, the upper boundary either `le` or `lt`.
[SearchExpression](./Org.OData.Capabilities.V1.xml#L527:~:text=<TypeDefinition%20Name="-,FilterExpressionType,-")|String property can be used as first operand in `startswith`, `endswith`, and `contains` clauses
[MultiRangeOrSearchExpression](./Org.OData.Capabilities.V1.xml#L531:~:text=<TypeDefinition%20Name="-,FilterExpressionType,-")|Property can be compared to a union of zero or more closed, half-open, or open intervals plus zero or more simple string patterns<br>The filter expression for this property consists of one or more interval expressions or string comparison functions combined by `or`. See MultiRange for a definition of an interval expression. See SearchExpression for the allowed string comparison functions.

## <a name="SortRestrictionsType"></a>[SortRestrictionsType](./Org.OData.Capabilities.V1.xml#L543:~:text=<ComplexType%20Name="-,SortRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[Sortable](./Org.OData.Capabilities.V1.xml#L549:~:text=<ComplexType%20Name="-,SortRestrictionsType,-")|Boolean|$orderby is supported
[AscendingOnlyProperties](./Org.OData.Capabilities.V1.xml#L552:~:text=<ComplexType%20Name="-,SortRestrictionsType,-")|\[PropertyPath\]|These properties can only be used for sorting in Ascending order
[DescendingOnlyProperties](./Org.OData.Capabilities.V1.xml#L555:~:text=<ComplexType%20Name="-,SortRestrictionsType,-")|\[PropertyPath\]|These properties can only be used for sorting in Descending order
[NonSortableProperties](./Org.OData.Capabilities.V1.xml#L558:~:text=<ComplexType%20Name="-,SortRestrictionsType,-")|\[PropertyPath\]|These structural properties cannot be used in orderby expressions

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

## <a name="ExpandRestrictionsType"></a>[ExpandRestrictionsType](./Org.OData.Capabilities.V1.xml#L566:~:text=<ComplexType%20Name="-,ExpandRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[Expandable](./Org.OData.Capabilities.V1.xml#L572:~:text=<ComplexType%20Name="-,ExpandRestrictionsType,-")|Boolean|$expand is supported
[StreamsExpandable](./Org.OData.Capabilities.V1.xml#L575:~:text=<ComplexType%20Name="-,ExpandRestrictionsType,-")|Boolean|$expand is supported for stream properties and media resources
[NonExpandableProperties](./Org.OData.Capabilities.V1.xml#L578:~:text=<ComplexType%20Name="-,ExpandRestrictionsType,-")|\[NavigationPropertyPath\]|These properties cannot be used in expand expressions
[NonExpandableStreamProperties](./Org.OData.Capabilities.V1.xml#L581:~:text=<ComplexType%20Name="-,ExpandRestrictionsType,-")|\[PropertyPath\]|These stream properties cannot be used in expand expressions
[MaxLevels](./Org.OData.Capabilities.V1.xml#L585:~:text=<ComplexType%20Name="-,ExpandRestrictionsType,-")|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

## <a name="SearchRestrictionsType"></a>[SearchRestrictionsType](./Org.OData.Capabilities.V1.xml#L593:~:text=<ComplexType%20Name="-,SearchRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[Searchable](./Org.OData.Capabilities.V1.xml#L599:~:text=<ComplexType%20Name="-,SearchRestrictionsType,-")|Boolean|$search is supported
[UnsupportedExpressions](./Org.OData.Capabilities.V1.xml#L602:~:text=<ComplexType%20Name="-,SearchRestrictionsType,-")|[SearchExpressions](#SearchExpressions)|Expressions not supported in $search

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

## <a name="SearchExpressions"></a>[SearchExpressions](./Org.OData.Capabilities.V1.xml#L606:~:text=<EnumType%20Name="-,SearchExpressions,-")


Flag Member|Value|Description
:-----|----:|:----------
[none](./Org.OData.Capabilities.V1.xml#L607:~:text=<EnumType%20Name="-,SearchExpressions,-")|0|Single search term
[AND](./Org.OData.Capabilities.V1.xml#L610:~:text=<EnumType%20Name="-,SearchExpressions,-")|1|Multiple search terms separated by `AND`
[OR](./Org.OData.Capabilities.V1.xml#L613:~:text=<EnumType%20Name="-,SearchExpressions,-")|2|Multiple search terms separated by `OR`
[NOT](./Org.OData.Capabilities.V1.xml#L616:~:text=<EnumType%20Name="-,SearchExpressions,-")|4|Search terms preceded by `NOT`
[phrase](./Org.OData.Capabilities.V1.xml#L619:~:text=<EnumType%20Name="-,SearchExpressions,-")|8|Search phrases enclosed in double quotes
[group](./Org.OData.Capabilities.V1.xml#L622:~:text=<EnumType%20Name="-,SearchExpressions,-")|16|Precedence grouping of search expressions with parentheses

## <a name="InsertRestrictionsType"></a>[InsertRestrictionsType](./Org.OData.Capabilities.V1.xml#L648:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")


**Derived Types:**
- [NavigationInsertRestrictionsType](#NavigationInsertRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Insertable](./Org.OData.Capabilities.V1.xml#L649:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|Boolean|Entities can be inserted
[NonInsertableProperties](./Org.OData.Capabilities.V1.xml#L652:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|\[PropertyPath\]|These structural properties cannot be specified on insert
[NonInsertableNavigationProperties](./Org.OData.Capabilities.V1.xml#L655:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|\[NavigationPropertyPath\]|These navigation properties do not allow deep inserts
[RequiredProperties](./Org.OData.Capabilities.V1.xml#L658:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|\[PropertyPath\]|These structural properties must be specified on insert
[MaxLevels](./Org.OData.Capabilities.V1.xml#L661:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to insert into. A value of -1 indicates there is no restriction.
[TypecastSegmentSupported](./Org.OData.Capabilities.V1.xml#L664:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|Boolean|Entities of a specific derived type can be created by specifying a type-cast segment
[Permissions](./Org.OData.Capabilities.V1.xml#L667:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the insert.
[QueryOptions](./Org.OData.Capabilities.V1.xml#L670:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with insert requests
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L673:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L676:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](./Org.OData.Capabilities.V1.xml#L679:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|String?|A brief description of the request
[LongDescription](./Org.OData.Capabilities.V1.xml#L683:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|String?|A lengthy description of the request

## <a name="NavigationInsertRestrictionsType"></a>[NavigationInsertRestrictionsType](./Org.OData.Capabilities.V1.xml#L688:~:text=<ComplexType%20Name="-,NavigationInsertRestrictionsType,-"): [InsertRestrictionsType](#InsertRestrictionsType)


Property|Type|Description
:-------|:---|:----------
[*Insertable*](./Org.OData.Capabilities.V1.xml#L649:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|Boolean|Entities can be inserted
[*NonInsertableProperties*](./Org.OData.Capabilities.V1.xml#L652:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|\[PropertyPath\]|These structural properties cannot be specified on insert
[*NonInsertableNavigationProperties*](./Org.OData.Capabilities.V1.xml#L655:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|\[NavigationPropertyPath\]|These navigation properties do not allow deep inserts
[*RequiredProperties*](./Org.OData.Capabilities.V1.xml#L658:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|\[PropertyPath\]|These structural properties must be specified on insert
[*MaxLevels*](./Org.OData.Capabilities.V1.xml#L661:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to insert into. A value of -1 indicates there is no restriction.
[*TypecastSegmentSupported*](./Org.OData.Capabilities.V1.xml#L664:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|Boolean|Entities of a specific derived type can be created by specifying a type-cast segment
[*Permissions*](./Org.OData.Capabilities.V1.xml#L667:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the insert.
[*QueryOptions*](./Org.OData.Capabilities.V1.xml#L670:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with insert requests
[*CustomHeaders*](./Org.OData.Capabilities.V1.xml#L673:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](./Org.OData.Capabilities.V1.xml#L676:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](./Org.OData.Capabilities.V1.xml#L679:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|String?|A brief description of the request
[*LongDescription*](./Org.OData.Capabilities.V1.xml#L683:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|String?|A lengthy description of the request
[NavigationProperty](./Org.OData.Capabilities.V1.xml#L689:~:text=<ComplexType%20Name="-,NavigationInsertRestrictionsType,-")|NavigationPropertyPath|Navigation property path addressing the entity collection

## <a name="PermissionType"></a>[PermissionType](./Org.OData.Capabilities.V1.xml#L694:~:text=<ComplexType%20Name="-,PermissionType,-")


Property|Type|Description
:-------|:---|:----------
[SchemeName](./Org.OData.Capabilities.V1.xml#L695:~:text=<ComplexType%20Name="-,PermissionType,-")|[SchemeName](Org.OData.Authorization.V1.md#SchemeName)|Authorization flow scheme name
[Scopes](./Org.OData.Capabilities.V1.xml#L698:~:text=<ComplexType%20Name="-,PermissionType,-")|\[[ScopeType](#ScopeType)\]|List of scopes that can provide access to the resource

## <a name="ScopeType"></a>[ScopeType](./Org.OData.Capabilities.V1.xml#L703:~:text=<ComplexType%20Name="-,ScopeType,-")


Property|Type|Description
:-------|:---|:----------
[Scope](./Org.OData.Capabilities.V1.xml#L704:~:text=<ComplexType%20Name="-,ScopeType,-")|String|Name of the scope.
[RestrictedProperties](./Org.OData.Capabilities.V1.xml#L707:~:text=<ComplexType%20Name="-,ScopeType,-")|String?|Comma-separated string value of all properties that will be included or excluded when using the scope.<br>Possible string value identifiers when specifying properties are `*`, _PropertyName_, `-`_PropertyName_.<br/>`*` denotes all properties are accessible.<br/>`-`_PropertyName_ excludes that specific property.<br/>_PropertyName_ explicitly provides access to the specific property.<br/>The absence of `RestrictedProperties` denotes all properties are accessible using that scope.

## <a name="DeepInsertSupportType"></a>[DeepInsertSupportType](./Org.OData.Capabilities.V1.xml#L727:~:text=<ComplexType%20Name="-,DeepInsertSupportType,-")


Property|Type|Description
:-------|:---|:----------
[Supported](./Org.OData.Capabilities.V1.xml#L728:~:text=<ComplexType%20Name="-,DeepInsertSupportType,-")|Boolean|Annotation target supports deep inserts
[ContentIDSupported](./Org.OData.Capabilities.V1.xml#L731:~:text=<ComplexType%20Name="-,DeepInsertSupportType,-")|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

## <a name="UpdateRestrictionsType"></a>[UpdateRestrictionsType](./Org.OData.Capabilities.V1.xml#L740:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[Updatable](./Org.OData.Capabilities.V1.xml#L741:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|Boolean|Entities can be updated
[Upsertable](./Org.OData.Capabilities.V1.xml#L744:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|Boolean|Entities can be upserted
[DeltaUpdateSupported](./Org.OData.Capabilities.V1.xml#L747:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|Boolean|Entities can be inserted, updated, and deleted via a PATCH request with a delta payload
[UpdateMethod](./Org.OData.Capabilities.V1.xml#L750:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|[HttpMethod?](#HttpMethod)|Supported HTTP Methods (PUT or PATCH) for updating an entity. If null, PATCH SHOULD be supported and PUT MAY be supported.
[FilterSegmentSupported](./Org.OData.Capabilities.V1.xml#L753:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|Boolean|Members of collections can be updated via a PATCH request with a `/$filter(...)/$each` segment
[TypecastSegmentSupported](./Org.OData.Capabilities.V1.xml#L756:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|Boolean|Members of collections can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[NonUpdatableProperties](./Org.OData.Capabilities.V1.xml#L759:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|\[PropertyPath\]|These structural properties cannot be specified on update
[NonUpdatableNavigationProperties](./Org.OData.Capabilities.V1.xml#L762:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|\[NavigationPropertyPath\]|These navigation properties do not allow rebinding
[RequiredProperties](./Org.OData.Capabilities.V1.xml#L765:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|\[PropertyPath\]|These structural properties must be specified on update
[MaxLevels](./Org.OData.Capabilities.V1.xml#L768:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|Int32|The maximum number of navigation properties that can be traversed when addressing the collection or entity to update. A value of -1 indicates there is no restriction.
[Permissions](./Org.OData.Capabilities.V1.xml#L771:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the update.
[QueryOptions](./Org.OData.Capabilities.V1.xml#L774:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with update requests
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L777:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L780:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](./Org.OData.Capabilities.V1.xml#L783:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|String?|A brief description of the request
[LongDescription](./Org.OData.Capabilities.V1.xml#L787:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|String?|A lengthy description of the request

## <a name="HttpMethod"></a>[HttpMethod](./Org.OData.Capabilities.V1.xml#L793:~:text=<EnumType%20Name="-,HttpMethod,-")


Flag Member|Value|Description
:-----|----:|:----------
[GET](./Org.OData.Capabilities.V1.xml#L794:~:text=<EnumType%20Name="-,HttpMethod,-")|1|The HTTP GET Method
[PATCH](./Org.OData.Capabilities.V1.xml#L797:~:text=<EnumType%20Name="-,HttpMethod,-")|2|The HTTP PATCH Method
[PUT](./Org.OData.Capabilities.V1.xml#L800:~:text=<EnumType%20Name="-,HttpMethod,-")|4|The HTTP PUT Method
[POST](./Org.OData.Capabilities.V1.xml#L803:~:text=<EnumType%20Name="-,HttpMethod,-")|8|The HTTP POST Method
[DELETE](./Org.OData.Capabilities.V1.xml#L806:~:text=<EnumType%20Name="-,HttpMethod,-")|16|The HTTP DELETE Method
[OPTIONS](./Org.OData.Capabilities.V1.xml#L809:~:text=<EnumType%20Name="-,HttpMethod,-")|32|The HTTP OPTIONS Method
[HEAD](./Org.OData.Capabilities.V1.xml#L812:~:text=<EnumType%20Name="-,HttpMethod,-")|64|The HTTP HEAD Method

## <a name="DeepUpdateSupportType"></a>[DeepUpdateSupportType](./Org.OData.Capabilities.V1.xml#L821:~:text=<ComplexType%20Name="-,DeepUpdateSupportType,-")


Property|Type|Description
:-------|:---|:----------
[Supported](./Org.OData.Capabilities.V1.xml#L822:~:text=<ComplexType%20Name="-,DeepUpdateSupportType,-")|Boolean|Annotation target supports deep updates
[ContentIDSupported](./Org.OData.Capabilities.V1.xml#L825:~:text=<ComplexType%20Name="-,DeepUpdateSupportType,-")|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

## <a name="DeleteRestrictionsType"></a>[DeleteRestrictionsType](./Org.OData.Capabilities.V1.xml#L834:~:text=<ComplexType%20Name="-,DeleteRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[Deletable](./Org.OData.Capabilities.V1.xml#L835:~:text=<ComplexType%20Name="-,DeleteRestrictionsType,-")|Boolean|Entities can be deleted
[NonDeletableNavigationProperties](./Org.OData.Capabilities.V1.xml#L838:~:text=<ComplexType%20Name="-,DeleteRestrictionsType,-")|\[NavigationPropertyPath\]|These navigation properties do not allow DeleteLink requests
[MaxLevels](./Org.OData.Capabilities.V1.xml#L841:~:text=<ComplexType%20Name="-,DeleteRestrictionsType,-")|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to delete from or the entity to delete. A value of -1 indicates there is no restriction.
[FilterSegmentSupported](./Org.OData.Capabilities.V1.xml#L844:~:text=<ComplexType%20Name="-,DeleteRestrictionsType,-")|Boolean|Members of collections can be updated via a PATCH request with a `/$filter(...)/$each` segment
[TypecastSegmentSupported](./Org.OData.Capabilities.V1.xml#L847:~:text=<ComplexType%20Name="-,DeleteRestrictionsType,-")|Boolean|Members of collections can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[Permissions](./Org.OData.Capabilities.V1.xml#L850:~:text=<ComplexType%20Name="-,DeleteRestrictionsType,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the delete.
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L853:~:text=<ComplexType%20Name="-,DeleteRestrictionsType,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L856:~:text=<ComplexType%20Name="-,DeleteRestrictionsType,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](./Org.OData.Capabilities.V1.xml#L859:~:text=<ComplexType%20Name="-,DeleteRestrictionsType,-")|String?|A brief description of the request
[LongDescription](./Org.OData.Capabilities.V1.xml#L863:~:text=<ComplexType%20Name="-,DeleteRestrictionsType,-")|String?|A lengthy description of the request

## <a name="CollectionPropertyRestrictionsType"></a>[CollectionPropertyRestrictionsType](./Org.OData.Capabilities.V1.xml#L873:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[CollectionProperty](./Org.OData.Capabilities.V1.xml#L874:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|PropertyPath?|Restricted Collection-valued property
[FilterFunctions](./Org.OData.Capabilities.V1.xml#L877:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|\[String\]|List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](./Org.OData.Capabilities.V1.xml#L881:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|[FilterRestrictionsType?](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](./Org.OData.Capabilities.V1.xml#L884:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](./Org.OData.Capabilities.V1.xml#L887:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|[SortRestrictionsType?](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](./Org.OData.Capabilities.V1.xml#L890:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|Boolean|Supports $top
[SkipSupported](./Org.OData.Capabilities.V1.xml#L893:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|Boolean|Supports $skip
[SelectSupport](./Org.OData.Capabilities.V1.xml#L896:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|[SelectSupportType?](#SelectSupportType)|Support for $select
[Insertable](./Org.OData.Capabilities.V1.xml#L899:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|Boolean|Members can be inserted into this collection<br>If additionally annotated with [Core.PositionalInsert](Org.OData.Core.V1.md#PositionalInsert), members can be inserted at a specific position
[Updatable](./Org.OData.Capabilities.V1.xml#L903:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|Boolean|Members of this ordered collection can be updated by ordinal
[Deletable](./Org.OData.Capabilities.V1.xml#L906:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|Boolean|Members of this ordered collection can be deleted by ordinal

## <a name="OperationRestrictionsType"></a>[OperationRestrictionsType](./Org.OData.Capabilities.V1.xml#L914:~:text=<ComplexType%20Name="-,OperationRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[FilterSegmentSupported](./Org.OData.Capabilities.V1.xml#L915:~:text=<ComplexType%20Name="-,OperationRestrictionsType,-")|Boolean|Bound action or function can be invoked on a collection-valued binding parameter path with a `/$filter(...)` segment
[Permissions](./Org.OData.Capabilities.V1.xml#L918:~:text=<ComplexType%20Name="-,OperationRestrictionsType,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to invoke an action or function
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L921:~:text=<ComplexType%20Name="-,OperationRestrictionsType,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L924:~:text=<ComplexType%20Name="-,OperationRestrictionsType,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options

## <a name="ModificationQueryOptionsType"></a>[ModificationQueryOptionsType](./Org.OData.Capabilities.V1.xml#L935:~:text=<ComplexType%20Name="-,ModificationQueryOptionsType,-")


Property|Type|Description
:-------|:---|:----------
[ExpandSupported](./Org.OData.Capabilities.V1.xml#L936:~:text=<ComplexType%20Name="-,ModificationQueryOptionsType,-")|Boolean|Supports $expand with modification requests
[SelectSupported](./Org.OData.Capabilities.V1.xml#L939:~:text=<ComplexType%20Name="-,ModificationQueryOptionsType,-")|Boolean|Supports $select with modification requests
[ComputeSupported](./Org.OData.Capabilities.V1.xml#L942:~:text=<ComplexType%20Name="-,ModificationQueryOptionsType,-")|Boolean|Supports $compute with modification requests
[FilterSupported](./Org.OData.Capabilities.V1.xml#L945:~:text=<ComplexType%20Name="-,ModificationQueryOptionsType,-")|Boolean|Supports $filter with modification requests
[SearchSupported](./Org.OData.Capabilities.V1.xml#L948:~:text=<ComplexType%20Name="-,ModificationQueryOptionsType,-")|Boolean|Supports $search with modification requests
[SortSupported](./Org.OData.Capabilities.V1.xml#L951:~:text=<ComplexType%20Name="-,ModificationQueryOptionsType,-")|Boolean|Supports $orderby with modification requests

## <a name="ReadRestrictionsBase"></a>[*ReadRestrictionsBase*](./Org.OData.Capabilities.V1.xml#L960:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")


**Derived Types:**
- [ReadByKeyRestrictionsType](#ReadByKeyRestrictionsType)
- [ReadRestrictionsType](#ReadRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Readable](./Org.OData.Capabilities.V1.xml#L961:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|Boolean|Entities can be retrieved
[Permissions](./Org.OData.Capabilities.V1.xml#L964:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L967:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L970:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](./Org.OData.Capabilities.V1.xml#L973:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|String?|A brief description of the request
[LongDescription](./Org.OData.Capabilities.V1.xml#L977:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|String?|A lengthy description of the request

## <a name="ReadByKeyRestrictionsType"></a>[ReadByKeyRestrictionsType](./Org.OData.Capabilities.V1.xml#L982:~:text=<ComplexType%20Name="-,ReadByKeyRestrictionsType,-"): [ReadRestrictionsBase](#ReadRestrictionsBase)
Restrictions for retrieving an entity by key

Property|Type|Description
:-------|:---|:----------
[*Readable*](./Org.OData.Capabilities.V1.xml#L961:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|Boolean|Entities can be retrieved
[*Permissions*](./Org.OData.Capabilities.V1.xml#L964:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[*CustomHeaders*](./Org.OData.Capabilities.V1.xml#L967:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](./Org.OData.Capabilities.V1.xml#L970:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](./Org.OData.Capabilities.V1.xml#L973:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|String?|A brief description of the request
[*LongDescription*](./Org.OData.Capabilities.V1.xml#L977:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|String?|A lengthy description of the request

## <a name="ReadRestrictionsType"></a>[ReadRestrictionsType](./Org.OData.Capabilities.V1.xml#L985:~:text=<ComplexType%20Name="-,ReadRestrictionsType,-"): [ReadRestrictionsBase](#ReadRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Readable*](./Org.OData.Capabilities.V1.xml#L961:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|Boolean|Entities can be retrieved
[*Permissions*](./Org.OData.Capabilities.V1.xml#L964:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[*CustomHeaders*](./Org.OData.Capabilities.V1.xml#L967:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](./Org.OData.Capabilities.V1.xml#L970:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](./Org.OData.Capabilities.V1.xml#L973:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|String?|A brief description of the request
[*LongDescription*](./Org.OData.Capabilities.V1.xml#L977:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|String?|A lengthy description of the request
[ReadByKeyRestrictions](./Org.OData.Capabilities.V1.xml#L986:~:text=<ComplexType%20Name="-,ReadRestrictionsType,-")|[ReadByKeyRestrictionsType?](#ReadByKeyRestrictionsType)|Restrictions for retrieving an entity by key<br>Only valid when applied to a collection. If a property of `ReadByKeyRestrictions` is not specified, the corresponding property value of `ReadRestrictions` applies.

## <a name="CustomParameter"></a>[CustomParameter](./Org.OData.Capabilities.V1.xml#L1049:~:text=<ComplexType%20Name="-,CustomParameter,-")
A custom parameter is either a header or a query option

The type of a custom parameter is always a string. Restrictions on the parameter values can be expressed by annotating the record expression describing the parameter with terms from the Validation vocabulary, e.g. Validation.Pattern or Validation.AllowedValues.

Property|Type|Description
:-------|:---|:----------
[Name](./Org.OData.Capabilities.V1.xml#L1052:~:text=<ComplexType%20Name="-,CustomParameter,-")|String|Name of the custom parameter
[Description](./Org.OData.Capabilities.V1.xml#L1055:~:text=<ComplexType%20Name="-,CustomParameter,-")|String?|Description of the custom parameter
[DocumentationURL](./Org.OData.Capabilities.V1.xml#L1058:~:text=<ComplexType%20Name="-,CustomParameter,-")|URL?|URL of related documentation
[Required](./Org.OData.Capabilities.V1.xml#L1062:~:text=<ComplexType%20Name="-,CustomParameter,-")|Boolean|true: parameter is required, false or not specified: parameter is optional
[ExampleValues](./Org.OData.Capabilities.V1.xml#L1065:~:text=<ComplexType%20Name="-,CustomParameter,-")|\[[PrimitiveExampleValue](Org.OData.Core.V1.md#PrimitiveExampleValue)\]|Example values for the custom parameter
