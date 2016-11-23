# Capabilities Vocabulary

Terms describing capabilities of a service

**Namespace: [Org.OData.Capabilities.V1](Org.OData.Capabilities.V1.xml)**

Term|Type|Description
----|----|-----------
ConformanceLevel|ConformanceLevelType|The conformance level achieved by this service
SupportedFormats|\[String\]|Media types of supported formats, including format parameters
SupportedMetadataFormats|\[String\]|Media types of supported formats for $metadata, including format parameters
AcceptableEncodings|\[String\]|List of acceptable compression methods for ($batch) requests, e.g. gzip
AsynchronousRequestsSupported|Tag|Service supports the asynchronous request preference
BatchContinueOnErrorSupported|Tag|Service supports the continue on error preference. Supports $batch requests. Services that apply the BatchContinueOnErrorSupported term should also specify the ContinueOnErrorSupported property from the BatchSupport term.
IsolationSupported|IsolationLevel|Supported odata.isolation levels
CallbackSupported|CallbackType|Supports callbacks for the specified protocols
CrossJoinSupported|Tag|Supports cross joins for the entity sets in this container
ChangeTracking|ChangeTrackingType|Change tracking capabilities of this service or entity set
CountRestrictions|CountRestrictionsType|Restrictions on /$count path suffix and $count=true system query option
NavigationRestrictions|NavigationRestrictionsType|Restrictions on navigating properties according to OData URL conventions
IndexableByKey|Tag|Supports key values according to OData URL conventions
TopSupported|Tag|Supports $top
SkipSupported|Tag|Supports $skip
BatchSupported|Tag|Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.
BatchSupport|BatchSupportType|Batch Support for the service
FilterFunctions|\[String\]|List of functions and operators supported in $filter
FilterRestrictions|FilterRestrictionsType|Restrictions on $filter expressions
SortRestrictions|SortRestrictionsType|Restrictions on $orderby expressions
ExpandRestrictions|ExpandRestrictionsType|Restrictions on $expand expressions
SearchRestrictions|SearchRestrictionsType|Restrictions on $search expressions
InsertRestrictions|InsertRestrictionsType|Restrictions on insert operations
DeepInsertSupport|DeepInsertSupportType|Deep Insert Support for the service
UpdateRestrictions|UpdateRestrictionsType|Restrictions on update operations
DeleteRestrictions|DeleteRestrictionsType|Restrictions on delete operations


## <a name="CallbackType"></a>CallbackType

A non-empty collection lists the full set of supported protocols. A empty collection means 'only HTTP is supported'
## <a name="CallbackProtocol"></a>CallbackProtocol


## <a name="ChangeTrackingType"></a>ChangeTrackingType


## <a name="CountRestrictionsType"></a>CountRestrictionsType


## <a name="NavigationRestrictionsType"></a>NavigationRestrictionsType


## <a name="NavigationPropertyRestriction"></a>NavigationPropertyRestriction


## <a name="BatchSupportType"></a>BatchSupportType


## <a name="FilterRestrictionsType"></a>FilterRestrictionsType


## <a name="FilterExpressionRestrictionType"></a>FilterExpressionRestrictionType


## <a name="SortRestrictionsType"></a>SortRestrictionsType


## <a name="ExpandRestrictionsType"></a>ExpandRestrictionsType


## <a name="SearchRestrictionsType"></a>SearchRestrictionsType


## <a name="InsertRestrictionsType"></a>InsertRestrictionsType


## <a name="DeepInsertSupportType"></a>DeepInsertSupportType


## <a name="UpdateRestrictionsType"></a>UpdateRestrictionsType


## <a name="DeleteRestrictionsType"></a>DeleteRestrictionsType

