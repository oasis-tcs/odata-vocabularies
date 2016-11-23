# Capabilities Vocabulary

Terms describing capabilities of a service

**Namespace: [Org.OData.Capabilities.V1](Org.OData.Capabilities.V1.xml)**

Term|Type|Description
----|----|-----------
ConformanceLevel|Capabilities.ConformanceLevelType|The conformance level achieved by this service
SupportedFormats|Collection(Edm.String)|Media types of supported formats, including format parameters
SupportedMetadataFormats|Collection(Edm.String)|Media types of supported formats for $metadata, including format parameters
AcceptableEncodings|Collection(Edm.String)|List of acceptable compression methods for ($batch) requests, e.g. gzip
AsynchronousRequestsSupported|Core.Tag|Service supports the asynchronous request preference
BatchContinueOnErrorSupported|Core.Tag|Service supports the continue on error preference. Supports $batch requests. Services that apply the BatchContinueOnErrorSupported term should also specify the ContinueOnErrorSupported property from the BatchSupport term.
IsolationSupported|Capabilities.IsolationLevel|Supported odata.isolation levels
CallbackSupported|Capabilities.CallbackType|Supports callbacks for the specified protocols
CrossJoinSupported|Core.Tag|Supports cross joins for the entity sets in this container
ChangeTracking|Capabilities.ChangeTrackingType|Change tracking capabilities of this service or entity set
CountRestrictions|Capabilities.CountRestrictionsType|Restrictions on /$count path suffix and $count=true system query option
NavigationRestrictions|Capabilities.NavigationRestrictionsType|Restrictions on navigating properties according to OData URL conventions
IndexableByKey|Core.Tag|Supports key values according to OData URL conventions
TopSupported|Core.Tag|Supports $top
SkipSupported|Core.Tag|Supports $skip
BatchSupported|Core.Tag|Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.
BatchSupport|Capabilities.BatchSupportType|Batch Support for the service
FilterFunctions|Collection(Edm.String)|List of functions and operators supported in $filter
FilterRestrictions|Capabilities.FilterRestrictionsType|Restrictions on $filter expressions
SortRestrictions|Capabilities.SortRestrictionsType|Restrictions on $orderby expressions
ExpandRestrictions|Capabilities.ExpandRestrictionsType|Restrictions on $expand expressions
SearchRestrictions|Capabilities.SearchRestrictionsType|Restrictions on $search expressions
InsertRestrictions|Capabilities.InsertRestrictionsType|Restrictions on insert operations
DeepInsertSupport|Capabilities.DeepInsertSupportType|Deep Insert Support for the service
UpdateRestrictions|Capabilities.UpdateRestrictionsType|Restrictions on update operations
DeleteRestrictions|Capabilities.DeleteRestrictionsType|Restrictions on delete operations

