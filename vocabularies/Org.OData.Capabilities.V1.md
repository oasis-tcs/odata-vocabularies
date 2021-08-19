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
[ConformanceLevel](./Org.OData.Capabilities.V1.xml#L115:~:text=Name="-,ConformanceLevel,-")|[ConformanceLevelType](#ConformanceLevelType)|<a name="ConformanceLevel"></a>The conformance level achieved by this service
[SupportedFormats](./Org.OData.Capabilities.V1.xml#L132:~:text=Name="-,SupportedFormats,-")|\[MediaType\]|<a name="SupportedFormats"></a>Media types of supported formats, including format parameters
[SupportedMetadataFormats](./Org.OData.Capabilities.V1.xml#L137:~:text=Name="-,SupportedMetadataFormats,-")|\[MediaType\]|<a name="SupportedMetadataFormats"></a>Media types of supported formats for $metadata, including format parameters
[AcceptableEncodings](./Org.OData.Capabilities.V1.xml#L142:~:text=Name="-,AcceptableEncodings,-")|\[String\]|<a name="AcceptableEncodings"></a>List of acceptable compression methods for ($batch) requests, e.g. gzip
[AsynchronousRequestsSupported](./Org.OData.Capabilities.V1.xml#L148:~:text=Name="-,AsynchronousRequestsSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AsynchronousRequestsSupported"></a>Service supports the asynchronous request preference
[BatchContinueOnErrorSupported](./Org.OData.Capabilities.V1.xml#L152:~:text=Name="-,BatchContinueOnErrorSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchContinueOnErrorSupported"></a>Service supports the continue on error preference. Supports $batch requests. Services that apply the BatchContinueOnErrorSupported term should also specify the ContinueOnErrorSupported property from the BatchSupport term.
[IsolationSupported](./Org.OData.Capabilities.V1.xml#L156:~:text=Name="-,IsolationSupported,-")|[IsolationLevel](#IsolationLevel)|<a name="IsolationSupported"></a>Supported odata.isolation levels
[CrossJoinSupported](./Org.OData.Capabilities.V1.xml#L165:~:text=Name="-,CrossJoinSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="CrossJoinSupported"></a>Supports cross joins for the entity sets in this container
[CallbackSupported](./Org.OData.Capabilities.V1.xml#L169:~:text=Name="-,CallbackSupported,-")|[CallbackType](#CallbackType)|<a name="CallbackSupported"></a>Supports callbacks for the specified protocols
[ChangeTracking](./Org.OData.Capabilities.V1.xml#L191:~:text=Name="-,ChangeTracking,-")|[ChangeTrackingType](#ChangeTrackingType)|<a name="ChangeTracking"></a>Change tracking capabilities of this service or entity set
[CountRestrictions](./Org.OData.Capabilities.V1.xml#L212:~:text=Name="-,CountRestrictions,-")|[CountRestrictionsType](#CountRestrictionsType)|<a name="CountRestrictions"></a>Restrictions on /$count path suffix and $count=true system query option
[NavigationRestrictions](./Org.OData.Capabilities.V1.xml#L229:~:text=Name="-,NavigationRestrictions,-")|[NavigationRestrictionsType](#NavigationRestrictionsType)|<a name="NavigationRestrictions"></a>Restrictions on navigating properties according to OData URL conventions<br>Restrictions specified on an entity set are valid whether the request is directly to the entity set or through a navigation property bound to that entity set. Services can specify a different set of restrictions specific to a path, in which case the more specific restrictions take precedence.
[IndexableByKey](./Org.OData.Capabilities.V1.xml#L307:~:text=Name="-,IndexableByKey,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="IndexableByKey"></a>Supports key values according to OData URL conventions
[TopSupported](./Org.OData.Capabilities.V1.xml#L311:~:text=Name="-,TopSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="TopSupported"></a>Supports $top
[SkipSupported](./Org.OData.Capabilities.V1.xml#L315:~:text=Name="-,SkipSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="SkipSupported"></a>Supports $skip
[ComputeSupported](./Org.OData.Capabilities.V1.xml#L319:~:text=Name="-,ComputeSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="ComputeSupported"></a>Supports $compute
[SelectSupport](./Org.OData.Capabilities.V1.xml#L323:~:text=Name="-,SelectSupport,-")|[SelectSupportType](#SelectSupportType)|<a name="SelectSupport"></a>Support for $select and nested query options within $select
[BatchSupported](./Org.OData.Capabilities.V1.xml#L359:~:text=Name="-,BatchSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchSupported"></a>Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.
[BatchSupport](./Org.OData.Capabilities.V1.xml#L363:~:text=Name="-,BatchSupport,-")|[BatchSupportType](#BatchSupportType)|<a name="BatchSupport"></a>Batch Support for the service
[FilterFunctions](./Org.OData.Capabilities.V1.xml#L409:~:text=Name="-,FilterFunctions,-")|\[String\]|<a name="FilterFunctions"></a>List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](./Org.OData.Capabilities.V1.xml#L414:~:text=Name="-,FilterRestrictions,-")|[FilterRestrictionsType](#FilterRestrictionsType)|<a name="FilterRestrictions"></a>Restrictions on filter expressions
[SortRestrictions](./Org.OData.Capabilities.V1.xml#L485:~:text=Name="-,SortRestrictions,-")|[SortRestrictionsType](#SortRestrictionsType)|<a name="SortRestrictions"></a>Restrictions on orderby expressions
[ExpandRestrictions](./Org.OData.Capabilities.V1.xml#L510:~:text=Name="-,ExpandRestrictions,-")|[ExpandRestrictionsType](#ExpandRestrictionsType)|<a name="ExpandRestrictions"></a>Restrictions on expand expressions
[SearchRestrictions](./Org.OData.Capabilities.V1.xml#L539:~:text=Name="-,SearchRestrictions,-")|[SearchRestrictionsType](#SearchRestrictionsType)|<a name="SearchRestrictions"></a>Restrictions on search expressions
[KeyAsSegmentSupported](./Org.OData.Capabilities.V1.xml#L576:~:text=Name="-,KeyAsSegmentSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="KeyAsSegmentSupported"></a>Supports [key-as-segment convention](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_KeyasSegmentConvention) for addressing entities within a collection
[QuerySegmentSupported](./Org.OData.Capabilities.V1.xml#L580:~:text=Name="-,QuerySegmentSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="QuerySegmentSupported"></a>Supports [passing query options in the request body](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_PassingQueryOptionsintheRequestBody)
[InsertRestrictions](./Org.OData.Capabilities.V1.xml#L586:~:text=Name="-,InsertRestrictions,-")|[InsertRestrictionsType](#InsertRestrictionsType)|<a name="InsertRestrictions"></a>Restrictions on insert operations
[DeepInsertSupport](./Org.OData.Capabilities.V1.xml#L662:~:text=Name="-,DeepInsertSupport,-")|[DeepInsertSupportType?](#DeepInsertSupportType)|<a name="DeepInsertSupport"></a>Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](./Org.OData.Capabilities.V1.xml#L674:~:text=Name="-,UpdateRestrictions,-")|[UpdateRestrictionsType](#UpdateRestrictionsType)|<a name="UpdateRestrictions"></a>Restrictions on update operations
[DeepUpdateSupport](./Org.OData.Capabilities.V1.xml#L757:~:text=Name="-,DeepUpdateSupport,-")|[DeepUpdateSupportType](#DeepUpdateSupportType)|<a name="DeepUpdateSupport"></a>Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](./Org.OData.Capabilities.V1.xml#L769:~:text=Name="-,DeleteRestrictions,-")|[DeleteRestrictionsType](#DeleteRestrictionsType)|<a name="DeleteRestrictions"></a>Restrictions on delete operations
[CollectionPropertyRestrictions](./Org.OData.Capabilities.V1.xml#L810:~:text=Name="-,CollectionPropertyRestrictions,-")|\[[CollectionPropertyRestrictionsType](#CollectionPropertyRestrictionsType)\]|<a name="CollectionPropertyRestrictions"></a>Describes restrictions on operations applied to collection-valued structural properties
[OperationRestrictions](./Org.OData.Capabilities.V1.xml#L851:~:text=Name="-,OperationRestrictions,-")|[OperationRestrictionsType](#OperationRestrictionsType)|<a name="OperationRestrictions"></a>Restrictions for function or action operation
[AnnotationValuesInQuerySupported](./Org.OData.Capabilities.V1.xml#L868:~:text=Name="-,AnnotationValuesInQuerySupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AnnotationValuesInQuerySupported"></a>Supports annotation values within system query options
[ModificationQueryOptions](./Org.OData.Capabilities.V1.xml#L872:~:text=Name="-,ModificationQueryOptions,-")|[ModificationQueryOptionsType](#ModificationQueryOptionsType)|<a name="ModificationQueryOptions"></a>Support for query options with modification requests (insert, update, action invocation)
[ReadRestrictions](./Org.OData.Capabilities.V1.xml#L896:~:text=Name="-,ReadRestrictions,-")|[ReadRestrictionsType](#ReadRestrictionsType)|<a name="ReadRestrictions"></a>Restrictions for retrieving a collection of entities, retrieving a singleton instance.
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L931:~:text=Name="-,CustomHeaders,-")|\[[CustomParameter](#CustomParameter)\]|<a name="CustomHeaders"></a>Custom headers that are supported/required for the annotated resource ([Example](./Org.OData.Capabilities.V1.xml#L933:~:text=Name="-,Example,-"))
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L957:~:text=Name="-,CustomQueryOptions,-")|\[[CustomParameter](#CustomParameter)\]|<a name="CustomQueryOptions"></a>Custom query options that are supported/required for the annotated resource ([Example](./Org.OData.Capabilities.V1.xml#L960:~:text=Name="-,Example,-"))<br>If the entity container is annotated, the query option is supported/required by all resources in that container.
[MediaLocationUpdateSupported](./Org.OData.Capabilities.V1.xml#L1009:~:text=Name="-,MediaLocationUpdateSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="MediaLocationUpdateSupported"></a>Stream property supports update of its media edit URL and/or media read URL
[DefaultCapabilities](./Org.OData.Capabilities.V1.xml#L1014:~:text=Name="-,DefaultCapabilities,-")|[DefaultCapabilitiesType](#DefaultCapabilitiesType)|<a name="DefaultCapabilities"></a>Default capability settings for all collection-valued resources in the container<br>Annotating a specific capability term, which is included as property in `DefaultCapabilitiesType`, for a specific collection-valued resource overrides the default capability with the specified properties using PATCH semantics:<br/>- Primitive or collection-valued properties specified in the specific capability term replace the corresponding properties specified in `DefaultCapabilities`<br/>- Complex-valued properties specified in the specific capability term override the corresponding properties specified in `DefaultCapabilities` using PATCH semantics recursively<br/>- Properties specified neither in the specific term nor in `DefaultCapabilities` have their default value

## <a name="ConformanceLevelType"></a>[ConformanceLevelType](./Org.OData.Capabilities.V1.xml#L118:~:text=Name="-,ConformanceLevelType,-")


Member|Value|Description
:-----|----:|:----------
[Minimal](./Org.OData.Capabilities.V1.xml#L119:~:text=Name="-,Minimal,-")|0|Minimal conformance level
[Intermediate](./Org.OData.Capabilities.V1.xml#L122:~:text=Name="-,Intermediate,-")|1|Intermediate conformance level
[Advanced](./Org.OData.Capabilities.V1.xml#L125:~:text=Name="-,Advanced,-")|2|Advanced conformance level

## <a name="IsolationLevel"></a>[IsolationLevel](./Org.OData.Capabilities.V1.xml#L159:~:text=Name="-,IsolationLevel,-")


Flag Member|Value|Description
:-----|----:|:----------
[Snapshot](./Org.OData.Capabilities.V1.xml#L160:~:text=Name="-,Snapshot,-")|1|All data returned for a request, including multiple requests within a batch or results retrieved across multiple pages, will be consistent as of a single point in time

## <a name="CallbackType"></a>[CallbackType](./Org.OData.Capabilities.V1.xml#L172:~:text=Name="-,CallbackType,-")
A non-empty collection lists the full set of supported protocols. A empty collection means 'only HTTP is supported'

Property|Type|Description
:-------|:---|:----------
[CallbackProtocols](./Org.OData.Capabilities.V1.xml#L173:~:text=Name="-,CallbackProtocols,-")|\[[CallbackProtocol](#CallbackProtocol)\]|List of supported callback protocols, e.g. `http` or `wss`

## <a name="CallbackProtocol"></a>[CallbackProtocol](./Org.OData.Capabilities.V1.xml#L178:~:text=Name="-,CallbackProtocol,-")


Property|Type|Description
:-------|:---|:----------
[Id](./Org.OData.Capabilities.V1.xml#L179:~:text=Name="-,Id,-")|String?|Protocol Identifier
[UrlTemplate](./Org.OData.Capabilities.V1.xml#L182:~:text=Name="-,UrlTemplate,-")|String?|URL Template including parameters. Parameters are enclosed in curly braces {} as defined in RFC6570
[DocumentationUrl](./Org.OData.Capabilities.V1.xml#L185:~:text=Name="-,DocumentationUrl,-")|URL?|Human readable description of the meaning of the URL Template parameters

## <a name="ChangeTrackingBase"></a>[ChangeTrackingBase](./Org.OData.Capabilities.V1.xml#L194:~:text=Name="-,ChangeTrackingBase,-")


**Derived Types:**
- [ChangeTrackingType](#ChangeTrackingType)

Property|Type|Description
:-------|:---|:----------
[Supported](./Org.OData.Capabilities.V1.xml#L195:~:text=Name="-,Supported,-")|Boolean|odata.track-changes preference is supported

## <a name="ChangeTrackingType"></a>[ChangeTrackingType](./Org.OData.Capabilities.V1.xml#L199:~:text=Name="-,ChangeTrackingType,-"): [ChangeTrackingBase](#ChangeTrackingBase)


Property|Type|Description
:-------|:---|:----------
[*Supported*](./Org.OData.Capabilities.V1.xml#L195:~:text=Name="-,Supported,-")|Boolean|odata.track-changes preference is supported
[FilterableProperties](./Org.OData.Capabilities.V1.xml#L200:~:text=Name="-,FilterableProperties,-")|\[PropertyPath\]|Change tracking supports filters on these properties<br>If no properties are specified or FilterableProperties is omitted, clients cannot assume support for filtering on any properties in combination with change tracking.
[ExpandableProperties](./Org.OData.Capabilities.V1.xml#L204:~:text=Name="-,ExpandableProperties,-")|\[NavigationPropertyPath\]|Change tracking supports these properties expanded<br>If no properties are specified or ExpandableProperties is omitted, clients cannot assume support for expanding any properties in combination with change tracking.

## <a name="CountRestrictionsBase"></a>[CountRestrictionsBase](./Org.OData.Capabilities.V1.xml#L215:~:text=Name="-,CountRestrictionsBase,-")


**Derived Types:**
- [CountRestrictionsType](#CountRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Countable](./Org.OData.Capabilities.V1.xml#L216:~:text=Name="-,Countable,-")|Boolean|Entities can be counted (only valid if targeting an entity set)

## <a name="CountRestrictionsType"></a>[CountRestrictionsType](./Org.OData.Capabilities.V1.xml#L220:~:text=Name="-,CountRestrictionsType,-"): [CountRestrictionsBase](#CountRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Countable*](./Org.OData.Capabilities.V1.xml#L216:~:text=Name="-,Countable,-")|Boolean|Entities can be counted (only valid if targeting an entity set)
[NonCountableProperties](./Org.OData.Capabilities.V1.xml#L221:~:text=Name="-,NonCountableProperties,-")|\[PropertyPath\]|Members of these collection properties cannot be counted
[NonCountableNavigationProperties](./Org.OData.Capabilities.V1.xml#L224:~:text=Name="-,NonCountableNavigationProperties,-")|\[NavigationPropertyPath\]|Members of these navigation properties cannot be counted

## <a name="NavigationRestrictionsType"></a>[NavigationRestrictionsType](./Org.OData.Capabilities.V1.xml#L233:~:text=Name="-,NavigationRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[Navigability](./Org.OData.Capabilities.V1.xml#L234:~:text=Name="-,Navigability,-")|[NavigationType?](#NavigationType)|Default navigability for all navigation properties of the annotation target. Individual navigation properties can override this value via `RestrictedProperties/Navigability`.
[RestrictedProperties](./Org.OData.Capabilities.V1.xml#L237:~:text=Name="-,RestrictedProperties,-")|\[[NavigationPropertyRestriction](#NavigationPropertyRestriction)\]|List of navigation properties with restrictions

## <a name="NavigationPropertyRestriction"></a>[NavigationPropertyRestriction](./Org.OData.Capabilities.V1.xml#L241:~:text=Name="-,NavigationPropertyRestriction,-")


Property|Type|Description
:-------|:---|:----------
[NavigationProperty](./Org.OData.Capabilities.V1.xml#L242:~:text=Name="-,NavigationProperty,-")|NavigationPropertyPath?|Navigation properties can be navigated
[Navigability](./Org.OData.Capabilities.V1.xml#L245:~:text=Name="-,Navigability,-")|[NavigationType?](#NavigationType)|Supported navigability of this navigation property
[FilterFunctions](./Org.OData.Capabilities.V1.xml#L248:~:text=Name="-,FilterFunctions,-")|\[String\]|List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](./Org.OData.Capabilities.V1.xml#L252:~:text=Name="-,FilterRestrictions,-")|[FilterRestrictionsType?](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](./Org.OData.Capabilities.V1.xml#L255:~:text=Name="-,SearchRestrictions,-")|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](./Org.OData.Capabilities.V1.xml#L258:~:text=Name="-,SortRestrictions,-")|[SortRestrictionsType?](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](./Org.OData.Capabilities.V1.xml#L261:~:text=Name="-,TopSupported,-")|Boolean|Supports $top
[SkipSupported](./Org.OData.Capabilities.V1.xml#L264:~:text=Name="-,SkipSupported,-")|Boolean|Supports $skip
[SelectSupport](./Org.OData.Capabilities.V1.xml#L267:~:text=Name="-,SelectSupport,-")|[SelectSupportType?](#SelectSupportType)|Support for $select
[IndexableByKey](./Org.OData.Capabilities.V1.xml#L270:~:text=Name="-,IndexableByKey,-")|Boolean|Supports key values according to OData URL conventions
[InsertRestrictions](./Org.OData.Capabilities.V1.xml#L273:~:text=Name="-,InsertRestrictions,-")|[InsertRestrictionsType?](#InsertRestrictionsType)|Restrictions on insert operations
[DeepInsertSupport](./Org.OData.Capabilities.V1.xml#L276:~:text=Name="-,DeepInsertSupport,-")|[DeepInsertSupportType?](#DeepInsertSupportType)|Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](./Org.OData.Capabilities.V1.xml#L279:~:text=Name="-,UpdateRestrictions,-")|[UpdateRestrictionsType?](#UpdateRestrictionsType)|Restrictions on update operations
[DeepUpdateSupport](./Org.OData.Capabilities.V1.xml#L282:~:text=Name="-,DeepUpdateSupport,-")|[DeepUpdateSupportType?](#DeepUpdateSupportType)|Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](./Org.OData.Capabilities.V1.xml#L285:~:text=Name="-,DeleteRestrictions,-")|[DeleteRestrictionsType?](#DeleteRestrictionsType)|Restrictions on delete operations
[OptimisticConcurrencyControl](./Org.OData.Capabilities.V1.xml#L288:~:text=Name="-,OptimisticConcurrencyControl,-")|Boolean|Data modification (including insert) along this navigation property requires the use of ETags
[ReadRestrictions](./Org.OData.Capabilities.V1.xml#L291:~:text=Name="-,ReadRestrictions,-")|[ReadRestrictionsType?](#ReadRestrictionsType)|Restrictions for retrieving entities

## <a name="NavigationType"></a>[NavigationType](./Org.OData.Capabilities.V1.xml#L295:~:text=Name="-,NavigationType,-")


Member|Value|Description
:-----|----:|:----------
[Recursive](./Org.OData.Capabilities.V1.xml#L296:~:text=Name="-,Recursive,-")|0|Navigation properties can be recursively navigated
[Single](./Org.OData.Capabilities.V1.xml#L299:~:text=Name="-,Single,-")|1|Navigation properties can be navigated to a single level
[None](./Org.OData.Capabilities.V1.xml#L302:~:text=Name="-,None,-")|2|Navigation properties are not navigable

## <a name="SelectSupportType"></a>[SelectSupportType](./Org.OData.Capabilities.V1.xml#L326:~:text=Name="-,SelectSupportType,-")


Property|Type|Description
:-------|:---|:----------
[Supported](./Org.OData.Capabilities.V1.xml#L327:~:text=Name="-,Supported,-")|Boolean|Supports $select
[InstanceAnnotationsSupported](./Org.OData.Capabilities.V1.xml#L330:~:text=Name="-,InstanceAnnotationsSupported,-")|Boolean|Supports instance annotations in $select list
[Expandable](./Org.OData.Capabilities.V1.xml#L333:~:text=Name="-,Expandable,-")|Boolean|$expand within $select is supported
[Filterable](./Org.OData.Capabilities.V1.xml#L336:~:text=Name="-,Filterable,-")|Boolean|$filter within $select is supported
[Searchable](./Org.OData.Capabilities.V1.xml#L339:~:text=Name="-,Searchable,-")|Boolean|$search within $select is supported
[TopSupported](./Org.OData.Capabilities.V1.xml#L342:~:text=Name="-,TopSupported,-")|Boolean|$top within $select is supported
[SkipSupported](./Org.OData.Capabilities.V1.xml#L345:~:text=Name="-,SkipSupported,-")|Boolean|$skip within $select is supported
[ComputeSupported](./Org.OData.Capabilities.V1.xml#L348:~:text=Name="-,ComputeSupported,-")|Boolean|$compute within $select is supported
[Countable](./Org.OData.Capabilities.V1.xml#L351:~:text=Name="-,Countable,-")|Boolean|$count within $select is supported
[Sortable](./Org.OData.Capabilities.V1.xml#L354:~:text=Name="-,Sortable,-")|Boolean|$orderby within $select is supported

## <a name="BatchSupportType"></a>[BatchSupportType](./Org.OData.Capabilities.V1.xml#L366:~:text=Name="-,BatchSupportType,-")


Property|Type|Description
:-------|:---|:----------
[Supported](./Org.OData.Capabilities.V1.xml#L373:~:text=Name="-,Supported,-")|Boolean|Service supports requests to $batch
[ContinueOnErrorSupported](./Org.OData.Capabilities.V1.xml#L376:~:text=Name="-,ContinueOnErrorSupported,-")|Boolean|Service supports the continue on error preference
[ReferencesInRequestBodiesSupported](./Org.OData.Capabilities.V1.xml#L379:~:text=Name="-,ReferencesInRequestBodiesSupported,-")|Boolean|Service supports Content-ID referencing in request bodies
[ReferencesAcrossChangeSetsSupported](./Org.OData.Capabilities.V1.xml#L382:~:text=Name="-,ReferencesAcrossChangeSetsSupported,-")|Boolean|Service supports Content-ID referencing across change sets
[EtagReferencesSupported](./Org.OData.Capabilities.V1.xml#L385:~:text=Name="-,EtagReferencesSupported,-")|Boolean|Service supports referencing Etags from previous requests
[RequestDependencyConditionsSupported](./Org.OData.Capabilities.V1.xml#L388:~:text=Name="-,RequestDependencyConditionsSupported,-")|Boolean|Service supports the `if` member in JSON batch requests
[SupportedFormats](./Org.OData.Capabilities.V1.xml#L391:~:text=Name="-,SupportedFormats,-")|\[MediaType\]|Media types of supported formats for $batch

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)
- [LongDescription](Org.OData.Core.V1.md#LongDescription)

## <a name="FilterRestrictionsBase"></a>[FilterRestrictionsBase](./Org.OData.Capabilities.V1.xml#L417:~:text=Name="-,FilterRestrictionsBase,-")


**Derived Types:**
- [FilterRestrictionsType](#FilterRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Filterable](./Org.OData.Capabilities.V1.xml#L423:~:text=Name="-,Filterable,-")|Boolean|$filter is supported
[RequiresFilter](./Org.OData.Capabilities.V1.xml#L426:~:text=Name="-,RequiresFilter,-")|Boolean|$filter is required
[MaxLevels](./Org.OData.Capabilities.V1.xml#L429:~:text=Name="-,MaxLevels,-")|Int32|The maximum number of levels (including recursion) that can be traversed in a filter expression. A value of -1 indicates there is no restriction.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

## <a name="FilterRestrictionsType"></a>[FilterRestrictionsType](./Org.OData.Capabilities.V1.xml#L433:~:text=Name="-,FilterRestrictionsType,-"): [FilterRestrictionsBase](#FilterRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Filterable*](./Org.OData.Capabilities.V1.xml#L423:~:text=Name="-,Filterable,-")|Boolean|$filter is supported
[*RequiresFilter*](./Org.OData.Capabilities.V1.xml#L426:~:text=Name="-,RequiresFilter,-")|Boolean|$filter is required
[*MaxLevels*](./Org.OData.Capabilities.V1.xml#L429:~:text=Name="-,MaxLevels,-")|Int32|The maximum number of levels (including recursion) that can be traversed in a filter expression. A value of -1 indicates there is no restriction.
[RequiredProperties](./Org.OData.Capabilities.V1.xml#L434:~:text=Name="-,RequiredProperties,-")|\[PropertyPath\]|These properties must be specified in the $filter clause (properties of derived types are not allowed here)
[NonFilterableProperties](./Org.OData.Capabilities.V1.xml#L437:~:text=Name="-,NonFilterableProperties,-")|\[PropertyPath\]|These structural properties cannot be used in filter expressions
[FilterExpressionRestrictions](./Org.OData.Capabilities.V1.xml#L440:~:text=Name="-,FilterExpressionRestrictions,-")|\[[FilterExpressionRestrictionType](#FilterExpressionRestrictionType)\]|These properties only allow a subset of filter expressions. A valid filter expression for a single property can be enclosed in parentheses and combined by `and` with valid expressions for other properties.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

## <a name="FilterExpressionRestrictionType"></a>[FilterExpressionRestrictionType](./Org.OData.Capabilities.V1.xml#L444:~:text=Name="-,FilterExpressionRestrictionType,-")


Property|Type|Description
:-------|:---|:----------
[Property](./Org.OData.Capabilities.V1.xml#L445:~:text=Name="-,Property,-")|PropertyPath?|Path to the restricted property
[AllowedExpressions](./Org.OData.Capabilities.V1.xml#L448:~:text=Name="-,AllowedExpressions,-")|[FilterExpressionType?](#FilterExpressionType)|Allowed subset of expressions

## <a name="FilterExpressionType"></a>[FilterExpressionType](./Org.OData.Capabilities.V1.xml#L452:~:text=Name="-,FilterExpressionType,-")
**Type:** String



Allowed Value|Description
:------------|:----------
[SingleValue](./Org.OData.Capabilities.V1.xml#L455:~:text=Name="-,SingleValue,-")|Property can be used in a single `eq` clause
[MultiValue](./Org.OData.Capabilities.V1.xml#L459:~:text=Name="-,MultiValue,-")|Property can be used in multiple `eq` and `in` clauses, combined by `or` (which is logically equivalent to a single `in` clause)
[SingleRange](./Org.OData.Capabilities.V1.xml#L463:~:text=Name="-,SingleRange,-")|Property can be used in at most one `ge` and/or one `le` clause, separated by `and`
[MultiRange](./Org.OData.Capabilities.V1.xml#L467:~:text=Name="-,MultiRange,-")|Property can be compared to a union of one or more closed, half-open, or open intervals<br>The filter expression for this property consists of one or more interval expressions combined by `or`. A single interval expression is either a single comparison of the property and a literal value with `eq`, `le`, `lt`, `ge`, or `gt`, or pair of boundaries combined by `and` and enclosed in parentheses. The lower boundary is either `ge` or `gt`, the upper boundary either `le` or `lt`.
[SearchExpression](./Org.OData.Capabilities.V1.xml#L472:~:text=Name="-,SearchExpression,-")|String property can be used as first operand in `startswith`, `endswith`, and `contains` clauses
[MultiRangeOrSearchExpression](./Org.OData.Capabilities.V1.xml#L476:~:text=Name="-,MultiRangeOrSearchExpression,-")|Property can be compared to a union of zero or more closed, half-open, or open intervals plus zero or more simple string patterns<br>The filter expression for this property consists of one or more interval expressions or string comparison functions combined by `or`. See MultiRange for a definition of an interval expression. See SearchExpression for the allowed string comparison functions.

## <a name="SortRestrictionsBase"></a>[SortRestrictionsBase](./Org.OData.Capabilities.V1.xml#L488:~:text=Name="-,SortRestrictionsBase,-")


**Derived Types:**
- [SortRestrictionsType](#SortRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Sortable](./Org.OData.Capabilities.V1.xml#L494:~:text=Name="-,Sortable,-")|Boolean|$orderby is supported

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

## <a name="SortRestrictionsType"></a>[SortRestrictionsType](./Org.OData.Capabilities.V1.xml#L498:~:text=Name="-,SortRestrictionsType,-"): [SortRestrictionsBase](#SortRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Sortable*](./Org.OData.Capabilities.V1.xml#L494:~:text=Name="-,Sortable,-")|Boolean|$orderby is supported
[AscendingOnlyProperties](./Org.OData.Capabilities.V1.xml#L499:~:text=Name="-,AscendingOnlyProperties,-")|\[PropertyPath\]|These properties can only be used for sorting in Ascending order
[DescendingOnlyProperties](./Org.OData.Capabilities.V1.xml#L502:~:text=Name="-,DescendingOnlyProperties,-")|\[PropertyPath\]|These properties can only be used for sorting in Descending order
[NonSortableProperties](./Org.OData.Capabilities.V1.xml#L505:~:text=Name="-,NonSortableProperties,-")|\[PropertyPath\]|These structural properties cannot be used in orderby expressions

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

## <a name="ExpandRestrictionsBase"></a>[ExpandRestrictionsBase](./Org.OData.Capabilities.V1.xml#L513:~:text=Name="-,ExpandRestrictionsBase,-")


**Derived Types:**
- [ExpandRestrictionsType](#ExpandRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Expandable](./Org.OData.Capabilities.V1.xml#L519:~:text=Name="-,Expandable,-")|Boolean|$expand is supported
[StreamsExpandable](./Org.OData.Capabilities.V1.xml#L522:~:text=Name="-,StreamsExpandable,-")|Boolean|$expand is supported for stream properties and media resources
[MaxLevels](./Org.OData.Capabilities.V1.xml#L525:~:text=Name="-,MaxLevels,-")|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

## <a name="ExpandRestrictionsType"></a>[ExpandRestrictionsType](./Org.OData.Capabilities.V1.xml#L529:~:text=Name="-,ExpandRestrictionsType,-"): [ExpandRestrictionsBase](#ExpandRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Expandable*](./Org.OData.Capabilities.V1.xml#L519:~:text=Name="-,Expandable,-")|Boolean|$expand is supported
[*StreamsExpandable*](./Org.OData.Capabilities.V1.xml#L522:~:text=Name="-,StreamsExpandable,-")|Boolean|$expand is supported for stream properties and media resources
[*MaxLevels*](./Org.OData.Capabilities.V1.xml#L525:~:text=Name="-,MaxLevels,-")|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.
[NonExpandableProperties](./Org.OData.Capabilities.V1.xml#L530:~:text=Name="-,NonExpandableProperties,-")|\[NavigationPropertyPath\]|These properties cannot be used in expand expressions
[NonExpandableStreamProperties](./Org.OData.Capabilities.V1.xml#L533:~:text=Name="-,NonExpandableStreamProperties,-")|\[PropertyPath\]|These stream properties cannot be used in expand expressions

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

## <a name="SearchRestrictionsType"></a>[SearchRestrictionsType](./Org.OData.Capabilities.V1.xml#L542:~:text=Name="-,SearchRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[Searchable](./Org.OData.Capabilities.V1.xml#L548:~:text=Name="-,Searchable,-")|Boolean|$search is supported
[UnsupportedExpressions](./Org.OData.Capabilities.V1.xml#L551:~:text=Name="-,UnsupportedExpressions,-")|[SearchExpressions](#SearchExpressions)|Expressions not supported in $search

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

## <a name="SearchExpressions"></a>[SearchExpressions](./Org.OData.Capabilities.V1.xml#L555:~:text=Name="-,SearchExpressions,-")


Flag Member|Value|Description
:-----|----:|:----------
[none](./Org.OData.Capabilities.V1.xml#L556:~:text=Name="-,none,-")|0|Single search term
[AND](./Org.OData.Capabilities.V1.xml#L559:~:text=Name="-,AND,-")|1|Multiple search terms separated by `AND`
[OR](./Org.OData.Capabilities.V1.xml#L562:~:text=Name="-,OR,-")|2|Multiple search terms separated by `OR`
[NOT](./Org.OData.Capabilities.V1.xml#L565:~:text=Name="-,NOT,-")|4|Search terms preceded by `NOT`
[phrase](./Org.OData.Capabilities.V1.xml#L568:~:text=Name="-,phrase,-")|8|Search phrases enclosed in double quotes
[group](./Org.OData.Capabilities.V1.xml#L571:~:text=Name="-,group,-")|16|Precedence grouping of search expressions with parentheses

## <a name="InsertRestrictionsBase"></a>[InsertRestrictionsBase](./Org.OData.Capabilities.V1.xml#L590:~:text=Name="-,InsertRestrictionsBase,-")


**Derived Types:**
- [InsertRestrictionsType](#InsertRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Insertable](./Org.OData.Capabilities.V1.xml#L591:~:text=Name="-,Insertable,-")|Boolean|Entities can be inserted
[MaxLevels](./Org.OData.Capabilities.V1.xml#L594:~:text=Name="-,MaxLevels,-")|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to insert into. A value of -1 indicates there is no restriction.
[TypecastSegmentSupported](./Org.OData.Capabilities.V1.xml#L597:~:text=Name="-,TypecastSegmentSupported,-")|Boolean|Entities of a specific derived type can be created by specifying a type-cast segment
[QueryOptions](./Org.OData.Capabilities.V1.xml#L600:~:text=Name="-,QueryOptions,-")|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with insert requests
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L603:~:text=Name="-,CustomHeaders,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L606:~:text=Name="-,CustomQueryOptions,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](./Org.OData.Capabilities.V1.xml#L609:~:text=Name="-,Description,-")|String?|A brief description of the request
[LongDescription](./Org.OData.Capabilities.V1.xml#L613:~:text=Name="-,LongDescription,-")|String?|A lengthy description of the request

## <a name="InsertRestrictionsType"></a>[InsertRestrictionsType](./Org.OData.Capabilities.V1.xml#L618:~:text=Name="-,InsertRestrictionsType,-"): [InsertRestrictionsBase](#InsertRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Insertable*](./Org.OData.Capabilities.V1.xml#L591:~:text=Name="-,Insertable,-")|Boolean|Entities can be inserted
[*MaxLevels*](./Org.OData.Capabilities.V1.xml#L594:~:text=Name="-,MaxLevels,-")|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to insert into. A value of -1 indicates there is no restriction.
[*TypecastSegmentSupported*](./Org.OData.Capabilities.V1.xml#L597:~:text=Name="-,TypecastSegmentSupported,-")|Boolean|Entities of a specific derived type can be created by specifying a type-cast segment
[*QueryOptions*](./Org.OData.Capabilities.V1.xml#L600:~:text=Name="-,QueryOptions,-")|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with insert requests
[*CustomHeaders*](./Org.OData.Capabilities.V1.xml#L603:~:text=Name="-,CustomHeaders,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](./Org.OData.Capabilities.V1.xml#L606:~:text=Name="-,CustomQueryOptions,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](./Org.OData.Capabilities.V1.xml#L609:~:text=Name="-,Description,-")|String?|A brief description of the request
[*LongDescription*](./Org.OData.Capabilities.V1.xml#L613:~:text=Name="-,LongDescription,-")|String?|A lengthy description of the request
[NonInsertableProperties](./Org.OData.Capabilities.V1.xml#L619:~:text=Name="-,NonInsertableProperties,-")|\[PropertyPath\]|These structural properties cannot be specified on insert
[NonInsertableNavigationProperties](./Org.OData.Capabilities.V1.xml#L622:~:text=Name="-,NonInsertableNavigationProperties,-")|\[NavigationPropertyPath\]|These navigation properties do not allow deep inserts
[RequiredProperties](./Org.OData.Capabilities.V1.xml#L625:~:text=Name="-,RequiredProperties,-")|\[PropertyPath\]|These structural properties must be specified on insert
[Permissions](./Org.OData.Capabilities.V1.xml#L628:~:text=Name="-,Permissions,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the insert.

## <a name="PermissionType"></a>[PermissionType](./Org.OData.Capabilities.V1.xml#L633:~:text=Name="-,PermissionType,-")


Property|Type|Description
:-------|:---|:----------
[SchemeName](./Org.OData.Capabilities.V1.xml#L634:~:text=Name="-,SchemeName,-")|[SchemeName](Org.OData.Authorization.V1.md#SchemeName)|Authorization flow scheme name
[Scopes](./Org.OData.Capabilities.V1.xml#L637:~:text=Name="-,Scopes,-")|\[[ScopeType](#ScopeType)\]|List of scopes that can provide access to the resource

## <a name="ScopeType"></a>[ScopeType](./Org.OData.Capabilities.V1.xml#L642:~:text=Name="-,ScopeType,-")


Property|Type|Description
:-------|:---|:----------
[Scope](./Org.OData.Capabilities.V1.xml#L643:~:text=Name="-,Scope,-")|String|Name of the scope.
[RestrictedProperties](./Org.OData.Capabilities.V1.xml#L646:~:text=Name="-,RestrictedProperties,-")|String?|Comma-separated string value of all properties that will be included or excluded when using the scope.<br>Possible string value identifiers when specifying properties are `*`, _PropertyName_, `-`_PropertyName_.<br/>`*` denotes all properties are accessible.<br/>`-`_PropertyName_ excludes that specific property.<br/>_PropertyName_ explicitly provides access to the specific property.<br/>The absence of `RestrictedProperties` denotes all properties are accessible using that scope.

## <a name="DeepInsertSupportType"></a>[DeepInsertSupportType](./Org.OData.Capabilities.V1.xml#L665:~:text=Name="-,DeepInsertSupportType,-")


Property|Type|Description
:-------|:---|:----------
[Supported](./Org.OData.Capabilities.V1.xml#L666:~:text=Name="-,Supported,-")|Boolean|Annotation target supports deep inserts
[ContentIDSupported](./Org.OData.Capabilities.V1.xml#L669:~:text=Name="-,ContentIDSupported,-")|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

## <a name="UpdateRestrictionsBase"></a>[UpdateRestrictionsBase](./Org.OData.Capabilities.V1.xml#L678:~:text=Name="-,UpdateRestrictionsBase,-")


**Derived Types:**
- [UpdateRestrictionsType](#UpdateRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Updatable](./Org.OData.Capabilities.V1.xml#L679:~:text=Name="-,Updatable,-")|Boolean|Entities can be updated
[Upsertable](./Org.OData.Capabilities.V1.xml#L682:~:text=Name="-,Upsertable,-")|Boolean|Entities can be upserted
[DeltaUpdateSupported](./Org.OData.Capabilities.V1.xml#L685:~:text=Name="-,DeltaUpdateSupported,-")|Boolean|Entities can be inserted, updated, and deleted via a PATCH request with a delta payload
[UpdateMethod](./Org.OData.Capabilities.V1.xml#L688:~:text=Name="-,UpdateMethod,-")|[HttpMethod?](#HttpMethod)|Supported HTTP Methods (PUT or PATCH) for updating an entity. If null, PATCH SHOULD be supported and PUT MAY be supported.
[FilterSegmentSupported](./Org.OData.Capabilities.V1.xml#L691:~:text=Name="-,FilterSegmentSupported,-")|Boolean|Members of collections can be updated via a PATCH request with a `/$filter(...)/$each` segment
[TypecastSegmentSupported](./Org.OData.Capabilities.V1.xml#L694:~:text=Name="-,TypecastSegmentSupported,-")|Boolean|Members of collections can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[MaxLevels](./Org.OData.Capabilities.V1.xml#L697:~:text=Name="-,MaxLevels,-")|Int32|The maximum number of navigation properties that can be traversed when addressing the collection or entity to update. A value of -1 indicates there is no restriction.
[Permissions](./Org.OData.Capabilities.V1.xml#L700:~:text=Name="-,Permissions,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the update.
[QueryOptions](./Org.OData.Capabilities.V1.xml#L703:~:text=Name="-,QueryOptions,-")|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with update requests
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L706:~:text=Name="-,CustomHeaders,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L709:~:text=Name="-,CustomQueryOptions,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](./Org.OData.Capabilities.V1.xml#L712:~:text=Name="-,Description,-")|String?|A brief description of the request
[LongDescription](./Org.OData.Capabilities.V1.xml#L716:~:text=Name="-,LongDescription,-")|String?|A lengthy description of the request

## <a name="UpdateRestrictionsType"></a>[UpdateRestrictionsType](./Org.OData.Capabilities.V1.xml#L721:~:text=Name="-,UpdateRestrictionsType,-"): [UpdateRestrictionsBase](#UpdateRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Updatable*](./Org.OData.Capabilities.V1.xml#L679:~:text=Name="-,Updatable,-")|Boolean|Entities can be updated
[*Upsertable*](./Org.OData.Capabilities.V1.xml#L682:~:text=Name="-,Upsertable,-")|Boolean|Entities can be upserted
[*DeltaUpdateSupported*](./Org.OData.Capabilities.V1.xml#L685:~:text=Name="-,DeltaUpdateSupported,-")|Boolean|Entities can be inserted, updated, and deleted via a PATCH request with a delta payload
[*UpdateMethod*](./Org.OData.Capabilities.V1.xml#L688:~:text=Name="-,UpdateMethod,-")|[HttpMethod?](#HttpMethod)|Supported HTTP Methods (PUT or PATCH) for updating an entity. If null, PATCH SHOULD be supported and PUT MAY be supported.
[*FilterSegmentSupported*](./Org.OData.Capabilities.V1.xml#L691:~:text=Name="-,FilterSegmentSupported,-")|Boolean|Members of collections can be updated via a PATCH request with a `/$filter(...)/$each` segment
[*TypecastSegmentSupported*](./Org.OData.Capabilities.V1.xml#L694:~:text=Name="-,TypecastSegmentSupported,-")|Boolean|Members of collections can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[*MaxLevels*](./Org.OData.Capabilities.V1.xml#L697:~:text=Name="-,MaxLevels,-")|Int32|The maximum number of navigation properties that can be traversed when addressing the collection or entity to update. A value of -1 indicates there is no restriction.
[*Permissions*](./Org.OData.Capabilities.V1.xml#L700:~:text=Name="-,Permissions,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the update.
[*QueryOptions*](./Org.OData.Capabilities.V1.xml#L703:~:text=Name="-,QueryOptions,-")|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with update requests
[*CustomHeaders*](./Org.OData.Capabilities.V1.xml#L706:~:text=Name="-,CustomHeaders,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](./Org.OData.Capabilities.V1.xml#L709:~:text=Name="-,CustomQueryOptions,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](./Org.OData.Capabilities.V1.xml#L712:~:text=Name="-,Description,-")|String?|A brief description of the request
[*LongDescription*](./Org.OData.Capabilities.V1.xml#L716:~:text=Name="-,LongDescription,-")|String?|A lengthy description of the request
[NonUpdatableProperties](./Org.OData.Capabilities.V1.xml#L722:~:text=Name="-,NonUpdatableProperties,-")|\[PropertyPath\]|These structural properties cannot be specified on update
[NonUpdatableNavigationProperties](./Org.OData.Capabilities.V1.xml#L725:~:text=Name="-,NonUpdatableNavigationProperties,-")|\[NavigationPropertyPath\]|These navigation properties do not allow rebinding
[RequiredProperties](./Org.OData.Capabilities.V1.xml#L728:~:text=Name="-,RequiredProperties,-")|\[PropertyPath\]|These structural properties must be specified on update

## <a name="HttpMethod"></a>[HttpMethod](./Org.OData.Capabilities.V1.xml#L733:~:text=Name="-,HttpMethod,-")


Flag Member|Value|Description
:-----|----:|:----------
[GET](./Org.OData.Capabilities.V1.xml#L734:~:text=Name="-,GET,-")|1|The HTTP GET Method
[PATCH](./Org.OData.Capabilities.V1.xml#L737:~:text=Name="-,PATCH,-")|2|The HTTP PATCH Method
[PUT](./Org.OData.Capabilities.V1.xml#L740:~:text=Name="-,PUT,-")|4|The HTTP PUT Method
[POST](./Org.OData.Capabilities.V1.xml#L743:~:text=Name="-,POST,-")|8|The HTTP POST Method
[DELETE](./Org.OData.Capabilities.V1.xml#L746:~:text=Name="-,DELETE,-")|16|The HTTP DELETE Method
[OPTIONS](./Org.OData.Capabilities.V1.xml#L749:~:text=Name="-,OPTIONS,-")|32|The HTTP OPTIONS Method
[HEAD](./Org.OData.Capabilities.V1.xml#L752:~:text=Name="-,HEAD,-")|64|The HTTP HEAD Method

## <a name="DeepUpdateSupportType"></a>[DeepUpdateSupportType](./Org.OData.Capabilities.V1.xml#L760:~:text=Name="-,DeepUpdateSupportType,-")


Property|Type|Description
:-------|:---|:----------
[Supported](./Org.OData.Capabilities.V1.xml#L761:~:text=Name="-,Supported,-")|Boolean|Annotation target supports deep updates
[ContentIDSupported](./Org.OData.Capabilities.V1.xml#L764:~:text=Name="-,ContentIDSupported,-")|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

## <a name="DeleteRestrictionsBase"></a>[DeleteRestrictionsBase](./Org.OData.Capabilities.V1.xml#L773:~:text=Name="-,DeleteRestrictionsBase,-")


**Derived Types:**
- [DeleteRestrictionsType](#DeleteRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Deletable](./Org.OData.Capabilities.V1.xml#L774:~:text=Name="-,Deletable,-")|Boolean|Entities can be deleted
[MaxLevels](./Org.OData.Capabilities.V1.xml#L777:~:text=Name="-,MaxLevels,-")|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to delete from or the entity to delete. A value of -1 indicates there is no restriction.
[FilterSegmentSupported](./Org.OData.Capabilities.V1.xml#L780:~:text=Name="-,FilterSegmentSupported,-")|Boolean|Members of collections can be updated via a PATCH request with a `/$filter(...)/$each` segment
[TypecastSegmentSupported](./Org.OData.Capabilities.V1.xml#L783:~:text=Name="-,TypecastSegmentSupported,-")|Boolean|Members of collections can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[Permissions](./Org.OData.Capabilities.V1.xml#L786:~:text=Name="-,Permissions,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the delete.
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L789:~:text=Name="-,CustomHeaders,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L792:~:text=Name="-,CustomQueryOptions,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](./Org.OData.Capabilities.V1.xml#L795:~:text=Name="-,Description,-")|String?|A brief description of the request
[LongDescription](./Org.OData.Capabilities.V1.xml#L799:~:text=Name="-,LongDescription,-")|String?|A lengthy description of the request

## <a name="DeleteRestrictionsType"></a>[DeleteRestrictionsType](./Org.OData.Capabilities.V1.xml#L804:~:text=Name="-,DeleteRestrictionsType,-"): [DeleteRestrictionsBase](#DeleteRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Deletable*](./Org.OData.Capabilities.V1.xml#L774:~:text=Name="-,Deletable,-")|Boolean|Entities can be deleted
[*MaxLevels*](./Org.OData.Capabilities.V1.xml#L777:~:text=Name="-,MaxLevels,-")|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to delete from or the entity to delete. A value of -1 indicates there is no restriction.
[*FilterSegmentSupported*](./Org.OData.Capabilities.V1.xml#L780:~:text=Name="-,FilterSegmentSupported,-")|Boolean|Members of collections can be updated via a PATCH request with a `/$filter(...)/$each` segment
[*TypecastSegmentSupported*](./Org.OData.Capabilities.V1.xml#L783:~:text=Name="-,TypecastSegmentSupported,-")|Boolean|Members of collections can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[*Permissions*](./Org.OData.Capabilities.V1.xml#L786:~:text=Name="-,Permissions,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the delete.
[*CustomHeaders*](./Org.OData.Capabilities.V1.xml#L789:~:text=Name="-,CustomHeaders,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](./Org.OData.Capabilities.V1.xml#L792:~:text=Name="-,CustomQueryOptions,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](./Org.OData.Capabilities.V1.xml#L795:~:text=Name="-,Description,-")|String?|A brief description of the request
[*LongDescription*](./Org.OData.Capabilities.V1.xml#L799:~:text=Name="-,LongDescription,-")|String?|A lengthy description of the request
[NonDeletableNavigationProperties](./Org.OData.Capabilities.V1.xml#L805:~:text=Name="-,NonDeletableNavigationProperties,-")|\[NavigationPropertyPath\]|These navigation properties do not allow DeleteLink requests

## <a name="CollectionPropertyRestrictionsType"></a>[CollectionPropertyRestrictionsType](./Org.OData.Capabilities.V1.xml#L813:~:text=Name="-,CollectionPropertyRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[CollectionProperty](./Org.OData.Capabilities.V1.xml#L814:~:text=Name="-,CollectionProperty,-")|PropertyPath?|Restricted Collection-valued property
[FilterFunctions](./Org.OData.Capabilities.V1.xml#L817:~:text=Name="-,FilterFunctions,-")|\[String\]|List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](./Org.OData.Capabilities.V1.xml#L821:~:text=Name="-,FilterRestrictions,-")|[FilterRestrictionsType?](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](./Org.OData.Capabilities.V1.xml#L824:~:text=Name="-,SearchRestrictions,-")|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](./Org.OData.Capabilities.V1.xml#L827:~:text=Name="-,SortRestrictions,-")|[SortRestrictionsType?](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](./Org.OData.Capabilities.V1.xml#L830:~:text=Name="-,TopSupported,-")|Boolean|Supports $top
[SkipSupported](./Org.OData.Capabilities.V1.xml#L833:~:text=Name="-,SkipSupported,-")|Boolean|Supports $skip
[SelectSupport](./Org.OData.Capabilities.V1.xml#L836:~:text=Name="-,SelectSupport,-")|[SelectSupportType?](#SelectSupportType)|Support for $select
[Insertable](./Org.OData.Capabilities.V1.xml#L839:~:text=Name="-,Insertable,-")|Boolean|Members can be inserted into this collection<br>If additionally annotated with [Core.PositionalInsert](Org.OData.Core.V1.md#PositionalInsert), members can be inserted at a specific position
[Updatable](./Org.OData.Capabilities.V1.xml#L843:~:text=Name="-,Updatable,-")|Boolean|Members of this ordered collection can be updated by ordinal
[Deletable](./Org.OData.Capabilities.V1.xml#L846:~:text=Name="-,Deletable,-")|Boolean|Members of this ordered collection can be deleted by ordinal

## <a name="OperationRestrictionsType"></a>[OperationRestrictionsType](./Org.OData.Capabilities.V1.xml#L854:~:text=Name="-,OperationRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[FilterSegmentSupported](./Org.OData.Capabilities.V1.xml#L855:~:text=Name="-,FilterSegmentSupported,-")|Boolean|Bound action or function can be invoked on a collection-valued binding parameter path with a `/$filter(...)` segment
[Permissions](./Org.OData.Capabilities.V1.xml#L858:~:text=Name="-,Permissions,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to invoke an action or function
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L861:~:text=Name="-,CustomHeaders,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L864:~:text=Name="-,CustomQueryOptions,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options

## <a name="ModificationQueryOptionsType"></a>[ModificationQueryOptionsType](./Org.OData.Capabilities.V1.xml#L875:~:text=Name="-,ModificationQueryOptionsType,-")


Property|Type|Description
:-------|:---|:----------
[ExpandSupported](./Org.OData.Capabilities.V1.xml#L876:~:text=Name="-,ExpandSupported,-")|Boolean|Supports $expand with modification requests
[SelectSupported](./Org.OData.Capabilities.V1.xml#L879:~:text=Name="-,SelectSupported,-")|Boolean|Supports $select with modification requests
[ComputeSupported](./Org.OData.Capabilities.V1.xml#L882:~:text=Name="-,ComputeSupported,-")|Boolean|Supports $compute with modification requests
[FilterSupported](./Org.OData.Capabilities.V1.xml#L885:~:text=Name="-,FilterSupported,-")|Boolean|Supports $filter with modification requests
[SearchSupported](./Org.OData.Capabilities.V1.xml#L888:~:text=Name="-,SearchSupported,-")|Boolean|Supports $search with modification requests
[SortSupported](./Org.OData.Capabilities.V1.xml#L891:~:text=Name="-,SortSupported,-")|Boolean|Supports $orderby with modification requests

## <a name="ReadRestrictionsBase"></a>[*ReadRestrictionsBase*](./Org.OData.Capabilities.V1.xml#L899:~:text=Name="-,ReadRestrictionsBase,-")


**Derived Types:**
- [ReadByKeyRestrictionsType](#ReadByKeyRestrictionsType)
- [ReadRestrictionsType](#ReadRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Readable](./Org.OData.Capabilities.V1.xml#L900:~:text=Name="-,Readable,-")|Boolean|Entities can be retrieved
[Permissions](./Org.OData.Capabilities.V1.xml#L903:~:text=Name="-,Permissions,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L906:~:text=Name="-,CustomHeaders,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L909:~:text=Name="-,CustomQueryOptions,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](./Org.OData.Capabilities.V1.xml#L912:~:text=Name="-,Description,-")|String?|A brief description of the request
[LongDescription](./Org.OData.Capabilities.V1.xml#L916:~:text=Name="-,LongDescription,-")|String?|A lengthy description of the request

## <a name="ReadByKeyRestrictionsType"></a>[ReadByKeyRestrictionsType](./Org.OData.Capabilities.V1.xml#L921:~:text=Name="-,ReadByKeyRestrictionsType,-"): [ReadRestrictionsBase](#ReadRestrictionsBase)
Restrictions for retrieving an entity by key

Property|Type|Description
:-------|:---|:----------
[*Readable*](./Org.OData.Capabilities.V1.xml#L900:~:text=Name="-,Readable,-")|Boolean|Entities can be retrieved
[*Permissions*](./Org.OData.Capabilities.V1.xml#L903:~:text=Name="-,Permissions,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[*CustomHeaders*](./Org.OData.Capabilities.V1.xml#L906:~:text=Name="-,CustomHeaders,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](./Org.OData.Capabilities.V1.xml#L909:~:text=Name="-,CustomQueryOptions,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](./Org.OData.Capabilities.V1.xml#L912:~:text=Name="-,Description,-")|String?|A brief description of the request
[*LongDescription*](./Org.OData.Capabilities.V1.xml#L916:~:text=Name="-,LongDescription,-")|String?|A lengthy description of the request

## <a name="ReadRestrictionsType"></a>[ReadRestrictionsType](./Org.OData.Capabilities.V1.xml#L924:~:text=Name="-,ReadRestrictionsType,-"): [ReadRestrictionsBase](#ReadRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Readable*](./Org.OData.Capabilities.V1.xml#L900:~:text=Name="-,Readable,-")|Boolean|Entities can be retrieved
[*Permissions*](./Org.OData.Capabilities.V1.xml#L903:~:text=Name="-,Permissions,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[*CustomHeaders*](./Org.OData.Capabilities.V1.xml#L906:~:text=Name="-,CustomHeaders,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](./Org.OData.Capabilities.V1.xml#L909:~:text=Name="-,CustomQueryOptions,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](./Org.OData.Capabilities.V1.xml#L912:~:text=Name="-,Description,-")|String?|A brief description of the request
[*LongDescription*](./Org.OData.Capabilities.V1.xml#L916:~:text=Name="-,LongDescription,-")|String?|A lengthy description of the request
[ReadByKeyRestrictions](./Org.OData.Capabilities.V1.xml#L925:~:text=Name="-,ReadByKeyRestrictions,-")|[ReadByKeyRestrictionsType?](#ReadByKeyRestrictionsType)|Restrictions for retrieving an entity by key<br>Only valid when applied to a collection. If a property of `ReadByKeyRestrictions` is not specified, the corresponding property value of `ReadRestrictions` applies.

## <a name="CustomParameter"></a>[CustomParameter](./Org.OData.Capabilities.V1.xml#L988:~:text=Name="-,CustomParameter,-")
A custom parameter is either a header or a query option

The type of a custom parameter is always a string. Restrictions on the parameter values can be expressed by annotating the record expression describing the parameter with terms from the Validation vocabulary, e.g. Validation.Pattern or Validation.AllowedValues.

Property|Type|Description
:-------|:---|:----------
[Name](./Org.OData.Capabilities.V1.xml#L991:~:text=Name="-,Name,-")|String|Name of the custom parameter
[Description](./Org.OData.Capabilities.V1.xml#L994:~:text=Name="-,Description,-")|String?|Description of the custom parameter
[DocumentationURL](./Org.OData.Capabilities.V1.xml#L997:~:text=Name="-,DocumentationURL,-")|URL?|URL of related documentation
[Required](./Org.OData.Capabilities.V1.xml#L1001:~:text=Name="-,Required,-")|Boolean|true: parameter is required, false or not specified: parameter is optional
[ExampleValues](./Org.OData.Capabilities.V1.xml#L1004:~:text=Name="-,ExampleValues,-")|\[[PrimitiveExampleValue](Org.OData.Core.V1.md#PrimitiveExampleValue)\]|Example values for the custom parameter

## <a name="DefaultCapabilitiesType"></a>[DefaultCapabilitiesType](./Org.OData.Capabilities.V1.xml#L1027:~:text=Name="-,DefaultCapabilitiesType,-")


Property|Type|Description
:-------|:---|:----------
[ChangeTracking](./Org.OData.Capabilities.V1.xml#L1028:~:text=Name="-,ChangeTracking,-")|[ChangeTrackingBase?](#ChangeTrackingBase)|Change tracking capabilities
[CountRestrictions](./Org.OData.Capabilities.V1.xml#L1031:~:text=Name="-,CountRestrictions,-")|[CountRestrictionsBase?](#CountRestrictionsBase)|Restrictions on /$count path suffix and $count=true system query option
[IndexableByKey](./Org.OData.Capabilities.V1.xml#L1034:~:text=Name="-,IndexableByKey,-")|[Tag?](Org.OData.Core.V1.md#Tag)|Supports key values according to OData URL conventions
[TopSupported](./Org.OData.Capabilities.V1.xml#L1037:~:text=Name="-,TopSupported,-")|[Tag?](Org.OData.Core.V1.md#Tag)|Supports $top
[SkipSupported](./Org.OData.Capabilities.V1.xml#L1040:~:text=Name="-,SkipSupported,-")|[Tag?](Org.OData.Core.V1.md#Tag)|Supports $skip
[ComputeSupported](./Org.OData.Capabilities.V1.xml#L1043:~:text=Name="-,ComputeSupported,-")|[Tag?](Org.OData.Core.V1.md#Tag)|Supports $compute
[SelectSupport](./Org.OData.Capabilities.V1.xml#L1046:~:text=Name="-,SelectSupport,-")|[SelectSupportType?](#SelectSupportType)|Support for $select and nested query options within $select
[FilterRestrictions](./Org.OData.Capabilities.V1.xml#L1049:~:text=Name="-,FilterRestrictions,-")|[FilterRestrictionsBase?](#FilterRestrictionsBase)|Restrictions on filter expressions
[SortRestrictions](./Org.OData.Capabilities.V1.xml#L1052:~:text=Name="-,SortRestrictions,-")|[SortRestrictionsBase?](#SortRestrictionsBase)|Restrictions on orderby expressions
[ExpandRestrictions](./Org.OData.Capabilities.V1.xml#L1055:~:text=Name="-,ExpandRestrictions,-")|[ExpandRestrictionsBase?](#ExpandRestrictionsBase)|Restrictions on expand expressions
[SearchRestrictions](./Org.OData.Capabilities.V1.xml#L1058:~:text=Name="-,SearchRestrictions,-")|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[InsertRestrictions](./Org.OData.Capabilities.V1.xml#L1061:~:text=Name="-,InsertRestrictions,-")|[InsertRestrictionsBase?](#InsertRestrictionsBase)|Restrictions on insert operations
[UpdateRestrictions](./Org.OData.Capabilities.V1.xml#L1064:~:text=Name="-,UpdateRestrictions,-")|[UpdateRestrictionsBase?](#UpdateRestrictionsBase)|Restrictions on update operations
[DeleteRestrictions](./Org.OData.Capabilities.V1.xml#L1067:~:text=Name="-,DeleteRestrictions,-")|[DeleteRestrictionsBase?](#DeleteRestrictionsBase)|Restrictions on delete operations
[OperationRestrictions](./Org.OData.Capabilities.V1.xml#L1070:~:text=Name="-,OperationRestrictions,-")|[OperationRestrictionsType?](#OperationRestrictionsType)|Restrictions for function or action operations
[ReadRestrictions](./Org.OData.Capabilities.V1.xml#L1073:~:text=Name="-,ReadRestrictions,-")|[ReadRestrictionsType?](#ReadRestrictionsType)|Restrictions for retrieving a collection of entities, retrieving a singleton instance
