# Capabilities Vocabulary
**Namespace: [Org.OData.Capabilities.V1](Org.OData.Capabilities.V1.xml)**

Terms describing capabilities of a service

Term|Type|Description
----|----|-----------
ConformanceLevel|[ConformanceLevelType](#ConformanceLevelType)|The conformance level achieved by this service
SupportedFormats|\[String\]|Media types of supported formats, including format parameters
SupportedMetadataFormats|\[String\]|Media types of supported formats for $metadata, including format parameters
AcceptableEncodings|\[String\]|List of acceptable compression methods for ($batch) requests, e.g. gzip
AsynchronousRequestsSupported|[Tag](Org.OData.Core.V1.md#Tag)|Service supports the asynchronous request preference
BatchContinueOnErrorSupported|[Tag](Org.OData.Core.V1.md#Tag)|Service supports the continue on error preference. Supports $batch requests. Services that apply the BatchContinueOnErrorSupported term should also specify the ContinueOnErrorSupported property from the BatchSupport term.
IsolationSupported|[IsolationLevel](#IsolationLevel)|Supported odata.isolation levels
CallbackSupported|[CallbackType](#CallbackType)|Supports callbacks for the specified protocols
CrossJoinSupported|[Tag](Org.OData.Core.V1.md#Tag)|Supports cross joins for the entity sets in this container
ChangeTracking|[ChangeTrackingType](#ChangeTrackingType)|Change tracking capabilities of this service or entity set
CountRestrictions|[CountRestrictionsType](#CountRestrictionsType)|Restrictions on /$count path suffix and $count=true system query option
NavigationRestrictions|[NavigationRestrictionsType](#NavigationRestrictionsType)|Restrictions on navigating properties according to OData URL conventions
IndexableByKey|[Tag](Org.OData.Core.V1.md#Tag)|Supports key values according to OData URL conventions
TopSupported|[Tag](Org.OData.Core.V1.md#Tag)|Supports $top
SkipSupported|[Tag](Org.OData.Core.V1.md#Tag)|Supports $skip
BatchSupported|[Tag](Org.OData.Core.V1.md#Tag)|Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.
BatchSupport|[BatchSupportType](#BatchSupportType)|Batch Support for the service
FilterFunctions|\[String\]|List of functions and operators supported in $filter
FilterRestrictions|[FilterRestrictionsType](#FilterRestrictionsType)|Restrictions on $filter expressions
SortRestrictions|[SortRestrictionsType](#SortRestrictionsType)|Restrictions on $orderby expressions
ExpandRestrictions|[ExpandRestrictionsType](#ExpandRestrictionsType)|Restrictions on $expand expressions
SearchRestrictions|[SearchRestrictionsType](#SearchRestrictionsType)|Restrictions on $search expressions
InsertRestrictions|[InsertRestrictionsType](#InsertRestrictionsType)|Restrictions on insert operations
DeepInsertSupport|[DeepInsertSupportType](#DeepInsertSupportType)|Deep Insert Support for the service
UpdateRestrictions|[UpdateRestrictionsType](#UpdateRestrictionsType)|Restrictions on update operations
DeleteRestrictions|[DeleteRestrictionsType](#DeleteRestrictionsType)|Restrictions on delete operations

## <a name="ConformanceLevelType"></a>ConformanceLevelType


Member|Value|Description
------|----:|-----------
Minimal|0|
Intermediate|1|
Advanced|2|

## <a name="IsolationLevel"></a>IsolationLevel


Member|Value|Description
------|----:|-----------
Snapshot|1|

## <a name="CallbackType"></a>CallbackType
A non-empty collection lists the full set of supported protocols. A empty collection means 'only HTTP is supported'

Property|Type|Description
--------|----|-----------
CallbackProtocols|\[[CallbackProtocol](#CallbackProtocol)\]|

## <a name="CallbackProtocol"></a>CallbackProtocol


Property|Type|Description
--------|----|-----------
Id|String|Protocol Identifier
UrlTemplate|String|URL Template including parameters. Parameters are enclosed in curly braces {} as defined in RFC6570
DocumentationUrl|URL|Human readable description of the meaning of the URL Template parameters

## <a name="ChangeTrackingType"></a>ChangeTrackingType


Property|Type|Description
--------|----|-----------
Supported|Boolean|This entity set supports the odata.track-changes preference
FilterableProperties|\[PropertyPath\]|Change tracking supports filters on these properties
ExpandableProperties|\[NavigationPropertyPath\]|Change tracking supports these properties expanded

## <a name="CountRestrictionsType"></a>CountRestrictionsType


Property|Type|Description
--------|----|-----------
Countable|Boolean|Entities can be counted
NonCountableProperties|\[PropertyPath\]|These collection properties do not allow /$count segments
NonCountableNavigationProperties|\[NavigationPropertyPath\]|These navigation properties do not allow /$count segments

## <a name="NavigationRestrictionsType"></a>NavigationRestrictionsType


Property|Type|Description
--------|----|-----------
Navigability|[NavigationType](#NavigationType)|Supported Navigability
RestrictedProperties|\[[NavigationPropertyRestriction](#NavigationPropertyRestriction)\]|

## <a name="NavigationPropertyRestriction"></a>NavigationPropertyRestriction


Property|Type|Description
--------|----|-----------
NavigationProperty|NavigationPropertyPath|Navigation properties can be navigated
Navigability|[NavigationType](#NavigationType)|Navigation properties can be navigated to this level

## <a name="NavigationType"></a>NavigationType


Member|Value|Description
------|----:|-----------
Recursive|0|Navigation properties can be recursively navigated
Single|1|Navigation properties can be navigated to a single level
None|2|Navigation properties are not navigable

## <a name="BatchSupportType"></a>BatchSupportType


Property|Type|Description
--------|----|-----------
Supported|Boolean|Service supports requests to $batch
ContinueOnErrorSupported|Boolean|Service supports the continue on error preference
ReferencesInRequestBodiesSupported|Boolean|Service supports Content-ID referencing in request bodies
ReferencesAcrossChangeSetsSupported|Boolean|Service supports Content-ID referencing across change sets
EtagReferencesSupported|Boolean|Service supports referencing Etags from previous requests

## <a name="FilterRestrictionsType"></a>FilterRestrictionsType


Property|Type|Description
--------|----|-----------
Filterable|Boolean|$filter is supported
RequiresFilter|Boolean|$filter is required
RequiredProperties|\[PropertyPath\]|These properties must be specified in the $filter clause (properties of derived types are not allowed here)
NonFilterableProperties|\[AnyPropertyPath\]|These structural or navigation properties cannot be used in $filter expressions
FilterExpressionRestrictions|\[[FilterExpressionRestrictionType](#FilterExpressionRestrictionType)\]|These properties only allow a subset of expressions

## <a name="FilterExpressionRestrictionType"></a>FilterExpressionRestrictionType


Property|Type|Description
--------|----|-----------
Property|PropertyPath|
AllowedExpressions|[FilterExpressionType](#FilterExpressionType)|

## <a name="FilterExpressionType"></a>FilterExpressionType
**Type:** String


Allowed Value|Description
-------------|-----------
SingleValue|Property can be used in a single eq clause
MultiValue|Property can be used in a single in clause
SingleRange|Property can be used in at most one ge and/or one le clause, separated by and

## <a name="SortRestrictionsType"></a>SortRestrictionsType


Property|Type|Description
--------|----|-----------
Sortable|Boolean|$orderby is supported
AscendingOnlyProperties|\[PropertyPath\]|These properties can only be used for sorting in Ascending order
DescendingOnlyProperties|\[PropertyPath\]|These properties can only be used for sorting in Descending order
NonSortableProperties|\[AnyPropertyPath\]|These structural or navigation properties cannot be used in $orderby expressions

## <a name="ExpandRestrictionsType"></a>ExpandRestrictionsType


Property|Type|Description
--------|----|-----------
Expandable|Boolean|$expand is supported
NonExpandableProperties|\[NavigationPropertyPath\]|These properties cannot be used in $expand expressions

## <a name="SearchRestrictionsType"></a>SearchRestrictionsType


Property|Type|Description
--------|----|-----------
Searchable|Boolean|$search is supported
UnsupportedExpressions|[SearchExpressions](#SearchExpressions)|Expressions not supported in $search

## <a name="SearchExpressions"></a>SearchExpressions


Member|Value|Description
------|----:|-----------
none|0|
AND|1|
OR|2|
NOT|4|
phrase|8|
group|16|

## <a name="InsertRestrictionsType"></a>InsertRestrictionsType


Property|Type|Description
--------|----|-----------
Insertable|Boolean|Entities can be inserted
NonInsertableNavigationProperties|\[NavigationPropertyPath\]|These navigation properties do not allow deep inserts

## <a name="DeepInsertSupportType"></a>DeepInsertSupportType


Property|Type|Description
--------|----|-----------
Supported|Boolean|Service supports deep inserts
ContentIDSupported|Boolean|Service supports accepting and returning nested entities annotated with the contentID instance annotation.

## <a name="UpdateRestrictionsType"></a>UpdateRestrictionsType


Property|Type|Description
--------|----|-----------
Updatable|Boolean|Entities can be updated
NonUpdatableNavigationProperties|\[NavigationPropertyPath\]|These navigation properties do not allow rebinding

## <a name="DeleteRestrictionsType"></a>DeleteRestrictionsType


Property|Type|Description
--------|----|-----------
Deletable|Boolean|Entities can be deleted
NonDeletableNavigationProperties|\[NavigationPropertyPath\]|These navigation properties do not allow DeleteLink requests
