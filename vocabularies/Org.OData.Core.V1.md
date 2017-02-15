# Core Vocabulary
**Namespace: [Org.OData.Core.V1](Org.OData.Core.V1.xml)**

Core terms needed to write vocabularies

Term|Type|Description
:---|:---|:----------
[ODataVersions](Org.OData.Core.V1.xml#L62)|String|<a name="ODataVersions"></a>A space-separated list of supported versions of the OData Protocol. Note that 4.0 is implied by 4.01 and does not need to be separately listed.
[SchemaVersion](Org.OData.Core.V1.xml#L67)|String|<a name="SchemaVersion"></a>Service-defined value representing the version of the schema. Services MAY use semantic versioning, but clients MUST NOT assume this is the case.
[Description](Org.OData.Core.V1.xml#L74)|String|<a name="Description"></a>A brief description of a model element
[LongDescription](Org.OData.Core.V1.xml#L79)|String|<a name="LongDescription"></a>A lengthy description of a model element
[Links](Org.OData.Core.V1.xml#L84)|\[[Link](#Link)\]|<a name="Links"></a>Link to related information
[NumericValueException](Org.OData.Core.V1.xml#L102)|[ValueException](#ValueException)|<a name="NumericValueException"></a>Used in place of a property value to annotate a property whose value is not representable according to its numeric type.
[Messages](Org.OData.Core.V1.xml#L127)|\[[MessageType](#MessageType)\]|<a name="Messages"></a>Instance annotation for warning and info messages
[IsLanguageDependent](Org.OData.Core.V1.xml#L173)|[Tag](#Tag)|<a name="IsLanguageDependent"></a>Properties and terms annotated with this term are language-dependent
[RequiresType](Org.OData.Core.V1.xml#L184)|String|<a name="RequiresType"></a>Terms annotated with this term can only be applied to elements that have a type that is identical to or derived from the given type name
[ResourcePath](Org.OData.Core.V1.xml#L191)|URL|<a name="ResourcePath"></a>Resource path for entity container child, can be relative to xml:base and the request URL
[DereferenceableIDs](Org.OData.Core.V1.xml#L196)|[Tag](#Tag)|<a name="DereferenceableIDs"></a>Entity-ids are URLs that locate the identified entity
[ConventionalIDs](Org.OData.Core.V1.xml#L200)|[Tag](#Tag)|<a name="ConventionalIDs"></a>Entity-ids follow OData URL conventions
[Permissions](Org.OData.Core.V1.xml#L208)|[Permission](#Permission)|<a name="Permissions"></a>Permissions for accessing a resource
[ContentID](Org.OData.Core.V1.xml#L231)|String|<a name="ContentID"></a>A unique identifier for nested entities within a request.
[DefaultNamespace](Org.OData.Core.V1.xml#L237)|[Tag](#Tag)|<a name="DefaultNamespace"></a>Functions, actions and types in this namespace can be referenced in URLs with or without namespace- or alias- qualification.
[Immutable](Org.OData.Core.V1.xml#L244)|[Tag](#Tag)|<a name="Immutable"></a>A value for this non-key property can be provided on insert and remains unchanged on update
[Computed](Org.OData.Core.V1.xml#L248)|[Tag](#Tag)|<a name="Computed"></a>A value for this property is generated on both insert and update
[IsURL](Org.OData.Core.V1.xml#L252)|[Tag](#Tag)|<a name="IsURL"></a>Properties and terms annotated with this term MUST contain a valid URL
[AcceptableMediaTypes](Org.OData.Core.V1.xml#L257)|\[MediaType\]|<a name="AcceptableMediaTypes"></a>Lists the MIME types acceptable for the annotated entity type marked with HasStream="true" or the annotated stream property
[MediaType](Org.OData.Core.V1.xml#L263)|MediaType|<a name="MediaType"></a>The media type of a binary resource
[IsMediaType](Org.OData.Core.V1.xml#L269)|[Tag](#Tag)|<a name="IsMediaType"></a>Properties and terms annotated with this term MUST contain a valid MIME type
[OptimisticConcurrency](Org.OData.Core.V1.xml#L274)|\[PropertyPath\]|<a name="OptimisticConcurrency"></a>Data modification requires the use of ETags. A non-empty collection contains the set of properties that are used to compute the ETag.
[AdditionalProperties](Org.OData.Core.V1.xml#L279)|[Tag](#Tag)|<a name="AdditionalProperties"></a>Instances of this type may contain properties in addition to those declared in $metadata
[AutoExpand](Org.OData.Core.V1.xml#L285)|[Tag](#Tag)|<a name="AutoExpand"></a>The service will automatically expand this navigation property even if not requested with $expand
[AutoExpandReferences](Org.OData.Core.V1.xml#L290)|[Tag](#Tag)|<a name="AutoExpandReferences"></a>The service will automatically expand this navigation property as entity references even if not requested with $expand=.../$ref
[MayImplement](Org.OData.Core.V1.xml#L295)|\[[QualifiedTypeName](#QualifiedTypeName)\]|<a name="MayImplement"></a>A collection of qualified type names outside of the type hierarchy that instances of this type might be addressable as by using a type segment.
[Ordered](Org.OData.Core.V1.xml#L304)|[Tag](#Tag)|<a name="Ordered"></a>Collection has a stable order. Ordered collections of primitive or complex types can be indexed by ordinal.
[PositionalInsert](Org.OData.Core.V1.xml#L309)|[Tag](#Tag)|<a name="PositionalInsert"></a>Items can be inserted at a given ordinal index.
[AlternateKeys](Org.OData.Core.V1.xml#L313)|\[[AlternateKey](#AlternateKey)\]|<a name="AlternateKeys"></a>Communicates available alternate keys

## <a name="Link"></a>[Link](Org.OData.Core.V1.xml#L87)
The Link term is inspired by the `atom:link` element, see [RFC4287](https://tools.ietf.org/html/rfc4287#section-4.2.7) and the `Link` HTTP header, see [RFC5988](https://tools.ietf.org/html/rfc5988)

Property|Type|Description
:-------|:---|:----------
[rel](Org.OData.Core.V1.xml#L90)|String|Link relation type, see [IANA Link Relations](http://www.iana.org/assignments/link-relations/link-relations.xhtml)
[href](Org.OData.Core.V1.xml#L94)|URL|URL of related information

## <a name="ValueException"></a>[ValueException](Org.OData.Core.V1.xml#L106)
**Type:** String


Allowed Value|Description
:------------|:----------
[INF](Org.OData.Core.V1.xml#L109)|The value is greater than the largest number for the prescribed numeric type
[-INF](Org.OData.Core.V1.xml#L113)|The value is less than smallest number for the prescribed numeric type
[NaN](Org.OData.Core.V1.xml#L117)|The value is not representable in the prescribed numeric type

## <a name="MessageType"></a>[MessageType](Org.OData.Core.V1.xml#L130)


Property|Type|Description
:-------|:---|:----------
[code](Org.OData.Core.V1.xml#L131)|String|Machine-readable, language-independent message code
[message](Org.OData.Core.V1.xml#L134)|String|Human-readable, language-dependent message text
[severity](Org.OData.Core.V1.xml#L138)|[MessageSeverity](#MessageSeverity)|Severity of the message
[target](Org.OData.Core.V1.xml#L141)|String|A path to the target of the message detail, relative to the annotated instance
[details](Org.OData.Core.V1.xml#L144)|\[[MessageType](#MessageType)\]|List of detail messages

## <a name="MessageSeverity"></a>[MessageSeverity](Org.OData.Core.V1.xml#L148)
**Type:** String


Allowed Value|Description
:------------|:----------
[success](Org.OData.Core.V1.xml#L151)|Positive feedback - no action required
[info](Org.OData.Core.V1.xml#L155)|Additional information - no action required
[warning](Org.OData.Core.V1.xml#L159)|Warning - action may be required
[error](Org.OData.Core.V1.xml#L163)|Error - action is required

## <a name="Tag"></a>[Tag](Org.OData.Core.V1.xml#L178)
**Type:** Boolean

This is the type to use for all tagging terms

## <a name="Permission"></a>[Permission](Org.OData.Core.V1.xml#L211)


Flag Member|Value|Description
:-----|----:|:----------
[None](Org.OData.Core.V1.xml#L212)|0|No permissions
[Read](Org.OData.Core.V1.xml#L215)|1|Read permission
[Write](Org.OData.Core.V1.xml#L218)|2|Write permission
[ReadWrite](Org.OData.Core.V1.xml#L221)|3|Read and write permission
[Invoke](Org.OData.Core.V1.xml#L224)|4|Permission to invoke actions

## <a name="QualifiedTypeName"></a>[QualifiedTypeName](Org.OData.Core.V1.xml#L300)
**Type:** String

The qualified name of a type in scope.

## <a name="AlternateKey"></a>[AlternateKey](Org.OData.Core.V1.xml#L316)


Property|Type|Description
:-------|:---|:----------
[Key](Org.OData.Core.V1.xml#L317)|\[[PropertyRef](#PropertyRef)\]|The set of properties that make up this key

## <a name="PropertyRef"></a>[PropertyRef](Org.OData.Core.V1.xml#L321)


Property|Type|Description
:-------|:---|:----------
[Name](Org.OData.Core.V1.xml#L322)|PropertyPath|A path expression resolving to a primitive property of the entity type itself or to a primitive property of a complex or navigation property (recursively) of the entity type. The names of the properties in the path are joined together by forward slashes.
[Alias](Org.OData.Core.V1.xml#L326)|String|A SimpleIdentifier that MUST be unique within the set of aliases, structural and navigation properties of the containing entity type that MUST be used in the key predicate of URLs
