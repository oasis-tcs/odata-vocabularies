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
1. embedded within a model element `edm:EntitySet` or `edm:Singleton`
2. with an external annotation target T starting with a container and targeting a collection
3. a `Capabilities.NavigationRestrictions` annotation with a `RestrictedProperties/NavigationProperty`;
   let T then be the concatenation of
   - the annotation target in the case of external targeting, otherwise the path from the container to the entity set or singleton in which the annotation is embedded
   - and the navigation property path in `RestrictedProperties/NavigationProperty`.

It is an error to specify conflicting restrictions of the same capability through mechanisms 2 and 3 with the same T.

Capabilities annotations given through mechanism 1 or where T contains no non-containment navigation property
target a canonical collection or singleton (in the sense of [OData-Protocol, section 10](https://oasis-tcs.github.io/odata-specs/odata-protocol/odata-protocol.html#ContextURL));
they apply to every entity in that collection, even if it is addressed via a non-canonical path.

Capabilities annotations given through mechanism 2 or 3 where T contains at least one non-containment navigation property
are specific to resource paths matching T; their restrictions take precedence over restrictions on
the canonical collection or singleton.
        


## Terms

Term|Type|Description
:---|:---|:----------
[ConformanceLevel](Org.OData.Capabilities.V1.xml#L133)|[ConformanceLevelType](#ConformanceLevelType)|<a name="ConformanceLevel"></a>The conformance level achieved by this service
[SupportedFormats](Org.OData.Capabilities.V1.xml#L150)|\[MediaType\]|<a name="SupportedFormats"></a>Media types of supported formats, including format parameters
[SupportedMetadataFormats](Org.OData.Capabilities.V1.xml#L155)|\[MediaType\]|<a name="SupportedMetadataFormats"></a>Media types of supported formats for $metadata, including format parameters
[AcceptableEncodings](Org.OData.Capabilities.V1.xml#L160)|\[String\]|<a name="AcceptableEncodings"></a>List of acceptable compression methods for ($batch) requests, e.g. gzip
[AsynchronousRequestsSupported](Org.OData.Capabilities.V1.xml#L166)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AsynchronousRequestsSupported"></a>Service supports the asynchronous request preference
[BatchContinueOnErrorSupported](Org.OData.Capabilities.V1.xml#L170)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchContinueOnErrorSupported"></a>Service supports the continue on error preference. Supports $batch requests. Services that apply the BatchContinueOnErrorSupported term should also specify the ContinueOnErrorSupported property from the BatchSupport term.
[IsolationSupported](Org.OData.Capabilities.V1.xml#L174)|[IsolationLevel](#IsolationLevel)|<a name="IsolationSupported"></a>Supported odata.isolation levels
[CrossJoinSupported](Org.OData.Capabilities.V1.xml#L183)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="CrossJoinSupported"></a>Supports cross joins for the entity sets in this container
[CallbackSupported](Org.OData.Capabilities.V1.xml#L187)|[CallbackType](#CallbackType)|<a name="CallbackSupported"></a>Supports callbacks for the specified protocols
[ChangeTracking](Org.OData.Capabilities.V1.xml#L209)|[ChangeTrackingType](#ChangeTrackingType)|<a name="ChangeTracking"></a>Change tracking capabilities of this service or entity set
[CountRestrictions](Org.OData.Capabilities.V1.xml#L230)|[CountRestrictionsType](#CountRestrictionsType)|<a name="CountRestrictions"></a>Restrictions on /$count path suffix and $count=true system query option
[NavigationRestrictions](Org.OData.Capabilities.V1.xml#L248)|[NavigationRestrictionsType](#NavigationRestrictionsType)|<a name="NavigationRestrictions"></a>Restrictions on navigating properties according to OData URL conventions
[IndexableByKey](Org.OData.Capabilities.V1.xml#L338)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="IndexableByKey"></a>Supports key values according to OData URL conventions
[TopSupported](Org.OData.Capabilities.V1.xml#L343)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="TopSupported"></a>Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L348)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="SkipSupported"></a>Supports $skip
[ComputeSupported](Org.OData.Capabilities.V1.xml#L353)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="ComputeSupported"></a>Supports $compute
[SelectSupport](Org.OData.Capabilities.V1.xml#L358)|[SelectSupportType](#SelectSupportType)|<a name="SelectSupport"></a>Support for $select and nested query options within $select
[BatchSupported](Org.OData.Capabilities.V1.xml#L395)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchSupported"></a>Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.
[BatchSupport](Org.OData.Capabilities.V1.xml#L399)|[BatchSupportType](#BatchSupportType)|<a name="BatchSupport"></a>Batch Support for the service
[FilterFunctions](Org.OData.Capabilities.V1.xml#L445)|\[String\]|<a name="FilterFunctions"></a>List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L451)|[FilterRestrictionsType](#FilterRestrictionsType)|<a name="FilterRestrictions"></a>Restrictions on filter expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L532)|[SortRestrictionsType](#SortRestrictionsType)|<a name="SortRestrictions"></a>Restrictions on orderby expressions
[ExpandRestrictions](Org.OData.Capabilities.V1.xml#L558)|[ExpandRestrictionsType](#ExpandRestrictionsType)|<a name="ExpandRestrictions"></a>Restrictions on expand expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L587)|[SearchRestrictionsType](#SearchRestrictionsType)|<a name="SearchRestrictions"></a>Restrictions on search expressions
[KeyAsSegmentSupported](Org.OData.Capabilities.V1.xml#L633)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="KeyAsSegmentSupported"></a>Supports [key-as-segment convention](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_KeyasSegmentConvention) for addressing entities within a collection
[QuerySegmentSupported](Org.OData.Capabilities.V1.xml#L637)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="QuerySegmentSupported"></a>Supports [passing query options in the request body](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_PassingQueryOptionsintheRequestBody)
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L643)|[InsertRestrictionsType](#InsertRestrictionsType)|<a name="InsertRestrictions"></a>Restrictions on insert operations
[DeepInsertSupport](Org.OData.Capabilities.V1.xml#L722)|[DeepInsertSupportType?](#DeepInsertSupportType)|<a name="DeepInsertSupport"></a>Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L735)|[UpdateRestrictionsType](#UpdateRestrictionsType)|<a name="UpdateRestrictions"></a>Restrictions on update operations
[DeepUpdateSupport](Org.OData.Capabilities.V1.xml#L821)|[DeepUpdateSupportType](#DeepUpdateSupportType)|<a name="DeepUpdateSupport"></a>Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L834)|[DeleteRestrictionsType](#DeleteRestrictionsType)|<a name="DeleteRestrictions"></a>Restrictions on delete operations
[CollectionPropertyRestrictions](Org.OData.Capabilities.V1.xml#L878)|\[[CollectionPropertyRestrictionsType](#CollectionPropertyRestrictionsType)\]|<a name="CollectionPropertyRestrictions"></a>Describes restrictions on operations applied to collection-valued structural properties
[OperationRestrictions](Org.OData.Capabilities.V1.xml#L919)|[OperationRestrictionsType](#OperationRestrictionsType)|<a name="OperationRestrictions"></a>Restrictions for function or action operation
[AnnotationValuesInQuerySupported](Org.OData.Capabilities.V1.xml#L939)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AnnotationValuesInQuerySupported"></a>Supports annotation values within system query options
[ModificationQueryOptions](Org.OData.Capabilities.V1.xml#L943)|[ModificationQueryOptionsType](#ModificationQueryOptionsType)|<a name="ModificationQueryOptions"></a>Support for query options with modification requests (insert, update, action invocation)
[ReadRestrictions](Org.OData.Capabilities.V1.xml#L967)|[ReadRestrictionsType](#ReadRestrictionsType)|<a name="ReadRestrictions"></a>Restrictions for retrieving a collection of entities, retrieving a singleton instance.
[CustomHeaders](Org.OData.Capabilities.V1.xml#L1009)|\[[CustomParameter](#CustomParameter)\]|<a name="CustomHeaders"></a>Custom headers that are supported/required for the annotated resource ([Example](Org.OData.Capabilities.V1.xml#L1011))
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L1035)|\[[CustomParameter](#CustomParameter)\]|<a name="CustomQueryOptions"></a>Custom query options that are supported/required for the annotated resource ([Example](Org.OData.Capabilities.V1.xml#L1038))<br>If the entity container is annotated, the query option is supported/required by all resources in that container.
[MediaLocationUpdateSupported](Org.OData.Capabilities.V1.xml#L1087)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="MediaLocationUpdateSupported"></a>Stream property or media stream supports update of its media edit URL and/or media read URL
[DefaultCapabilities](Org.OData.Capabilities.V1.xml#L1092)|[DefaultCapabilitiesType](#DefaultCapabilitiesType)|<a name="DefaultCapabilities"></a>Default capability settings for all collection-valued resources in the container<br><p>Annotating a specific capability term, which is included as property in <code>DefaultCapabilitiesType</code>, for a specific collection-valued resource overrides the default capability with the specified properties using PATCH semantics:</p> <ul> <li>Primitive or collection-valued properties specified in the specific capability term replace the corresponding properties specified in <code>DefaultCapabilities</code></li> <li>Complex-valued properties specified in the specific capability term override the corresponding properties specified in <code>DefaultCapabilities</code> using PATCH semantics recursively</li> <li>Properties specified neither in the specific term nor in <code>DefaultCapabilities</code> have their default value</li> </ul> 

<a name="ConformanceLevelType"></a>
## [ConformanceLevelType](Org.OData.Capabilities.V1.xml#L136)


Member|Value|Description
:-----|----:|:----------
[Minimal](Org.OData.Capabilities.V1.xml#L137)|0|Minimal conformance level
[Intermediate](Org.OData.Capabilities.V1.xml#L140)|1|Intermediate conformance level
[Advanced](Org.OData.Capabilities.V1.xml#L143)|2|Advanced conformance level

<a name="IsolationLevel"></a>
## [IsolationLevel](Org.OData.Capabilities.V1.xml#L177)


Flag Member|Value|Description
:-----|----:|:----------
[Snapshot](Org.OData.Capabilities.V1.xml#L178)|1|All data returned for a request, including multiple requests within a batch or results retrieved across multiple pages, will be consistent as of a single point in time

<a name="CallbackType"></a>
## [CallbackType](Org.OData.Capabilities.V1.xml#L190)
A non-empty collection lists the full set of supported protocols. A empty collection means 'only HTTP is supported'

Property|Type|Description
:-------|:---|:----------
[CallbackProtocols](Org.OData.Capabilities.V1.xml#L191)|\[[CallbackProtocol](#CallbackProtocol)\]|List of supported callback protocols, e.g. `http` or `wss`

<a name="CallbackProtocol"></a>
## [CallbackProtocol](Org.OData.Capabilities.V1.xml#L196)


Property|Type|Description
:-------|:---|:----------
[Id](Org.OData.Capabilities.V1.xml#L197)|String?|Protocol Identifier
[UrlTemplate](Org.OData.Capabilities.V1.xml#L200)|String?|URL Template including parameters. Parameters are enclosed in curly braces {} as defined in RFC6570
[DocumentationUrl](Org.OData.Capabilities.V1.xml#L203)|URL?|Human readable description of the meaning of the URL Template parameters

<a name="ChangeTrackingBase"></a>
## [ChangeTrackingBase](Org.OData.Capabilities.V1.xml#L212)


**Derived Types:**
- [ChangeTrackingType](#ChangeTrackingType)

Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L213)|Boolean|odata.track-changes preference is supported

<a name="ChangeTrackingType"></a>
## [ChangeTrackingType](Org.OData.Capabilities.V1.xml#L217): [ChangeTrackingBase](#ChangeTrackingBase)


Property|Type|Description
:-------|:---|:----------
[*Supported*](Org.OData.Capabilities.V1.xml#L213)|Boolean|odata.track-changes preference is supported
[FilterableProperties](Org.OData.Capabilities.V1.xml#L218)|\[PropertyPath\]|Change tracking supports filters on these properties<br>If no properties are specified or FilterableProperties is omitted, clients cannot assume support for filtering on any properties in combination with change tracking.
[ExpandableProperties](Org.OData.Capabilities.V1.xml#L222)|\[NavigationPropertyPath\]|Change tracking supports these properties expanded<br>If no properties are specified or ExpandableProperties is omitted, clients cannot assume support for expanding any properties in combination with change tracking.

<a name="CountRestrictionsBase"></a>
## [CountRestrictionsBase](Org.OData.Capabilities.V1.xml#L234)


**Derived Types:**
- [CountRestrictionsType](#CountRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Countable](Org.OData.Capabilities.V1.xml#L235)|Boolean|Instances can be counted in requests targeting a collection

<a name="CountRestrictionsType"></a>
## [CountRestrictionsType](Org.OData.Capabilities.V1.xml#L239): [CountRestrictionsBase](#CountRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Countable*](Org.OData.Capabilities.V1.xml#L235)|Boolean|Instances can be counted in requests targeting a collection
[NonCountableProperties](Org.OData.Capabilities.V1.xml#L240)|\[PropertyPath\]|Members of these collection properties cannot be counted
[NonCountableNavigationProperties](Org.OData.Capabilities.V1.xml#L243)|\[NavigationPropertyPath\]|Members of these navigation properties cannot be counted

<a name="NavigationRestrictionsType"></a>
## [NavigationRestrictionsType](Org.OData.Capabilities.V1.xml#L252)


Property|Type|Description
:-------|:---|:----------
[Navigability](Org.OData.Capabilities.V1.xml#L253)|[NavigationType?](#NavigationType)|Default navigability for all navigation properties of the annotation target. Individual navigation properties can override this value via `RestrictedProperties/Navigability`.
[RestrictedProperties](Org.OData.Capabilities.V1.xml#L256)|\[[NavigationPropertyRestriction](#NavigationPropertyRestriction)\]|List of navigation properties with restrictions

<a name="NavigationPropertyRestriction"></a>
## [NavigationPropertyRestriction](Org.OData.Capabilities.V1.xml#L260)


Using a property of `NavigationPropertyRestriction` in a [`NavigationRestrictions`](#NavigationRestrictions) annotation
          is discouraged in favor of using an annotation with the corresponding term from this vocabulary and a target path starting with a container and ending in the `NavigationProperty`,
          unless the favored alternative is impossible because a dynamic expression requires an instance path whose evaluation
          starts at the target of the `NavigationRestrictions` annotation. See [this example](../examples/Org.OData.Capabilities.V1.capabilities.md).

Property|Type|Description
:-------|:---|:----------
[NavigationProperty](Org.OData.Capabilities.V1.xml#L267)|NavigationPropertyPath|Navigation properties can be navigated<br>The target path of a [`NavigationRestrictions`](#NavigationRestrictions) annotation followed by this navigation property path addresses the resource to which the other properties of `NavigationPropertyRestriction` apply. Instance paths that occur in dynamic expressions are evaluated starting at the boundary between both paths, which must therefore be chosen accordingly.
[Navigability](Org.OData.Capabilities.V1.xml#L276)|[NavigationType?](#NavigationType)|Supported navigability of this navigation property
[FilterFunctions](Org.OData.Capabilities.V1.xml#L279)|\[String\]|List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L283)|[FilterRestrictionsType?](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L286)|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L289)|[SortRestrictionsType?](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](Org.OData.Capabilities.V1.xml#L292)|Boolean|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L295)|Boolean|Supports $skip
[SelectSupport](Org.OData.Capabilities.V1.xml#L298)|[SelectSupportType?](#SelectSupportType)|Support for $select
[IndexableByKey](Org.OData.Capabilities.V1.xml#L301)|Boolean|Supports key values according to OData URL conventions
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L304)|[InsertRestrictionsType?](#InsertRestrictionsType)|Restrictions on insert operations
[DeepInsertSupport](Org.OData.Capabilities.V1.xml#L307)|[DeepInsertSupportType?](#DeepInsertSupportType)|Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L310)|[UpdateRestrictionsType?](#UpdateRestrictionsType)|Restrictions on update operations
[DeepUpdateSupport](Org.OData.Capabilities.V1.xml#L313)|[DeepUpdateSupportType?](#DeepUpdateSupportType)|Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L316)|[DeleteRestrictionsType?](#DeleteRestrictionsType)|Restrictions on delete operations
[OptimisticConcurrencyControl](Org.OData.Capabilities.V1.xml#L319)|Boolean|Data modification (including insert) along this navigation property requires the use of ETags
[ReadRestrictions](Org.OData.Capabilities.V1.xml#L322)|[ReadRestrictionsType?](#ReadRestrictionsType)|Restrictions for retrieving entities

<a name="NavigationType"></a>
## [NavigationType](Org.OData.Capabilities.V1.xml#L326)


Member|Value|Description
:-----|----:|:----------
[Recursive](Org.OData.Capabilities.V1.xml#L327)|0|Navigation properties can be recursively navigated
[Single](Org.OData.Capabilities.V1.xml#L330)|1|Navigation properties can be navigated to a single level
[None](Org.OData.Capabilities.V1.xml#L333)|2|Navigation properties are not navigable

<a name="SelectSupportType"></a>
## [SelectSupportType](Org.OData.Capabilities.V1.xml#L362)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L363)|Boolean|Supports $select
[InstanceAnnotationsSupported](Org.OData.Capabilities.V1.xml#L366)|Boolean|Supports instance annotations in $select list
[Expandable](Org.OData.Capabilities.V1.xml#L369)|Boolean|$expand within $select is supported
[Filterable](Org.OData.Capabilities.V1.xml#L372)|Boolean|$filter within $select is supported
[Searchable](Org.OData.Capabilities.V1.xml#L375)|Boolean|$search within $select is supported
[TopSupported](Org.OData.Capabilities.V1.xml#L378)|Boolean|$top within $select is supported
[SkipSupported](Org.OData.Capabilities.V1.xml#L381)|Boolean|$skip within $select is supported
[ComputeSupported](Org.OData.Capabilities.V1.xml#L384)|Boolean|$compute within $select is supported
[Countable](Org.OData.Capabilities.V1.xml#L387)|Boolean|$count within $select is supported
[Sortable](Org.OData.Capabilities.V1.xml#L390)|Boolean|$orderby within $select is supported

<a name="BatchSupportType"></a>
## [BatchSupportType](Org.OData.Capabilities.V1.xml#L402)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L409)|Boolean|Service supports requests to $batch
[ContinueOnErrorSupported](Org.OData.Capabilities.V1.xml#L412)|Boolean|Service supports the continue on error preference
[ReferencesInRequestBodiesSupported](Org.OData.Capabilities.V1.xml#L415)|Boolean|Service supports Content-ID referencing in request bodies
[ReferencesAcrossChangeSetsSupported](Org.OData.Capabilities.V1.xml#L418)|Boolean|Service supports Content-ID referencing across change sets
[EtagReferencesSupported](Org.OData.Capabilities.V1.xml#L421)|Boolean|Service supports referencing Etags from previous requests
[RequestDependencyConditionsSupported](Org.OData.Capabilities.V1.xml#L424)|Boolean|Service supports the `if` member in JSON batch requests
[SupportedFormats](Org.OData.Capabilities.V1.xml#L427)|\[MediaType\]|Media types of supported formats for $batch<br>Allowed Values:<dl><dt>[multipart/mixed](Org.OData.Capabilities.V1.xml#L432)<dd>[Multipart Batch Format](http://docs.oasis-open.org/odata/odata/v4.01/cs01/part1-protocol/odata-v4.01-cs01-part1-protocol.html#sec_MultipartBatchFormat)<dt>[application/json](Org.OData.Capabilities.V1.xml#L436)<dd>[JSON Batch Format](http://docs.oasis-open.org/odata/odata-json-format/v4.01/cs01/odata-json-format-v4.01-cs01.html#sec_BatchRequestsandResponses)</dl>

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)
- [LongDescription](Org.OData.Core.V1.md#LongDescription)

<a name="FilterRestrictionsBase"></a>
## [FilterRestrictionsBase](Org.OData.Capabilities.V1.xml#L455)


**Derived Types:**
- [FilterRestrictionsType](#FilterRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Filterable](Org.OData.Capabilities.V1.xml#L461)|Boolean|$filter is supported
[RequiresFilter](Org.OData.Capabilities.V1.xml#L464)|Boolean|$filter is required
[MaxLevels](Org.OData.Capabilities.V1.xml#L467)|Int32|The maximum number of levels (including recursion) that can be traversed in a filter expression. A value of -1 indicates there is no restriction.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="FilterRestrictionsType"></a>
## [FilterRestrictionsType](Org.OData.Capabilities.V1.xml#L471): [FilterRestrictionsBase](#FilterRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Filterable*](Org.OData.Capabilities.V1.xml#L461)|Boolean|$filter is supported
[*RequiresFilter*](Org.OData.Capabilities.V1.xml#L464)|Boolean|$filter is required
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L467)|Int32|The maximum number of levels (including recursion) that can be traversed in a filter expression. A value of -1 indicates there is no restriction.
[RequiredProperties](Org.OData.Capabilities.V1.xml#L472)|\[PropertyPath\]|These properties must be specified in the $filter clause (properties of derived types are not allowed here)
[NonFilterableProperties](Org.OData.Capabilities.V1.xml#L475)|\[PropertyPath\]|These structural properties cannot be used in filter expressions
[FilterExpressionRestrictions](Org.OData.Capabilities.V1.xml#L478)|\[[FilterExpressionRestrictionType](#FilterExpressionRestrictionType)\]|These properties only allow a subset of filter expressions. A valid filter expression for a single property can be enclosed in parentheses and combined by `and` with valid expressions for other properties.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="FilterExpressionRestrictionType"></a>
## [FilterExpressionRestrictionType](Org.OData.Capabilities.V1.xml#L482)


Property|Type|Description
:-------|:---|:----------
[Property](Org.OData.Capabilities.V1.xml#L483)|PropertyPath?|Path to the restricted property
[AllowedExpressions](Org.OData.Capabilities.V1.xml#L486)|[FilterExpressionType?](#FilterExpressionType)|Allowed subset of expressions

<a name="FilterExpressionType"></a>
## [FilterExpressionType](Org.OData.Capabilities.V1.xml#L490)
**Type:** String



Allowed Value|Description
:------------|:----------
[SingleValue](Org.OData.Capabilities.V1.xml#L493)|Property can be used in a single `eq` clause
[MultiValue](Org.OData.Capabilities.V1.xml#L497)|Property can be used in multiple `eq` and `in` clauses, combined by `or` (which is logically equivalent to a single `in` clause)
[SingleRange](Org.OData.Capabilities.V1.xml#L501)|Property can be compared to a single closed, half-open, or open interval<br>The filter expression for this property consists of a single interval expression, which is either a single comparison of the property and a literal value with `eq`, `le`, `lt`, `ge`, or `gt`, or a pair of boundaries combined by `and`. The lower boundary is either `ge` or `gt`, the upper boundary either `le` or `lt`.
[MultiRange](Org.OData.Capabilities.V1.xml#L506)|Property can be compared to a union of one or more closed, half-open, or open intervals<br>The filter expression for this property consists of one or more interval expressions, combined by `or`. See SingleRange for the definition of an interval expression.<br> Alternatively the filter expression can consist of one or more `ne` expressions combined by `and`, which is roughly equivalent to the union of the complementing open intervals. Roughly equivalent because `null` is allowed as a right-side operand of an `ne` expression.
[SearchExpression](Org.OData.Capabilities.V1.xml#L515)|String property can be used as first operand in one or more `startswith`, `endswith`, and `contains` clauses, combined by `or`
[MultiValueOrSearchExpression](Org.OData.Capabilities.V1.xml#L519)|String property can be used like in `MultiValue` and like in `SearchExpression`, combined with `or`
[MultiRangeOrSearchExpression](Org.OData.Capabilities.V1.xml#L523)|Property can be compared to a union of zero or more closed, half-open, or open intervals plus zero or more simple string patterns<br>The filter expression for this property consists of one or more interval expressions or string comparison functions combined by `or`. See SingleRange for the definition of an interval expression. See SearchExpression for the allowed string comparison functions.

<a name="SortRestrictionsBase"></a>
## [SortRestrictionsBase](Org.OData.Capabilities.V1.xml#L536)


**Derived Types:**
- [SortRestrictionsType](#SortRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Sortable](Org.OData.Capabilities.V1.xml#L542)|Boolean|$orderby is supported

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="SortRestrictionsType"></a>
## [SortRestrictionsType](Org.OData.Capabilities.V1.xml#L546): [SortRestrictionsBase](#SortRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Sortable*](Org.OData.Capabilities.V1.xml#L542)|Boolean|$orderby is supported
[AscendingOnlyProperties](Org.OData.Capabilities.V1.xml#L547)|\[PropertyPath\]|These properties can only be used for sorting in Ascending order
[DescendingOnlyProperties](Org.OData.Capabilities.V1.xml#L550)|\[PropertyPath\]|These properties can only be used for sorting in Descending order
[NonSortableProperties](Org.OData.Capabilities.V1.xml#L553)|\[PropertyPath\]|These structural properties cannot be used in orderby expressions

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="ExpandRestrictionsBase"></a>
## [ExpandRestrictionsBase](Org.OData.Capabilities.V1.xml#L562)


**Derived Types:**
- [ExpandRestrictionsType](#ExpandRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Expandable](Org.OData.Capabilities.V1.xml#L568)|Boolean|$expand is supported
[StreamsExpandable](Org.OData.Capabilities.V1.xml#L571)|Boolean|$expand is supported for stream properties and media streams
[MaxLevels](Org.OData.Capabilities.V1.xml#L574)|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="ExpandRestrictionsType"></a>
## [ExpandRestrictionsType](Org.OData.Capabilities.V1.xml#L578): [ExpandRestrictionsBase](#ExpandRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Expandable*](Org.OData.Capabilities.V1.xml#L568)|Boolean|$expand is supported
[*StreamsExpandable*](Org.OData.Capabilities.V1.xml#L571)|Boolean|$expand is supported for stream properties and media streams
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L574)|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.
[NonExpandableProperties](Org.OData.Capabilities.V1.xml#L579)|\[NavigationPropertyPath\]|These properties cannot be used in expand expressions
[NonExpandableStreamProperties](Org.OData.Capabilities.V1.xml#L582)|\[PropertyPath\]|These stream properties cannot be used in expand expressions

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="SearchRestrictionsType"></a>
## [SearchRestrictionsType](Org.OData.Capabilities.V1.xml#L591)


Property|Type|Description
:-------|:---|:----------
[Searchable](Org.OData.Capabilities.V1.xml#L597)|Boolean|$search is supported
[UnsupportedExpressions](Org.OData.Capabilities.V1.xml#L600)|[SearchExpressions](#SearchExpressions)|Expressions not supported in $search as specified by the standard syntax [OData-URL, section 5.1.8.1](https://docs.oasis-open.org/odata/odata/v4.02/odata-v4.02-part2-url-conventions.html#SearchExpressions)<br>An unsupported expression may be treated as a term to be matched even if the standard syntax treats it as a keyword.
[SearchSyntax](Org.OData.Capabilities.V1.xml#L607)|URL?|URL of the $search syntax supported by the service (null means the standard syntax [OData-URL, section 5.1.8.1](https://docs.oasis-open.org/odata/odata/v4.02/odata-v4.02-part2-url-conventions.html#SearchExpressions))

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="SearchExpressions"></a>
## [SearchExpressions](Org.OData.Capabilities.V1.xml#L612)


Flag Member|Value|Description
:-----|----:|:----------
[none](Org.OData.Capabilities.V1.xml#L613)|0|No unsupported expressions
[AND](Org.OData.Capabilities.V1.xml#L616)|1|Multiple search terms, optionally separated by `AND`
[OR](Org.OData.Capabilities.V1.xml#L619)|2|Multiple search terms separated by `OR`
[NOT](Org.OData.Capabilities.V1.xml#L622)|4|Search terms preceded by `NOT`
[phrase](Org.OData.Capabilities.V1.xml#L625)|8|Search phrases enclosed in double quotes
[group](Org.OData.Capabilities.V1.xml#L628)|16|Precedence grouping of search expressions with parentheses

<a name="InsertRestrictionsBase"></a>
## [InsertRestrictionsBase](Org.OData.Capabilities.V1.xml#L647)


**Derived Types:**
- [InsertRestrictionsType](#InsertRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Insertable](Org.OData.Capabilities.V1.xml#L648)|Boolean|Entities can be inserted
[MaxLevels](Org.OData.Capabilities.V1.xml#L651)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to insert into. A value of -1 indicates there is no restriction.
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L654)|Boolean|Entities of a specific derived type can be created by specifying a type-cast segment
[QueryOptions](Org.OData.Capabilities.V1.xml#L657)|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with insert requests
[CustomHeaders](Org.OData.Capabilities.V1.xml#L660)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L663)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](Org.OData.Capabilities.V1.xml#L666)|String?|A brief description of the request
[LongDescription](Org.OData.Capabilities.V1.xml#L670)|String?|A long description of the request
[ErrorResponses](Org.OData.Capabilities.V1.xml#L674)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="InsertRestrictionsType"></a>
## [InsertRestrictionsType](Org.OData.Capabilities.V1.xml#L678): [InsertRestrictionsBase](#InsertRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Insertable*](Org.OData.Capabilities.V1.xml#L648)|Boolean|Entities can be inserted
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L651)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to insert into. A value of -1 indicates there is no restriction.
[*TypecastSegmentSupported*](Org.OData.Capabilities.V1.xml#L654)|Boolean|Entities of a specific derived type can be created by specifying a type-cast segment
[*QueryOptions*](Org.OData.Capabilities.V1.xml#L657)|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with insert requests
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L660)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L663)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L666)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L670)|String?|A long description of the request
[*ErrorResponses*](Org.OData.Capabilities.V1.xml#L674)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.
[NonInsertableProperties](Org.OData.Capabilities.V1.xml#L679)|\[PropertyPath\]|These structural properties cannot be specified on insert
[NonInsertableNavigationProperties](Org.OData.Capabilities.V1.xml#L682)|\[NavigationPropertyPath\]|These navigation properties do not allow deep inserts
[RequiredProperties](Org.OData.Capabilities.V1.xml#L685)|\[PropertyPath\]|These structural properties must be specified on insert
[Permissions](Org.OData.Capabilities.V1.xml#L688)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the insert.

<a name="PermissionType"></a>
## [PermissionType](Org.OData.Capabilities.V1.xml#L693)


Property|Type|Description
:-------|:---|:----------
[SchemeName](Org.OData.Capabilities.V1.xml#L694)|[SchemeName](Org.OData.Authorization.V1.md#SchemeName)|Authorization flow scheme name
[Scopes](Org.OData.Capabilities.V1.xml#L697)|\[[ScopeType](#ScopeType)\]|List of scopes that can provide access to the resource

<a name="ScopeType"></a>
## [ScopeType](Org.OData.Capabilities.V1.xml#L702)


Property|Type|Description
:-------|:---|:----------
[Scope](Org.OData.Capabilities.V1.xml#L703)|String|Name of the scope.
[RestrictedProperties](Org.OData.Capabilities.V1.xml#L706)|String?|Comma-separated string value of all properties that will be included or excluded when using the scope.<br>Possible string value identifiers when specifying properties are `*`, _PropertyName_, `-`_PropertyName_.<br>`*` denotes all properties are accessible.<br>`-`_PropertyName_ excludes that specific property.<br>_PropertyName_ explicitly provides access to the specific property.<br>The absence of `RestrictedProperties` denotes all properties are accessible using that scope.

<a name="DeepInsertSupportType"></a>
## [DeepInsertSupportType](Org.OData.Capabilities.V1.xml#L726)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L727)|Boolean|Annotation target supports deep inserts
[ContentIDSupported](Org.OData.Capabilities.V1.xml#L730)|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

<a name="UpdateRestrictionsBase"></a>
## [UpdateRestrictionsBase](Org.OData.Capabilities.V1.xml#L739)


**Derived Types:**
- [UpdateRestrictionsType](#UpdateRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Updatable](Org.OData.Capabilities.V1.xml#L740)|Boolean|Entities can be updated
[Upsertable](Org.OData.Capabilities.V1.xml#L743)|Boolean|Entities can be upserted
[DeltaUpdateSupported](Org.OData.Capabilities.V1.xml#L746)|Boolean|Entities can be inserted, updated, and deleted via a PATCH request with a delta payload
[UpdateMethod](Org.OData.Capabilities.V1.xml#L749)|[HttpMethod?](#HttpMethod)|Supported HTTP Methods (PUT or PATCH) for updating an entity. If null, PATCH SHOULD be supported and PUT MAY be supported.
[FilterSegmentSupported](Org.OData.Capabilities.V1.xml#L752)|Boolean|Members of collections can be updated via a PATCH request with a `/$filter(...)/$each` segment
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L755)|Boolean|Members of collections can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[MaxLevels](Org.OData.Capabilities.V1.xml#L758)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection or entity to update. A value of -1 indicates there is no restriction.
[Permissions](Org.OData.Capabilities.V1.xml#L761)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the update.
[QueryOptions](Org.OData.Capabilities.V1.xml#L764)|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with update requests
[CustomHeaders](Org.OData.Capabilities.V1.xml#L767)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L770)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](Org.OData.Capabilities.V1.xml#L773)|String?|A brief description of the request
[LongDescription](Org.OData.Capabilities.V1.xml#L777)|String?|A long description of the request
[ErrorResponses](Org.OData.Capabilities.V1.xml#L781)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="UpdateRestrictionsType"></a>
## [UpdateRestrictionsType](Org.OData.Capabilities.V1.xml#L785): [UpdateRestrictionsBase](#UpdateRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Updatable*](Org.OData.Capabilities.V1.xml#L740)|Boolean|Entities can be updated
[*Upsertable*](Org.OData.Capabilities.V1.xml#L743)|Boolean|Entities can be upserted
[*DeltaUpdateSupported*](Org.OData.Capabilities.V1.xml#L746)|Boolean|Entities can be inserted, updated, and deleted via a PATCH request with a delta payload
[*UpdateMethod*](Org.OData.Capabilities.V1.xml#L749)|[HttpMethod?](#HttpMethod)|Supported HTTP Methods (PUT or PATCH) for updating an entity. If null, PATCH SHOULD be supported and PUT MAY be supported.
[*FilterSegmentSupported*](Org.OData.Capabilities.V1.xml#L752)|Boolean|Members of collections can be updated via a PATCH request with a `/$filter(...)/$each` segment
[*TypecastSegmentSupported*](Org.OData.Capabilities.V1.xml#L755)|Boolean|Members of collections can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L758)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection or entity to update. A value of -1 indicates there is no restriction.
[*Permissions*](Org.OData.Capabilities.V1.xml#L761)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the update.
[*QueryOptions*](Org.OData.Capabilities.V1.xml#L764)|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with update requests
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L767)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L770)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L773)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L777)|String?|A long description of the request
[*ErrorResponses*](Org.OData.Capabilities.V1.xml#L781)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.
[NonUpdatableProperties](Org.OData.Capabilities.V1.xml#L786)|\[PropertyPath\]|These structural properties cannot be specified on update
[NonUpdatableNavigationProperties](Org.OData.Capabilities.V1.xml#L789)|\[NavigationPropertyPath\]|These navigation properties do not allow rebinding
[RequiredProperties](Org.OData.Capabilities.V1.xml#L792)|\[PropertyPath\]|These structural properties must be specified on update

<a name="HttpMethod"></a>
## [HttpMethod](Org.OData.Capabilities.V1.xml#L797)


Flag Member|Value|Description
:-----|----:|:----------
[GET](Org.OData.Capabilities.V1.xml#L798)|1|The HTTP GET Method
[PATCH](Org.OData.Capabilities.V1.xml#L801)|2|The HTTP PATCH Method
[PUT](Org.OData.Capabilities.V1.xml#L804)|4|The HTTP PUT Method
[POST](Org.OData.Capabilities.V1.xml#L807)|8|The HTTP POST Method
[DELETE](Org.OData.Capabilities.V1.xml#L810)|16|The HTTP DELETE Method
[OPTIONS](Org.OData.Capabilities.V1.xml#L813)|32|The HTTP OPTIONS Method
[HEAD](Org.OData.Capabilities.V1.xml#L816)|64|The HTTP HEAD Method

<a name="DeepUpdateSupportType"></a>
## [DeepUpdateSupportType](Org.OData.Capabilities.V1.xml#L825)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Capabilities.V1.xml#L826)|Boolean|Annotation target supports deep updates
[ContentIDSupported](Org.OData.Capabilities.V1.xml#L829)|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

<a name="DeleteRestrictionsBase"></a>
## [DeleteRestrictionsBase](Org.OData.Capabilities.V1.xml#L838)


**Derived Types:**
- [DeleteRestrictionsType](#DeleteRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Deletable](Org.OData.Capabilities.V1.xml#L839)|Boolean|Entities can be deleted
[MaxLevels](Org.OData.Capabilities.V1.xml#L842)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to delete from or the entity to delete. A value of -1 indicates there is no restriction.
[FilterSegmentSupported](Org.OData.Capabilities.V1.xml#L845)|Boolean|Members of collections can be deleted via a DELETE request with a `/$filter(...)/$each` segment
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L848)|Boolean|Members of collections can be deleted via a DELETE request with a type-cast segment and a `/$each` segment
[Permissions](Org.OData.Capabilities.V1.xml#L851)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the delete.
[CustomHeaders](Org.OData.Capabilities.V1.xml#L854)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L857)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](Org.OData.Capabilities.V1.xml#L860)|String?|A brief description of the request
[LongDescription](Org.OData.Capabilities.V1.xml#L864)|String?|A long description of the request
[ErrorResponses](Org.OData.Capabilities.V1.xml#L868)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="DeleteRestrictionsType"></a>
## [DeleteRestrictionsType](Org.OData.Capabilities.V1.xml#L872): [DeleteRestrictionsBase](#DeleteRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Deletable*](Org.OData.Capabilities.V1.xml#L839)|Boolean|Entities can be deleted
[*MaxLevels*](Org.OData.Capabilities.V1.xml#L842)|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to delete from or the entity to delete. A value of -1 indicates there is no restriction.
[*FilterSegmentSupported*](Org.OData.Capabilities.V1.xml#L845)|Boolean|Members of collections can be deleted via a DELETE request with a `/$filter(...)/$each` segment
[*TypecastSegmentSupported*](Org.OData.Capabilities.V1.xml#L848)|Boolean|Members of collections can be deleted via a DELETE request with a type-cast segment and a `/$each` segment
[*Permissions*](Org.OData.Capabilities.V1.xml#L851)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the delete.
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L854)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L857)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L860)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L864)|String?|A long description of the request
[*ErrorResponses*](Org.OData.Capabilities.V1.xml#L868)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.
[NonDeletableNavigationProperties](Org.OData.Capabilities.V1.xml#L873)|\[NavigationPropertyPath\]|These navigation properties do not allow DeleteLink requests

<a name="CollectionPropertyRestrictionsType"></a>
## [CollectionPropertyRestrictionsType](Org.OData.Capabilities.V1.xml#L881)


Property|Type|Description
:-------|:---|:----------
[CollectionProperty](Org.OData.Capabilities.V1.xml#L882)|PropertyPath?|Restricted Collection-valued property
[FilterFunctions](Org.OData.Capabilities.V1.xml#L885)|\[String\]|List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L889)|[FilterRestrictionsType?](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L892)|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L895)|[SortRestrictionsType?](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](Org.OData.Capabilities.V1.xml#L898)|Boolean|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L901)|Boolean|Supports $skip
[SelectSupport](Org.OData.Capabilities.V1.xml#L904)|[SelectSupportType?](#SelectSupportType)|Support for $select
[Insertable](Org.OData.Capabilities.V1.xml#L907)|Boolean|Members can be inserted into this collection<br>If additionally annotated with [Core.PositionalInsert](Org.OData.Core.V1.md#PositionalInsert), members can be inserted at a specific position
[Updatable](Org.OData.Capabilities.V1.xml#L911)|Boolean|Members of this ordered collection can be updated by ordinal
[Deletable](Org.OData.Capabilities.V1.xml#L914)|Boolean|Members of this ordered collection can be deleted by ordinal

<a name="OperationRestrictionsType"></a>
## [OperationRestrictionsType](Org.OData.Capabilities.V1.xml#L922)


Property|Type|Description
:-------|:---|:----------
[FilterSegmentSupported](Org.OData.Capabilities.V1.xml#L923)|Boolean|Bound action or function can be invoked on a collection-valued binding parameter path with a `/$filter(...)` segment
[Permissions](Org.OData.Capabilities.V1.xml#L926)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to invoke an action or function
[CustomHeaders](Org.OData.Capabilities.V1.xml#L929)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L932)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[ErrorResponses](Org.OData.Capabilities.V1.xml#L935)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="ModificationQueryOptionsType"></a>
## [ModificationQueryOptionsType](Org.OData.Capabilities.V1.xml#L946)


Property|Type|Description
:-------|:---|:----------
[ExpandSupported](Org.OData.Capabilities.V1.xml#L947)|Boolean|Supports $expand with modification requests
[SelectSupported](Org.OData.Capabilities.V1.xml#L950)|Boolean|Supports $select with modification requests
[ComputeSupported](Org.OData.Capabilities.V1.xml#L953)|Boolean|Supports $compute with modification requests
[FilterSupported](Org.OData.Capabilities.V1.xml#L956)|Boolean|Supports $filter with modification requests
[SearchSupported](Org.OData.Capabilities.V1.xml#L959)|Boolean|Supports $search with modification requests
[SortSupported](Org.OData.Capabilities.V1.xml#L962)|Boolean|Supports $orderby with modification requests

<a name="ReadRestrictionsBase"></a>
## [*ReadRestrictionsBase*](Org.OData.Capabilities.V1.xml#L971)


**Derived Types:**
- [ReadByKeyRestrictionsType](#ReadByKeyRestrictionsType)
- [ReadRestrictionsType](#ReadRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Readable](Org.OData.Capabilities.V1.xml#L972)|Boolean|Entities can be retrieved
[Permissions](Org.OData.Capabilities.V1.xml#L975)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[CustomHeaders](Org.OData.Capabilities.V1.xml#L978)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](Org.OData.Capabilities.V1.xml#L981)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](Org.OData.Capabilities.V1.xml#L984)|String?|A brief description of the request
[LongDescription](Org.OData.Capabilities.V1.xml#L988)|String?|A long description of the request
[ErrorResponses](Org.OData.Capabilities.V1.xml#L992)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="ReadByKeyRestrictionsType"></a>
## [ReadByKeyRestrictionsType](Org.OData.Capabilities.V1.xml#L996): [ReadRestrictionsBase](#ReadRestrictionsBase)
Restrictions for retrieving an entity by key

Property|Type|Description
:-------|:---|:----------
[*Readable*](Org.OData.Capabilities.V1.xml#L972)|Boolean|Entities can be retrieved
[*Permissions*](Org.OData.Capabilities.V1.xml#L975)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L978)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L981)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L984)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L988)|String?|A long description of the request
[*ErrorResponses*](Org.OData.Capabilities.V1.xml#L992)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="ReadRestrictionsType"></a>
## [ReadRestrictionsType](Org.OData.Capabilities.V1.xml#L999): [ReadRestrictionsBase](#ReadRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Readable*](Org.OData.Capabilities.V1.xml#L972)|Boolean|Entities can be retrieved
[*Permissions*](Org.OData.Capabilities.V1.xml#L975)|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[*CustomHeaders*](Org.OData.Capabilities.V1.xml#L978)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](Org.OData.Capabilities.V1.xml#L981)|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](Org.OData.Capabilities.V1.xml#L984)|String?|A brief description of the request
[*LongDescription*](Org.OData.Capabilities.V1.xml#L988)|String?|A long description of the request
[*ErrorResponses*](Org.OData.Capabilities.V1.xml#L992)|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.
[TypecastSegmentSupported](Org.OData.Capabilities.V1.xml#L1000)|Boolean|Entities of a specific derived type can be read by specifying a type-cast segment
[ReadByKeyRestrictions](Org.OData.Capabilities.V1.xml#L1003)|[ReadByKeyRestrictionsType?](#ReadByKeyRestrictionsType)|Restrictions for retrieving an entity by key<br>Only valid when applied to a collection. If a property of `ReadByKeyRestrictions` is not specified, the corresponding property value of `ReadRestrictions` applies.

<a name="CustomParameter"></a>
## [CustomParameter](Org.OData.Capabilities.V1.xml#L1066)
A custom parameter is either a header or a query option

The type of a custom parameter is always a string. Restrictions on the parameter values can be expressed by annotating the record expression describing the parameter with terms from the Validation vocabulary, e.g. Validation.Pattern or Validation.AllowedValues.

Property|Type|Description
:-------|:---|:----------
[Name](Org.OData.Capabilities.V1.xml#L1069)|String|Name of the custom parameter
[Description](Org.OData.Capabilities.V1.xml#L1072)|String?|Description of the custom parameter
[DocumentationURL](Org.OData.Capabilities.V1.xml#L1075)|URL?|URL of related documentation
[Required](Org.OData.Capabilities.V1.xml#L1079)|Boolean|true: parameter is required, false or not specified: parameter is optional
[ExampleValues](Org.OData.Capabilities.V1.xml#L1082)|\[[PrimitiveExampleValue](Org.OData.Core.V1.md#PrimitiveExampleValue)\]|Example values for the custom parameter

<a name="DefaultCapabilitiesType"></a>
## [DefaultCapabilitiesType](Org.OData.Capabilities.V1.xml#L1101)


Property|Type|Description
:-------|:---|:----------
[ChangeTracking](Org.OData.Capabilities.V1.xml#L1102)|[ChangeTrackingBase?](#ChangeTrackingBase)|Change tracking capabilities
[CountRestrictions](Org.OData.Capabilities.V1.xml#L1105)|[CountRestrictionsBase?](#CountRestrictionsBase)|Restrictions on /$count path suffix and $count=true system query option
[IndexableByKey](Org.OData.Capabilities.V1.xml#L1108)|[Tag?](Org.OData.Core.V1.md#Tag)|Supports key values according to OData URL conventions
[TopSupported](Org.OData.Capabilities.V1.xml#L1111)|[Tag?](Org.OData.Core.V1.md#Tag)|Supports $top
[SkipSupported](Org.OData.Capabilities.V1.xml#L1114)|[Tag?](Org.OData.Core.V1.md#Tag)|Supports $skip
[ComputeSupported](Org.OData.Capabilities.V1.xml#L1117)|[Tag?](Org.OData.Core.V1.md#Tag)|Supports $compute
[SelectSupport](Org.OData.Capabilities.V1.xml#L1120)|[SelectSupportType?](#SelectSupportType)|Support for $select and nested query options within $select
[FilterRestrictions](Org.OData.Capabilities.V1.xml#L1123)|[FilterRestrictionsBase?](#FilterRestrictionsBase)|Restrictions on filter expressions
[SortRestrictions](Org.OData.Capabilities.V1.xml#L1126)|[SortRestrictionsBase?](#SortRestrictionsBase)|Restrictions on orderby expressions
[ExpandRestrictions](Org.OData.Capabilities.V1.xml#L1129)|[ExpandRestrictionsBase?](#ExpandRestrictionsBase)|Restrictions on expand expressions
[SearchRestrictions](Org.OData.Capabilities.V1.xml#L1132)|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[InsertRestrictions](Org.OData.Capabilities.V1.xml#L1135)|[InsertRestrictionsBase?](#InsertRestrictionsBase)|Restrictions on insert operations
[UpdateRestrictions](Org.OData.Capabilities.V1.xml#L1138)|[UpdateRestrictionsBase?](#UpdateRestrictionsBase)|Restrictions on update operations
[DeleteRestrictions](Org.OData.Capabilities.V1.xml#L1141)|[DeleteRestrictionsBase?](#DeleteRestrictionsBase)|Restrictions on delete operations
[OperationRestrictions](Org.OData.Capabilities.V1.xml#L1144)|[OperationRestrictionsType?](#OperationRestrictionsType)|Restrictions for function or action operations
[ReadRestrictions](Org.OData.Capabilities.V1.xml#L1147)|[ReadRestrictionsType?](#ReadRestrictionsType)|Restrictions for retrieving a collection of entities, retrieving a singleton instance

<a name="HttpResponse"></a>
## [HttpResponse](Org.OData.Capabilities.V1.xml#L1152)


Property|Type|Description
:-------|:---|:----------
[StatusCode](Org.OData.Capabilities.V1.xml#L1153)|String|HTTP response status code, for example 400, 403, 501
[Description](Org.OData.Capabilities.V1.xml#L1156)|String|Human-readable description of the response
