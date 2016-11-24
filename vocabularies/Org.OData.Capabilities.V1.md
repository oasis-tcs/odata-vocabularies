# Capabilities Vocabulary
**Namespace: [Org.OData.Capabilities.V1](Org.OData.Capabilities.V1.xml)**

Terms describing capabilities of a service

Term|Type|Description
----|----|-----------
ConformanceLevel|[ConformanceLevelType](#ConformanceLevelType)|The conformance level achieved by this service
SupportedFormats|\[*String*\]|Media types of supported formats, including format parameters
SupportedMetadataFormats|\[*String*\]|Media types of supported formats for $metadata, including format parameters
AcceptableEncodings|\[*String*\]|List of acceptable compression methods for ($batch) requests, e.g. gzip
AsynchronousRequestsSupported|[Tag](./Org.OData.Core.V1.md#Tag)|Service supports the asynchronous request preference
BatchContinueOnErrorSupported|[Tag](./Org.OData.Core.V1.md#Tag)|Service supports the continue on error preference. Supports $batch requests. Services that apply the BatchContinueOnErrorSupported term should also specify the ContinueOnErrorSupported property from the BatchSupport term.
IsolationSupported|[IsolationLevel](#IsolationLevel)|Supported odata.isolation levels
CallbackSupported|[CallbackType](#CallbackType)|Supports callbacks for the specified protocols
CrossJoinSupported|[Tag](./Org.OData.Core.V1.md#Tag)|Supports cross joins for the entity sets in this container
ChangeTracking|[ChangeTrackingType](#ChangeTrackingType)|Change tracking capabilities of this service or entity set
CountRestrictions|[CountRestrictionsType](#CountRestrictionsType)|Restrictions on /$count path suffix and $count=true system query option
NavigationRestrictions|[NavigationRestrictionsType](#NavigationRestrictionsType)|Restrictions on navigating properties according to OData URL conventions
IndexableByKey|[Tag](./Org.OData.Core.V1.md#Tag)|Supports key values according to OData URL conventions
TopSupported|[Tag](./Org.OData.Core.V1.md#Tag)|Supports $top
SkipSupported|[Tag](./Org.OData.Core.V1.md#Tag)|Supports $skip
BatchSupported|[Tag](./Org.OData.Core.V1.md#Tag)|Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.
BatchSupport|[BatchSupportType](#BatchSupportType)|Batch Support for the service
FilterFunctions|\[*String*\]|List of functions and operators supported in $filter
FilterRestrictions|[FilterRestrictionsType](#FilterRestrictionsType)|Restrictions on $filter expressions
SortRestrictions|[SortRestrictionsType](#SortRestrictionsType)|Restrictions on $orderby expressions
ExpandRestrictions|[ExpandRestrictionsType](#ExpandRestrictionsType)|Restrictions on $expand expressions
SearchRestrictions|[SearchRestrictionsType](#SearchRestrictionsType)|Restrictions on $search expressions
InsertRestrictions|[InsertRestrictionsType](#InsertRestrictionsType)|Restrictions on insert operations
DeepInsertSupport|[DeepInsertSupportType](#DeepInsertSupportType)|Deep Insert Support for the service
UpdateRestrictions|[UpdateRestrictionsType](#UpdateRestrictionsType)|Restrictions on update operations
DeleteRestrictions|[DeleteRestrictionsType](#DeleteRestrictionsType)|Restrictions on delete operations

## <a name="ConformanceLevelType"></a>ConformanceLevelType


Name|Value|Description
----|-----|-----------
`Minimal`|0|
`Intermediate`|1|
`Advanced`|2|

## <a name="IsolationLevel"></a>IsolationLevel


Name|Value|Description
----|-----|-----------
`Snapshot`|1|

## <a name="CallbackType"></a>CallbackType
A non-empty collection lists the full set of supported protocols. A empty collection means 'only HTTP is supported'

## <a name="CallbackProtocol"></a>CallbackProtocol


## <a name="ChangeTrackingType"></a>ChangeTrackingType


## <a name="CountRestrictionsType"></a>CountRestrictionsType


## <a name="NavigationRestrictionsType"></a>NavigationRestrictionsType


## <a name="NavigationPropertyRestriction"></a>NavigationPropertyRestriction


## <a name="NavigationType"></a>NavigationType


Name|Value|Description
----|-----|-----------
`Recursive`|0|Navigation properties can be recursively navigated
`Single`|1|Navigation properties can be navigated to a single level
`None`|2|Navigation properties are not navigable

## <a name="BatchSupportType"></a>BatchSupportType


## <a name="FilterRestrictionsType"></a>FilterRestrictionsType


## <a name="FilterExpressionRestrictionType"></a>FilterExpressionRestrictionType


## <a name="FilterExpressionType"></a>FilterExpressionType
**Type:** *String*



## <a name="SortRestrictionsType"></a>SortRestrictionsType


## <a name="ExpandRestrictionsType"></a>ExpandRestrictionsType


## <a name="SearchRestrictionsType"></a>SearchRestrictionsType


## <a name="SearchExpressions"></a>SearchExpressions


Name|Value|Description
----|-----|-----------
`none`|0|
`AND`|1|
`OR`|2|
`NOT`|4|
`phrase`|8|
`group`|16|

## <a name="InsertRestrictionsType"></a>InsertRestrictionsType


## <a name="DeepInsertSupportType"></a>DeepInsertSupportType


## <a name="UpdateRestrictionsType"></a>UpdateRestrictionsType


## <a name="DeleteRestrictionsType"></a>DeleteRestrictionsType

