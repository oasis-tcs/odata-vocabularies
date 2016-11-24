# Core Vocabulary

Core terms needed to write vocabularies

**Namespace: [Org.OData.Core.V1](Org.OData.Core.V1.xml)**

Term|Type|Description
----|----|-----------
ODataVersions|*String*|A space-separated list of supported versions of the OData Protocol. Note that 4.0 is implied by 4.01 and does not need to be separately listed.
SchemaVersion|*String*|Service-defined value representing the version of the schema. Services MAY use semantic versioning, but clients MUST NOT assume this is the case.
Description|*String*|A brief description of a model element
LongDescription|*String*|A lengthy description of a model element
NumericValueException|[ValueException](#ValueException)|Used in place of a property value to annotate a property whose value is not representable according to its numeric type.
Messages|\[[MessageType](#MessageType)\]|Instance annotation for warning and info messages
IsLanguageDependent|[Tag](#Tag)|Properties and terms annotated with this term are language-dependent
RequiresType|*String*|Terms annotated with this term can only be applied to elements that have a type that is identical to or derived from the given type name
ResourcePath|*String*|Resource path for entity container child, can be relative to xml:base and the request URL
DereferenceableIDs|[Tag](#Tag)|Entity-ids are URLs that locate the identified entity
ConventionalIDs|[Tag](#Tag)|Entity-ids follow OData URL conventions
Permissions|[Permission](#Permission)|Permissions for accessing a resource
ContentID|*String*|A unique identifier for nested entities within a request.
DefaultNamespace|[Tag](#Tag)|Functions, actions and types in this namespace can be referenced in URLs with or without namespace- or alias- qualification.
Immutable|[Tag](#Tag)|A value for this non-key property can be provided on insert and remains unchanged on update
Computed|[Tag](#Tag)|A value for this property is generated on both insert and update
IsURL|[Tag](#Tag)|Properties and terms annotated with this term MUST contain a valid URL
AcceptableMediaTypes|\[*String*\]|Lists the MIME types acceptable for the annotated entity type marked with HasStream="true" or the annotated stream property
MediaType|*String*|The media type of a binary resource
IsMediaType|[Tag](#Tag)|Properties and terms annotated with this term MUST contain a valid MIME type
OptimisticConcurrency|\[*PropertyPath*\]|Data modification requires the use of ETags. A non-empty collection contains the set of properties that are used to compute the ETag.
AdditionalProperties|[Tag](#Tag)|Instances of this type may contain properties in addition to those declared in $metadata
AutoExpand|[Tag](#Tag)|The service will automatically expand this navigation property even if not requested with $expand
AutoExpandReferences|[Tag](#Tag)|The service will automatically expand this navigation property as entity references even if not requested with $expand=.../$ref
MayImplement|\[[QualifiedTypeName](#QualifiedTypeName)\]|A collection of qualified type names outside of the type hierarchy that instances of this type might be addressable as by using a type segment.
Ordered|[Tag](#Tag)|Collection has a stable order. Ordered collections of primitive or complex types can be indexed by ordinal.
PositionalInsert|[Tag](#Tag)|Items can be inserted at a given ordinal index.
AlternateKeys|\[[AlternateKey](#AlternateKey)\]|Communicates available alternate keys


## <a name="ValueException"></a>ValueException


## <a name="MessageType"></a>MessageType


## <a name="MessageSeverity"></a>MessageSeverity


## <a name="Tag"></a>Tag

This is the type to use for all tagging terms
## <a name="Permission"></a>Permission


## <a name="QualifiedTypeName"></a>QualifiedTypeName

The qualified name of a type in scope.
## <a name="AlternateKey"></a>AlternateKey


## <a name="PropertyRef"></a>PropertyRef

