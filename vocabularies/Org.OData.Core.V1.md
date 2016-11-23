# Core Vocabulary

Core terms needed to write vocabularies

**Namespace: [Org.OData.Core.V1](Org.OData.Core.V1.xml)**

Term|Type|Description
----|----|-----------
ODataVersions|Edm.String|A space-separated list of supported versions of the OData Protocol. Note that 4.0 is implied by 4.01 and does not need to be separately listed.
SchemaVersion|Edm.String|Service-defined value representing the version of the schema. Services MAY use semantic versioning, but clients MUST NOT assume this is the case.
Description|Edm.String|A brief description of a model element
LongDescription|Edm.String|A lengthy description of a model element
NumericValueException|Core.ValueException|Used in place of a property value to annotate a property whose value is not representable according to its numeric type.
Messages|Collection(Core.MessageType)|Instance annotation for warning and info messages
IsLanguageDependent|Core.Tag|Properties and terms annotated with this term are language-dependent
RequiresType|Edm.String|Terms annotated with this term can only be applied to elements that have a type that is identical to or derived from the given type name
ResourcePath|Edm.String|Resource path for entity container child, can be relative to xml:base and the request URL
DereferenceableIDs|Core.Tag|Entity-ids are URLs that locate the identified entity
ConventionalIDs|Core.Tag|Entity-ids follow OData URL conventions
Permissions|Core.Permission|Permissions for accessing a resource
ContentID|Edm.String|A unique identifier for nested entities within a request.
DefaultNamespace|Core.Tag|Functions, actions and types in this namespace can be referenced in URLs with or without namespace- or alias- qualification.
Immutable|Core.Tag|A value for this non-key property can be provided on insert and remains unchanged on update
Computed|Core.Tag|A value for this property is generated on both insert and update
IsURL|Core.Tag|Properties and terms annotated with this term MUST contain a valid URL
AcceptableMediaTypes|Collection(Edm.String)|Lists the MIME types acceptable for the annotated entity type marked with HasStream="true" or the annotated stream property
MediaType|Edm.String|The media type of a binary resource
IsMediaType|Core.Tag|Properties and terms annotated with this term MUST contain a valid MIME type
OptimisticConcurrency|Collection(Edm.PropertyPath)|Data modification requires the use of ETags. A non-empty collection contains the set of properties that are used to compute the ETag.
AdditionalProperties|Core.Tag|Instances of this type may contain properties in addition to those declared in $metadata
AutoExpand|Core.Tag|The service will automatically expand this navigation property even if not requested with $expand
AutoExpandReferences|Core.Tag|The service will automatically expand this navigation property as entity references even if not requested with $expand=.../$ref
MayImplement|Collection(Core.QualifiedTypeName)|A collection of qualified type names outside of the type hierarchy that instances of this type might be addressable as by using a type segment.
Ordered|Core.Tag|Collection has a stable order. Ordered collections of primitive or complex types can be indexed by ordinal.
PositionalInsert|Core.Tag|Items can be inserted at a given ordinal index.
AlternateKeys|Collection(Core.AlternateKey)|Communicates available alternate keys


## <a name="MessageType"></a>MessageType


## <a name="AlternateKey"></a>AlternateKey


## <a name="PropertyRef"></a>PropertyRef

