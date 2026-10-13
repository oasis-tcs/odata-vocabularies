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

Capabilities annotations can be given through three mechanisms:
- embedded within a model element `edm:EntitySet` or `edm:Singleton`;
  let T then be the path from the container to that model element
- with an external annotation target T starting with a container and targeting a collection
- a `Capabilities.NavigationRestrictions` annotation with a `RestrictedProperties/NavigationProperty`;
  let T then be the concatenation of
  - the annotation target in the case of external targeting, otherwise the path from the container to the entity set or singleton in which the annotation is embedded
  - and the navigation property path in `RestrictedProperties/NavigationProperty`.

It is an error to specify conflicting restrictions of the same capability with the same T.
A resource path _matches_ T if it contains the same non-container, non-key segments in the same order as T.

If T contains no non-containment navigation property, then resource paths matching T are
canonical in the sense of [OData-URL, sections 4.3.1 and 4.3.2]. A capabilities annotation
with such a T applies to every entity that can be addressed by a canonical resource path matching T,
even when it is addressed via another, non-canonical, resource path.

If T contains at least one non-containment navigation property, the capabilities annotation
is specific to resource paths matching T, such resource paths are non-canonical.
Restrictions in such capabilities annotations take precedence over any restrictions
from capabilities annotations where T matches the canonical resource path.
        


## Terms

