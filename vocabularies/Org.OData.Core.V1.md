# Core Vocabulary
**Namespace: [Org.OData.Core.V1](Org.OData.Core.V1.xml)**

Core terms needed to write vocabularies

Term|Type|Description
:---|:---|:----------
<a name="ODataVersions"></a>ODataVersions|String|A space-separated list of supported versions of the OData Protocol. Note that 4.0 is implied by 4.01 and does not need to be separately listed.
<a name="SchemaVersion"></a>SchemaVersion|String|Service-defined value representing the version of the schema. Services MAY use semantic versioning, but clients MUST NOT assume this is the case.
<a name="Description"></a>Description|String|A brief description of a model element
<a name="LongDescription"></a>LongDescription|String|A lengthy description of a model element
<a name="NumericValueException"></a>NumericValueException|[ValueException](#ValueException)|Used in place of a property value to annotate a property whose value is not representable according to its numeric type.
<a name="Messages"></a>Messages|\[[MessageType](#MessageType)\]|Instance annotation for warning and info messages
<a name="IsLanguageDependent"></a>IsLanguageDependent|[Tag](#Tag)|Properties and terms annotated with this term are language-dependent
<a name="RequiresType"></a>RequiresType|String|Terms annotated with this term can only be applied to elements that have a type that is identical to or derived from the given type name
<a name="ResourcePath"></a>ResourcePath|URL|Resource path for entity container child, can be relative to xml:base and the request URL
<a name="DereferenceableIDs"></a>DereferenceableIDs|[Tag](#Tag)|Entity-ids are URLs that locate the identified entity
<a name="ConventionalIDs"></a>ConventionalIDs|[Tag](#Tag)|Entity-ids follow OData URL conventions
<a name="Permissions"></a>Permissions|[Permission](#Permission)|Permissions for accessing a resource
<a name="ContentID"></a>ContentID|String|A unique identifier for nested entities within a request.
<a name="DefaultNamespace"></a>DefaultNamespace|[Tag](#Tag)|Functions, actions and types in this namespace can be referenced in URLs with or without namespace- or alias- qualification.
<a name="Immutable"></a>Immutable|[Tag](#Tag)|A value for this non-key property can be provided on insert and remains unchanged on update
<a name="Computed"></a>Computed|[Tag](#Tag)|A value for this property is generated on both insert and update
<a name="IsURL"></a>IsURL|[Tag](#Tag)|Properties and terms annotated with this term MUST contain a valid URL
<a name="AcceptableMediaTypes"></a>AcceptableMediaTypes|\[MediaType\]|Lists the MIME types acceptable for the annotated entity type marked with HasStream="true" or the annotated stream property
<a name="MediaType"></a>MediaType|MediaType|The media type of a binary resource
<a name="IsMediaType"></a>IsMediaType|[Tag](#Tag)|Properties and terms annotated with this term MUST contain a valid MIME type
<a name="OptimisticConcurrency"></a>OptimisticConcurrency|\[PropertyPath\]|Data modification requires the use of ETags. A non-empty collection contains the set of properties that are used to compute the ETag.
<a name="AdditionalProperties"></a>AdditionalProperties|[Tag](#Tag)|Instances of this type may contain properties in addition to those declared in $metadata
<a name="AutoExpand"></a>AutoExpand|[Tag](#Tag)|The service will automatically expand this navigation property even if not requested with $expand
<a name="AutoExpandReferences"></a>AutoExpandReferences|[Tag](#Tag)|The service will automatically expand this navigation property as entity references even if not requested with $expand=.../$ref
<a name="MayImplement"></a>MayImplement|\[[QualifiedTypeName](#QualifiedTypeName)\]|A collection of qualified type names outside of the type hierarchy that instances of this type might be addressable as by using a type segment.
<a name="Ordered"></a>Ordered|[Tag](#Tag)|Collection has a stable order. Ordered collections of primitive or complex types can be indexed by ordinal.
<a name="PositionalInsert"></a>PositionalInsert|[Tag](#Tag)|Items can be inserted at a given ordinal index.
<a name="AlternateKeys"></a>AlternateKeys|\[[AlternateKey](#AlternateKey)\]|Communicates available alternate keys

## <a name="ValueException"></a>ValueException
**Type:** String


Allowed Value|Description
:------------|:----------
INF|The value is greater than the largest number for the prescribed numeric type
-INF|The value is less than smallest number for the prescribed numeric type
NaN|The value is not representable in the prescribed numeric type

## <a name="MessageType"></a>MessageType


Property|Type|Description
:-------|:---|:----------
code|String|Machine-readable, language-independent message code
message|String|Human-readable, language-dependent message text
severity|[MessageSeverity](#MessageSeverity)|Severity of the message
target|String|A path to the target of the message detail, relative to the annotated instance
details|\[[MessageType](#MessageType)\]|List of detail messages

## <a name="MessageSeverity"></a>MessageSeverity
**Type:** String


Allowed Value|Description
:------------|:----------
success|Positive feedback - no action required
info|Additional information - no action required
warning|Warning - action may be required
error|Error - action is required

## <a name="Tag"></a>Tag
**Type:** Boolean

This is the type to use for all tagging terms

## <a name="Permission"></a>Permission


Flag Member|Value|Description
:-----|----:|:----------
None|0|No permissions
Read|1|Read permission
Write|2|Write permission
ReadWrite|3|Read and write permission
Invoke|4|Permission to invoke actions

## <a name="QualifiedTypeName"></a>QualifiedTypeName
**Type:** String

The qualified name of a type in scope.

## <a name="AlternateKey"></a>AlternateKey


Property|Type|Description
:-------|:---|:----------
Key|\[[PropertyRef](#PropertyRef)\]|The set of properties that make up this key

## <a name="PropertyRef"></a>PropertyRef


Property|Type|Description
:-------|:---|:----------
Name|PropertyPath|A path expression resolving to a primitive property of the entity type itself or to a primitive property of a complex or navigation property (recursively) of the entity type. The names of the properties in the path are joined together by forward slashes.
Alias|String|A SimpleIdentifier that MUST be unique within the set of aliases, structural and navigation properties of the containing entity type that MUST be used in the key predicate of URLs
