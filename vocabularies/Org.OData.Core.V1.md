# Core Vocabulary
**Namespace: [Org.OData.Core.V1](Org.OData.Core.V1.xml)**

Core terms needed to write vocabularies


## Terms

Term|Type|Description
:---|:---|:----------
[ODataVersions](./Org.OData.Core.V1.xml#L69:~:text=<Term%20Name="-,ODataVersions,-")|String|<a name="ODataVersions"></a>A space-separated list of supported versions of the OData Protocol. Note that 4.0 is implied by 4.01 and does not need to be separately listed.
[SchemaVersion](./Org.OData.Core.V1.xml#L73:~:text=<Term%20Name="-,SchemaVersion,-")|String|<a name="SchemaVersion"></a>Service-defined value representing the version of the schema. Services MAY use semantic versioning, but clients MUST NOT assume this is the case.
[Revisions](./Org.OData.Core.V1.xml#L77:~:text=<Term%20Name="-,Revisions,-")|\[[RevisionType](#RevisionType)\]|<a name="Revisions"></a>List of revisions of a model element
[Description](./Org.OData.Core.V1.xml#L105:~:text=<Term%20Name="-,Description,-")|String?|<a name="Description"></a>A brief description of a model element
[LongDescription](./Org.OData.Core.V1.xml#L110:~:text=<Term%20Name="-,LongDescription,-")|String?|<a name="LongDescription"></a>A long description of a model element
[Links](./Org.OData.Core.V1.xml#L115:~:text=<Term%20Name="-,Links,-")|\[[Link](#Link)\]|<a name="Links"></a>Link to related information
[Example](./Org.OData.Core.V1.xml#L129:~:text=<Term%20Name="-,Example,-")|[ExampleValue](#ExampleValue)|<a name="Example"></a>Example for an instance of the annotated model element ([Example](./Org.OData.Core.V1.xml#L131))
[Messages](./Org.OData.Core.V1.xml#L198:~:text=<Term%20Name="-,Messages,-")|\[[MessageType](#MessageType)\]|<a name="Messages"></a>Instance annotation for warning and info messages
[ValueException](./Org.OData.Core.V1.xml#L242:~:text=<Term%20Name="-,ValueException,-")|[ValueExceptionType](#ValueExceptionType)|<a name="ValueException"></a>The annotated value is problematic
[ResourceException](./Org.OData.Core.V1.xml#L256:~:text=<Term%20Name="-,ResourceException,-")|[ResourceExceptionType](#ResourceExceptionType)|<a name="ResourceException"></a>The annotated instance within a success payload is problematic
[DataModificationException](./Org.OData.Core.V1.xml#L266:~:text=<Term%20Name="-,DataModificationException,-")|[DataModificationExceptionType](#DataModificationExceptionType)|<a name="DataModificationException"></a>A modification operation failed on the annotated instance or collection within a success payload
[IsLanguageDependent](./Org.OData.Core.V1.xml#L306:~:text=<Term%20Name="-,IsLanguageDependent,-")|[Tag](#Tag)|<a name="IsLanguageDependent"></a>Properties and terms annotated with this term are language-dependent
[RequiresType](./Org.OData.Core.V1.xml#L317:~:text=<Term%20Name="-,RequiresType,-")|String|<a name="RequiresType"></a>Terms annotated with this term can only be applied to elements that have a type that is identical to or derived from the given type name
[AppliesViaContainer](./Org.OData.Core.V1.xml#L321:~:text=<Term%20Name="-,AppliesViaContainer,-")|[Tag](#Tag)|<a name="AppliesViaContainer"></a>The target path of an annotation with this term must start with an entity container or the annotation must be embedded within an entity container, entity set or singleton<br>Servers that apply the tagged term based solely on the entity type, structural or navigation property, independently of the container, MAY additionally annotate the EntityType, Property or NavigationProperty model element in order to facilitate the annotation consumption by OData clients.
[ResourcePath](./Org.OData.Core.V1.xml#L332:~:text=<Term%20Name="-,ResourcePath,-")|URL|<a name="ResourcePath"></a>Resource path for entity container child, can be relative to xml:base and the request URL
[DereferenceableIDs](./Org.OData.Core.V1.xml#L337:~:text=<Term%20Name="-,DereferenceableIDs,-")|[Tag](#Tag)|<a name="DereferenceableIDs"></a>Entity-ids are URLs that locate the identified entity
[ConventionalIDs](./Org.OData.Core.V1.xml#L341:~:text=<Term%20Name="-,ConventionalIDs,-")|[Tag](#Tag)|<a name="ConventionalIDs"></a>Entity-ids follow OData URL conventions
[Permissions](./Org.OData.Core.V1.xml#L347:~:text=<Term%20Name="-,Permissions,-")|[Permission](#Permission)|<a name="Permissions"></a>Permissions for accessing a resource
[ContentID](./Org.OData.Core.V1.xml#L370:~:text=<Term%20Name="-,ContentID,-")|String|<a name="ContentID"></a>A unique identifier for nested entities within a request.
[DefaultNamespace](./Org.OData.Core.V1.xml#L376:~:text=<Term%20Name="-,DefaultNamespace,-")|[Tag](#Tag)|<a name="DefaultNamespace"></a>Functions, actions and types in this namespace can be referenced in URLs with or without namespace- or alias- qualification.<br>Data Modelers should ensure uniqueness of schema children across all default namespaces, and should avoid naming bound functions, actions, or derived types with the same name as a structural or navigational property of the type.
[Immutable](./Org.OData.Core.V1.xml#L381:~:text=<Term%20Name="-,Immutable,-")|[Tag](#Tag)|<a name="Immutable"></a>A value for this non-key property can be provided by the client on insert and remains unchanged on update
[Computed](./Org.OData.Core.V1.xml#L385:~:text=<Term%20Name="-,Computed,-")|[Tag](#Tag)|<a name="Computed"></a>A value for this property is generated on both insert and update
[ComputedDefaultValue](./Org.OData.Core.V1.xml#L389:~:text=<Term%20Name="-,ComputedDefaultValue,-")|[Tag](#Tag)|<a name="ComputedDefaultValue"></a>A value for this property can be provided by the client on insert and update. If no value is provided on insert, a non-static default value is generated
[IsURL](./Org.OData.Core.V1.xml#L393:~:text=<Term%20Name="-,IsURL,-")|[Tag](#Tag)|<a name="IsURL"></a>Properties and terms annotated with this term MUST contain a valid URL
[AcceptableMediaTypes](./Org.OData.Core.V1.xml#L398:~:text=<Term%20Name="-,AcceptableMediaTypes,-")|\[MediaType\]|<a name="AcceptableMediaTypes"></a>Lists the MIME types acceptable for the annotated entity type marked with HasStream="true" or the annotated binary, stream, or string property or term.<br>The annotation of a TypeDefinition propagates to the model elements having this type
[MediaType](./Org.OData.Core.V1.xml#L404:~:text=<Term%20Name="-,MediaType,-")|MediaType?|<a name="MediaType"></a>The media type of the values of a binary or string or stream property or term.<br>The annotation of a TypeDefinition propagates to the model elements having this type
[IsMediaType](./Org.OData.Core.V1.xml#L410:~:text=<Term%20Name="-,IsMediaType,-")|[Tag](#Tag)|<a name="IsMediaType"></a>Properties and terms annotated with this term MUST contain a valid MIME type
[ContentDisposition](./Org.OData.Core.V1.xml#L415:~:text=<Term%20Name="-,ContentDisposition,-")|[ContentDispositionType](#ContentDispositionType)|<a name="ContentDisposition"></a>The content disposition of a media resource or a binary or stream property or term
[OptimisticConcurrency](./Org.OData.Core.V1.xml#L428:~:text=<Term%20Name="-,OptimisticConcurrency,-")|\[PropertyPath\]|<a name="OptimisticConcurrency"></a>Data modification requires the use of ETags. A non-empty collection contains the set of properties that are used to compute the ETag. An empty collection means that the service won't tell how it computes the ETag.
[AdditionalProperties](./Org.OData.Core.V1.xml#L432:~:text=<Term%20Name="-,AdditionalProperties,-")|[Tag](#Tag)|<a name="AdditionalProperties"></a>Instances of this type may contain properties in addition to those declared in $metadata<br>If specified as false clients can assume that instances will not contain dynamic properties, irrespective of the value of the OpenType attribute.
[AutoExpand](./Org.OData.Core.V1.xml#L437:~:text=<Term%20Name="-,AutoExpand,-")|[Tag](#Tag)|<a name="AutoExpand"></a>The service will automatically expand this stream or navigation property even if not requested with $expand
[AutoExpandReferences](./Org.OData.Core.V1.xml#L441:~:text=<Term%20Name="-,AutoExpandReferences,-")|[Tag](#Tag)|<a name="AutoExpandReferences"></a>The service will automatically expand this navigation property as entity references even if not requested with $expand=.../$ref
[MayImplement](./Org.OData.Core.V1.xml#L445:~:text=<Term%20Name="-,MayImplement,-")|\[[QualifiedTypeName](#QualifiedTypeName)\]|<a name="MayImplement"></a>A collection of qualified type names outside of the type hierarchy that instances of this type might be addressable as by using a type-cast segment.
[Ordered](./Org.OData.Core.V1.xml#L461:~:text=<Term%20Name="-,Ordered,-")|[Tag](#Tag)|<a name="Ordered"></a>Collection has a stable order. Ordered collections of primitive or complex types can be indexed by ordinal.
[PositionalInsert](./Org.OData.Core.V1.xml#L465:~:text=<Term%20Name="-,PositionalInsert,-")|[Tag](#Tag)|<a name="PositionalInsert"></a>Items can be inserted at a given ordinal index.
[AlternateKeys](./Org.OData.Core.V1.xml#L469:~:text=<Term%20Name="-,AlternateKeys,-")|\[[AlternateKey](#AlternateKey)\]|<a name="AlternateKeys"></a>Communicates available alternate keys
[OptionalParameter](./Org.OData.Core.V1.xml#L497:~:text=<Term%20Name="-,OptionalParameter,-")|[OptionalParameterType](#OptionalParameterType)|<a name="OptionalParameter"></a>Supplying a value for the action or function parameter is optional.<br>All parameters marked as optional must come after any parameters not marked as optional. The binding parameter must not be marked as optional.
[OperationAvailable](./Org.OData.Core.V1.xml#L508:~:text=<Term%20Name="-,OperationAvailable,-")|Boolean?|<a name="OperationAvailable"></a>Action or function is available<br>The annotation value will usually be an expression, e.g. using properties of the binding parameter type for instance-dependent availability, or using properties of a singleton for global availability. The static value `null` means that availability cannot be determined upfront and is instead expressed as an operation advertisement.
[SymbolicName](./Org.OData.Core.V1.xml#L519:~:text=<Term%20Name="-,SymbolicName,-")|[SimpleIdentifier](#SimpleIdentifier)|<a name="SymbolicName"></a>A symbolic name for a model element
[GeometryFeature](./Org.OData.Core.V1.xml#L527:~:text=<Term%20Name="-,GeometryFeature,-")|[GeometryFeatureType?](#GeometryFeatureType)|<a name="GeometryFeature"></a>A [Feature Object](https://datatracker.ietf.org/doc/html/rfc7946#section-3.2) represents a spatially bounded thing

## <a name="RevisionType"></a>[RevisionType](./Org.OData.Core.V1.xml#L80:~:text=<ComplexType%20Name="-,RevisionType,-")


Property|Type|Description
:-------|:---|:----------
[Version](./Org.OData.Core.V1.xml#L81:~:text=<ComplexType%20Name="-,RevisionType,-")|String?|The schema version with which this revision was first published
[Kind](./Org.OData.Core.V1.xml#L84:~:text=<ComplexType%20Name="-,RevisionType,-")|[RevisionKind](#RevisionKind)|The kind of revision
[Description](./Org.OData.Core.V1.xml#L87:~:text=<ComplexType%20Name="-,RevisionType,-")|String|Text describing the reason for the revision

## <a name="RevisionKind"></a>[RevisionKind](./Org.OData.Core.V1.xml#L91:~:text=<EnumType%20Name="-,RevisionKind,-")


Member|Value|Description
:-----|----:|:----------
[Added](./Org.OData.Core.V1.xml#L92:~:text=<EnumType%20Name="-,RevisionKind,-")|0|Model element was added
[Modified](./Org.OData.Core.V1.xml#L95:~:text=<EnumType%20Name="-,RevisionKind,-")|1|Model element was modified
[Deprecated](./Org.OData.Core.V1.xml#L98:~:text=<EnumType%20Name="-,RevisionKind,-")|2|Model element was deprecated

## <a name="Link"></a>[Link](./Org.OData.Core.V1.xml#L118:~:text=<ComplexType%20Name="-,Link,-")
The Link term is inspired by the `atom:link` element, see [RFC4287](https://tools.ietf.org/html/rfc4287#section-4.2.7), and the `Link` HTTP header, see [RFC5988](https://tools.ietf.org/html/rfc5988)

Property|Type|Description
:-------|:---|:----------
[rel](./Org.OData.Core.V1.xml#L120:~:text=<ComplexType%20Name="-,Link,-")|String|Link relation type, see [IANA Link Relations](http://www.iana.org/assignments/link-relations/link-relations.xhtml)
[href](./Org.OData.Core.V1.xml#L123:~:text=<ComplexType%20Name="-,Link,-")|URL|URL of related information

## <a name="ExampleValue"></a>[ExampleValue](./Org.OData.Core.V1.xml#L169:~:text=<ComplexType%20Name="-,ExampleValue,-")


**Derived Types:**
- [PrimitiveExampleValue](#PrimitiveExampleValue)
- [ComplexExampleValue](#ComplexExampleValue)
- [EntityExampleValue](#EntityExampleValue)
- [ExternalExampleValue](#ExternalExampleValue)

Property|Type|Description
:-------|:---|:----------
[Description](./Org.OData.Core.V1.xml#L170:~:text=<ComplexType%20Name="-,ExampleValue,-")|String?|Description of the example value

## <a name="PrimitiveExampleValue"></a>[PrimitiveExampleValue](./Org.OData.Core.V1.xml#L174:~:text=<ComplexType%20Name="-,PrimitiveExampleValue,-"): [ExampleValue](#ExampleValue)


Property|Type|Description
:-------|:---|:----------
[*Description*](./Org.OData.Core.V1.xml#L170:~:text=<ComplexType%20Name="-,ExampleValue,-")|String?|Description of the example value
[Value](./Org.OData.Core.V1.xml#L175:~:text=<ComplexType%20Name="-,PrimitiveExampleValue,-")|PrimitiveType|Example value for the custom parameter

## <a name="ComplexExampleValue"></a>[ComplexExampleValue](./Org.OData.Core.V1.xml#L179:~:text=<ComplexType%20Name="-,ComplexExampleValue,-"): [ExampleValue](#ExampleValue)


Property|Type|Description
:-------|:---|:----------
[*Description*](./Org.OData.Core.V1.xml#L170:~:text=<ComplexType%20Name="-,ExampleValue,-")|String?|Description of the example value
[Value](./Org.OData.Core.V1.xml#L180:~:text=<ComplexType%20Name="-,ComplexExampleValue,-")|ComplexType|Example value for the custom parameter

## <a name="EntityExampleValue"></a>[EntityExampleValue](./Org.OData.Core.V1.xml#L184:~:text=<ComplexType%20Name="-,EntityExampleValue,-"): [ExampleValue](#ExampleValue)


Property|Type|Description
:-------|:---|:----------
[*Description*](./Org.OData.Core.V1.xml#L170:~:text=<ComplexType%20Name="-,ExampleValue,-")|String?|Description of the example value
[Value](./Org.OData.Core.V1.xml#L185:~:text=<NavigationProperty%20Name="-,Value,-")|EntityType|Example value for the custom parameter

## <a name="ExternalExampleValue"></a>[ExternalExampleValue](./Org.OData.Core.V1.xml#L189:~:text=<ComplexType%20Name="-,ExternalExampleValue,-"): [ExampleValue](#ExampleValue)


Property|Type|Description
:-------|:---|:----------
[*Description*](./Org.OData.Core.V1.xml#L170:~:text=<ComplexType%20Name="-,ExampleValue,-")|String?|Description of the example value
[ExternalValue](./Org.OData.Core.V1.xml#L190:~:text=<ComplexType%20Name="-,ExternalExampleValue,-")|URL|Url reference to the value in its literal format

## <a name="MessageType"></a>[MessageType](./Org.OData.Core.V1.xml#L201:~:text=<ComplexType%20Name="-,MessageType,-")


Property|Type|Description
:-------|:---|:----------
[code](./Org.OData.Core.V1.xml#L202:~:text=<ComplexType%20Name="-,MessageType,-")|String|Machine-readable, language-independent message code
[message](./Org.OData.Core.V1.xml#L205:~:text=<ComplexType%20Name="-,MessageType,-")|String|Human-readable, language-dependent message text
[severity](./Org.OData.Core.V1.xml#L209:~:text=<ComplexType%20Name="-,MessageType,-")|[MessageSeverity](#MessageSeverity)|Severity of the message
[target](./Org.OData.Core.V1.xml#L212:~:text=<ComplexType%20Name="-,MessageType,-")|String?|A path to the target of the message detail, relative to the annotated instance
[details](./Org.OData.Core.V1.xml#L215:~:text=<ComplexType%20Name="-,MessageType,-")|\[[MessageType](#MessageType)\]|List of detail messages

## <a name="MessageSeverity"></a>[MessageSeverity](./Org.OData.Core.V1.xml#L219:~:text=<TypeDefinition%20Name="-,MessageSeverity,-")
**Type:** String



Allowed Value|Description
:------------|:----------
[success](./Org.OData.Core.V1.xml#L222:~:text=<TypeDefinition%20Name="-,MessageSeverity,-")|Positive feedback - no action required
[info](./Org.OData.Core.V1.xml#L226:~:text=<TypeDefinition%20Name="-,MessageSeverity,-")|Additional information - no action required
[warning](./Org.OData.Core.V1.xml#L230:~:text=<TypeDefinition%20Name="-,MessageSeverity,-")|Warning - action may be required
[error](./Org.OData.Core.V1.xml#L234:~:text=<TypeDefinition%20Name="-,MessageSeverity,-")|Error - action is required

## <a name="ExceptionType"></a>[*ExceptionType*](./Org.OData.Core.V1.xml#L245:~:text=<ComplexType%20Name="-,ExceptionType,-")


**Derived Types:**
- [ValueExceptionType](#ValueExceptionType)
- [ResourceExceptionType](#ResourceExceptionType)
- [DataModificationExceptionType](#DataModificationExceptionType)

Property|Type|Description
:-------|:---|:----------
[info](./Org.OData.Core.V1.xml#L246:~:text=<ComplexType%20Name="-,ExceptionType,-")|[MessageType?](#MessageType)|Information about the exception

## <a name="ValueExceptionType"></a>[ValueExceptionType](./Org.OData.Core.V1.xml#L250:~:text=<ComplexType%20Name="-,ValueExceptionType,-"): [ExceptionType](#ExceptionType)


Property|Type|Description
:-------|:---|:----------
[*info*](./Org.OData.Core.V1.xml#L246:~:text=<ComplexType%20Name="-,ExceptionType,-")|[MessageType?](#MessageType)|Information about the exception
[value](./Org.OData.Core.V1.xml#L251:~:text=<ComplexType%20Name="-,ValueExceptionType,-")|String?|String representation of the exact value

## <a name="ResourceExceptionType"></a>[ResourceExceptionType](./Org.OData.Core.V1.xml#L259:~:text=<ComplexType%20Name="-,ResourceExceptionType,-"): [ExceptionType](#ExceptionType)


Property|Type|Description
:-------|:---|:----------
[*info*](./Org.OData.Core.V1.xml#L246:~:text=<ComplexType%20Name="-,ExceptionType,-")|[MessageType?](#MessageType)|Information about the exception
[retryLink](./Org.OData.Core.V1.xml#L260:~:text=<ComplexType%20Name="-,ResourceExceptionType,-")|URL?|A GET request to this URL retries retrieving the problematic instance

## <a name="DataModificationExceptionType"></a>[DataModificationExceptionType](./Org.OData.Core.V1.xml#L269:~:text=<ComplexType%20Name="-,DataModificationExceptionType,-"): [ExceptionType](#ExceptionType)


Property|Type|Description
:-------|:---|:----------
[*info*](./Org.OData.Core.V1.xml#L246:~:text=<ComplexType%20Name="-,ExceptionType,-")|[MessageType?](#MessageType)|Information about the exception
[failedOperation](./Org.OData.Core.V1.xml#L270:~:text=<ComplexType%20Name="-,DataModificationExceptionType,-")|[DataModificationOperationKind](#DataModificationOperationKind)|The kind of modification operation that failed
[responseCode](./Org.OData.Core.V1.xml#L273:~:text=<ComplexType%20Name="-,DataModificationExceptionType,-")|Int16?|Response code of the failed operation, e.g. 424 for a failed dependency

## <a name="DataModificationOperationKind"></a>[DataModificationOperationKind](./Org.OData.Core.V1.xml#L279:~:text=<EnumType%20Name="-,DataModificationOperationKind,-")


Member|Value|Description
:-----|----:|:----------
[insert](./Org.OData.Core.V1.xml#L280:~:text=<EnumType%20Name="-,DataModificationOperationKind,-")|0|Insert new instance
[update](./Org.OData.Core.V1.xml#L283:~:text=<EnumType%20Name="-,DataModificationOperationKind,-")|1|Update existing instance
[upsert](./Org.OData.Core.V1.xml#L286:~:text=<EnumType%20Name="-,DataModificationOperationKind,-")|2|Insert new instance or update it if it already exists
[delete](./Org.OData.Core.V1.xml#L289:~:text=<EnumType%20Name="-,DataModificationOperationKind,-")|3|Delete existing instance
[invoke](./Org.OData.Core.V1.xml#L292:~:text=<EnumType%20Name="-,DataModificationOperationKind,-")|4|Invoke action or function
[link](./Org.OData.Core.V1.xml#L295:~:text=<EnumType%20Name="-,DataModificationOperationKind,-")|5|Add link between entities
[unlink](./Org.OData.Core.V1.xml#L298:~:text=<EnumType%20Name="-,DataModificationOperationKind,-")|6|Remove link between entities

## <a name="Tag"></a>[Tag](./Org.OData.Core.V1.xml#L311:~:text=<TypeDefinition%20Name="-,Tag,-")
**Type:** Boolean

This is the type to use for all tagging terms

## <a name="Permission"></a>[Permission](./Org.OData.Core.V1.xml#L350:~:text=<EnumType%20Name="-,Permission,-")


Flag Member|Value|Description
:-----|----:|:----------
[None](./Org.OData.Core.V1.xml#L351:~:text=<EnumType%20Name="-,Permission,-")|0|No permissions
[Read](./Org.OData.Core.V1.xml#L354:~:text=<EnumType%20Name="-,Permission,-")|1|Read permission
[Write](./Org.OData.Core.V1.xml#L357:~:text=<EnumType%20Name="-,Permission,-")|2|Write permission
[ReadWrite](./Org.OData.Core.V1.xml#L360:~:text=<EnumType%20Name="-,Permission,-")|3|Read and write permission
[Invoke](./Org.OData.Core.V1.xml#L363:~:text=<EnumType%20Name="-,Permission,-")|4|Permission to invoke actions

## <a name="ContentDispositionType"></a>[ContentDispositionType](./Org.OData.Core.V1.xml#L419:~:text=<ComplexType%20Name="-,ContentDispositionType,-")


Property|Type|Description
:-------|:---|:----------
[Type](./Org.OData.Core.V1.xml#L420:~:text=<ComplexType%20Name="-,ContentDispositionType,-")|String?|The disposition type of the binary or stream value, see [RFC 6266, Disposition Type](https://datatracker.ietf.org/doc/html/rfc6266#section-4.2)
[Filename](./Org.OData.Core.V1.xml#L423:~:text=<ComplexType%20Name="-,ContentDispositionType,-")|String?|The proposed filename for downloading the binary or stream value, see [RFC 6266, Disposition Parameter: 'Filename'](https://datatracker.ietf.org/doc/html/rfc6266#section-4.3)

## <a name="QualifiedTermName"></a>[QualifiedTermName](./Org.OData.Core.V1.xml#L449:~:text=<TypeDefinition%20Name="-,QualifiedTermName,-")
**Type:** String

The qualified name of a term in scope.

## <a name="QualifiedTypeName"></a>[QualifiedTypeName](./Org.OData.Core.V1.xml#L453:~:text=<TypeDefinition%20Name="-,QualifiedTypeName,-")
**Type:** String

The qualified name of a type in scope.

## <a name="QualifiedActionName"></a>[QualifiedActionName](./Org.OData.Core.V1.xml#L457:~:text=<TypeDefinition%20Name="-,QualifiedActionName,-")
**Type:** String

The qualified name of an action in scope.

## <a name="AlternateKey"></a>[AlternateKey](./Org.OData.Core.V1.xml#L472:~:text=<ComplexType%20Name="-,AlternateKey,-")


Property|Type|Description
:-------|:---|:----------
[Key](./Org.OData.Core.V1.xml#L473:~:text=<ComplexType%20Name="-,AlternateKey,-")|\[[PropertyRef](#PropertyRef)\]|The set of properties that make up this key

## <a name="PropertyRef"></a>[PropertyRef](./Org.OData.Core.V1.xml#L477:~:text=<ComplexType%20Name="-,PropertyRef,-")


Property|Type|Description
:-------|:---|:----------
[Name](./Org.OData.Core.V1.xml#L478:~:text=<ComplexType%20Name="-,PropertyRef,-")|PropertyPath|A path expression resolving to a primitive property of the entity type itself or to a primitive property of a complex or navigation property (recursively) of the entity type. The names of the properties in the path are joined together by forward slashes.
[Alias](./Org.OData.Core.V1.xml#L481:~:text=<ComplexType%20Name="-,PropertyRef,-")|String|A SimpleIdentifier that MUST be unique within the set of aliases, structural and navigation properties of the containing entity type that MUST be used in the key predicate of URLs

## <a name="Dictionary"></a>[Dictionary](./Org.OData.Core.V1.xml#L486:~:text=<ComplexType%20Name="-,Dictionary,-")
A dictionary of name-value pairs. Names must be valid property names, values may be restricted to a list of types via an annotation with term `Validation.OpenPropertyTypeConstraint`.


Property|Type
:-------|:---
Any simple identifier | Any type listed in `Validation.OpenPropertyTypeConstraint`, or any type if there is no constraint


## <a name="OptionalParameterType"></a>[OptionalParameterType](./Org.OData.Core.V1.xml#L501:~:text=<ComplexType%20Name="-,OptionalParameterType,-")


Property|Type|Description
:-------|:---|:----------
[DefaultValue](./Org.OData.Core.V1.xml#L502:~:text=<ComplexType%20Name="-,OptionalParameterType,-")|String?|Default value for an optional parameter of primitive or enumeration type, using the same rules as the `cast` function in URLs.<br>If no explicit DefaultValue is specified, the service is free on how to interpret omitting the parameter from the request. For example, a service might interpret an omitted optional parameter `KeyDate` as having the current date.

## <a name="LocalDateTime"></a>[LocalDateTime](./Org.OData.Core.V1.xml#L513:~:text=<TypeDefinition%20Name="-,LocalDateTime,-")
**Type:** String

A string representing a Local Date-Time value with no offset.

## <a name="SimpleIdentifier"></a>[SimpleIdentifier](./Org.OData.Core.V1.xml#L522:~:text=<TypeDefinition%20Name="-,SimpleIdentifier,-")
**Type:** String

A [simple identifier](https://docs.oasis-open.org/odata/odata-csdl-xml/v4.01/odata-csdl-xml-v4.01.html#sec_SimpleIdentifier)

## <a name="GeometryFeatureType"></a>[GeometryFeatureType](./Org.OData.Core.V1.xml#L530:~:text=<ComplexType%20Name="-,GeometryFeatureType,-")
A [Feature Object](https://datatracker.ietf.org/doc/html/rfc7946#section-3.2) represents a spatially bounded thing

Property|Type|Description
:-------|:---|:----------
[geometry](./Org.OData.Core.V1.xml#L532:~:text=<ComplexType%20Name="-,GeometryFeatureType,-")|Geometry?|Location of the Feature
[properties](./Org.OData.Core.V1.xml#L535:~:text=<ComplexType%20Name="-,GeometryFeatureType,-")|[Dictionary?](#Dictionary)|Properties of the Feature
[id](./Org.OData.Core.V1.xml#L538:~:text=<ComplexType%20Name="-,GeometryFeatureType,-")|String?|Commonly used identifer for a Feature
