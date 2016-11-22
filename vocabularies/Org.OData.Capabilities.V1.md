# Capabilities Vocabulary

Terms describing capabilities of a service

**Namespace: Org.OData.Capabilities.V1**

Term|Description
----|-----------
ConformanceLevel|The conformance level achieved by this service
SupportedFormats|Media types of supported formats, including format parameters
SupportedMetadataFormats|Media types of supported formats for $metadata, including format parameters
AcceptableEncodings|List of acceptable compression methods for ($batch) requests, e.g. gzip
AsynchronousRequestsSupported|Service supports the asynchronous request preference
BatchContinueOnErrorSupported|Service supports the continue on error preference. Supports $batch requests. Services that apply the BatchContinueOnErrorSupported term should also specify the ContinueOnErrorSupported property from the BatchSupport term.
IsolationSupported|Supported odata.isolation levels
CallbackSupported|Supports callbacks for the specified protocols
CrossJoinSupported|Supports cross joins for the entity sets in this container
ChangeTracking|Change tracking capabilities of this service or entity set
CountRestrictions|Restrictions on /$count path suffix and $count=true system query option
NavigationRestrictions|Restrictions on navigating properties according to OData URL conventions
IndexableByKey|Supports key values according to OData URL conventions
TopSupported|Supports $top
SkipSupported|Supports $skip
BatchSupported|Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.
BatchSupport|Batch Support for the service
FilterFunctions|List of functions and operators supported in $filter
FilterRestrictions|Restrictions on $filter expressions
SortRestrictions|Restrictions on $orderby expressions
ExpandRestrictions|Restrictions on $expand expressions
SearchRestrictions|Restrictions on $search expressions
InsertRestrictions|Restrictions on insert operations
DeepInsertSupport|Deep Insert Support for the service
UpdateRestrictions|Restrictions on update operations
DeleteRestrictions|Restrictions on delete operations

[XML Source](Org.OData.Capabilities.V1.xml)