# Core Vocabulary
**Namespace: [Org.OData.Core.V1](Org.OData.Core.V1.xml)**

Core terms needed to write vocabularies


## Terms

Term|Type|Description
:---|:---|:----------
[ODataVersions](Org.OData.Core.V1.xml#L72)|String|<a name="ODataVersions"></a>A space-separated list of supported versions of the OData Protocol. Note that 4.0 is implied by 4.01 and does not need to be separately listed.
[SchemaVersion](Org.OData.Core.V1.xml#L77)|String|<a name="SchemaVersion"></a>Service-defined value representing the version of the schema. Services MAY use semantic versioning, but clients MUST NOT assume this is the case.
[Revisions](Org.OData.Core.V1.xml#L82)|\[[RevisionType](#RevisionType)\]|<a name="Revisions"></a>List of revisions of a model element
[Description](Org.OData.Core.V1.xml#L110)|String|<a name="Description"></a>A brief description of a model element
[LongDescription](Org.OData.Core.V1.xml#L115)|String|<a name="LongDescription"></a>A lengthy description of a model element
[Links](Org.OData.Core.V1.xml#L120)|\[[Link](#Link)\]|<a name="Links"></a>Link to related information
[Example](Org.OData.Core.V1.xml#L138)|[ExampleValue](#ExampleValue)|<a name="Example"></a>Example for an instance of the annotated model element
[Messages](Org.OData.Core.V1.xml#L154)|\[[MessageType](#MessageType)\]|<a name="Messages"></a>Instance annotation for warning and info messages
[IsLanguageDependent](Org.OData.Core.V1.xml#L201)|[Tag](#Tag)|<a name="IsLanguageDependent"></a>Properties and terms annotated with this term are language-dependent
[RequiresType](Org.OData.Core.V1.xml#L212)|String|<a name="RequiresType"></a>Terms annotated with this term can only be applied to elements that have a type that is identical to or derived from the given type name
[ResourcePath](Org.OData.Core.V1.xml#L219)|URL|<a name="ResourcePath"></a>Resource path for entity container child, can be relative to xml:base and the request URL
[DereferenceableIDs](Org.OData.Core.V1.xml#L225)|[Tag](#Tag)|<a name="DereferenceableIDs"></a>Entity-ids are URLs that locate the identified entity
[ConventionalIDs](Org.OData.Core.V1.xml#L229)|[Tag](#Tag)|<a name="ConventionalIDs"></a>Entity-ids follow OData URL conventions
[Permissions](Org.OData.Core.V1.xml#L237)|[Permission](#Permission)|<a name="Permissions"></a>Permissions for accessing a resource
[ContentID](Org.OData.Core.V1.xml#L260)|String|<a name="ContentID"></a>A unique identifier for nested entities within a request.
[DefaultNamespace](Org.OData.Core.V1.xml#L266)|[Tag](#Tag)|<a name="DefaultNamespace"></a>Functions, actions and types in this namespace can be referenced in URLs with or without namespace- or alias- qualification.<p>Data Modelers should ensure uniqueness of schema children across all default namespaces, and should avoid naming bound functions, actions, or derived types with the same name as a structural or navigational property of the type.</p>
[Immutable](Org.OData.Core.V1.xml#L273)|[Tag](#Tag)|<a name="Immutable"></a>A value for this non-key property can be provided by the client on insert and remains unchanged on update
[Computed](Org.OData.Core.V1.xml#L278)|[Tag](#Tag)|<a name="Computed"></a>A value for this property is generated on both insert and update
[ComputedDefaultValue](Org.OData.Core.V1.xml#L282)|[Tag](#Tag)|<a name="ComputedDefaultValue"></a>A value for this property can be provided by the client on insert and update. If no value is provided on insert, a non-static default value is generated
[IsURL](Org.OData.Core.V1.xml#L287)|[Tag](#Tag)|<a name="IsURL"></a>Properties and terms annotated with this term MUST contain a valid URL
[AcceptableMediaTypes](Org.OData.Core.V1.xml#L292)|\[MediaType\]|<a name="AcceptableMediaTypes"></a>Lists the MIME types acceptable for the annotated entity type marked with HasStream="true" or the annotated stream property
[MediaType](Org.OData.Core.V1.xml#L298)|MediaType|<a name="MediaType"></a>The media type of a binary resource
[IsMediaType](Org.OData.Core.V1.xml#L304)|[Tag](#Tag)|<a name="IsMediaType"></a>Properties and terms annotated with this term MUST contain a valid MIME type
[OptimisticConcurrency](Org.OData.Core.V1.xml#L309)|\[PropertyPath\]|<a name="OptimisticConcurrency"></a>Data modification requires the use of ETags. A non-empty collection contains the set of properties that are used to compute the ETag.
[AdditionalProperties](Org.OData.Core.V1.xml#L314)|[Tag](#Tag)|<a name="AdditionalProperties"></a>Instances of this type may contain properties in addition to those declared in $metadata<p>If specified as false clients can assume that instances will not contain dynamic properties, irrespective of the value of the OpenType attribute.</p>
[AutoExpand](Org.OData.Core.V1.xml#L321)|[Tag](#Tag)|<a name="AutoExpand"></a>The service will automatically expand this navigation property even if not requested with $expand
[AutoExpandReferences](Org.OData.Core.V1.xml#L326)|[Tag](#Tag)|<a name="AutoExpandReferences"></a>The service will automatically expand this navigation property as entity references even if not requested with $expand=.../$ref
[MayImplement](Org.OData.Core.V1.xml#L331)|\[[QualifiedTypeName](#QualifiedTypeName)\]|<a name="MayImplement"></a>A collection of qualified type names outside of the type hierarchy that instances of this type might be addressable as by using a type-cast segment.
[Ordered](Org.OData.Core.V1.xml#L346)|[Tag](#Tag)|<a name="Ordered"></a>Collection has a stable order. Ordered collections of primitive or complex types can be indexed by ordinal.
[PositionalInsert](Org.OData.Core.V1.xml#L353)|[Tag](#Tag)|<a name="PositionalInsert"></a>Items can be inserted at a given ordinal index.
[AlternateKeys](Org.OData.Core.V1.xml#L359)|\[[AlternateKey](#AlternateKey)\]|<a name="AlternateKeys"></a>Communicates available alternate keys
[OptionalParameter](Org.OData.Core.V1.xml#L390)|[OptionalParameterType](#OptionalParameterType)|<a name="OptionalParameter"></a>Supplying a value for the parameter is optional.<p>All parameters marked as optional must come after any parameters not marked as optional. The binding parameter must not be marked as optional.</p>
[OperationAvailable](Org.OData.Core.V1.xml#L402)|Boolean|<a name="OperationAvailable"></a>Action or function is available<p>The annotation value will usually be an expression, e.g. using properties of the binding parameter type for instance-dependent availability, or using properties of a singleton for global availability. The static value `null` means that availability cannot be determined upfront and is instead expressed as an operation advertisement.</p>

## <a name="RevisionType"></a>[RevisionType](Org.OData.Core.V1.xml#L85)


Property|Type|Description
:-------|:---|:----------
[Version](Org.OData.Core.V1.xml#L86)|String|The schema version with which this revision was first published
[Kind](Org.OData.Core.V1.xml#L89)|[RevisionKind](#RevisionKind)|The kind of revision
[Description](Org.OData.Core.V1.xml#L92)|String|Text describing the reason for the revision

## <a name="RevisionKind"></a>[RevisionKind](Org.OData.Core.V1.xml#L96)


Member|Value|Description
:-----|----:|:----------
[Added](Org.OData.Core.V1.xml#L97)|0|Model element was added
[Modified](Org.OData.Core.V1.xml#L100)|1|Model element was modified
[Deprecated](Org.OData.Core.V1.xml#L103)|2|Model element was deprecated

## <a name="Link"></a>[Link](Org.OData.Core.V1.xml#L123)
The Link term is inspired by the `atom:link` element, see [RFC4287](https://tools.ietf.org/html/rfc4287#section-4.2.7), and the `Link` HTTP header, see [RFC5988](https://tools.ietf.org/html/rfc5988)

Property|Type|Description
:-------|:---|:----------
[rel](Org.OData.Core.V1.xml#L126)|String|Link relation type, see [IANA Link Relations](http://www.iana.org/assignments/link-relations/link-relations.xhtml)
[href](Org.OData.Core.V1.xml#L130)|URL|URL of related information

## <a name="ExampleValue"></a>[ExampleValue](Org.OData.Core.V1.xml#L141)


**Derived Types:**
- [PrimitiveExampleValue](#PrimitiveExampleValue)

Property|Type|Description
:-------|:---|:----------
[Description](Org.OData.Core.V1.xml#L142)|String|Description of the example value

## <a name="PrimitiveExampleValue"></a>[PrimitiveExampleValue](Org.OData.Core.V1.xml#L146): [ExampleValue](#ExampleValue)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Core.V1.xml#L142)|String|Description of the example value
[Value](Org.OData.Core.V1.xml#L147)|PrimitiveType|Example value for the custom parameter

## <a name="MessageType"></a>[MessageType](Org.OData.Core.V1.xml#L157)


Property|Type|Description
:-------|:---|:----------
[code](Org.OData.Core.V1.xml#L158)|String|Machine-readable, language-independent message code
[message](Org.OData.Core.V1.xml#L161)|String|Human-readable, language-dependent message text
[severity](Org.OData.Core.V1.xml#L165)|[MessageSeverity](#MessageSeverity)|Severity of the message
[target](Org.OData.Core.V1.xml#L168)|String|A path to the target of the message detail, relative to the annotated instance
[details](Org.OData.Core.V1.xml#L172)|\[[MessageType](#MessageType)\]|List of detail messages

## <a name="MessageSeverity"></a>[MessageSeverity](Org.OData.Core.V1.xml#L176)
**Type:** String



Allowed Value|Description
:------------|:----------
[success](Org.OData.Core.V1.xml#L179)|Positive feedback - no action required
[info](Org.OData.Core.V1.xml#L183)|Additional information - no action required
[warning](Org.OData.Core.V1.xml#L187)|Warning - action may be required
[error](Org.OData.Core.V1.xml#L191)|Error - action is required

## <a name="Tag"></a>[Tag](Org.OData.Core.V1.xml#L206)
**Type:** Boolean

This is the type to use for all tagging terms

## <a name="Permission"></a>[Permission](Org.OData.Core.V1.xml#L240)


Flag Member|Value|Description
:-----|----:|:----------
[None](Org.OData.Core.V1.xml#L241)|0|No permissions
[Read](Org.OData.Core.V1.xml#L244)|1|Read permission
[Write](Org.OData.Core.V1.xml#L247)|2|Write permission
[ReadWrite](Org.OData.Core.V1.xml#L250)|3|Read and write permission
[Invoke](Org.OData.Core.V1.xml#L253)|4|Permission to invoke actions

## <a name="QualifiedTermName"></a>[QualifiedTermName](Org.OData.Core.V1.xml#L336)
**Type:** String

The qualified name of a term in scope.

## <a name="QualifiedTypeName"></a>[QualifiedTypeName](Org.OData.Core.V1.xml#L340)
**Type:** String

The qualified name of a type in scope.

## <a name="AlternateKey"></a>[AlternateKey](Org.OData.Core.V1.xml#L362)


Property|Type|Description
:-------|:---|:----------
[Key](Org.OData.Core.V1.xml#L363)|\[[PropertyRef](#PropertyRef)\]|The set of properties that make up this key

## <a name="PropertyRef"></a>[PropertyRef](Org.OData.Core.V1.xml#L367)


Property|Type|Description
:-------|:---|:----------
[Name](Org.OData.Core.V1.xml#L368)|PropertyPath|A path expression resolving to a primitive property of the entity type itself or to a primitive property of a complex or navigation property (recursively) of the entity type. The names of the properties in the path are joined together by forward slashes.
[Alias](Org.OData.Core.V1.xml#L372)|String|A SimpleIdentifier that MUST be unique within the set of aliases, structural and navigation properties of the containing entity type that MUST be used in the key predicate of URLs

## <a name="Dictionary"></a>[Dictionary](Org.OData.Core.V1.xml#L378)
A dictionary of name-value pairs. Names must be valid property names, values may be restricted to a list of types via an annotation with term `Validation.OpenPropertyTypeConstraint`.


Property|Type
:-------|:---
Any simple identifier | Any type listed in `Validation.OpenPropertyTypeConstraint`, or any type if there is no constraint


## <a name="OptionalParameterType"></a>[OptionalParameterType](Org.OData.Core.V1.xml#L395)


Property|Type|Description
:-------|:---|:----------
[DefaultValue](Org.OData.Core.V1.xml#L396)|String|Default value for an optional parameter of primitive or enumeration type, using the same rules as the `cast` function in URLs.

## <a name="LocalDateTime"></a>[LocalDateTime](Org.OData.Core.V1.xml#L408)
**Type:** String

A string representing a Local Date-Time value with no offset.
