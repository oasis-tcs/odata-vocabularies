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
[AsynchronousRequestsRequired](Org.OData.Capabilities.V1.xml#L152)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AsynchronousRequestsRequired"></a>Service requires the asynchronous request preference
[BatchContinueOnErrorSupported](Org.OData.Capabilities.V1.xml#L156)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchContinueOnErrorSupported"></a>Service supports the continue on error preference. Supports $batch requests. Services that apply the BatchContinueOnErrorSupported term should also specify the ContinueOnErrorSupported property from the BatchSupport term.
[IsolationSupported](Org.OData.Capabilities.V1.xml#L160)|[IsolationLevel](#IsolationLevel)|<a name="IsolationSupported"></a>Supported odata.isolation levels
[CrossJoinSupported](Org.OData.Capabilities.V1.xml#L169)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="CrossJoinSupported"></a>Supports cross joins for the entity sets in this container
[CallbackSupported](Org.OData.Capabilities.V1.xml#L173)|[CallbackType](#CallbackType)|<a name="CallbackSupported"></a>Supports callbacks for the specified protocols
[ChangeTracking](Org.OData.Capabilities.V1.xml#L195)|[ChangeTrackingType](#ChangeTrackingType)|<a name="ChangeTracking"></a>Change tracking capabilities of this service or entity set
[CountRestrictions](Org.OData.Capabilities.V1.xml#L216)|[CountRestrictionsType](#CountRestrictionsType)|<a name="CountRestrictions"></a>Restrictions on /$count path suffix and $count=true system query option
[NavigationRestrictions](Org.OData.Capabilities.V1.xml#L234)|[NavigationRestrictionsType](#NavigationRestrictionsType)|<a name="NavigationRestrictions"></a>Restrictions on navigating properties according to OData URL conventions<br>Restrictions specified on an entity set are valid whether the request is directly to the entity set or through a navigation property bound to that entity set. Services can specify a different set of restrictions specific to a path, in which case the more specific restrictions take precedence.
[IndexableByKey](Org.OData.Capabilities.V1.xml#L325)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="IndexableByKey"></a>Supports key values according to OData URL conventions
[TopSupported](Org.OData.Capabilities.V1.xml#L330)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="TopSupported"></a>Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L335)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="SkipSupported"></a>Supports $skip
[ComputeSupported](Org.OData.Capabilities.V1.xml#L340)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="ComputeSupported"></a>Supports $compute
[SelectSupport](Org.OData.Capabilities.V1.xml#L345)|[SelectSupportType](#SelectSupportType)|<a name="SelectSupport"></a>Support for $select and nested query options within $select
[BatchSupported](Org.OData.Capabilities.V1.xml#L382)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchSupported"></a>Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.
[BatchSupport](Org.OData.Capabilities.V1.xml#L386)|[BatchSupportType](#BatchSupportType)|<a name="BatchSupport"></a>Batch Support for the service
[FilterFunctions](Org.OData.Capabilities.V1.xml#L432)|\[String\]|<a name="FilterFunctions"></a>List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L438)|[FilterRestrictionsType](#FilterRestrictionsType)|<a name="FilterRestrictions"></a>Restrictions on filter expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L515)|[SortRestrictionsType](#SortRestrictionsType)|<a name="SortRestrictions"></a>Restrictions on orderby expressions
[ExpandRestrictions](Org.OData.Capabilities.V1.xml#L541)|[ExpandRestrictionsType](#ExpandRestrictionsType)|<a name="ExpandRestrictions"></a>Restrictions on expand expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L571)|[SearchRestrictionsType](#SearchRestrictionsType)|<a name="SearchRestrictions"></a>Restrictions on search expressions
[KeyAsSegmentSupported](Org.OData.Capabilities.V1.xml#L609)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="KeyAsSegmentSupported"></a>Supports [key-as-segment convention](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_KeyasSegmentConvention) for addressing entities within a collection
[QuerySegmentSupported](Org.OData.Capabilities.V1.xml#L613)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="QuerySegmentSupported"></a>Supports [passing query options in the request body](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_PassingQueryOptionsintheRequestBody)
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L619)|[InsertRestrictionsType](#InsertRestrictionsType)|<a name="InsertRestrictions"></a>Restrictions on insert operations
[DeepInsertSupport](Org.OData.Capabilities.V1.xml#L698)|[DeepInsertSupportType?](#DeepInsertSupportType)|<a name="DeepInsertSupport"></a>Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L711)|[UpdateRestrictionsType](#UpdateRestrictionsType)|<a name="UpdateRestrictions"></a>Restrictions on update operations
[DeepUpdateSupport](Org.OData.Capabilities.V1.xml#L797)|[DeepUpdateSupportType](#DeepUpdateSupportType)|<a name="DeepUpdateSupport"></a>Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L810)|[DeleteRestrictionsType](#DeleteRestrictionsType)|<a name="DeleteRestrictions"></a>Restrictions on delete operations
[CollectionPropertyRestrictions](Org.OData.Capabilities.V1.xml#L854)|\[[CollectionPropertyRestrictionsType](#CollectionPropertyRestrictionsType)\]|<a name="CollectionPropertyRestrictions"></a>Describes restrictions on operations applied to collection-valued structural properties
[OperationRestrictions](Org.OData.Capabilities.V1.xml#L895)|[OperationRestrictionsType](#OperationRestrictionsType)|<a name="OperationRestrictions"></a>Restrictions for function or action operation
[AnnotationValuesInQuerySupported](Org.OData.Capabilities.V1.xml#L915)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AnnotationValuesInQuerySupported"></a>Supports annotation values within system query options
[ModificationQueryOptions](Org.OData.Capabilities.V1.xml#L919)|[ModificationQueryOptionsType](#ModificationQueryOptionsType)|<a name="ModificationQueryOptions"></a>Support for query options with modification requests (insert, update, action invocation)
[ReadRestrictions](Org.OData.Capabilities.V1.xml#L943)|[ReadRestrictionsType](#ReadRestrictionsType)|<a name="ReadRestrictions"></a>Restrictions for retrieving a collection of entities, retrieving a singleton instance.
[CustomHeaders](Org.OData.Capabilities.V1.xml#L985)|\[[CustomParameter](#CustomParameter)\]|<a name="CustomHeaders"></a>Custom headers that are supported/required for the annotated resource ([Example](Org.OData.Capabilities.V1.xml#L987))
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L1011)|\[[CustomParameter](#CustomParameter)\]|<a name="CustomQueryOptions"></a>Custom query options that are supported/required for the annotated resource ([Example](Org.OData.Capabilities.V1.xml#L1014))<br>If the entity container is annotated, the query option is supported/required by all resources in that container.
[MediaLocationUpdateSupported](Org.OData.Capabilities.V1.xml#L1063)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="MediaLocationUpdateSupported"></a>Stream property or media stream supports update of its media edit URL and/or media read URL
[DefaultCapabilities](Org.OData.Capabilities.V1.xml#L1068)|[DefaultCapabilitiesType](#DefaultCapabilitiesType)|<a name="DefaultCapabilities"></a>Default capability settings for all collection-valued resources in the container<br><p>Annotating a specific capability term, which is included as property in <code>DefaultCapabilitiesType</code>, for a specific collection-valued resource overrides the default capability with the specified properties using PATCH semantics:</p> <ul> <li>Primitive or collection-valued properties specified in the specific capability term replace the corresponding properties specified in <code>DefaultCapabilities</code></li> <li>Complex-valued properties specified in the specific capability term override the corresponding properties specified in <code>DefaultCapabilities</code> using PATCH semantics recursively</li> <li>Properties specified neither in the specific term nor in <code>DefaultCapabilities</code> have their default value</li> </ul> 

<a name="ConformanceLevelType"></a>
## [ConformanceLevelType](Org.OData.Capabilities.V1.xml#L118)


Member|Value|Description
:-----|----:|:----------
[Minimal](Org.OData.Capabilities.V1.xml#L119)|0|Minimal conformance level
[Intermediate](Org.OData.Capabilities.V1.xml#L122)|1|Intermediate conformance level
[Advanced](Org.OData.Capabilities.V1.xml#L125)|2|Advanced conformance level

<a name="IsolationLevel"></a>
## [IsolationLevel](Org.OData.Capabilities.V1.xml#L163)


Flag Member|Value|Description
:-----|----:|:----------
[Snapshot](Org.OData.Capabilities.V1.xml#L164)|1|All data returned for a request, including multiple requests within a batch or results retrieved across multiple pages, will be consistent as of a single point in time

<a name="CallbackType"></a>
## [CallbackType](Org.OData.Capabilities.V1.xml#L176)
A non-empty collection lists the full set of supported protocols. A empty collection means 'only HTTP is supported'

Property|Type|Description
:-------|:---|:----------
[CallbackProtocols](Org.OData.Capabilities.V1.xml#L177)|\[[CallbackProtocol](#CallbackProtocol)\]|List of supported callback protocols, e.g. `http` or `wss`

<a name="CallbackProtocol"></a>
## [CallbackProtocol](Org.OData.Capabilities.V1.xml#L182)


Property|Type|Description
:-------|:---|:----------
[Id](Org.OData.Capabilities.V1.xml#L183)|String?|Protocol Identifier
[UrlTemplate](Org.OData.Capabilities.V1.xml#L186)|String?|URL Template including parameters. Parameters are enclosed in curly braces {} as defined in RFC6570
[DocumentationUrl](Org.OData.Capabilities.V1.xml#L189)|URL?|Human readable description of the meaning of the URL Template parameters

<a name="ChangeTrackingBase"></a>
## [ChangeTrackingBase](Org.OData.Capabilities.V1.xml#L198)


**Derived Types:**
- [ChangeTrackingType](#ChangeTrackingType)

Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L199)|Boolean|odata.track-changes preference is supported

<a name="ChangeTrackingType"></a>
## [ChangeTrackingType](Org.OData.Capabilities.V1.xml#L203): [ChangeTrackingBase](#ChangeTrackingBase)


Property|Type|Description
:-------|:---|:----------
[*Supported*](Org.OData.Capabilities.V1.xml#L199)|Boolean|odata.track-changes preference is supported
[FilterableProperties](Org.OData.Capabilities.V1.xml#L204)|\[PropertyPath\]|Change tracking supports filters on these properties<br>If no properties are specified or FilterableProperties is omitted, clients cannot assume support for filtering on any properties in combination with change tracking.
[ExpandableProperties](Org.OData.Capabilities.V1.xml#L208)|\[NavigationPropertyPath\]|Change tracking supports these properties expanded<br>If no properties are specified or ExpandableProperties is omitted, clients cannot assume support for expanding any properties in combination with change tracking.

<a name="CountRestrictionsBase"></a>
## [CountRestrictionsBase](Org.OData.Capabilities.V1.xml#L220)


**Derived Types:**
- [CountRestrictionsType](#CountRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Countable](Org.OData.Capabilities.V1.xml#L221)|Boolean|Instances can be counted in requests targeting a collection

<a name="CountRestrictionsType"></a>
## [CountRestrictionsType](Org.OData.Capabilities.V1.xml#L225): [CountRestrictionsBase](#CountRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Countable*](Org.OData.Capabilities.V1.xml#L221)|Boolean|Instances can be counted in requests targeting a collection
[NonCountableProperties](Org.OData.Capabilities.V1.xml#L226)|\[PropertyPath\]|Members of these collection properties cannot be counted
[NonCountableNavigationProperties](Org.OData.Capabilities.V1.xml#L229)|\[NavigationPropertyPath\]|Members of these navigation properties cannot be counted

<a name="NavigationRestrictionsType"></a>
## [NavigationRestrictionsType](Org.OData.Capabilities.V1.xml#L239)


Property|Type|Description
:-------|:---|:----------
[Navigability](Org.OData.Capabilities.V1.xml#L240)|[NavigationType?](#NavigationType)|Default navigability for all navigation properties of the annotation target. Individual navigation properties can override this value via `RestrictedProperties/Navigability`.
[RestrictedProperties](Org.OData.Capabilities.V1.xml#L243)|\[[NavigationPropertyRestriction](#NavigationPropertyRestriction)\]|List of navigation properties with restrictions

<a name="NavigationPropertyRestriction"></a>
## [NavigationPropertyRestriction](Org.OData.Capabilities.V1.xml#L247)


Using a property of `NavigationPropertyRestriction` in a [`NavigationRestrictions`](#NavigationRestrictions) annotation
          is discouraged in favor of using an annotation with the corresponding term from this vocabulary and a target path starting with a container and ending in the `NavigationProperty`,
          unless the favored alternative is impossible because a dynamic expression requires an instance path whose evaluation
          starts at the target of the `NavigationRestrictions` annotation. See [this example](../examples/Org.OData.Capabilities.V1.capabilities.md).

Property|Type|Description
:-------|:---|:----------
[NavigationProperty](Org.OData.Capabilities.V1.xml#L254)|NavigationPropertyPath|Navigation properties can be navigated<br>The target path of a [`NavigationRestrictions`](#NavigationRestrictions) annotation followed by this navigation property path addresses the resource to which the other properties of `NavigationPropertyRestriction` apply. Instance paths that occur in dynamic expressions are evaluated starting at the boundary between both paths, which must therefore be chosen accordingly.
[Navigability](Org.OData.Capabilities.V1.xml#L263)|[NavigationType?](#NavigationType)|Supported navigability of this navigation property
[FilterFunctions](Org.OData.Capabilities.V1.xml#L266)|\[String\]|List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L270)|[FilterRestrictionsType?](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L273)|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L276)|[SortRestrictionsType?](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](Org.OData.Capabilities.V1.xml#L279)|Boolean|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L282)|Boolean|Supports $skip
[SelectSupport](Org.OData.Capabilities.V1.xml#L285)|[SelectSupportType?](#SelectSupportType)|Support for $select
[IndexableByKey](Org.OData.Capabilities.V1.xml#L288)|Boolean|Supports key values according to OData URL conventions
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L291)|[InsertRestrictionsType?](#InsertRestrictionsType)|Restrictions on insert operations
[DeepInsertSupport](Org.OData.Capabilities.V1.xml#L294)|[DeepInsertSupportType?](#DeepInsertSupportType)|Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L297)|[UpdateRestrictionsType?](#UpdateRestrictionsType)|Restrictions on update operations
[DeepUpdateSupport](Org.OData.Capabilities.V1.xml#L300)|[DeepUpdateSupportType?](#DeepUpdateSupportType)|Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L303)|[DeleteRestrictionsType?](#DeleteRestrictionsType)|Restrictions on delete operations
[OptimisticConcurrencyControl](Org.OData.Capabilities.V1.xml#L306)|Boolean|Data modification (including insert) along this navigation property requires the use of ETags
[ReadRestrictions](Org.OData.Capabilities.V1.xml#L309)|[ReadRestrictionsType?](#ReadRestrictionsType)|Restrictions for retrieving entities

<a name="NavigationType"></a>
## [NavigationType](Org.OData.Capabilities.V1.xml#L313)


Member|Value|Description
:-----|----:|:----------
[Recursive](Org.OData.Capabilities.V1.xml#L314)|0|Navigation properties can be recursively navigated
[Single](Org.OData.Capabilities.V1.xml#L317)|1|Navigation properties can be navigated to a single level
[None](Org.OData.Capabilities.V1.xml#L320)|2|Navigation properties are not navigable

<a name="SelectSupportType"></a>
## [SelectSupportType](Org.OData.Capabilities.V1.xml#L349)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L350)|Boolean|Supports $select
[InstanceAnnotationsSupported](Org.OData.Capabilities.V1.xml#L353)|Boolean|Supports instance annotations in $select list
[Expandable](Org.OData.Capabilities.V1.xml#L356)|Boolean|$expand within $select is supported
[Filterable](Org.OData.Capabilities.V1.xml#L359)|Boolean|$filter within $select is supported
[Searchable](Org.OData.Capabilities.V1.xml#L362)|Boolean|$search within $select is supported
[TopSupported](Org.OData.Capabilities.V1.xml#L365)|Boolean|$top within $select is supported
[SkipSupported](Org.OData.Capabilities.V1.xml#L368)|Boolean|$skip within $select is supported
[ComputeSupported](Org.OData.Capabilities.V1.xml#L371)|Boolean|$compute within $select is supported
[Countable](Org.OData.Capabilities.V1.xml#L374)|Boolean|$count within $select is supported
[Sortable](Org.OData.Capabilities.V1.xml#L377)|Boolean|$orderby within $select is supported

<a name="BatchSupportType"></a>
## [BatchSupportType](Org.OData.Capabilities.V1.xml#L389)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L396)|Boolean|Service supports requests to $batch
[ContinueOnErrorSupported](Org.OData.Capabilities.V1.xml#L399)|Boolean|Service supports the continue on error preference
[ReferencesInRequestBodiesSupported](Org.OData.Capabilities.V1.xml#L402)|Boolean|Service supports Content-ID referencing in request bodies
[ReferencesAcrossChangeSetsSupported](Org.OData.Capabilities.V1.xml#L405)|Boolean|Service supports Content-ID referencing across change sets
[EtagReferencesSupported](Org.OData.Capabilities.V1.xml#L408)|Boolean|Service supports referencing Etags from previous requests
[RequestDependencyConditionsSupported](Org.OData.Capabilities.V1.xml#L411)|Boolean|Service supports the `if` member in JSON batch requests
[SupportedFormats](Org.OData.Capabilities.V1.xml#L414)|\[MediaType\]|Media types of supported formats for $batch<dl>Allowed Values:<dt>[multipart/mixed](Org.OData.Capabilities.V1.xml#L419)<dd>[Multipart Batch Format](http://docs.oasis-open.org/odata/odata/v4.01/cs01/part1-protocol/odata-v4.01-cs01-part1-protocol.html#sec_MultipartBatchFormat)<dt>[application/json](Org.OData.Capabilities.V1.xml#L423)<dd>[JSON Batch Format](http://docs.oasis-open.org/odata/odata-json-format/v4.01/cs01/odata-json-format-v4.01-cs01.html#sec_BatchRequestsandResponses)</dl>

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)
- [LongDescription](Org.OData.Core.V1.md#LongDescription)

<a name="FilterRestrictionsBase"></a>
## [FilterRestrictionsBase](Org.OData.Capabilities.V1.xml#L442)


**Derived Types:**
- [FilterRestrictionsType](#FilterRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Filterable](Org.OData.Capabilities.V1.xml#L448)|Boolean|$filter is supported
[RequiresFilter](Org.OData.Capabilities.V1.xml#L451)|Boolean|$filter is required
[MaxLevels](Org.OData.Capabilities.V1.xml#L454)|Int32|The maximum number of levels (including recursion) that can be traversed in a filter expression. A value of -1 indicates there is no restriction.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="FilterRestrictionsType"></a>
## [FilterRestrictionsType](Org.OData.Capabilities.V1.xml#L458): [FilterRestrictionsBase](#FilterRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Filterable*](Org.OData.Capabilities.V1.xml#L448)|Boolean|$filter is supported
[*RequiresFilter*](Org.OData.Capabilities.V1.xml#L451)|Boolean|$filter is required
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L454)|Int32|The maximum number of levels (including recursion) that can be traversed in a filter expression. A value of -1 indicates there is no restriction.
[RequiredProperties](Org.OData.Capabilities.V1.xml#L459)|\[PropertyPath\]|These properties must be specified in the $filter clause (properties of derived types are not allowed here)
[NonFilterableProperties](Org.OData.Capabilities.V1.xml#L462)|\[PropertyPath\]|These structural properties cannot be used in filter expressions
[FilterExpressionRestrictions](Org.OData.Capabilities.V1.xml#L465)|\[[FilterExpressionRestrictionType](#FilterExpressionRestrictionType)\]|These properties only allow a subset of filter expressions. A valid filter expression for a single property can be enclosed in parentheses and combined by `and` with valid expressions for other properties.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="FilterExpressionRestrictionType"></a>
## [FilterExpressionRestrictionType](Org.OData.Capabilities.V1.xml#L469)


Property|Type|Description
:-------|:---|:----------
[Property](Org.OData.Capabilities.V1.xml#L470)|PropertyPath?|Path to the restricted property
[AllowedExpressions](Org.OData.Capabilities.V1.xml#L473)|[FilterExpressionType?](#FilterExpressionType)|Allowed subset of expressions

<a name="FilterExpressionType"></a>
## [FilterExpressionType](Org.OData.Capabilities.V1.xml#L477)
**Type:** String



Allowed Value|Description
:------------|:----------
[SingleValue](Org.OData.Capabilities.V1.xml#L480)|Property can be used in a single `eq` clause
[MultiValue](Org.OData.Capabilities.V1.xml#L484)|Property can be used in multiple `eq` and `in` clauses, combined by `or` (which is logically equivalent to a single `in` clause)
[SingleRange](Org.OData.Capabilities.V1.xml#L488)|Property can be compared to a single closed, half-open, or open interval<br>The filter expression for this property consists of a single interval expression, which is either a single comparison of the property and a literal value with `eq`, `le`, `lt`, `ge`, or `gt`, or a pair of boundaries combined by `and`. The lower boundary is either `ge` or `gt`, the upper boundary either `le` or `lt`.
[MultiRange](Org.OData.Capabilities.V1.xml#L493)|Property can be compared to a union of one or more closed, half-open, or open intervals<br>The filter expression for this property consists of one or more interval expressions, combined by `or`. See SingleRange for the definition of an interval expression.<br> Alternatively the filter expression can consist of one or more `ne` expressions combined by `and`, which is roughly equivalent to the union of the complementing open intervals. Roughly equivalent because `null` is allowed as a right-side operand of an `ne` expression.
[SearchExpression](Org.OData.Capabilities.V1.xml#L502)|String property can be used as first operand in `startswith`, `endswith`, and `contains` clauses
[MultiRangeOrSearchExpression](Org.OData.Capabilities.V1.xml#L506)|Property can be compared to a union of zero or more closed, half-open, or open intervals plus zero or more simple string patterns<br>The filter expression for this property consists of one or more interval expressions or string comparison functions combined by `or`. See SingleRange for the definition of an interval expression. See SearchExpression for the allowed string comparison functions.

<a name="SortRestrictionsBase"></a>
## [SortRestrictionsBase](Org.OData.Capabilities.V1.xml#L519)


**Derived Types:**
- [SortRestrictionsType](#SortRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Sortable](Org.OData.Capabilities.V1.xml#L525)|Boolean|$orderby is supported

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="SortRestrictionsType"></a>
## [SortRestrictionsType](Org.OData.Capabilities.V1.xml#L529): [SortRestrictionsBase](#SortRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Sortable*](Org.OData.Capabilities.V1.xml#L525)|Boolean|$orderby is supported
[AscendingOnlyProperties](Org.OData.Capabilities.V1.xml#L530)|\[PropertyPath\]|These properties can only be used for sorting in Ascending order
[DescendingOnlyProperties](Org.OData.Capabilities.V1.xml#L533)|\[PropertyPath\]|These properties can only be used for sorting in Descending order
[NonSortableProperties](Org.OData.Capabilities.V1.xml#L536)|\[PropertyPath\]|These structural properties cannot be used in orderby expressions

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="ExpandRestrictionsBase"></a>
## [ExpandRestrictionsBase](Org.OData.Capabilities.V1.xml#L545)


**Derived Types:**
- [ExpandRestrictionsType](#ExpandRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Expandable](Org.OData.Capabilities.V1.xml#L551)|Boolean|$expand is supported
[StreamsExpandable](Org.OData.Capabilities.V1.xml#L554)|Boolean|$expand is supported for stream properties and media streams
[MaxLevels](Org.OData.Capabilities.V1.xml#L557)|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="ExpandRestrictionsType"></a>
## [ExpandRestrictionsType](Org.OData.Capabilities.V1.xml#L561): [ExpandRestrictionsBase](#ExpandRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Expandable*](Org.OData.Capabilities.V1.xml#L551)|Boolean|$expand is supported
[*StreamsExpandable*](Org.OData.Capabilities.V1.xml#L554)|Boolean|$expand is supported for stream properties and media streams
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L557)|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.
[NonExpandableProperties](Org.OData.Capabilities.V1.xml#L562)|\[NavigationPropertyPath\]|These properties cannot be used in expand expressions
[NonExpandableStreamProperties](Org.OData.Capabilities.V1.xml#L565)|\[PropertyPath\]|These stream properties cannot be used in expand expressions

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="SearchRestrictionsType"></a>
## [SearchRestrictionsType](Org.OData.Capabilities.V1.xml#L575)


Property|Type|Description
:-------|:---|:----------
[Searchable](Org.OData.Capabilities.V1.xml#L581)|Boolean|$search is supported
[UnsupportedExpressions](Org.OData.Capabilities.V1.xml#L584)|[SearchExpressions](#SearchExpressions)|Expressions not supported in $search

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="SearchExpressions"></a>
## [SearchExpressions](Org.OData.Capabilities.V1.xml#L588)


Flag Member|Value|Description
:-----|----:|:----------
[none](Org.OData.Capabilities.V1.xml#L589)|0|Single search term
[AND](Org.OData.Capabilities.V1.xml#L592)|1|Multiple search terms, optionally separated by `AND`
[OR](Org.OData.Capabilities.V1.xml#L595)|2|Multiple search terms separated by `OR`
[NOT](Org.OData.Capabilities.V1.xml#L598)|4|Search terms preceded by `NOT`
[phrase](Org.OData.Capabilities.V1.xml#L601)|8|Search phrases enclosed in double quotes
[group](Org.OData.Capabilities.V1.xml#L604)|16|Precedence grouping of search expressions with parentheses

<a name="InsertRestrictionsBase"></a>
## [InsertRestrictionsBase](Org.OData.Capabilities.V1.xml#L623)


**Derived Types:**
- [InsertRestrictionsType](#InsertRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Insertable](Org.OData.Capabilities.V1.xml#L624)|Boolean|Entities can be inserted
[MaxLevels](Org.OData.Capabilities.V1.xml#L627)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to insert into. A value of -1 indicates there is no restriction.
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L630)|Boolean|Entities of a specific derived type can be created by specifying a type-cast segment
[QueryOptions](Org.OData.Capabilities.V1.xml#L633)|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with insert requests
[CustomHeaders](Org.OData.Capabilities.V1.xml#L636)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L639)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](Org.OData.Capabilities.V1.xml#L642)|String?|A brief description of the request
[LongDescription](Org.OData.Capabilities.V1.xml#L646)|String?|A long description of the request
[ErrorResponses](Org.OData.Capabilities.V1.xml#L650)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="InsertRestrictionsType"></a>
## [InsertRestrictionsType](Org.OData.Capabilities.V1.xml#L654): [InsertRestrictionsBase](#InsertRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Insertable*](Org.OData.Capabilities.V1.xml#L624)|Boolean|Entities can be inserted
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L627)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to insert into. A value of -1 indicates there is no restriction.
[*TypecastSegmentSupported*](Org.OData.Capabilities.V1.xml#L630)|Boolean|Entities of a specific derived type can be created by specifying a type-cast segment
[*QueryOptions*](Org.OData.Capabilities.V1.xml#L633)|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with insert requests
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L636)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L639)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L642)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L646)|String?|A long description of the request
[*ErrorResponses*](Org.OData.Capabilities.V1.xml#L650)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.
[NonInsertableProperties](Org.OData.Capabilities.V1.xml#L655)|\[PropertyPath\]|These structural properties cannot be specified on insert
[NonInsertableNavigationProperties](Org.OData.Capabilities.V1.xml#L658)|\[NavigationPropertyPath\]|These navigation properties do not allow deep inserts
[RequiredProperties](Org.OData.Capabilities.V1.xml#L661)|\[PropertyPath\]|These structural properties must be specified on insert
[Permissions](Org.OData.Capabilities.V1.xml#L664)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the insert.

<a name="PermissionType"></a>
## [PermissionType](Org.OData.Capabilities.V1.xml#L669)


Property|Type|Description
:-------|:---|:----------
[SchemeName](Org.OData.Capabilities.V1.xml#L670)|[SchemeName](Org.OData.Authorization.V1.md#SchemeName)|Authorization flow scheme name
[Scopes](Org.OData.Capabilities.V1.xml#L673)|\[[ScopeType](#ScopeType)\]|List of scopes that can provide access to the resource

<a name="ScopeType"></a>
## [ScopeType](Org.OData.Capabilities.V1.xml#L678)


Property|Type|Description
:-------|:---|:----------
[Scope](Org.OData.Capabilities.V1.xml#L679)|String|Name of the scope.
[RestrictedProperties](Org.OData.Capabilities.V1.xml#L682)|String?|Comma-separated string value of all properties that will be included or excluded when using the scope.<br>Possible string value identifiers when specifying properties are `*`, _PropertyName_, `-`_PropertyName_.<br>`*` denotes all properties are accessible.<br>`-`_PropertyName_ excludes that specific property.<br>_PropertyName_ explicitly provides access to the specific property.<br>The absence of `RestrictedProperties` denotes all properties are accessible using that scope.

<a name="DeepInsertSupportType"></a>
## [DeepInsertSupportType](Org.OData.Capabilities.V1.xml#L702)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L703)|Boolean|Annotation target supports deep inserts
[ContentIDSupported](Org.OData.Capabilities.V1.xml#L706)|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

<a name="UpdateRestrictionsBase"></a>
## [UpdateRestrictionsBase](Org.OData.Capabilities.V1.xml#L715)


**Derived Types:**
- [UpdateRestrictionsType](#UpdateRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Updatable](Org.OData.Capabilities.V1.xml#L716)|Boolean|Entities can be updated
[Upsertable](Org.OData.Capabilities.V1.xml#L719)|Boolean|Entities can be upserted
[DeltaUpdateSupported](Org.OData.Capabilities.V1.xml#L722)|Boolean|Entities can be inserted, updated, and deleted via a PATCH request with a delta payload
[UpdateMethod](Org.OData.Capabilities.V1.xml#L725)|[HttpMethod?](#HttpMethod)|Supported HTTP Methods (PUT or PATCH) for updating an entity. If null, PATCH SHOULD be supported and PUT MAY be supported.
[FilterSegmentSupported](Org.OData.Capabilities.V1.xml#L728)|Boolean|Members of collections can be updated via a PATCH request with a `/$filter(...)/$each` segment
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L731)|Boolean|Members of collections can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[MaxLevels](Org.OData.Capabilities.V1.xml#L734)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection or entity to update. A value of -1 indicates there is no restriction.
[Permissions](Org.OData.Capabilities.V1.xml#L737)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the update.
[QueryOptions](Org.OData.Capabilities.V1.xml#L740)|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with update requests
[CustomHeaders](Org.OData.Capabilities.V1.xml#L743)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L746)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](Org.OData.Capabilities.V1.xml#L749)|String?|A brief description of the request
[LongDescription](Org.OData.Capabilities.V1.xml#L753)|String?|A long description of the request
[ErrorResponses](Org.OData.Capabilities.V1.xml#L757)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="UpdateRestrictionsType"></a>
## [UpdateRestrictionsType](Org.OData.Capabilities.V1.xml#L761): [UpdateRestrictionsBase](#UpdateRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Updatable*](Org.OData.Capabilities.V1.xml#L716)|Boolean|Entities can be updated
[*Upsertable*](Org.OData.Capabilities.V1.xml#L719)|Boolean|Entities can be upserted
[*DeltaUpdateSupported*](Org.OData.Capabilities.V1.xml#L722)|Boolean|Entities can be inserted, updated, and deleted via a PATCH request with a delta payload
[*UpdateMethod*](Org.OData.Capabilities.V1.xml#L725)|[HttpMethod?](#HttpMethod)|Supported HTTP Methods (PUT or PATCH) for updating an entity. If null, PATCH SHOULD be supported and PUT MAY be supported.
[*FilterSegmentSupported*](Org.OData.Capabilities.V1.xml#L728)|Boolean|Members of collections can be updated via a PATCH request with a `/$filter(...)/$each` segment
[*TypecastSegmentSupported*](Org.OData.Capabilities.V1.xml#L731)|Boolean|Members of collections can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L734)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection or entity to update. A value of -1 indicates there is no restriction.
[*Permissions*](Org.OData.Capabilities.V1.xml#L737)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the update.
[*QueryOptions*](Org.OData.Capabilities.V1.xml#L740)|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with update requests
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L743)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L746)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L749)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L753)|String?|A long description of the request
[*ErrorResponses*](Org.OData.Capabilities.V1.xml#L757)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.
[NonUpdatableProperties](Org.OData.Capabilities.V1.xml#L762)|\[PropertyPath\]|These structural properties cannot be specified on update
[NonUpdatableNavigationProperties](Org.OData.Capabilities.V1.xml#L765)|\[NavigationPropertyPath\]|These navigation properties do not allow rebinding
[RequiredProperties](Org.OData.Capabilities.V1.xml#L768)|\[PropertyPath\]|These structural properties must be specified on update

<a name="HttpMethod"></a>
## [HttpMethod](Org.OData.Capabilities.V1.xml#L773)


Flag Member|Value|Description
:-----|----:|:----------
[GET](Org.OData.Capabilities.V1.xml#L774)|1|The HTTP GET Method
[PATCH](Org.OData.Capabilities.V1.xml#L777)|2|The HTTP PATCH Method
[PUT](Org.OData.Capabilities.V1.xml#L780)|4|The HTTP PUT Method
[POST](Org.OData.Capabilities.V1.xml#L783)|8|The HTTP POST Method
[DELETE](Org.OData.Capabilities.V1.xml#L786)|16|The HTTP DELETE Method
[OPTIONS](Org.OData.Capabilities.V1.xml#L789)|32|The HTTP OPTIONS Method
[HEAD](Org.OData.Capabilities.V1.xml#L792)|64|The HTTP HEAD Method

<a name="DeepUpdateSupportType"></a>
## [DeepUpdateSupportType](Org.OData.Capabilities.V1.xml#L801)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L802)|Boolean|Annotation target supports deep updates
[ContentIDSupported](Org.OData.Capabilities.V1.xml#L805)|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

<a name="DeleteRestrictionsBase"></a>
## [DeleteRestrictionsBase](Org.OData.Capabilities.V1.xml#L814)


**Derived Types:**
- [DeleteRestrictionsType](#DeleteRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Deletable](Org.OData.Capabilities.V1.xml#L815)|Boolean|Entities can be deleted
[MaxLevels](Org.OData.Capabilities.V1.xml#L818)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to delete from or the entity to delete. A value of -1 indicates there is no restriction.
[FilterSegmentSupported](Org.OData.Capabilities.V1.xml#L821)|Boolean|Members of collections can be deleted via a DELETE request with a `/$filter(...)/$each` segment
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L824)|Boolean|Members of collections can be deleted via a DELETE request with a type-cast segment and a `/$each` segment
[Permissions](Org.OData.Capabilities.V1.xml#L827)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the delete.
[CustomHeaders](Org.OData.Capabilities.V1.xml#L830)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L833)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](Org.OData.Capabilities.V1.xml#L836)|String?|A brief description of the request
[LongDescription](Org.OData.Capabilities.V1.xml#L840)|String?|A long description of the request
[ErrorResponses](Org.OData.Capabilities.V1.xml#L844)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="DeleteRestrictionsType"></a>
## [DeleteRestrictionsType](Org.OData.Capabilities.V1.xml#L848): [DeleteRestrictionsBase](#DeleteRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Deletable*](Org.OData.Capabilities.V1.xml#L815)|Boolean|Entities can be deleted
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L818)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to delete from or the entity to delete. A value of -1 indicates there is no restriction.
[*FilterSegmentSupported*](Org.OData.Capabilities.V1.xml#L821)|Boolean|Members of collections can be deleted via a DELETE request with a `/$filter(...)/$each` segment
[*TypecastSegmentSupported*](Org.OData.Capabilities.V1.xml#L824)|Boolean|Members of collections can be deleted via a DELETE request with a type-cast segment and a `/$each` segment
[*Permissions*](Org.OData.Capabilities.V1.xml#L827)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the delete.
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L830)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L833)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L836)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L840)|String?|A long description of the request
[*ErrorResponses*](Org.OData.Capabilities.V1.xml#L844)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.
[NonDeletableNavigationProperties](Org.OData.Capabilities.V1.xml#L849)|\[NavigationPropertyPath\]|These navigation properties do not allow DeleteLink requests

<a name="CollectionPropertyRestrictionsType"></a>
## [CollectionPropertyRestrictionsType](Org.OData.Capabilities.V1.xml#L857)


Property|Type|Description
:-------|:---|:----------
[CollectionProperty](Org.OData.Capabilities.V1.xml#L858)|PropertyPath?|Restricted Collection-valued property
[FilterFunctions](Org.OData.Capabilities.V1.xml#L861)|\[String\]|List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L865)|[FilterRestrictionsType?](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L868)|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L871)|[SortRestrictionsType?](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](Org.OData.Capabilities.V1.xml#L874)|Boolean|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L877)|Boolean|Supports $skip
[SelectSupport](Org.OData.Capabilities.V1.xml#L880)|[SelectSupportType?](#SelectSupportType)|Support for $select
[Insertable](Org.OData.Capabilities.V1.xml#L883)|Boolean|Members can be inserted into this collection<br>If additionally annotated with [Core.PositionalInsert](Org.OData.Core.V1.md#PositionalInsert), members can be inserted at a specific position
[Updatable](Org.OData.Capabilities.V1.xml#L887)|Boolean|Members of this ordered collection can be updated by ordinal
[Deletable](Org.OData.Capabilities.V1.xml#L890)|Boolean|Members of this ordered collection can be deleted by ordinal

<a name="OperationRestrictionsType"></a>
## [OperationRestrictionsType](Org.OData.Capabilities.V1.xml#L898)


Property|Type|Description
:-------|:---|:----------
[FilterSegmentSupported](Org.OData.Capabilities.V1.xml#L899)|Boolean|Bound action or function can be invoked on a collection-valued binding parameter path with a `/$filter(...)` segment
[Permissions](Org.OData.Capabilities.V1.xml#L902)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to invoke an action or function
[CustomHeaders](Org.OData.Capabilities.V1.xml#L905)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L908)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[ErrorResponses](Org.OData.Capabilities.V1.xml#L911)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="ModificationQueryOptionsType"></a>
## [ModificationQueryOptionsType](Org.OData.Capabilities.V1.xml#L922)


Property|Type|Description
:-------|:---|:----------
[ExpandSupported](Org.OData.Capabilities.V1.xml#L923)|Boolean|Supports $expand with modification requests
[SelectSupported](Org.OData.Capabilities.V1.xml#L926)|Boolean|Supports $select with modification requests
[ComputeSupported](Org.OData.Capabilities.V1.xml#L929)|Boolean|Supports $compute with modification requests
[FilterSupported](Org.OData.Capabilities.V1.xml#L932)|Boolean|Supports $filter with modification requests
[SearchSupported](Org.OData.Capabilities.V1.xml#L935)|Boolean|Supports $search with modification requests
[SortSupported](Org.OData.Capabilities.V1.xml#L938)|Boolean|Supports $orderby with modification requests

<a name="ReadRestrictionsBase"></a>
## [*ReadRestrictionsBase*](Org.OData.Capabilities.V1.xml#L947)


**Derived Types:**
- [ReadByKeyRestrictionsType](#ReadByKeyRestrictionsType)
- [ReadRestrictionsType](#ReadRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Readable](Org.OData.Capabilities.V1.xml#L948)|Boolean|Entities can be retrieved
[Permissions](Org.OData.Capabilities.V1.xml#L951)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[CustomHeaders](Org.OData.Capabilities.V1.xml#L954)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L957)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](Org.OData.Capabilities.V1.xml#L960)|String?|A brief description of the request
[LongDescription](Org.OData.Capabilities.V1.xml#L964)|String?|A long description of the request
[ErrorResponses](Org.OData.Capabilities.V1.xml#L968)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="ReadByKeyRestrictionsType"></a>
## [ReadByKeyRestrictionsType](Org.OData.Capabilities.V1.xml#L972): [ReadRestrictionsBase](#ReadRestrictionsBase)
Restrictions for retrieving an entity by key

Property|Type|Description
:-------|:---|:----------
[*Readable*](Org.OData.Capabilities.V1.xml#L948)|Boolean|Entities can be retrieved
[*Permissions*](Org.OData.Capabilities.V1.xml#L951)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L954)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L957)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L960)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L964)|String?|A long description of the request
[*ErrorResponses*](Org.OData.Capabilities.V1.xml#L968)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="ReadRestrictionsType"></a>
## [ReadRestrictionsType](Org.OData.Capabilities.V1.xml#L975): [ReadRestrictionsBase](#ReadRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Readable*](Org.OData.Capabilities.V1.xml#L948)|Boolean|Entities can be retrieved
[*Permissions*](Org.OData.Capabilities.V1.xml#L951)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L954)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L957)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L960)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L964)|String?|A long description of the request
[*ErrorResponses*](Org.OData.Capabilities.V1.xml#L968)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L976)|Boolean|Entities of a specific derived type can be read by specifying a type-cast segment
[ReadByKeyRestrictions](Org.OData.Capabilities.V1.xml#L979)|[ReadByKeyRestrictionsType?](#ReadByKeyRestrictionsType)|Restrictions for retrieving an entity by key<br>Only valid when applied to a collection. If a property of `ReadByKeyRestrictions` is not specified, the corresponding property value of `ReadRestrictions` applies.

<a name="CustomParameter"></a>
## [CustomParameter](Org.OData.Capabilities.V1.xml#L1042)
A custom parameter is either a header or a query option

The type of a custom parameter is always a string. Restrictions on the parameter values can be expressed by annotating the record expression describing the parameter with terms from the Validation vocabulary, e.g. Validation.Pattern or Validation.AllowedValues.

Property|Type|Description
:-------|:---|:----------
[Name](Org.OData.Capabilities.V1.xml#L1045)|String|Name of the custom parameter
[Description](Org.OData.Capabilities.V1.xml#L1048)|String?|Description of the custom parameter
[DocumentationURL](Org.OData.Capabilities.V1.xml#L1051)|URL?|URL of related documentation
[Required](Org.OData.Capabilities.V1.xml#L1055)|Boolean|true: parameter is required, false or not specified: parameter is optional
[ExampleValues](Org.OData.Capabilities.V1.xml#L1058)|\[[PrimitiveExampleValue](Org.OData.Core.V1.md#PrimitiveExampleValue)\]|Example values for the custom parameter

<a name="DefaultCapabilitiesType"></a>
## [DefaultCapabilitiesType](Org.OData.Capabilities.V1.xml#L1077)


Property|Type|Description
:-------|:---|:----------
[ChangeTracking](Org.OData.Capabilities.V1.xml#L1078)|[ChangeTrackingBase?](#ChangeTrackingBase)|Change tracking capabilities
[CountRestrictions](Org.OData.Capabilities.V1.xml#L1081)|[CountRestrictionsBase?](#CountRestrictionsBase)|Restrictions on /$count path suffix and $count=true system query option
[IndexableByKey](Org.OData.Capabilities.V1.xml#L1084)|[Tag?](Org.OData.Core.V1.md#Tag)|Supports key values according to OData URL conventions
[TopSupported](Org.OData.Capabilities.V1.xml#L1087)|[Tag?](Org.OData.Core.V1.md#Tag)|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L1090)|[Tag?](Org.OData.Core.V1.md#Tag)|Supports $skip
[ComputeSupported](Org.OData.Capabilities.V1.xml#L1093)|[Tag?](Org.OData.Core.V1.md#Tag)|Supports $compute
[SelectSupport](Org.OData.Capabilities.V1.xml#L1096)|[SelectSupportType?](#SelectSupportType)|Support for $select and nested query options within $select
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L1099)|[FilterRestrictionsBase?](#FilterRestrictionsBase)|Restrictions on filter expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L1102)|[SortRestrictionsBase?](#SortRestrictionsBase)|Restrictions on orderby expressions
[ExpandRestrictions](Org.OData.Capabilities.V1.xml#L1105)|[ExpandRestrictionsBase?](#ExpandRestrictionsBase)|Restrictions on expand expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L1108)|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L1111)|[InsertRestrictionsBase?](#InsertRestrictionsBase)|Restrictions on insert operations
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L1114)|[UpdateRestrictionsBase?](#UpdateRestrictionsBase)|Restrictions on update operations
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L1117)|[DeleteRestrictionsBase?](#DeleteRestrictionsBase)|Restrictions on delete operations
[OperationRestrictions](Org.OData.Capabilities.V1.xml#L1120)|[OperationRestrictionsType?](#OperationRestrictionsType)|Restrictions for function or action operations
[ReadRestrictions](Org.OData.Capabilities.V1.xml#L1123)|[ReadRestrictionsType?](#ReadRestrictionsType)|Restrictions for retrieving a collection of entities, retrieving a singleton instance

<a name="HttpResponse"></a>
## [HttpResponse](Org.OData.Capabilities.V1.xml#L1128)


Property|Type|Description
:-------|:---|:----------
[StatusCode](Org.OData.Capabilities.V1.xml#L1129)|String|HTTP response status code, for example 400, 403, 501
[Description](Org.OData.Capabilities.V1.xml#L1132)|String|Human-readable description of the response
