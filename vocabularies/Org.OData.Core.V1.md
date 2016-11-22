# Core Vocabulary

Core terms needed to write vocabularies

**Namespace: Org.OData.Core.V1**

Term|Description
----|-----------
ODataVersions|A space-separated list of supported versions of the OData Protocol. Note that 4.0 is implied by 4.01 and does not need to be separately listed.
SchemaVersion|Service-defined value representing the version of the schema. Services MAY use semantic versioning, but clients MUST NOT assume this is the case.
Description|A brief description of a model element
LongDescription|A lengthy description of a model element
NumericValueException|Used in place of a property value to annotate a property whose value is not representable according to its numeric type.
Messages|Instance annotation for warning and info messages
IsLanguageDependent|Properties and terms annotated with this term are language-dependent
RequiresType|Terms annotated with this term can only be applied to elements that have a type that is identical to or derived from the given type name
ResourcePath|Resource path for entity container child, can be relative to xml:base and the request URL
DereferenceableIDs|Entity-ids are URLs that locate the identified entity
ConventionalIDs|Entity-ids follow OData URL conventions
Permissions|Permissions for accessing a resource
ContentID|A unique identifier for nested entities within a request.
DefaultNamespace|Functions, actions and types in this namespace can be referenced in URLs with or without namespace- or alias- qualification.
Immutable|A value for this non-key property can be provided on insert and remains unchanged on update
Computed|A value for this property is generated on both insert and update
IsURL|Properties and terms annotated with this term MUST contain a valid URL
AcceptableMediaTypes|Lists the MIME types acceptable for the annotated entity type marked with HasStream="true" or the annotated stream property
MediaType|The media type of a binary resource
IsMediaType|Properties and terms annotated with this term MUST contain a valid MIME type
OptimisticConcurrency|Data modification requires the use of ETags. A non-empty collection contains the set of properties that are used to compute the ETag.
AdditionalProperties|Instances of this type may contain properties in addition to those declared in $metadata
AutoExpand|The service will automatically expand this navigation property even if not requested with $expand
AutoExpandReferences|The service will automatically expand this navigation property as entity references even if not requested with $expand=.../$ref
MayImplement|A collection of qualified type names outside of the type hierarchy that instances of this type might be addressable as by using a type segment.
Ordered|Collection has a stable order. Ordered collections of primitive or complex types can be indexed by ordinal.
PositionalInsert|Items can be inserted at a given ordinal index.
AlternateKeys|Communicates available alternate keys

[XML Source](Org.OData.Core.V1.xml)