Term|Type|Description
:---|:---|:----------
[ConformanceLevel](Org.OData.Capabilities.V1.xml#L137)|[ConformanceLevelType](#ConformanceLevelType)|<a name="ConformanceLevel"></a>The conformance level achieved by this service
[SupportedFormats](Org.OData.Capabilities.V1.xml#L154)|\[MediaType\]|<a name="SupportedFormats"></a>Media types of supported formats, including format parameters
[SupportedMetadataFormats](Org.OData.Capabilities.V1.xml#L159)|\[MediaType\]|<a name="SupportedMetadataFormats"></a>Media types of supported formats for $metadata, including format parameters
[AcceptableEncodings](Org.OData.Capabilities.V1.xml#L164)|\[String\]|<a name="AcceptableEncodings"></a>List of acceptable compression methods for ($batch) requests, e.g. gzip
[AsynchronousRequestsSupported](Org.OData.Capabilities.V1.xml#L170)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AsynchronousRequestsSupported"></a>Service supports the asynchronous request preference
[BatchContinueOnErrorSupported](Org.OData.Capabilities.V1.xml#L174) *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchContinueOnErrorSupported"></a>Deprecated in favor of the [`ContinueOnErrorSupported`](#BatchSupportType) property from the [`BatchSupport`](#BatchSupport) term
[IsolationSupported](Org.OData.Capabilities.V1.xml#L186)|[IsolationLevel](#IsolationLevel)|<a name="IsolationSupported"></a>Supported odata.isolation levels
[CrossJoinSupported](Org.OData.Capabilities.V1.xml#L195)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="CrossJoinSupported"></a>Supports cross joins for the entity sets in this container
[CallbackSupported](Org.OData.Capabilities.V1.xml#L199)|[CallbackType](#CallbackType)|<a name="CallbackSupported"></a>Supports callbacks for the specified protocols
[ChangeTracking](Org.OData.Capabilities.V1.xml#L221)|[ChangeTrackingType](#ChangeTrackingType)|<a name="ChangeTracking"></a>Change tracking capabilities of this service or entity set
[CountRestrictions](Org.OData.Capabilities.V1.xml#L242)|[CountRestrictionsType](#CountRestrictionsType)|<a name="CountRestrictions"></a>Restrictions on /$count path suffix and $count=true system query option
[NavigationRestrictions](Org.OData.Capabilities.V1.xml#L298)|[NavigationRestrictionsType](#NavigationRestrictionsType)|<a name="NavigationRestrictions"></a>Restrictions on navigating properties according to OData URL conventions
[IndexableByKey](Org.OData.Capabilities.V1.xml#L388)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="IndexableByKey"></a>Supports key values according to OData URL conventions
[TopSupported](Org.OData.Capabilities.V1.xml#L393)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="TopSupported"></a>Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L398)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="SkipSupported"></a>Supports $skip
[ComputeSupported](Org.OData.Capabilities.V1.xml#L403)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="ComputeSupported"></a>Supports $compute
[SelectSupport](Org.OData.Capabilities.V1.xml#L408)|[SelectSupportType](#SelectSupportType)|<a name="SelectSupport"></a>Support for $select and nested query options within $select
[BatchSupported](Org.OData.Capabilities.V1.xml#L445)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchSupported"></a>Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.
[BatchSupport](Org.OData.Capabilities.V1.xml#L449)|[BatchSupportType](#BatchSupportType)|<a name="BatchSupport"></a>Batch Support for the service
[FilterFunctions](Org.OData.Capabilities.V1.xml#L499)|\[String\]|<a name="FilterFunctions"></a>List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L505)|[FilterRestrictionsType](#FilterRestrictionsType)|<a name="FilterRestrictions"></a>Restrictions on filter expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L586)|[SortRestrictionsType](#SortRestrictionsType)|<a name="SortRestrictions"></a>Restrictions on orderby expressions
[ExpandRestrictions](Org.OData.Capabilities.V1.xml#L612)|[ExpandRestrictionsType](#ExpandRestrictionsType)|<a name="ExpandRestrictions"></a>Restrictions on expand expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L661)|[SearchRestrictionsType](#SearchRestrictionsType)|<a name="SearchRestrictions"></a>Restrictions on search expressions
[KeyAsSegmentSupported](Org.OData.Capabilities.V1.xml#L707)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="KeyAsSegmentSupported"></a>Supports [key-as-segment convention](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_KeyasSegmentConvention) for addressing entities within a collection
[QuerySegmentSupported](Org.OData.Capabilities.V1.xml#L711)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="QuerySegmentSupported"></a>Supports [passing query options in the request body](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_PassingQueryOptionsintheRequestBody)
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L717)|[InsertRestrictionsType](#InsertRestrictionsType)|<a name="InsertRestrictions"></a>Restrictions on insert operations
[DeepInsertSupport](Org.OData.Capabilities.V1.xml#L796)|[DeepInsertSupportType?](#DeepInsertSupportType)|<a name="DeepInsertSupport"></a>Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L809)|[UpdateRestrictionsType](#UpdateRestrictionsType)|<a name="UpdateRestrictions"></a>Restrictions on update operations
[DeepUpdateSupport](Org.OData.Capabilities.V1.xml#L895)|[DeepUpdateSupportType](#DeepUpdateSupportType)|<a name="DeepUpdateSupport"></a>Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L908)|[DeleteRestrictionsType](#DeleteRestrictionsType)|<a name="DeleteRestrictions"></a>Restrictions on delete operations
[CollectionPropertyRestrictions](Org.OData.Capabilities.V1.xml#L952)|\[[CollectionPropertyRestrictionsType](#CollectionPropertyRestrictionsType)\]|<a name="CollectionPropertyRestrictions"></a>Describes restrictions on operations applied to collection-valued structural properties
[OperationRestrictions](Org.OData.Capabilities.V1.xml#L993)|[OperationRestrictionsType](#OperationRestrictionsType)|<a name="OperationRestrictions"></a>Restrictions for function or action operation
[AnnotationValuesInQuerySupported](Org.OData.Capabilities.V1.xml#L1013)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AnnotationValuesInQuerySupported"></a>Supports annotation values within system query options
[ModificationQueryOptions](Org.OData.Capabilities.V1.xml#L1017)|[ModificationQueryOptionsType](#ModificationQueryOptionsType)|<a name="ModificationQueryOptions"></a>Support for query options with modification requests (insert, update, action invocation)
[ReadRestrictions](Org.OData.Capabilities.V1.xml#L1041)|[ReadRestrictionsType](#ReadRestrictionsType)|<a name="ReadRestrictions"></a>Restrictions for retrieving a collection of entities, retrieving a singleton instance.
[CustomHeaders](Org.OData.Capabilities.V1.xml#L1083)|\[[CustomParameter](#CustomParameter)\]|<a name="CustomHeaders"></a>Custom headers that are supported/required for the annotated resource ([Example](Org.OData.Capabilities.V1.xml#L1085))
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L1109)|\[[CustomParameter](#CustomParameter)\]|<a name="CustomQueryOptions"></a>Custom query options that are supported/required for the annotated resource ([Example](Org.OData.Capabilities.V1.xml#L1112))<br>If the entity container is annotated, the query option is supported/required by all resources in that container.
[MediaLocationUpdateSupported](Org.OData.Capabilities.V1.xml#L1161)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="MediaLocationUpdateSupported"></a>Stream property or media stream supports update of its media edit URL and/or media read URL
[DefaultCapabilities](Org.OData.Capabilities.V1.xml#L1166)|[DefaultCapabilitiesType](#DefaultCapabilitiesType)|<a name="DefaultCapabilities"></a>Default capability settings for all collection-valued resources in the container<br><p>Annotating a specific capability term, which is included as property in <code>DefaultCapabilitiesType</code>, for a specific collection-valued resource overrides the default capability with the specified properties using PATCH semantics:</p> <ul> <li>Primitive or collection-valued properties specified in the specific capability term replace the corresponding properties specified in <code>DefaultCapabilities</code></li> <li>Complex-valued properties specified in the specific capability term override the corresponding properties specified in <code>DefaultCapabilities</code> using PATCH semantics recursively</li> <li>Properties specified neither in the specific term nor in <code>DefaultCapabilities</code> have their default value</li> </ul> 

<a name="ConformanceLevelType"></a>
## [ConformanceLevelType](Org.OData.Capabilities.V1.xml#L140)


Member|Value|Description
:-----|----:|:----------
[Minimal](Org.OData.Capabilities.V1.xml#L141)|0|Minimal conformance level
[Intermediate](Org.OData.Capabilities.V1.xml#L144)|1|Intermediate conformance level
[Advanced](Org.OData.Capabilities.V1.xml#L147)|2|Advanced conformance level

<a name="IsolationLevel"></a>
## [IsolationLevel](Org.OData.Capabilities.V1.xml#L189)


Flag Member|Value|Description
:-----|----:|:----------
[Snapshot](Org.OData.Capabilities.V1.xml#L190)|1|All data returned for a request, including multiple requests within a batch or results retrieved across multiple pages, will be consistent as of a single point in time

<a name="CallbackType"></a>
## [CallbackType](Org.OData.Capabilities.V1.xml#L202)
A non-empty collection lists the full set of supported protocols. A empty collection means 'only HTTP is supported'

Property|Type|Description
:-------|:---|:----------
[CallbackProtocols](Org.OData.Capabilities.V1.xml#L203)|\[[CallbackProtocol](#CallbackProtocol)\]|List of supported callback protocols, e.g. `http` or `wss`

<a name="CallbackProtocol"></a>
## [CallbackProtocol](Org.OData.Capabilities.V1.xml#L208)


Property|Type|Description
:-------|:---|:----------
[Id](Org.OData.Capabilities.V1.xml#L209)|String?|Protocol Identifier
[UrlTemplate](Org.OData.Capabilities.V1.xml#L212)|String?|URL Template including parameters. Parameters are enclosed in curly braces {} as defined in RFC6570
[DocumentationUrl](Org.OData.Capabilities.V1.xml#L215)|URL?|Human readable description of the meaning of the URL Template parameters

<a name="ChangeTrackingBase"></a>
## [ChangeTrackingBase](Org.OData.Capabilities.V1.xml#L224)


**Derived Types:**
- [ChangeTrackingType](#ChangeTrackingType)

Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L225)|Boolean|odata.track-changes preference is supported

<a name="ChangeTrackingType"></a>
## [ChangeTrackingType](Org.OData.Capabilities.V1.xml#L229): [ChangeTrackingBase](#ChangeTrackingBase)


Property|Type|Description
:-------|:---|:----------
[*Supported*](Org.OData.Capabilities.V1.xml#L225)|Boolean|odata.track-changes preference is supported
[FilterableProperties](Org.OData.Capabilities.V1.xml#L230)|\[PropertyPath\]|Change tracking supports filters on these properties<br>If no properties are specified or FilterableProperties is omitted, clients cannot assume support for filtering on any properties in combination with change tracking.
[ExpandableProperties](Org.OData.Capabilities.V1.xml#L234)|\[NavigationPropertyPath\]|Change tracking supports these properties expanded<br>If no properties are specified or ExpandableProperties is omitted, clients cannot assume support for expanding any properties in combination with change tracking.

<a name="CountRestrictionsBase"></a>
## [CountRestrictionsBase](Org.OData.Capabilities.V1.xml#L246)


**Derived Types:**
- [CountRestrictionsType](#CountRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Countable](Org.OData.Capabilities.V1.xml#L247)|Boolean|Instances can be counted in requests targeting a collection
[InlineCountAccuracy](Org.OData.Capabilities.V1.xml#L250)|[CountAccuracy?](#CountAccuracy)|The default accuracy for inline count

<a name="CountRestrictionsType"></a>
## [CountRestrictionsType](Org.OData.Capabilities.V1.xml#L254): [CountRestrictionsBase](#CountRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Countable*](Org.OData.Capabilities.V1.xml#L247)|Boolean|Instances can be counted in requests targeting a collection
[*InlineCountAccuracy*](Org.OData.Capabilities.V1.xml#L250)|[CountAccuracy?](#CountAccuracy)|The default accuracy for inline count
[NonCountableProperties](Org.OData.Capabilities.V1.xml#L255)|\[PropertyPath\]|Members of these collection properties cannot be counted
[NonCountableNavigationProperties](Org.OData.Capabilities.V1.xml#L258)|\[NavigationPropertyPath\]|Members of these navigation properties cannot be counted

<a name="CountAccuracy"></a>
## [CountAccuracy](Org.OData.Capabilities.V1.xml#L263)
**Type:** String

The accuracy of the count value


            Note that additional values may be defined in the future. Clients should treat any unknown value as an inexact count.
            If the service changes the default accuracy from `counted` to any other value, it MUST return the actual count accuracy
            in responses to preserve backward compatibility with existing clients.
          

Allowed Value|Description
:------------|:----------
[counted](Org.OData.Capabilities.V1.xml#L274)|The count was exact at the time of calculation
[estimated](Org.OData.Capabilities.V1.xml#L278)|The count was estimated
[cached](Org.OData.Capabilities.V1.xml#L282)|The count was based on cached values and may no longer be current
[partial](Org.OData.Capabilities.V1.xml#L286)|The collection contained at least the returned number of items at the time of calculation
[unavailable](Org.OData.Capabilities.V1.xml#L290)|The count was unavailable and the count value returned (typically 0) should be ignored

<a name="NavigationRestrictionsType"></a>
## [NavigationRestrictionsType](Org.OData.Capabilities.V1.xml#L302)


Property|Type|Description
:-------|:---|:----------
[Navigability](Org.OData.Capabilities.V1.xml#L303)|[NavigationType?](#NavigationType)|Default navigability for all navigation properties of the annotation target. Individual navigation properties can override this value via `RestrictedProperties/Navigability`.
[RestrictedProperties](Org.OData.Capabilities.V1.xml#L306)|\[[NavigationPropertyRestriction](#NavigationPropertyRestriction)\]|List of navigation properties with restrictions

<a name="NavigationPropertyRestriction"></a>
## [NavigationPropertyRestriction](Org.OData.Capabilities.V1.xml#L310)


Using a property of `NavigationPropertyRestriction` in a [`NavigationRestrictions`](#NavigationRestrictions) annotation
          is discouraged in favor of using an annotation with the corresponding term from this vocabulary and a target path starting with a container and ending in the `NavigationProperty`,
          unless the favored alternative is impossible because a dynamic expression requires an instance path whose evaluation
          starts at the target of the `NavigationRestrictions` annotation. See [this example](../examples/Org.OData.Capabilities.V1.capabilities.md).

Property|Type|Description
:-------|:---|:----------
[NavigationProperty](Org.OData.Capabilities.V1.xml#L317)|NavigationPropertyPath|Navigation properties can be navigated<br>The target path of a [`NavigationRestrictions`](#NavigationRestrictions) annotation followed by this navigation property path addresses the resource to which the other properties of `NavigationPropertyRestriction` apply. Instance paths that occur in dynamic expressions are evaluated starting at the boundary between both paths, which must therefore be chosen accordingly.
[Navigability](Org.OData.Capabilities.V1.xml#L326)|[NavigationType?](#NavigationType)|Supported navigability of this navigation property
[FilterFunctions](Org.OData.Capabilities.V1.xml#L329)|\[String\]|List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L333)|[FilterRestrictionsType?](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L336)|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L339)|[SortRestrictionsType?](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](Org.OData.Capabilities.V1.xml#L342)|Boolean|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L345)|Boolean|Supports $skip
[SelectSupport](Org.OData.Capabilities.V1.xml#L348)|[SelectSupportType?](#SelectSupportType)|Support for $select
[IndexableByKey](Org.OData.Capabilities.V1.xml#L351)|Boolean|Supports key values according to OData URL conventions
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L354)|[InsertRestrictionsType?](#InsertRestrictionsType)|Restrictions on insert operations
[DeepInsertSupport](Org.OData.Capabilities.V1.xml#L357)|[DeepInsertSupportType?](#DeepInsertSupportType)|Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L360)|[UpdateRestrictionsType?](#UpdateRestrictionsType)|Restrictions on update operations
[DeepUpdateSupport](Org.OData.Capabilities.V1.xml#L363)|[DeepUpdateSupportType?](#DeepUpdateSupportType)|Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L366)|[DeleteRestrictionsType?](#DeleteRestrictionsType)|Restrictions on delete operations
[OptimisticConcurrencyControl](Org.OData.Capabilities.V1.xml#L369)|Boolean|Data modification (including insert) along this navigation property requires the use of ETags
[ReadRestrictions](Org.OData.Capabilities.V1.xml#L372)|[ReadRestrictionsType?](#ReadRestrictionsType)|Restrictions for retrieving entities

<a name="NavigationType"></a>
## [NavigationType](Org.OData.Capabilities.V1.xml#L376)


Member|Value|Description
:-----|----:|:----------
[Recursive](Org.OData.Capabilities.V1.xml#L377)|0|Navigation properties can be recursively navigated
[Single](Org.OData.Capabilities.V1.xml#L380)|1|Navigation properties can be navigated to a single level
[None](Org.OData.Capabilities.V1.xml#L383)|2|Navigation properties are not navigable

<a name="SelectSupportType"></a>
## [SelectSupportType](Org.OData.Capabilities.V1.xml#L412)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L413)|Boolean|Supports $select
[InstanceAnnotationsSupported](Org.OData.Capabilities.V1.xml#L416)|Boolean|Supports instance annotations in $select list
[Expandable](Org.OData.Capabilities.V1.xml#L419)|Boolean|$expand within $select is supported
[Filterable](Org.OData.Capabilities.V1.xml#L422)|Boolean|$filter within $select is supported
[Searchable](Org.OData.Capabilities.V1.xml#L425)|Boolean|$search within $select is supported
[TopSupported](Org.OData.Capabilities.V1.xml#L428)|Boolean|$top within $select is supported
[SkipSupported](Org.OData.Capabilities.V1.xml#L431)|Boolean|$skip within $select is supported
[ComputeSupported](Org.OData.Capabilities.V1.xml#L434)|Boolean|$compute within $select is supported
[Countable](Org.OData.Capabilities.V1.xml#L437)|Boolean|$count within $select is supported
[Sortable](Org.OData.Capabilities.V1.xml#L440)|Boolean|$orderby within $select is supported

<a name="BatchSupportType"></a>
## [BatchSupportType](Org.OData.Capabilities.V1.xml#L452)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L459)|Boolean|Service supports requests to $batch
[ContinueOnErrorSupported](Org.OData.Capabilities.V1.xml#L462)|Boolean|Service supports the `continue-on-error` preference<br>When the client specifies the `continue-on-error` preference, the service applies it by processing all requests according to their dependencies, regardless of the format for the $batch request.
[ReferencesInRequestBodiesSupported](Org.OData.Capabilities.V1.xml#L469)|Boolean|Service supports Content-ID referencing in request bodies
[ReferencesAcrossChangeSetsSupported](Org.OData.Capabilities.V1.xml#L472)|Boolean|Service supports Content-ID referencing across change sets
[EtagReferencesSupported](Org.OData.Capabilities.V1.xml#L475)|Boolean|Service supports referencing Etags from previous requests
[RequestDependencyConditionsSupported](Org.OData.Capabilities.V1.xml#L478)|Boolean|Service supports the `if` member in JSON batch requests
[SupportedFormats](Org.OData.Capabilities.V1.xml#L481)|\[MediaType\]|Media types of supported formats for $batch<br>Allowed Values:<dl><dt>[multipart/mixed](Org.OData.Capabilities.V1.xml#L486)<dd>[Multipart Batch Format](http://docs.oasis-open.org/odata/odata/v4.01/cs01/part1-protocol/odata-v4.01-cs01-part1-protocol.html#sec_MultipartBatchFormat)<dt>[application/json](Org.OData.Capabilities.V1.xml#L490)<dd>[JSON Batch Format](http://docs.oasis-open.org/odata/odata-json-format/v4.01/cs01/odata-json-format-v4.01-cs01.html#sec_BatchRequestsandResponses)</dl>

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)
- [LongDescription](Org.OData.Core.V1.md#LongDescription)

<a name="FilterRestrictionsBase"></a>
## [FilterRestrictionsBase](Org.OData.Capabilities.V1.xml#L509)


**Derived Types:**
- [FilterRestrictionsType](#FilterRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Filterable](Org.OData.Capabilities.V1.xml#L515)|Boolean|$filter is supported
[RequiresFilter](Org.OData.Capabilities.V1.xml#L518)|Boolean|$filter is required
[MaxLevels](Org.OData.Capabilities.V1.xml#L521)|Int32|The maximum number of levels (including recursion) that can be traversed in a filter expression. A value of -1 indicates there is no restriction.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="FilterRestrictionsType"></a>
## [FilterRestrictionsType](Org.OData.Capabilities.V1.xml#L525): [FilterRestrictionsBase](#FilterRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Filterable*](Org.OData.Capabilities.V1.xml#L515)|Boolean|$filter is supported
[*RequiresFilter*](Org.OData.Capabilities.V1.xml#L518)|Boolean|$filter is required
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L521)|Int32|The maximum number of levels (including recursion) that can be traversed in a filter expression. A value of -1 indicates there is no restriction.
[RequiredProperties](Org.OData.Capabilities.V1.xml#L526)|\[PropertyPath\]|These properties must be specified in the $filter clause (properties of derived types are not allowed here)
[NonFilterableProperties](Org.OData.Capabilities.V1.xml#L529)|\[PropertyPath\]|These structural properties cannot be used in filter expressions
[FilterExpressionRestrictions](Org.OData.Capabilities.V1.xml#L532)|\[[FilterExpressionRestrictionType](#FilterExpressionRestrictionType)\]|These properties only allow a subset of filter expressions. A valid filter expression for a single property can be enclosed in parentheses and combined by `and` with valid expressions for other properties.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="FilterExpressionRestrictionType"></a>
## [FilterExpressionRestrictionType](Org.OData.Capabilities.V1.xml#L536)


Property|Type|Description
:-------|:---|:----------
[Property](Org.OData.Capabilities.V1.xml#L537)|PropertyPath?|Path to the restricted property
[AllowedExpressions](Org.OData.Capabilities.V1.xml#L540)|[FilterExpressionType?](#FilterExpressionType)|Allowed subset of expressions

<a name="FilterExpressionType"></a>
## [FilterExpressionType](Org.OData.Capabilities.V1.xml#L544)
**Type:** String



Allowed Value|Description
:------------|:----------
[SingleValue](Org.OData.Capabilities.V1.xml#L547)|Property can be used in a single `eq` clause
[MultiValue](Org.OData.Capabilities.V1.xml#L551)|Property can be used in multiple `eq` and `in` clauses, combined by `or` (which is logically equivalent to a single `in` clause)
[SingleRange](Org.OData.Capabilities.V1.xml#L555)|Property can be compared to a single closed, half-open, or open interval<br>The filter expression for this property consists of a single interval expression, which is either a single comparison of the property and a literal value with `eq`, `le`, `lt`, `ge`, or `gt`, or a pair of boundaries combined by `and`. The lower boundary is either `ge` or `gt`, the upper boundary either `le` or `lt`.
[MultiRange](Org.OData.Capabilities.V1.xml#L560)|Property can be compared to a union of one or more closed, half-open, or open intervals<br>The filter expression for this property consists of one or more interval expressions, combined by `or`. See SingleRange for the definition of an interval expression.<br> Alternatively the filter expression can consist of one or more `ne` expressions combined by `and`, which is roughly equivalent to the union of the complementing open intervals. Roughly equivalent because `null` is allowed as a right-side operand of an `ne` expression.
[SearchExpression](Org.OData.Capabilities.V1.xml#L569)|String property can be used as first operand in one or more `startswith`, `endswith`, and `contains` clauses, combined by `or`
[MultiValueOrSearchExpression](Org.OData.Capabilities.V1.xml#L573)|String property can be used like in `MultiValue` and like in `SearchExpression`, combined with `or`
[MultiRangeOrSearchExpression](Org.OData.Capabilities.V1.xml#L577)|Property can be compared to a union of zero or more closed, half-open, or open intervals plus zero or more simple string patterns<br>The filter expression for this property consists of one or more interval expressions or string comparison functions combined by `or`. See SingleRange for the definition of an interval expression. See SearchExpression for the allowed string comparison functions.

<a name="SortRestrictionsBase"></a>
## [SortRestrictionsBase](Org.OData.Capabilities.V1.xml#L590)


**Derived Types:**
- [SortRestrictionsType](#SortRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Sortable](Org.OData.Capabilities.V1.xml#L596)|Boolean|$orderby is supported

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="SortRestrictionsType"></a>
## [SortRestrictionsType](Org.OData.Capabilities.V1.xml#L600): [SortRestrictionsBase](#SortRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Sortable*](Org.OData.Capabilities.V1.xml#L596)|Boolean|$orderby is supported
[AscendingOnlyProperties](Org.OData.Capabilities.V1.xml#L601)|\[PropertyPath\]|These properties can only be used for sorting in Ascending order
[DescendingOnlyProperties](Org.OData.Capabilities.V1.xml#L604)|\[PropertyPath\]|These properties can only be used for sorting in Descending order
[NonSortableProperties](Org.OData.Capabilities.V1.xml#L607)|\[PropertyPath\]|These structural properties cannot be used in orderby expressions

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="ExpandRestrictionsBase"></a>
## [ExpandRestrictionsBase](Org.OData.Capabilities.V1.xml#L616)


**Derived Types:**
- [ExpandCollectionRestrictionsType](#ExpandCollectionRestrictionsType)
  - [ExpandRestrictionsType](#ExpandRestrictionsType)
- [ExpandByKeyRestrictionsBase](#ExpandByKeyRestrictionsBase)
  - [ExpandByKeyRestrictionsType](#ExpandByKeyRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Expandable](Org.OData.Capabilities.V1.xml#L622)|Boolean|$expand is supported
[StreamsExpandable](Org.OData.Capabilities.V1.xml#L625)|Boolean|$expand is supported for stream properties and media streams
[MaxLevels](Org.OData.Capabilities.V1.xml#L628)|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="ExpandCollectionRestrictionsType"></a>
## [ExpandCollectionRestrictionsType](Org.OData.Capabilities.V1.xml#L632): [ExpandRestrictionsBase](#ExpandRestrictionsBase)


**Derived Types:**
- [ExpandRestrictionsType](#ExpandRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[*Expandable*](Org.OData.Capabilities.V1.xml#L622)|Boolean|$expand is supported
[*StreamsExpandable*](Org.OData.Capabilities.V1.xml#L625)|Boolean|$expand is supported for stream properties and media streams
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L628)|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.
[ExpandByKeyRestrictions](Org.OData.Capabilities.V1.xml#L633)|[ExpandByKeyRestrictionsBase?](#ExpandByKeyRestrictionsBase)|Restrictions on expand expressions when accessed by key<br>Restrictions on expand expressions when accessing a member of the collection by key. SHOULD be Null (or unspecified) for single-valued targets. If Null for collection-valued targets, then the same expand capabilities when accessing the collection apply when accessing an instance within the collection by key. Different non-expandable navigation or stream properties from the target collection can be specified by providing an instance of the derived `ExpandByKeyRestrictionsType`. Otherwise, the same set of non-expandable navigation and stream properties specified for the collection apply when accessing an instance within the collection by key.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="ExpandRestrictionsType"></a>
## [ExpandRestrictionsType](Org.OData.Capabilities.V1.xml#L643): [ExpandCollectionRestrictionsType](#ExpandCollectionRestrictionsType)


Property|Type|Description
:-------|:---|:----------
[*Expandable*](Org.OData.Capabilities.V1.xml#L622)|Boolean|$expand is supported
[*StreamsExpandable*](Org.OData.Capabilities.V1.xml#L625)|Boolean|$expand is supported for stream properties and media streams
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L628)|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.
[*ExpandByKeyRestrictions*](Org.OData.Capabilities.V1.xml#L633)|[ExpandByKeyRestrictionsBase?](#ExpandByKeyRestrictionsBase)|Restrictions on expand expressions when accessed by key<br>Restrictions on expand expressions when accessing a member of the collection by key. SHOULD be Null (or unspecified) for single-valued targets. If Null for collection-valued targets, then the same expand capabilities when accessing the collection apply when accessing an instance within the collection by key. Different non-expandable navigation or stream properties from the target collection can be specified by providing an instance of the derived `ExpandByKeyRestrictionsType`. Otherwise, the same set of non-expandable navigation and stream properties specified for the collection apply when accessing an instance within the collection by key.
[NonExpandableProperties](Org.OData.Capabilities.V1.xml#L644)|\[NavigationPropertyPath\]|These properties cannot be used in expand expressions
[NonExpandableStreamProperties](Org.OData.Capabilities.V1.xml#L647)|\[PropertyPath\]|These stream properties cannot be used in expand expressions

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="ExpandByKeyRestrictionsBase"></a>
## [ExpandByKeyRestrictionsBase](Org.OData.Capabilities.V1.xml#L651): [ExpandRestrictionsBase](#ExpandRestrictionsBase)


**Derived Types:**
- [ExpandByKeyRestrictionsType](#ExpandByKeyRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[*Expandable*](Org.OData.Capabilities.V1.xml#L622)|Boolean|$expand is supported
[*StreamsExpandable*](Org.OData.Capabilities.V1.xml#L625)|Boolean|$expand is supported for stream properties and media streams
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L628)|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="ExpandByKeyRestrictionsType"></a>
## [ExpandByKeyRestrictionsType](Org.OData.Capabilities.V1.xml#L652): [ExpandByKeyRestrictionsBase](#ExpandByKeyRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Expandable*](Org.OData.Capabilities.V1.xml#L622)|Boolean|$expand is supported
[*StreamsExpandable*](Org.OData.Capabilities.V1.xml#L625)|Boolean|$expand is supported for stream properties and media streams
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L628)|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.
[NonExpandableProperties](Org.OData.Capabilities.V1.xml#L653)|\[NavigationPropertyPath\]|These properties cannot be used in expand expressions when accessing by key
[NonExpandableStreamProperties](Org.OData.Capabilities.V1.xml#L656)|\[PropertyPath\]|These stream properties cannot be used in expand expressions when accessing by key

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="SearchRestrictionsType"></a>
## [SearchRestrictionsType](Org.OData.Capabilities.V1.xml#L665)


Property|Type|Description
:-------|:---|:----------
[Searchable](Org.OData.Capabilities.V1.xml#L671)|Boolean|$search is supported
[UnsupportedExpressions](Org.OData.Capabilities.V1.xml#L674)|[SearchExpressions](#SearchExpressions)|Expressions not supported in $search as specified by the standard syntax [OData-URL, section 5.1.8.1](https://docs.oasis-open.org/odata/odata/v4.02/odata-v4.02-part2-url-conventions.html#SearchExpressions)<br>An unsupported expression may be treated as a term to be matched even if the standard syntax treats it as a keyword.
[SearchSyntax](Org.OData.Capabilities.V1.xml#L681)|URL?|URL of the $search syntax supported by the service (null means the standard syntax [OData-URL, section 5.1.8.1](https://docs.oasis-open.org/odata/odata/v4.02/odata-v4.02-part2-url-conventions.html#SearchExpressions))

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="SearchExpressions"></a>
## [SearchExpressions](Org.OData.Capabilities.V1.xml#L686)


Flag Member|Value|Description
:-----|----:|:----------
[none](Org.OData.Capabilities.V1.xml#L687)|0|No unsupported expressions
[AND](Org.OData.Capabilities.V1.xml#L690)|1|Multiple search terms, optionally separated by `AND`
[OR](Org.OData.Capabilities.V1.xml#L693)|2|Multiple search terms separated by `OR`
[NOT](Org.OData.Capabilities.V1.xml#L696)|4|Search terms preceded by `NOT`
[phrase](Org.OData.Capabilities.V1.xml#L699)|8|Search phrases enclosed in double quotes
[group](Org.OData.Capabilities.V1.xml#L702)|16|Precedence grouping of search expressions with parentheses

<a name="InsertRestrictionsBase"></a>
## [InsertRestrictionsBase](Org.OData.Capabilities.V1.xml#L721)


**Derived Types:**
- [InsertRestrictionsType](#InsertRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Insertable](Org.OData.Capabilities.V1.xml#L722)|Boolean|Entities can be inserted
[MaxLevels](Org.OData.Capabilities.V1.xml#L725)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to insert into. A value of -1 indicates there is no restriction.
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L728)|Boolean|Entities of a specific derived type can be created by specifying a type-cast segment
[QueryOptions](Org.OData.Capabilities.V1.xml#L731)|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with insert requests
[CustomHeaders](Org.OData.Capabilities.V1.xml#L734)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L737)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](Org.OData.Capabilities.V1.xml#L740)|String?|A brief description of the request
[LongDescription](Org.OData.Capabilities.V1.xml#L744)|String?|A long description of the request
[ErrorResponses](Org.OData.Capabilities.V1.xml#L748)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="InsertRestrictionsType"></a>
## [InsertRestrictionsType](Org.OData.Capabilities.V1.xml#L752): [InsertRestrictionsBase](#InsertRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Insertable*](Org.OData.Capabilities.V1.xml#L722)|Boolean|Entities can be inserted
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L725)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to insert into. A value of -1 indicates there is no restriction.
[*TypecastSegmentSupported*](Org.OData.Capabilities.V1.xml#L728)|Boolean|Entities of a specific derived type can be created by specifying a type-cast segment
[*QueryOptions*](Org.OData.Capabilities.V1.xml#L731)|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with insert requests
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L734)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L737)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L740)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L744)|String?|A long description of the request
[*ErrorResponses*](Org.OData.Capabilities.V1.xml#L748)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.
[NonInsertableProperties](Org.OData.Capabilities.V1.xml#L753)|\[PropertyPath\]|These structural properties cannot be specified on insert
[NonInsertableNavigationProperties](Org.OData.Capabilities.V1.xml#L756)|\[NavigationPropertyPath\]|These navigation properties do not allow deep inserts
[RequiredProperties](Org.OData.Capabilities.V1.xml#L759)|\[PropertyPath\]|These structural properties must be specified on insert
[Permissions](Org.OData.Capabilities.V1.xml#L762)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the insert.

<a name="PermissionType"></a>
## [PermissionType](Org.OData.Capabilities.V1.xml#L767)


Property|Type|Description
:-------|:---|:----------
[SchemeName](Org.OData.Capabilities.V1.xml#L768)|[SchemeName](Org.OData.Authorization.V1.md#SchemeName)|Authorization flow scheme name
[Scopes](Org.OData.Capabilities.V1.xml#L771)|\[[ScopeType](#ScopeType)\]|List of scopes that can provide access to the resource

<a name="ScopeType"></a>
## [ScopeType](Org.OData.Capabilities.V1.xml#L776)


Property|Type|Description
:-------|:---|:----------
[Scope](Org.OData.Capabilities.V1.xml#L777)|String|Name of the scope.
[RestrictedProperties](Org.OData.Capabilities.V1.xml#L780)|String?|Comma-separated string value of all properties that will be included or excluded when using the scope.<br>Possible string value identifiers when specifying properties are `*`, _PropertyName_, `-`_PropertyName_.<br>`*` denotes all properties are accessible.<br>`-`_PropertyName_ excludes that specific property.<br>_PropertyName_ explicitly provides access to the specific property.<br>The absence of `RestrictedProperties` denotes all properties are accessible using that scope.

<a name="DeepInsertSupportType"></a>
## [DeepInsertSupportType](Org.OData.Capabilities.V1.xml#L800)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L801)|Boolean|Annotation target supports deep inserts
[ContentIDSupported](Org.OData.Capabilities.V1.xml#L804)|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

<a name="UpdateRestrictionsBase"></a>
## [UpdateRestrictionsBase](Org.OData.Capabilities.V1.xml#L813)


**Derived Types:**
- [UpdateRestrictionsType](#UpdateRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Updatable](Org.OData.Capabilities.V1.xml#L814)|Boolean|Entities can be updated
[Upsertable](Org.OData.Capabilities.V1.xml#L817)|Boolean|Entities can be upserted
[DeltaUpdateSupported](Org.OData.Capabilities.V1.xml#L820)|Boolean|Entities can be inserted, updated, and deleted via a PATCH request with a delta payload
[UpdateMethod](Org.OData.Capabilities.V1.xml#L823)|[HttpMethod?](#HttpMethod)|Supported HTTP Methods (PUT or PATCH) for updating an entity. If null, PATCH SHOULD be supported and PUT MAY be supported.
[FilterSegmentSupported](Org.OData.Capabilities.V1.xml#L826)|Boolean|Members of collections can be updated via a PATCH request with a `/$filter(...)/$each` segment
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L829)|Boolean|Members of collections can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[MaxLevels](Org.OData.Capabilities.V1.xml#L832)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection or entity to update. A value of -1 indicates there is no restriction.
[Permissions](Org.OData.Capabilities.V1.xml#L835)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the update.
[QueryOptions](Org.OData.Capabilities.V1.xml#L838)|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with update requests
[CustomHeaders](Org.OData.Capabilities.V1.xml#L841)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L844)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](Org.OData.Capabilities.V1.xml#L847)|String?|A brief description of the request
[LongDescription](Org.OData.Capabilities.V1.xml#L851)|String?|A long description of the request
[ErrorResponses](Org.OData.Capabilities.V1.xml#L855)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="UpdateRestrictionsType"></a>
## [UpdateRestrictionsType](Org.OData.Capabilities.V1.xml#L859): [UpdateRestrictionsBase](#UpdateRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Updatable*](Org.OData.Capabilities.V1.xml#L814)|Boolean|Entities can be updated
[*Upsertable*](Org.OData.Capabilities.V1.xml#L817)|Boolean|Entities can be upserted
[*DeltaUpdateSupported*](Org.OData.Capabilities.V1.xml#L820)|Boolean|Entities can be inserted, updated, and deleted via a PATCH request with a delta payload
[*UpdateMethod*](Org.OData.Capabilities.V1.xml#L823)|[HttpMethod?](#HttpMethod)|Supported HTTP Methods (PUT or PATCH) for updating an entity. If null, PATCH SHOULD be supported and PUT MAY be supported.
[*FilterSegmentSupported*](Org.OData.Capabilities.V1.xml#L826)|Boolean|Members of collections can be updated via a PATCH request with a `/$filter(...)/$each` segment
[*TypecastSegmentSupported*](Org.OData.Capabilities.V1.xml#L829)|Boolean|Members of collections can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L832)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection or entity to update. A value of -1 indicates there is no restriction.
[*Permissions*](Org.OData.Capabilities.V1.xml#L835)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the update.
[*QueryOptions*](Org.OData.Capabilities.V1.xml#L838)|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with update requests
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L841)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L844)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L847)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L851)|String?|A long description of the request
[*ErrorResponses*](Org.OData.Capabilities.V1.xml#L855)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.
[NonUpdatableProperties](Org.OData.Capabilities.V1.xml#L860)|\[PropertyPath\]|These structural properties cannot be specified on update
[NonUpdatableNavigationProperties](Org.OData.Capabilities.V1.xml#L863)|\[NavigationPropertyPath\]|These navigation properties do not allow rebinding
[RequiredProperties](Org.OData.Capabilities.V1.xml#L866)|\[PropertyPath\]|These structural properties must be specified on update

<a name="HttpMethod"></a>
## [HttpMethod](Org.OData.Capabilities.V1.xml#L871)


Flag Member|Value|Description
:-----|----:|:----------
[GET](Org.OData.Capabilities.V1.xml#L872)|1|The HTTP GET Method
[PATCH](Org.OData.Capabilities.V1.xml#L875)|2|The HTTP PATCH Method
[PUT](Org.OData.Capabilities.V1.xml#L878)|4|The HTTP PUT Method
[POST](Org.OData.Capabilities.V1.xml#L881)|8|The HTTP POST Method
[DELETE](Org.OData.Capabilities.V1.xml#L884)|16|The HTTP DELETE Method
[OPTIONS](Org.OData.Capabilities.V1.xml#L887)|32|The HTTP OPTIONS Method
[HEAD](Org.OData.Capabilities.V1.xml#L890)|64|The HTTP HEAD Method

<a name="DeepUpdateSupportType"></a>
## [DeepUpdateSupportType](Org.OData.Capabilities.V1.xml#L899)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L900)|Boolean|Annotation target supports deep updates
[ContentIDSupported](Org.OData.Capabilities.V1.xml#L903)|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

<a name="DeleteRestrictionsBase"></a>
## [DeleteRestrictionsBase](Org.OData.Capabilities.V1.xml#L912)


**Derived Types:**
- [DeleteRestrictionsType](#DeleteRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Deletable](Org.OData.Capabilities.V1.xml#L913)|Boolean|Entities can be deleted
[MaxLevels](Org.OData.Capabilities.V1.xml#L916)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to delete from or the entity to delete. A value of -1 indicates there is no restriction.
[FilterSegmentSupported](Org.OData.Capabilities.V1.xml#L919)|Boolean|Members of collections can be deleted via a DELETE request with a `/$filter(...)/$each` segment
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L922)|Boolean|Members of collections can be deleted via a DELETE request with a type-cast segment and a `/$each` segment
[Permissions](Org.OData.Capabilities.V1.xml#L925)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the delete.
[CustomHeaders](Org.OData.Capabilities.V1.xml#L928)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L931)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](Org.OData.Capabilities.V1.xml#L934)|String?|A brief description of the request
[LongDescription](Org.OData.Capabilities.V1.xml#L938)|String?|A long description of the request
[ErrorResponses](Org.OData.Capabilities.V1.xml#L942)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="DeleteRestrictionsType"></a>
## [DeleteRestrictionsType](Org.OData.Capabilities.V1.xml#L946): [DeleteRestrictionsBase](#DeleteRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Deletable*](Org.OData.Capabilities.V1.xml#L913)|Boolean|Entities can be deleted
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L916)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to delete from or the entity to delete. A value of -1 indicates there is no restriction.
[*FilterSegmentSupported*](Org.OData.Capabilities.V1.xml#L919)|Boolean|Members of collections can be deleted via a DELETE request with a `/$filter(...)/$each` segment
[*TypecastSegmentSupported*](Org.OData.Capabilities.V1.xml#L922)|Boolean|Members of collections can be deleted via a DELETE request with a type-cast segment and a `/$each` segment
[*Permissions*](Org.OData.Capabilities.V1.xml#L925)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the delete.
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L928)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L931)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L934)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L938)|String?|A long description of the request
[*ErrorResponses*](Org.OData.Capabilities.V1.xml#L942)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.
[NonDeletableNavigationProperties](Org.OData.Capabilities.V1.xml#L947)|\[NavigationPropertyPath\]|These navigation properties do not allow DeleteLink requests

<a name="CollectionPropertyRestrictionsType"></a>
## [CollectionPropertyRestrictionsType](Org.OData.Capabilities.V1.xml#L955)


Property|Type|Description
:-------|:---|:----------
[CollectionProperty](Org.OData.Capabilities.V1.xml#L956)|PropertyPath?|Restricted Collection-valued property
[FilterFunctions](Org.OData.Capabilities.V1.xml#L959)|\[String\]|List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L963)|[FilterRestrictionsType?](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L966)|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L969)|[SortRestrictionsType?](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](Org.OData.Capabilities.V1.xml#L972)|Boolean|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L975)|Boolean|Supports $skip
[SelectSupport](Org.OData.Capabilities.V1.xml#L978)|[SelectSupportType?](#SelectSupportType)|Support for $select
[Insertable](Org.OData.Capabilities.V1.xml#L981)|Boolean|Members can be inserted into this collection<br>If additionally annotated with [Core.PositionalInsert](Org.OData.Core.V1.md#PositionalInsert), members can be inserted at a specific position
[Updatable](Org.OData.Capabilities.V1.xml#L985)|Boolean|Members of this ordered collection can be updated by ordinal
[Deletable](Org.OData.Capabilities.V1.xml#L988)|Boolean|Members of this ordered collection can be deleted by ordinal

<a name="OperationRestrictionsType"></a>
## [OperationRestrictionsType](Org.OData.Capabilities.V1.xml#L996)


Property|Type|Description
:-------|:---|:----------
[FilterSegmentSupported](Org.OData.Capabilities.V1.xml#L997)|Boolean|Bound action or function can be invoked on a collection-valued binding parameter path with a `/$filter(...)` segment
[Permissions](Org.OData.Capabilities.V1.xml#L1000)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to invoke an action or function
[CustomHeaders](Org.OData.Capabilities.V1.xml#L1003)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L1006)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[ErrorResponses](Org.OData.Capabilities.V1.xml#L1009)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="ModificationQueryOptionsType"></a>
## [ModificationQueryOptionsType](Org.OData.Capabilities.V1.xml#L1020)


Property|Type|Description
:-------|:---|:----------
[ExpandSupported](Org.OData.Capabilities.V1.xml#L1021)|Boolean|Supports $expand with modification requests
[SelectSupported](Org.OData.Capabilities.V1.xml#L1024)|Boolean|Supports $select with modification requests
[ComputeSupported](Org.OData.Capabilities.V1.xml#L1027)|Boolean|Supports $compute with modification requests
[FilterSupported](Org.OData.Capabilities.V1.xml#L1030)|Boolean|Supports $filter with modification requests
[SearchSupported](Org.OData.Capabilities.V1.xml#L1033)|Boolean|Supports $search with modification requests
[SortSupported](Org.OData.Capabilities.V1.xml#L1036)|Boolean|Supports $orderby with modification requests

<a name="ReadRestrictionsBase"></a>
## [*ReadRestrictionsBase*](Org.OData.Capabilities.V1.xml#L1045)


**Derived Types:**
- [ReadByKeyRestrictionsType](#ReadByKeyRestrictionsType)
- [ReadRestrictionsType](#ReadRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Readable](Org.OData.Capabilities.V1.xml#L1046)|Boolean|Entities can be retrieved
[Permissions](Org.OData.Capabilities.V1.xml#L1049)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[CustomHeaders](Org.OData.Capabilities.V1.xml#L1052)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L1055)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](Org.OData.Capabilities.V1.xml#L1058)|String?|A brief description of the request
[LongDescription](Org.OData.Capabilities.V1.xml#L1062)|String?|A long description of the request
[ErrorResponses](Org.OData.Capabilities.V1.xml#L1066)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="ReadByKeyRestrictionsType"></a>
## [ReadByKeyRestrictionsType](Org.OData.Capabilities.V1.xml#L1070): [ReadRestrictionsBase](#ReadRestrictionsBase)
Restrictions for retrieving an entity by key

Property|Type|Description
:-------|:---|:----------
[*Readable*](Org.OData.Capabilities.V1.xml#L1046)|Boolean|Entities can be retrieved
[*Permissions*](Org.OData.Capabilities.V1.xml#L1049)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L1052)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L1055)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L1058)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L1062)|String?|A long description of the request
[*ErrorResponses*](Org.OData.Capabilities.V1.xml#L1066)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="ReadRestrictionsType"></a>
## [ReadRestrictionsType](Org.OData.Capabilities.V1.xml#L1073): [ReadRestrictionsBase](#ReadRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Readable*](Org.OData.Capabilities.V1.xml#L1046)|Boolean|Entities can be retrieved
[*Permissions*](Org.OData.Capabilities.V1.xml#L1049)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L1052)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L1055)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L1058)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L1062)|String?|A long description of the request
[*ErrorResponses*](Org.OData.Capabilities.V1.xml#L1066)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L1074)|Boolean|Entities of a specific derived type can be read by specifying a type-cast segment
[ReadByKeyRestrictions](Org.OData.Capabilities.V1.xml#L1077)|[ReadByKeyRestrictionsType?](#ReadByKeyRestrictionsType)|Restrictions for retrieving an entity by key<br>Only valid when applied to a collection. If a property of `ReadByKeyRestrictions` is not specified, the corresponding property value of `ReadRestrictions` applies.

<a name="CustomParameter"></a>
## [CustomParameter](Org.OData.Capabilities.V1.xml#L1140)
A custom parameter is either a header or a query option

The type of a custom parameter is always a string. Restrictions on the parameter values can be expressed by annotating the record expression describing the parameter with terms from the Validation vocabulary, e.g. Validation.Pattern or Validation.AllowedValues.

Property|Type|Description
:-------|:---|:----------
[Name](Org.OData.Capabilities.V1.xml#L1143)|String|Name of the custom parameter
[Description](Org.OData.Capabilities.V1.xml#L1146)|String?|Description of the custom parameter
[DocumentationURL](Org.OData.Capabilities.V1.xml#L1149)|URL?|URL of related documentation
[Required](Org.OData.Capabilities.V1.xml#L1153)|Boolean|true: parameter is required, false or not specified: parameter is optional
[ExampleValues](Org.OData.Capabilities.V1.xml#L1156)|\[[PrimitiveExampleValue](Org.OData.Core.V1.md#PrimitiveExampleValue)\]|Example values for the custom parameter

<a name="DefaultCapabilitiesType"></a>
## [DefaultCapabilitiesType](Org.OData.Capabilities.V1.xml#L1175)


Property|Type|Description
:-------|:---|:----------
[ChangeTracking](Org.OData.Capabilities.V1.xml#L1176)|[ChangeTrackingBase?](#ChangeTrackingBase)|Change tracking capabilities
[CountRestrictions](Org.OData.Capabilities.V1.xml#L1179)|[CountRestrictionsBase?](#CountRestrictionsBase)|Restrictions on /$count path suffix and $count=true system query option
[IndexableByKey](Org.OData.Capabilities.V1.xml#L1182)|[Tag?](Org.OData.Core.V1.md#Tag)|Supports key values according to OData URL conventions
[TopSupported](Org.OData.Capabilities.V1.xml#L1185)|[Tag?](Org.OData.Core.V1.md#Tag)|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L1188)|[Tag?](Org.OData.Core.V1.md#Tag)|Supports $skip
[ComputeSupported](Org.OData.Capabilities.V1.xml#L1191)|[Tag?](Org.OData.Core.V1.md#Tag)|Supports $compute
[SelectSupport](Org.OData.Capabilities.V1.xml#L1194)|[SelectSupportType?](#SelectSupportType)|Support for $select and nested query options within $select
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L1197)|[FilterRestrictionsBase?](#FilterRestrictionsBase)|Restrictions on filter expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L1200)|[SortRestrictionsBase?](#SortRestrictionsBase)|Restrictions on orderby expressions
[ExpandRestrictions](Org.OData.Capabilities.V1.xml#L1203)|[ExpandRestrictionsBase?](#ExpandRestrictionsBase)|Restrictions on expand expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L1206)|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L1209)|[InsertRestrictionsBase?](#InsertRestrictionsBase)|Restrictions on insert operations
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L1212)|[UpdateRestrictionsBase?](#UpdateRestrictionsBase)|Restrictions on update operations
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L1215)|[DeleteRestrictionsBase?](#DeleteRestrictionsBase)|Restrictions on delete operations
[OperationRestrictions](Org.OData.Capabilities.V1.xml#L1218)|[OperationRestrictionsType?](#OperationRestrictionsType)|Restrictions for function or action operations
[ReadRestrictions](Org.OData.Capabilities.V1.xml#L1221)|[ReadRestrictionsType?](#ReadRestrictionsType)|Restrictions for retrieving a collection of entities, retrieving a singleton instance

<a name="HttpResponse"></a>
## [HttpResponse](Org.OData.Capabilities.V1.xml#L1226)


Property|Type|Description
:-------|:---|:----------
[StatusCode](Org.OData.Capabilities.V1.xml#L1227)|String|HTTP response status code, for example 400, 403, 501
[Description](Org.OData.Capabilities.V1.xml#L1230)|String|Human-readable description of the response
