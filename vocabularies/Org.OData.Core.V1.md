# Core Vocabulary
**Namespace: [Org.OData.Core.V1](Org.OData.Core.V1.xml)**

Core terms needed to write vocabularies


## Terms

Term|Type|Description
:---|:---|:----------
[ODataVersions](Org.OData.Core.V1.xml#L69)|String|<a name="ODataVersions"></a>A space-separated list of supported versions of the OData Protocol. Note that 4.0 is implied by 4.01 and does not need to be separately listed.
[SchemaVersion](Org.OData.Core.V1.xml#L73)|String|<a name="SchemaVersion"></a>Service-defined value representing the version of the schema. Services MAY use semantic versioning, but clients MUST NOT assume this is the case.
[Revisions](Org.OData.Core.V1.xml#L77)|\[[RevisionType](#RevisionType)\]|<a name="Revisions"></a>List of revisions of a model element
[Description](Org.OData.Core.V1.xml#L105)|String?|<a name="Description"></a>A brief description of a model element
[LongDescription](Org.OData.Core.V1.xml#L110)|String?|<a name="LongDescription"></a>A long description of a model element
[Links](Org.OData.Core.V1.xml#L115)|\[[Link](#Link)\]|<a name="Links"></a>Link to related information
[Example](Org.OData.Core.V1.xml#L129)|[ExampleValue](#ExampleValue)|<a name="Example"></a>Example for an instance of the annotated model element ([Example](Org.OData.Core.V1.xml#L131))
[Messages](Org.OData.Core.V1.xml#L198)|\[[MessageType](#MessageType)\]|<a name="Messages"></a>Instance annotation for warning and info messages
[ValueException](Org.OData.Core.V1.xml#L242)|[ValueExceptionType](#ValueExceptionType)|<a name="ValueException"></a>The annotated value is problematic
[ResourceException](Org.OData.Core.V1.xml#L256)|[ResourceExceptionType](#ResourceExceptionType)|<a name="ResourceException"></a>The annotated instance within a success payload is problematic
[DataModificationException](Org.OData.Core.V1.xml#L266)|[DataModificationExceptionType](#DataModificationExceptionType)|<a name="DataModificationException"></a>A modification operation failed on the annotated instance or collection within a success payload
[IsLanguageDependent](Org.OData.Core.V1.xml#L306)|[Tag](#Tag)|<a name="IsLanguageDependent"></a>Properties and terms annotated with this term are language-dependent
[RequiresType](Org.OData.Core.V1.xml#L317)|String|<a name="RequiresType"></a>Terms annotated with this term can only be applied to elements that have a type that is identical to or derived from the given type name
[AppliesViaContainer](Org.OData.Core.V1.xml#L321)|[Tag](#Tag)|<a name="AppliesViaContainer"></a>The target path of an annotation with the tagged term MUST start with an entity container or the annotation MUST be embedded within an entity container, entity set or singleton<br>Services MAY additionally annotate a container-independent model element (entity type, property, navigation property) if allowed by the `AppliesTo` property of the term and the annotation applies to all uses of that model element.
[ResourcePath](Org.OData.Core.V1.xml#L331)|URL|<a name="ResourcePath"></a>Resource path for entity container child, can be relative to xml:base and the request URL
[DereferenceableIDs](Org.OData.Core.V1.xml#L336)|[Tag](#Tag)|<a name="DereferenceableIDs"></a>Entity-ids are URLs that locate the identified entity
[ConventionalIDs](Org.OData.Core.V1.xml#L340)|[Tag](#Tag)|<a name="ConventionalIDs"></a>Entity-ids follow OData URL conventions
[Permissions](Org.OData.Core.V1.xml#L346)|[Permission](#Permission)|<a name="Permissions"></a>Permissions for accessing a resource
[ContentID](Org.OData.Core.V1.xml#L369)|String|<a name="ContentID"></a>A unique identifier for nested entities within a request.
[DefaultNamespace](Org.OData.Core.V1.xml#L375)|[Tag](#Tag)|<a name="DefaultNamespace"></a>Functions, actions and types in this namespace can be referenced in URLs with or without namespace- or alias- qualification.<br>Data Modelers should ensure uniqueness of schema children across all default namespaces, and should avoid naming bound functions, actions, or derived types with the same name as a structural or navigational property of the type.
[Immutable](Org.OData.Core.V1.xml#L380)|[Tag](#Tag)|<a name="Immutable"></a>A value for this non-key property can be provided by the client on insert and remains unchanged on update
[Computed](Org.OData.Core.V1.xml#L384)|[Tag](#Tag)|<a name="Computed"></a>A value for this property is generated on both insert and update
[ComputedDefaultValue](Org.OData.Core.V1.xml#L388)|[Tag](#Tag)|<a name="ComputedDefaultValue"></a>A value for this property can be provided by the client on insert and update. If no value is provided on insert, a non-static default value is generated
[IsURL](Org.OData.Core.V1.xml#L392)|[Tag](#Tag)|<a name="IsURL"></a>Properties and terms annotated with this term MUST contain a valid URL
[AcceptableMediaTypes](Org.OData.Core.V1.xml#L397)|\[MediaType\]|<a name="AcceptableMediaTypes"></a>Lists the MIME types acceptable for the annotated entity type marked with HasStream="true" or the annotated binary, stream, or string property or term<br>The annotation of a TypeDefinition propagates to the model elements having this type
[MediaType](Org.OData.Core.V1.xml#L403)|MediaType?|<a name="MediaType"></a>The media type of the media stream of the annotated entity type marked with HasStream="true" or the annotated binary, stream, or string property or term<br>The annotation of a TypeDefinition propagates to the model elements having this type
[IsMediaType](Org.OData.Core.V1.xml#L409)|[Tag](#Tag)|<a name="IsMediaType"></a>Properties and terms annotated with this term MUST contain a valid MIME type
[ContentDisposition](Org.OData.Core.V1.xml#L414)|[ContentDispositionType](#ContentDispositionType)|<a name="ContentDisposition"></a>The content disposition of the media stream of the annotated entity type marked with HasStream="true" or the annotated binary, stream, or string property or term
[OptimisticConcurrency](Org.OData.Core.V1.xml#L427)|\[PropertyPath\]|<a name="OptimisticConcurrency"></a>Data modification requires the use of ETags. A non-empty collection contains the set of properties that are used to compute the ETag. An empty collection means that the service won't tell how it computes the ETag
[AdditionalProperties](Org.OData.Core.V1.xml#L431)|[Tag](#Tag)|<a name="AdditionalProperties"></a>Instances of this type may contain properties in addition to those declared in $metadata<br>If specified as false clients can assume that instances will not contain dynamic properties, irrespective of the value of the OpenType attribute.
[AutoExpand](Org.OData.Core.V1.xml#L436)|[Tag](#Tag)|<a name="AutoExpand"></a>The service will automatically expand this stream property, navigation property, or the media stream of this media entity type even if not requested with $expand
[AutoExpandReferences](Org.OData.Core.V1.xml#L440)|[Tag](#Tag)|<a name="AutoExpandReferences"></a>The service will automatically expand this navigation property as entity references even if not requested with $expand=.../$ref
[MayImplement](Org.OData.Core.V1.xml#L444)|\[[QualifiedTypeName](#QualifiedTypeName)\]|<a name="MayImplement"></a>A collection of qualified type names outside of the type hierarchy that instances of this type might be addressable as by using a type-cast segment.
[Ordered](Org.OData.Core.V1.xml#L471)|[Tag](#Tag)|<a name="Ordered"></a>Collection has a stable order. Ordered collections of primitive or complex types can be indexed by ordinal.
[PositionalInsert](Org.OData.Core.V1.xml#L475)|[Tag](#Tag)|<a name="PositionalInsert"></a>Items can be inserted at a given ordinal index.
[AlternateKeys](Org.OData.Core.V1.xml#L479)|\[[AlternateKey](#AlternateKey)\]|<a name="AlternateKeys"></a>Communicates available alternate keys
[OptionalParameter](Org.OData.Core.V1.xml#L507)|[OptionalParameterType](#OptionalParameterType)|<a name="OptionalParameter"></a>Supplying a value for the action or function parameter is optional.<br>All parameters marked as optional must come after any parameters not marked as optional. The binding parameter must not be marked as optional.
[OperationAvailable](Org.OData.Core.V1.xml#L518)|Boolean?|<a name="OperationAvailable"></a>Action or function is available<br>The annotation value will usually be an expression, e.g. using properties of the binding parameter type for instance-dependent availability, or using properties of a singleton for global availability. The static value `null` means that availability cannot be determined upfront and is instead expressed as an operation advertisement.
[RequiresExplicitBinding](Org.OData.Core.V1.xml#L523)|[Tag?](#Tag)|<a name="RequiresExplicitBinding"></a>This bound action or function is only available on model elements annotated with the ExplicitOperationBindings term.
[ExplicitOperationBindings](Org.OData.Core.V1.xml#L527)|\[[QualifiedBoundOperationName](#QualifiedBoundOperationName)\]|<a name="ExplicitOperationBindings"></a>The qualified names of explicitly bound operations that are supported on the target model element. These operations are in addition to any operations not annotated with RequiresExplicitBinding that are bound to the type of the target model element.
[SymbolicName](Org.OData.Core.V1.xml#L536)|[SimpleIdentifier](#SimpleIdentifier)|<a name="SymbolicName"></a>A symbolic name for a model element
[GeometryFeature](Org.OData.Core.V1.xml#L545)|[GeometryFeatureType?](#GeometryFeatureType)|<a name="GeometryFeature"></a>A [Feature Object](https://datatracker.ietf.org/doc/html/rfc7946#section-3.2) represents a spatially bounded thing
[AnyStructure](Org.OData.Core.V1.xml#L561)|[Tag](#Tag)|<a name="AnyStructure"></a>Instances of a type are annotated with this tag if they have no common structure in a given response payload<br>The select-list of a context URL MUST be `(@Core.AnyStructure)` if it would otherwise be empty, but this instance annotation SHOULD be omitted from the response value.
[Constructor](Org.OData.Core.V1.xml#L569)|[Tag](#Tag)|<a name="Constructor"></a>On success the annotated action creates a new entity

<a name="RevisionType"></a>
## [RevisionType](Org.OData.Core.V1.xml#L80)


Property|Type|Description
:-------|:---|:----------
[Version](Org.OData.Core.V1.xml#L81)|String?|The schema version with which this revision was first published
[Kind](Org.OData.Core.V1.xml#L84)|[RevisionKind](#RevisionKind)|The kind of revision
[Description](Org.OData.Core.V1.xml#L87)|String|Text describing the reason for the revision

<a name="RevisionKind"></a>
## [RevisionKind](Org.OData.Core.V1.xml#L91)


Member|Value|Description
:-----|----:|:----------
[Added](Org.OData.Core.V1.xml#L92)|0|Model element was added
[Modified](Org.OData.Core.V1.xml#L95)|1|Model element was modified
[Deprecated](Org.OData.Core.V1.xml#L98)|2|Model element was deprecated

<a name="Link"></a>
## [Link](Org.OData.Core.V1.xml#L118)
The Link term is inspired by the `atom:link` element, see [RFC4287](https://tools.ietf.org/html/rfc4287#section-4.2.7), and the `Link` HTTP header, see [RFC5988](https://tools.ietf.org/html/rfc5988)

Property|Type|Description
:-------|:---|:----------
[rel](Org.OData.Core.V1.xml#L120)|String|Link relation type, see [IANA Link Relations](http://www.iana.org/assignments/link-relations/link-relations.xhtml)
[href](Org.OData.Core.V1.xml#L123)|URL|URL of related information

<a name="ExampleValue"></a>
## [ExampleValue](Org.OData.Core.V1.xml#L169)


**Derived Types:**
- [PrimitiveExampleValue](#PrimitiveExampleValue)
- [ComplexExampleValue](#ComplexExampleValue)
- [EntityExampleValue](#EntityExampleValue)
- [ExternalExampleValue](#ExternalExampleValue)

Property|Type|Description
:-------|:---|:----------
[Description](Org.OData.Core.V1.xml#L170)|String?|Description of the example value

<a name="PrimitiveExampleValue"></a>
## [PrimitiveExampleValue](Org.OData.Core.V1.xml#L174): [ExampleValue](#ExampleValue)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Core.V1.xml#L170)|String?|Description of the example value
[Value](Org.OData.Core.V1.xml#L175)|PrimitiveType|Example value for the custom parameter

<a name="ComplexExampleValue"></a>
## [ComplexExampleValue](Org.OData.Core.V1.xml#L179): [ExampleValue](#ExampleValue)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Core.V1.xml#L170)|String?|Description of the example value
[Value](Org.OData.Core.V1.xml#L180)|ComplexType|Example value for the custom parameter

<a name="EntityExampleValue"></a>
## [EntityExampleValue](Org.OData.Core.V1.xml#L184): [ExampleValue](#ExampleValue)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Core.V1.xml#L170)|String?|Description of the example value
[Value](Org.OData.Core.V1.xml#L185)|EntityType|Example value for the custom parameter

<a name="ExternalExampleValue"></a>
## [ExternalExampleValue](Org.OData.Core.V1.xml#L189): [ExampleValue](#ExampleValue)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Core.V1.xml#L170)|String?|Description of the example value
[ExternalValue](Org.OData.Core.V1.xml#L190)|URL|Url reference to the value in its literal format

<a name="MessageType"></a>
## [MessageType](Org.OData.Core.V1.xml#L201)


Property|Type|Description
:-------|:---|:----------
[code](Org.OData.Core.V1.xml#L202)|String|Machine-readable, language-independent message code
[message](Org.OData.Core.V1.xml#L205)|String|Human-readable, language-dependent message text
[severity](Org.OData.Core.V1.xml#L209)|[MessageSeverity](#MessageSeverity)|Severity of the message
[target](Org.OData.Core.V1.xml#L212)|String?|A path to the target of the message detail, relative to the annotated instance
[details](Org.OData.Core.V1.xml#L215)|\[[MessageType](#MessageType)\]|List of detail messages

<a name="MessageSeverity"></a>
## [MessageSeverity](Org.OData.Core.V1.xml#L219)
**Type:** String



Allowed Value|Description
:------------|:----------
[success](Org.OData.Core.V1.xml#L222)|Positive feedback - no action required
[info](Org.OData.Core.V1.xml#L226)|Additional information - no action required
[warning](Org.OData.Core.V1.xml#L230)|Warning - action may be required
[error](Org.OData.Core.V1.xml#L234)|Error - action is required

<a name="ExceptionType"></a>
## [*ExceptionType*](Org.OData.Core.V1.xml#L245)


**Derived Types:**
- [ValueExceptionType](#ValueExceptionType)
- [ResourceExceptionType](#ResourceExceptionType)
- [DataModificationExceptionType](#DataModificationExceptionType)

Property|Type|Description
:-------|:---|:----------
[info](Org.OData.Core.V1.xml#L246)|[MessageType?](#MessageType)|Information about the exception

<a name="ValueExceptionType"></a>
## [ValueExceptionType](Org.OData.Core.V1.xml#L250): [ExceptionType](#ExceptionType)


Property|Type|Description
:-------|:---|:----------
[*info*](Org.OData.Core.V1.xml#L246)|[MessageType?](#MessageType)|Information about the exception
[value](Org.OData.Core.V1.xml#L251)|String?|String representation of the exact value

<a name="ResourceExceptionType"></a>
## [ResourceExceptionType](Org.OData.Core.V1.xml#L259): [ExceptionType](#ExceptionType)


Property|Type|Description
:-------|:---|:----------
[*info*](Org.OData.Core.V1.xml#L246)|[MessageType?](#MessageType)|Information about the exception
[retryLink](Org.OData.Core.V1.xml#L260)|URL?|A GET request to this URL retries retrieving the problematic instance

<a name="DataModificationExceptionType"></a>
## [DataModificationExceptionType](Org.OData.Core.V1.xml#L269): [ExceptionType](#ExceptionType)


Property|Type|Description
:-------|:---|:----------
[*info*](Org.OData.Core.V1.xml#L246)|[MessageType?](#MessageType)|Information about the exception
[failedOperation](Org.OData.Core.V1.xml#L270)|[DataModificationOperationKind](#DataModificationOperationKind)|The kind of modification operation that failed
[responseCode](Org.OData.Core.V1.xml#L273)|Int16?|Response code of the failed operation, e.g. 424 for a failed dependency

<a name="DataModificationOperationKind"></a>
## [DataModificationOperationKind](Org.OData.Core.V1.xml#L279)


Member|Value|Description
:-----|----:|:----------
[insert](Org.OData.Core.V1.xml#L280)|0|Insert new instance
[update](Org.OData.Core.V1.xml#L283)|1|Update existing instance
[upsert](Org.OData.Core.V1.xml#L286)|2|Insert new instance or update it if it already exists
[delete](Org.OData.Core.V1.xml#L289)|3|Delete existing instance
[invoke](Org.OData.Core.V1.xml#L292)|4|Invoke action or function
[link](Org.OData.Core.V1.xml#L295)|5|Add link between entities
[unlink](Org.OData.Core.V1.xml#L298)|6|Remove link between entities

<a name="Tag"></a>
## [Tag](Org.OData.Core.V1.xml#L311)
**Type:** Boolean

This is the type to use for all tagging terms

<a name="Permission"></a>
## [Permission](Org.OData.Core.V1.xml#L349)


Flag Member|Value|Description
:-----|----:|:----------
[None](Org.OData.Core.V1.xml#L350)|0|No permissions
[Read](Org.OData.Core.V1.xml#L353)|1|Read permission
[Write](Org.OData.Core.V1.xml#L356)|2|Write permission
[ReadWrite](Org.OData.Core.V1.xml#L359)|3|Read and write permission
[Invoke](Org.OData.Core.V1.xml#L362)|4|Permission to invoke actions

<a name="ContentDispositionType"></a>
## [ContentDispositionType](Org.OData.Core.V1.xml#L418)


Property|Type|Description
:-------|:---|:----------
[Type](Org.OData.Core.V1.xml#L419)|String|The disposition type of the binary or stream value, see [RFC 6266, Disposition Type](https://datatracker.ietf.org/doc/html/rfc6266#section-4.2)
[Filename](Org.OData.Core.V1.xml#L422)|String?|The proposed filename for downloading the binary or stream value, see [RFC 6266, Disposition Parameter: 'Filename'](https://datatracker.ietf.org/doc/html/rfc6266#section-4.3)

<a name="QualifiedTermName"></a>
## [QualifiedTermName](Org.OData.Core.V1.xml#L448)
**Type:** String

The qualified name of a term in scope.

<a name="QualifiedTypeName"></a>
## [QualifiedTypeName](Org.OData.Core.V1.xml#L452)
**Type:** String

The qualified name of a type in scope.

<a name="QualifiedActionName"></a>
## [QualifiedActionName](Org.OData.Core.V1.xml#L456)
**Type:** String

The qualified name of an action in scope.

<a name="QualifiedBoundOperationName"></a>
## [QualifiedBoundOperationName](Org.OData.Core.V1.xml#L460)
**Type:** String

The qualified name of a bound action or function in scope.

Either
- the qualified name of an action, to indicate the single bound overload with the specified binding parameter type, 
- the qualified name of a function, to indicate all bound overloads with the specified binding parameter type, or 
- the qualified name of a function followed by parentheses containing a comma-separated list of parameter types, in the order of their definition, to identify a single function overload with the first (binding) parameter matching the specified parameter type.
        

<a name="AlternateKey"></a>
## [AlternateKey](Org.OData.Core.V1.xml#L482)


Property|Type|Description
:-------|:---|:----------
[Key](Org.OData.Core.V1.xml#L483)|\[[PropertyRef](#PropertyRef)\]|The set of properties that make up this key

<a name="PropertyRef"></a>
## [PropertyRef](Org.OData.Core.V1.xml#L487)


Property|Type|Description
:-------|:---|:----------
[Name](Org.OData.Core.V1.xml#L488)|PropertyPath|A path expression resolving to a primitive property of the entity type itself or to a primitive property of a complex or navigation property (recursively) of the entity type. The names of the properties in the path are joined together by forward slashes.
[Alias](Org.OData.Core.V1.xml#L491)|String|A SimpleIdentifier that MUST be unique within the set of aliases, structural and navigation properties of the containing entity type that MUST be used in the key predicate of URLs

<a name="Dictionary"></a>
## [Dictionary](Org.OData.Core.V1.xml#L496)
A dictionary of name-value pairs. Names must be valid property names, values may be restricted to a list of types via an annotation with term `Validation.OpenPropertyTypeConstraint`.


Property|Type
:-------|:---
Any simple identifier | Any type listed in `Validation.OpenPropertyTypeConstraint`, or any type if there is no constraint


<a name="OptionalParameterType"></a>
## [OptionalParameterType](Org.OData.Core.V1.xml#L511)


Property|Type|Description
:-------|:---|:----------
[DefaultValue](Org.OData.Core.V1.xml#L512)|String?|Default value for an optional parameter of primitive or enumeration type, using the same rules as the `cast` function in URLs.<br>If no explicit DefaultValue is specified, the service is free on how to interpret omitting the parameter from the request. For example, a service might interpret an omitted optional parameter `KeyDate` as having the current date.

<a name="LocalDateTime"></a>
## [LocalDateTime](Org.OData.Core.V1.xml#L531)
**Type:** String

A string representing a Local Date-Time value with no offset.

<a name="SimpleIdentifier"></a>
## [SimpleIdentifier](Org.OData.Core.V1.xml#L540)
**Type:** String

A [simple identifier](https://docs.oasis-open.org/odata/odata-csdl-xml/v4.01/odata-csdl-xml-v4.01.html#sec_SimpleIdentifier)

<a name="GeometryFeatureType"></a>
## [GeometryFeatureType](Org.OData.Core.V1.xml#L548)
A [Feature Object](https://datatracker.ietf.org/doc/html/rfc7946#section-3.2) represents a spatially bounded thing

Property|Type|Description
:-------|:---|:----------
[geometry](Org.OData.Core.V1.xml#L550)|Geometry?|Location of the Feature
[properties](Org.OData.Core.V1.xml#L553)|[Dictionary?](#Dictionary)|Properties of the Feature
[id](Org.OData.Core.V1.xml#L556)|String?|Commonly used identifer for a Feature
