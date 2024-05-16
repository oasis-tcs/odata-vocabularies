
![OASIS Logo](https://docs.oasis-open.org/templates/OASISLogo-v3.0.png)

-------

# OData Vocabularies Version 4.0

## Committee Specification Draft 02 / Public Review Draft 02

## 28 February 2024

$\hbox{}$

#### This stage:
https://docs.oasis-open.org/odata/odata-vocabularies/v4.0/csprd02/odata-vocabularies-v4.0-csprd02.md (Authoritative) \
https://docs.oasis-open.org/odata/odata-vocabularies/v4.0/csprd02/odata-vocabularies-v4.0-csprd02.html \
https://docs.oasis-open.org/odata/odata-vocabularies/v4.0/csprd02/odata-vocabularies-v4.0-csprd02.pdf

#### Previous stage:
https://docs.oasis-open.org/odata/odata-vocabularies/v4.0/csprd01/odata-vocabularies-v4.0-csprd01.docx (Authoritative) \
https://docs.oasis-open.org/odata/odata-vocabularies/v4.0/csprd01/odata-vocabularies-v4.0-csprd01.html \
https://docs.oasis-open.org/odata/odata-vocabularies/v4.0/csprd01/odata-vocabularies-v4.0-csprd01.pdf

#### Latest stage:
https://docs.oasis-open.org/odata/odata-vocabularies/v4.0/odata-vocabularies-v4.0.docx (Authoritative) \
https://docs.oasis-open.org/odata/odata-vocabularies/v4.0/odata-vocabularies-v4.0.html \
https://docs.oasis-open.org/odata/odata-vocabularies/v4.0/odata-vocabularies-v4.0.pdf

#### Technical Committee:
[OASIS Open Data Protocol (OData) TC](https://www.oasis-open.org/committees/odata/)

#### Chairs:

Ralf Handl (ralf.handl@sap.com), [SAP SE](http://www.sap.com/) \
Michael Pizzo (mikep@microsoft.com), [Microsoft](http://www.microsoft.com/)

#### Editors:

Ralf Handl (ralf.handl@sap.com), [SAP SE](http://www.sap.com/) \
Michael Pizzo (mikep@microsoft.com), [Microsoft](http://www.microsoft.com/) \
Heiko Theißen (heiko.theissen@sap.com), [SAP SE](http://www.sap.com/)

#### <a name="RelatedWork">Related work:</a>
This specification replaces or supersedes:
OData Vocabularies Version 4.0. Edited by Ralf Handl, Michael Pizzo, and Ram Jeyaraman. 08 December 2016. OASIS Committee Specification Draft 01 / Public Review Draft 01. http://docs.oasis-open.org/odata/odata-vocabularies/v4.0/csprd01/odata-vocabularies-v4.0-csprd01.html. Latest version: http://docs.oasis-open.org/odata/odata-vocabularies/v4.0/odata-vocabularies-v4.0.html.

This specification is related to:
* _OData Version 4.02_. Edited by Michael Pizzo, Ralf Handl, and Heiko Theißen. A multi-part Work Product that includes:
  * _OData Version 4.02 Part 1: Protocol_. Latest stage. https://docs.oasis-open.org/odata/odata/v4.02/odata-v4.02-part1-protocol.html
  * _OData Version 4.02 Part 2: URL Conventions_. Latest stage. https://docs.oasis-open.org/odata/odata/v4.02/odata-v4.02-part2-url-conventions.html
  * _ABNF components: OData ABNF Construction Rules Version 4.02 and OData ABNF Test Cases_. https://docs.oasis-open.org/odata/odata/v4.02/csprd02/abnf/
* _OData Vocabularies Version 4.0_. Edited by Michael Pizzo, Ralf Handl, and Ram Jeyaraman. Latest stage: https://docs.oasis-open.org/odata/odata-vocabularies/v4.0/odata-vocabularies-v4.0.html
* _OData Common Schema Definition Language (CSDL) JSON Representation Version 4.02_. Edited by Michael Pizzo, Ralf Handl, and Heiko Theißen. Latest stage: https://docs.oasis-open.org/odata/odata-csdl-json/v4.02/odata-csdl-json-v4.02.html
* _OData Common Schema Definition Language (CSDL) XML Representation Version 4.02_. Edited by Michael Pizzo, Ralf Handl, and Heiko Theißen. Latest stage: https://docs.oasis-open.org/odata/odata-csdl-xml/v4.02/odata-csdl-xml-v4.02.html

#### Abstract:
This prose specification describes a set of OData vocabularies maintained by the OASIS OData Technical Committee. These vocabulary components are continuously evolved. The latest work-in-progress revisions are available at the odata-vocabularies OASIS TC GitHub repository: https://github.com/oasis-tcs/odata-vocabularies.

#### Status:
This document was last revised or approved by the OASIS Open Data Protocol (OData) TC on the above date. The level of approval is also listed above. Check the "Latest stage" location noted above for possible later revisions of this document. Any other numbered Versions and other technical work produced by the Technical Committee (TC) are listed at https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=odata#technical.

TC members should send comments on this specification to the TC's email list. Others should send comments to the TC's public comment list, after subscribing to it by following the instructions at the "<a href="https://www.oasis-open.org/committees/comments/index.php?wg_abbrev=odata">Send A Comment</a>" button on the TC's web page at https://www.oasis-open.org/committees/odata/.

This specification is provided under the [RF on RAND Terms Mode](https://www.oasis-open.org/policies-guidelines/ipr/#RF-on-RAND-Mode) of the [OASIS IPR Policy](https://www.oasis-open.org/policies-guidelines/ipr/), the mode chosen when the Technical Committee was established. For information on whether any patents have been disclosed that may be essential to implementing this specification, and any offers of patent licensing terms, please refer to the Intellectual Property Rights section of the TC's web page (https://www.oasis-open.org/committees/odata/ipr.php).

Note that any machine-readable content ([Computer Language Definitions](https://www.oasis-open.org/policies-guidelines/tc-process-2017-05-26/#wpComponentsCompLang)) declared Normative for this Work Product is provided in separate plain text files. In the event of a discrepancy between any such plain text file and display content in the Work Product's prose narrative document(s), the content in the separate plain text file prevails.

#### Key words:
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in BCP 14 [RFC2119](#rfc2119) and [RFC8174](#rfc8174) when, and only when, they appear in all capitals, as shown here.

#### Citation format:
When referencing this specification the following citation format should be used:

**[OData-Vocabularies-v4.0]**

_OData Vocabularies Version 4.0_.
Edited by Ralf Handl, Michael Pizzo, and Heiko Theißen. 28 February 2024. OASIS Committee Specification Draft 02 / Public Review Draft 02.
https://docs.oasis-open.org/odata/odata-vocabularies/v4.0/csprd02/odata-vocabularies-v4.0-csprd02.html.
Latest stage: https://docs.oasis-open.org/odata/odata-vocabularies/v4.0/odata-vocabularies-v4.0.html.

#### Notices
Copyright © OASIS Open 2024. All Rights Reserved.

Distributed under the terms of the OASIS [IPR Policy](https://www.oasis-open.org/policies-guidelines/ipr/).

The name "OASIS" is a trademark of [OASIS](https://www.oasis-open.org/), the owner and developer of this specification, and should be used only to refer to the organization and its official outputs.

For complete copyright information please see the full Notices section in an Appendix [below](#Notices).

-------

# Table of Contents

::: toc
- [1 Core Vocabulary](#CoreVocabulary)
- [2 Capabilities Vocabulary](#CapabilitiesVocabulary)
- [3 Measures Vocabulary](#MeasuresVocabulary)
- [4 Validation Vocabulary](#ValidationVocabulary)
- [5 Aggregation Vocabulary](#AggregationVocabulary)
- [6 Authorization Vocabulary](#AuthorizationVocabulary)
- [7 Temporal Vocabulary](#TemporalVocabulary)
:::


-------

# <a name="CoreVocabulary" href="#CoreVocabulary">1 Core Vocabulary</a>

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
[AppliesViaContainer](./Org.OData.Core.V1.xml#L321:~:text=<Term%20Name="-,AppliesViaContainer,-")|[Tag](#Tag)|<a name="AppliesViaContainer"></a>The target path of an annotation with the tagged term MUST start with an entity container or the annotation MUST be embedded within an entity container, entity set or singleton<br>Services MAY additionally annotate a container-independent model element (entity type, property, navigation property) if allowed by the `AppliesTo` property of the term and the annotation applies to all uses of that model element.
[ResourcePath](./Org.OData.Core.V1.xml#L331:~:text=<Term%20Name="-,ResourcePath,-")|URL|<a name="ResourcePath"></a>Resource path for entity container child, can be relative to xml:base and the request URL
[DereferenceableIDs](./Org.OData.Core.V1.xml#L336:~:text=<Term%20Name="-,DereferenceableIDs,-")|[Tag](#Tag)|<a name="DereferenceableIDs"></a>Entity-ids are URLs that locate the identified entity
[ConventionalIDs](./Org.OData.Core.V1.xml#L340:~:text=<Term%20Name="-,ConventionalIDs,-")|[Tag](#Tag)|<a name="ConventionalIDs"></a>Entity-ids follow OData URL conventions
[Permissions](./Org.OData.Core.V1.xml#L346:~:text=<Term%20Name="-,Permissions,-")|[Permission](#Permission)|<a name="Permissions"></a>Permissions for accessing a resource
[ContentID](./Org.OData.Core.V1.xml#L369:~:text=<Term%20Name="-,ContentID,-")|String|<a name="ContentID"></a>A unique identifier for nested entities within a request.
[DefaultNamespace](./Org.OData.Core.V1.xml#L375:~:text=<Term%20Name="-,DefaultNamespace,-")|[Tag](#Tag)|<a name="DefaultNamespace"></a>Functions, actions and types in this namespace can be referenced in URLs with or without namespace- or alias- qualification.<br>Data Modelers should ensure uniqueness of schema children across all default namespaces, and should avoid naming bound functions, actions, or derived types with the same name as a structural or navigational property of the type.
[Immutable](./Org.OData.Core.V1.xml#L380:~:text=<Term%20Name="-,Immutable,-")|[Tag](#Tag)|<a name="Immutable"></a>A value for this non-key property can be provided by the client on insert and remains unchanged on update
[Computed](./Org.OData.Core.V1.xml#L384:~:text=<Term%20Name="-,Computed,-")|[Tag](#Tag)|<a name="Computed"></a>A value for this property is generated on both insert and update
[ComputedDefaultValue](./Org.OData.Core.V1.xml#L388:~:text=<Term%20Name="-,ComputedDefaultValue,-")|[Tag](#Tag)|<a name="ComputedDefaultValue"></a>A value for this property can be provided by the client on insert and update. If no value is provided on insert, a non-static default value is generated
[IsURL](./Org.OData.Core.V1.xml#L392:~:text=<Term%20Name="-,IsURL,-")|[Tag](#Tag)|<a name="IsURL"></a>Properties and terms annotated with this term MUST contain a valid URL
[AcceptableMediaTypes](./Org.OData.Core.V1.xml#L397:~:text=<Term%20Name="-,AcceptableMediaTypes,-")|\[MediaType\]|<a name="AcceptableMediaTypes"></a>Lists the MIME types acceptable for the annotated entity type marked with HasStream="true" or the annotated binary, stream, or string property or term<br>The annotation of a TypeDefinition propagates to the model elements having this type
[MediaType](./Org.OData.Core.V1.xml#L403:~:text=<Term%20Name="-,MediaType,-")|MediaType?|<a name="MediaType"></a>The media type of the media stream of the annotated entity type marked with HasStream="true" or the annotated binary, stream, or string property or term<br>The annotation of a TypeDefinition propagates to the model elements having this type
[IsMediaType](./Org.OData.Core.V1.xml#L409:~:text=<Term%20Name="-,IsMediaType,-")|[Tag](#Tag)|<a name="IsMediaType"></a>Properties and terms annotated with this term MUST contain a valid MIME type
[ContentDisposition](./Org.OData.Core.V1.xml#L414:~:text=<Term%20Name="-,ContentDisposition,-")|[ContentDispositionType](#ContentDispositionType)|<a name="ContentDisposition"></a>The content disposition of the media stream of the annotated entity type marked with HasStream="true" or the annotated binary, stream, or string property or term
[OptimisticConcurrency](./Org.OData.Core.V1.xml#L427:~:text=<Term%20Name="-,OptimisticConcurrency,-")|\[PropertyPath\]|<a name="OptimisticConcurrency"></a>Data modification requires the use of ETags. A non-empty collection contains the set of properties that are used to compute the ETag. An empty collection means that the service won't tell how it computes the ETag
[AdditionalProperties](./Org.OData.Core.V1.xml#L431:~:text=<Term%20Name="-,AdditionalProperties,-")|[Tag](#Tag)|<a name="AdditionalProperties"></a>Instances of this type may contain properties in addition to those declared in $metadata<br>If specified as false clients can assume that instances will not contain dynamic properties, irrespective of the value of the OpenType attribute.
[AutoExpand](./Org.OData.Core.V1.xml#L436:~:text=<Term%20Name="-,AutoExpand,-")|[Tag](#Tag)|<a name="AutoExpand"></a>The service will automatically expand this stream property, navigation property, or the media stream of this media entity type even if not requested with $expand
[AutoExpandReferences](./Org.OData.Core.V1.xml#L440:~:text=<Term%20Name="-,AutoExpandReferences,-")|[Tag](#Tag)|<a name="AutoExpandReferences"></a>The service will automatically expand this navigation property as entity references even if not requested with $expand=.../$ref
[MayImplement](./Org.OData.Core.V1.xml#L444:~:text=<Term%20Name="-,MayImplement,-")|\[[QualifiedTypeName](#QualifiedTypeName)\]|<a name="MayImplement"></a>A collection of qualified type names outside of the type hierarchy that instances of this type might be addressable as by using a type-cast segment.
[Ordered](./Org.OData.Core.V1.xml#L471:~:text=<Term%20Name="-,Ordered,-")|[Tag](#Tag)|<a name="Ordered"></a>Collection has a stable order. Ordered collections of primitive or complex types can be indexed by ordinal.
[PositionalInsert](./Org.OData.Core.V1.xml#L475:~:text=<Term%20Name="-,PositionalInsert,-")|[Tag](#Tag)|<a name="PositionalInsert"></a>Items can be inserted at a given ordinal index.
[AlternateKeys](./Org.OData.Core.V1.xml#L479:~:text=<Term%20Name="-,AlternateKeys,-")|\[[AlternateKey](#AlternateKey)\]|<a name="AlternateKeys"></a>Communicates available alternate keys
[OptionalParameter](./Org.OData.Core.V1.xml#L507:~:text=<Term%20Name="-,OptionalParameter,-")|[OptionalParameterType](#OptionalParameterType)|<a name="OptionalParameter"></a>Supplying a value for the action or function parameter is optional.<br>All parameters marked as optional must come after any parameters not marked as optional. The binding parameter must not be marked as optional.
[OperationAvailable](./Org.OData.Core.V1.xml#L518:~:text=<Term%20Name="-,OperationAvailable,-")|Boolean?|<a name="OperationAvailable"></a>Action or function is available<br>The annotation value will usually be an expression, e.g. using properties of the binding parameter type for instance-dependent availability, or using properties of a singleton for global availability. The static value `null` means that availability cannot be determined upfront and is instead expressed as an operation advertisement.
[RequiresExplicitBinding](./Org.OData.Core.V1.xml#L523:~:text=<Term%20Name="-,RequiresExplicitBinding,-")|[Tag?](#Tag)|<a name="RequiresExplicitBinding"></a>This bound action or function is only available on model elements annotated with the ExplicitOperationBindings term.
[ExplicitOperationBindings](./Org.OData.Core.V1.xml#L527:~:text=<Term%20Name="-,ExplicitOperationBindings,-")|\[[QualifiedBoundOperationName](#QualifiedBoundOperationName)\]|<a name="ExplicitOperationBindings"></a>The qualified names of explicitly bound operations that are supported on the target model element. These operations are in addition to any operations not annotated with RequiresExplicitBinding that are bound to the type of the target model element.
[SymbolicName](./Org.OData.Core.V1.xml#L536:~:text=<Term%20Name="-,SymbolicName,-")|[SimpleIdentifier](#SimpleIdentifier)|<a name="SymbolicName"></a>A symbolic name for a model element
[GeometryFeature](./Org.OData.Core.V1.xml#L545:~:text=<Term%20Name="-,GeometryFeature,-")|[GeometryFeatureType?](#GeometryFeatureType)|<a name="GeometryFeature"></a>A [Feature Object](https://datatracker.ietf.org/doc/html/rfc7946#section-3.2) represents a spatially bounded thing
[AnyStructure](./Org.OData.Core.V1.xml#L561:~:text=<Term%20Name="-,AnyStructure,-")|[Tag](#Tag)|<a name="AnyStructure"></a>Instances of a type are annotated with this tag if they have no common structure in a given response payload<br>The select-list of a context URL MUST be `(@Core.AnyStructure)` if it would otherwise be empty, but this instance annotation SHOULD be omitted from the response value.

<a name="RevisionType"></a>
## [RevisionType](./Org.OData.Core.V1.xml#L80:~:text=<ComplexType%20Name="-,RevisionType,-")


Property|Type|Description
:-------|:---|:----------
[Version](./Org.OData.Core.V1.xml#L81:~:text=<ComplexType%20Name="-,RevisionType,-")|String?|The schema version with which this revision was first published
[Kind](./Org.OData.Core.V1.xml#L84:~:text=<ComplexType%20Name="-,RevisionType,-")|[RevisionKind](#RevisionKind)|The kind of revision
[Description](./Org.OData.Core.V1.xml#L87:~:text=<ComplexType%20Name="-,RevisionType,-")|String|Text describing the reason for the revision

<a name="RevisionKind"></a>
## [RevisionKind](./Org.OData.Core.V1.xml#L91:~:text=<EnumType%20Name="-,RevisionKind,-")


Member|Value|Description
:-----|----:|:----------
[Added](./Org.OData.Core.V1.xml#L92:~:text=<EnumType%20Name="-,RevisionKind,-")|0|Model element was added
[Modified](./Org.OData.Core.V1.xml#L95:~:text=<EnumType%20Name="-,RevisionKind,-")|1|Model element was modified
[Deprecated](./Org.OData.Core.V1.xml#L98:~:text=<EnumType%20Name="-,RevisionKind,-")|2|Model element was deprecated

<a name="Link"></a>
## [Link](./Org.OData.Core.V1.xml#L118:~:text=<ComplexType%20Name="-,Link,-")
The Link term is inspired by the `atom:link` element, see [RFC4287](https://tools.ietf.org/html/rfc4287#section-4.2.7), and the `Link` HTTP header, see [RFC5988](https://tools.ietf.org/html/rfc5988)

Property|Type|Description
:-------|:---|:----------
[rel](./Org.OData.Core.V1.xml#L120:~:text=<ComplexType%20Name="-,Link,-")|String|Link relation type, see [IANA Link Relations](http://www.iana.org/assignments/link-relations/link-relations.xhtml)
[href](./Org.OData.Core.V1.xml#L123:~:text=<ComplexType%20Name="-,Link,-")|URL|URL of related information

<a name="ExampleValue"></a>
## [ExampleValue](./Org.OData.Core.V1.xml#L169:~:text=<ComplexType%20Name="-,ExampleValue,-")


**Derived Types:**
- [PrimitiveExampleValue](#PrimitiveExampleValue)
- [ComplexExampleValue](#ComplexExampleValue)
- [EntityExampleValue](#EntityExampleValue)
- [ExternalExampleValue](#ExternalExampleValue)

Property|Type|Description
:-------|:---|:----------
[Description](./Org.OData.Core.V1.xml#L170:~:text=<ComplexType%20Name="-,ExampleValue,-")|String?|Description of the example value

<a name="PrimitiveExampleValue"></a>
## [PrimitiveExampleValue](./Org.OData.Core.V1.xml#L174:~:text=<ComplexType%20Name="-,PrimitiveExampleValue,-"): [ExampleValue](#ExampleValue)


Property|Type|Description
:-------|:---|:----------
[*Description*](./Org.OData.Core.V1.xml#L170:~:text=<ComplexType%20Name="-,ExampleValue,-")|String?|Description of the example value
[Value](./Org.OData.Core.V1.xml#L175:~:text=<ComplexType%20Name="-,PrimitiveExampleValue,-")|PrimitiveType|Example value for the custom parameter

<a name="ComplexExampleValue"></a>
## [ComplexExampleValue](./Org.OData.Core.V1.xml#L179:~:text=<ComplexType%20Name="-,ComplexExampleValue,-"): [ExampleValue](#ExampleValue)


Property|Type|Description
:-------|:---|:----------
[*Description*](./Org.OData.Core.V1.xml#L170:~:text=<ComplexType%20Name="-,ExampleValue,-")|String?|Description of the example value
[Value](./Org.OData.Core.V1.xml#L180:~:text=<ComplexType%20Name="-,ComplexExampleValue,-")|ComplexType|Example value for the custom parameter

<a name="EntityExampleValue"></a>
## [EntityExampleValue](./Org.OData.Core.V1.xml#L184:~:text=<ComplexType%20Name="-,EntityExampleValue,-"): [ExampleValue](#ExampleValue)


Property|Type|Description
:-------|:---|:----------
[*Description*](./Org.OData.Core.V1.xml#L170:~:text=<ComplexType%20Name="-,ExampleValue,-")|String?|Description of the example value
[Value](./Org.OData.Core.V1.xml#L185:~:text=<NavigationProperty%20Name="-,Value,-")|EntityType|Example value for the custom parameter

<a name="ExternalExampleValue"></a>
## [ExternalExampleValue](./Org.OData.Core.V1.xml#L189:~:text=<ComplexType%20Name="-,ExternalExampleValue,-"): [ExampleValue](#ExampleValue)


Property|Type|Description
:-------|:---|:----------
[*Description*](./Org.OData.Core.V1.xml#L170:~:text=<ComplexType%20Name="-,ExampleValue,-")|String?|Description of the example value
[ExternalValue](./Org.OData.Core.V1.xml#L190:~:text=<ComplexType%20Name="-,ExternalExampleValue,-")|URL|Url reference to the value in its literal format

<a name="MessageType"></a>
## [MessageType](./Org.OData.Core.V1.xml#L201:~:text=<ComplexType%20Name="-,MessageType,-")


Property|Type|Description
:-------|:---|:----------
[code](./Org.OData.Core.V1.xml#L202:~:text=<ComplexType%20Name="-,MessageType,-")|String|Machine-readable, language-independent message code
[message](./Org.OData.Core.V1.xml#L205:~:text=<ComplexType%20Name="-,MessageType,-")|String|Human-readable, language-dependent message text
[severity](./Org.OData.Core.V1.xml#L209:~:text=<ComplexType%20Name="-,MessageType,-")|[MessageSeverity](#MessageSeverity)|Severity of the message
[target](./Org.OData.Core.V1.xml#L212:~:text=<ComplexType%20Name="-,MessageType,-")|String?|A path to the target of the message detail, relative to the annotated instance
[details](./Org.OData.Core.V1.xml#L215:~:text=<ComplexType%20Name="-,MessageType,-")|\[[MessageType](#MessageType)\]|List of detail messages

<a name="MessageSeverity"></a>
## [MessageSeverity](./Org.OData.Core.V1.xml#L219:~:text=<TypeDefinition%20Name="-,MessageSeverity,-")
**Type:** String



Allowed Value|Description
:------------|:----------
[success](./Org.OData.Core.V1.xml#L222:~:text=<TypeDefinition%20Name="-,MessageSeverity,-")|Positive feedback - no action required
[info](./Org.OData.Core.V1.xml#L226:~:text=<TypeDefinition%20Name="-,MessageSeverity,-")|Additional information - no action required
[warning](./Org.OData.Core.V1.xml#L230:~:text=<TypeDefinition%20Name="-,MessageSeverity,-")|Warning - action may be required
[error](./Org.OData.Core.V1.xml#L234:~:text=<TypeDefinition%20Name="-,MessageSeverity,-")|Error - action is required

<a name="ExceptionType"></a>
## [*ExceptionType*](./Org.OData.Core.V1.xml#L245:~:text=<ComplexType%20Name="-,ExceptionType,-")


**Derived Types:**
- [ValueExceptionType](#ValueExceptionType)
- [ResourceExceptionType](#ResourceExceptionType)
- [DataModificationExceptionType](#DataModificationExceptionType)

Property|Type|Description
:-------|:---|:----------
[info](./Org.OData.Core.V1.xml#L246:~:text=<ComplexType%20Name="-,ExceptionType,-")|[MessageType?](#MessageType)|Information about the exception

<a name="ValueExceptionType"></a>
## [ValueExceptionType](./Org.OData.Core.V1.xml#L250:~:text=<ComplexType%20Name="-,ValueExceptionType,-"): [ExceptionType](#ExceptionType)


Property|Type|Description
:-------|:---|:----------
[*info*](./Org.OData.Core.V1.xml#L246:~:text=<ComplexType%20Name="-,ExceptionType,-")|[MessageType?](#MessageType)|Information about the exception
[value](./Org.OData.Core.V1.xml#L251:~:text=<ComplexType%20Name="-,ValueExceptionType,-")|String?|String representation of the exact value

<a name="ResourceExceptionType"></a>
## [ResourceExceptionType](./Org.OData.Core.V1.xml#L259:~:text=<ComplexType%20Name="-,ResourceExceptionType,-"): [ExceptionType](#ExceptionType)


Property|Type|Description
:-------|:---|:----------
[*info*](./Org.OData.Core.V1.xml#L246:~:text=<ComplexType%20Name="-,ExceptionType,-")|[MessageType?](#MessageType)|Information about the exception
[retryLink](./Org.OData.Core.V1.xml#L260:~:text=<ComplexType%20Name="-,ResourceExceptionType,-")|URL?|A GET request to this URL retries retrieving the problematic instance

<a name="DataModificationExceptionType"></a>
## [DataModificationExceptionType](./Org.OData.Core.V1.xml#L269:~:text=<ComplexType%20Name="-,DataModificationExceptionType,-"): [ExceptionType](#ExceptionType)


Property|Type|Description
:-------|:---|:----------
[*info*](./Org.OData.Core.V1.xml#L246:~:text=<ComplexType%20Name="-,ExceptionType,-")|[MessageType?](#MessageType)|Information about the exception
[failedOperation](./Org.OData.Core.V1.xml#L270:~:text=<ComplexType%20Name="-,DataModificationExceptionType,-")|[DataModificationOperationKind](#DataModificationOperationKind)|The kind of modification operation that failed
[responseCode](./Org.OData.Core.V1.xml#L273:~:text=<ComplexType%20Name="-,DataModificationExceptionType,-")|Int16?|Response code of the failed operation, e.g. 424 for a failed dependency

<a name="DataModificationOperationKind"></a>
## [DataModificationOperationKind](./Org.OData.Core.V1.xml#L279:~:text=<EnumType%20Name="-,DataModificationOperationKind,-")


Member|Value|Description
:-----|----:|:----------
[insert](./Org.OData.Core.V1.xml#L280:~:text=<EnumType%20Name="-,DataModificationOperationKind,-")|0|Insert new instance
[update](./Org.OData.Core.V1.xml#L283:~:text=<EnumType%20Name="-,DataModificationOperationKind,-")|1|Update existing instance
[upsert](./Org.OData.Core.V1.xml#L286:~:text=<EnumType%20Name="-,DataModificationOperationKind,-")|2|Insert new instance or update it if it already exists
[delete](./Org.OData.Core.V1.xml#L289:~:text=<EnumType%20Name="-,DataModificationOperationKind,-")|3|Delete existing instance
[invoke](./Org.OData.Core.V1.xml#L292:~:text=<EnumType%20Name="-,DataModificationOperationKind,-")|4|Invoke action or function
[link](./Org.OData.Core.V1.xml#L295:~:text=<EnumType%20Name="-,DataModificationOperationKind,-")|5|Add link between entities
[unlink](./Org.OData.Core.V1.xml#L298:~:text=<EnumType%20Name="-,DataModificationOperationKind,-")|6|Remove link between entities

<a name="Tag"></a>
## [Tag](./Org.OData.Core.V1.xml#L311:~:text=<TypeDefinition%20Name="-,Tag,-")
**Type:** Boolean

This is the type to use for all tagging terms

<a name="Permission"></a>
## [Permission](./Org.OData.Core.V1.xml#L349:~:text=<EnumType%20Name="-,Permission,-")


Flag Member|Value|Description
:-----|----:|:----------
[None](./Org.OData.Core.V1.xml#L350:~:text=<EnumType%20Name="-,Permission,-")|0|No permissions
[Read](./Org.OData.Core.V1.xml#L353:~:text=<EnumType%20Name="-,Permission,-")|1|Read permission
[Write](./Org.OData.Core.V1.xml#L356:~:text=<EnumType%20Name="-,Permission,-")|2|Write permission
[ReadWrite](./Org.OData.Core.V1.xml#L359:~:text=<EnumType%20Name="-,Permission,-")|3|Read and write permission
[Invoke](./Org.OData.Core.V1.xml#L362:~:text=<EnumType%20Name="-,Permission,-")|4|Permission to invoke actions

<a name="ContentDispositionType"></a>
## [ContentDispositionType](./Org.OData.Core.V1.xml#L418:~:text=<ComplexType%20Name="-,ContentDispositionType,-")


Property|Type|Description
:-------|:---|:----------
[Type](./Org.OData.Core.V1.xml#L419:~:text=<ComplexType%20Name="-,ContentDispositionType,-")|String|The disposition type of the binary or stream value, see [RFC 6266, Disposition Type](https://datatracker.ietf.org/doc/html/rfc6266#section-4.2)
[Filename](./Org.OData.Core.V1.xml#L422:~:text=<ComplexType%20Name="-,ContentDispositionType,-")|String?|The proposed filename for downloading the binary or stream value, see [RFC 6266, Disposition Parameter: 'Filename'](https://datatracker.ietf.org/doc/html/rfc6266#section-4.3)

<a name="QualifiedTermName"></a>
## [QualifiedTermName](./Org.OData.Core.V1.xml#L448:~:text=<TypeDefinition%20Name="-,QualifiedTermName,-")
**Type:** String

The qualified name of a term in scope.

<a name="QualifiedTypeName"></a>
## [QualifiedTypeName](./Org.OData.Core.V1.xml#L452:~:text=<TypeDefinition%20Name="-,QualifiedTypeName,-")
**Type:** String

The qualified name of a type in scope.

<a name="QualifiedActionName"></a>
## [QualifiedActionName](./Org.OData.Core.V1.xml#L456:~:text=<TypeDefinition%20Name="-,QualifiedActionName,-")
**Type:** String

The qualified name of an action in scope.

<a name="QualifiedBoundOperationName"></a>
## [QualifiedBoundOperationName](./Org.OData.Core.V1.xml#L460:~:text=<TypeDefinition%20Name="-,QualifiedBoundOperationName,-")
**Type:** String

The qualified name of a bound action or function in scope.

Either
- the qualified name of an action, to indicate the single bound overload with the specified binding parameter type, 
- the qualified name of a function, to indicate all bound overloads with the specified binding parameter type, or 
- the qualified name of a function followed by parentheses containing a comma-separated list of parameter types, in the order of their definition, to identify a single function overload with the first (binding) parameter matching the specified parameter type.
        

<a name="AlternateKey"></a>
## [AlternateKey](./Org.OData.Core.V1.xml#L482:~:text=<ComplexType%20Name="-,AlternateKey,-")


Property|Type|Description
:-------|:---|:----------
[Key](./Org.OData.Core.V1.xml#L483:~:text=<ComplexType%20Name="-,AlternateKey,-")|\[[PropertyRef](#PropertyRef)\]|The set of properties that make up this key

<a name="PropertyRef"></a>
## [PropertyRef](./Org.OData.Core.V1.xml#L487:~:text=<ComplexType%20Name="-,PropertyRef,-")


Property|Type|Description
:-------|:---|:----------
[Name](./Org.OData.Core.V1.xml#L488:~:text=<ComplexType%20Name="-,PropertyRef,-")|PropertyPath|A path expression resolving to a primitive property of the entity type itself or to a primitive property of a complex or navigation property (recursively) of the entity type. The names of the properties in the path are joined together by forward slashes.
[Alias](./Org.OData.Core.V1.xml#L491:~:text=<ComplexType%20Name="-,PropertyRef,-")|String|A SimpleIdentifier that MUST be unique within the set of aliases, structural and navigation properties of the containing entity type that MUST be used in the key predicate of URLs

<a name="Dictionary"></a>
## [Dictionary](./Org.OData.Core.V1.xml#L496:~:text=<ComplexType%20Name="-,Dictionary,-")
A dictionary of name-value pairs. Names must be valid property names, values may be restricted to a list of types via an annotation with term `Validation.OpenPropertyTypeConstraint`.


Property|Type
:-------|:---
Any simple identifier | Any type listed in `Validation.OpenPropertyTypeConstraint`, or any type if there is no constraint


<a name="OptionalParameterType"></a>
## [OptionalParameterType](./Org.OData.Core.V1.xml#L511:~:text=<ComplexType%20Name="-,OptionalParameterType,-")


Property|Type|Description
:-------|:---|:----------
[DefaultValue](./Org.OData.Core.V1.xml#L512:~:text=<ComplexType%20Name="-,OptionalParameterType,-")|String?|Default value for an optional parameter of primitive or enumeration type, using the same rules as the `cast` function in URLs.<br>If no explicit DefaultValue is specified, the service is free on how to interpret omitting the parameter from the request. For example, a service might interpret an omitted optional parameter `KeyDate` as having the current date.

<a name="LocalDateTime"></a>
## [LocalDateTime](./Org.OData.Core.V1.xml#L531:~:text=<TypeDefinition%20Name="-,LocalDateTime,-")
**Type:** String

A string representing a Local Date-Time value with no offset.

<a name="SimpleIdentifier"></a>
## [SimpleIdentifier](./Org.OData.Core.V1.xml#L540:~:text=<TypeDefinition%20Name="-,SimpleIdentifier,-")
**Type:** String

A [simple identifier](https://docs.oasis-open.org/odata/odata-csdl-xml/v4.01/odata-csdl-xml-v4.01.html#sec_SimpleIdentifier)

<a name="GeometryFeatureType"></a>
## [GeometryFeatureType](./Org.OData.Core.V1.xml#L548:~:text=<ComplexType%20Name="-,GeometryFeatureType,-")
A [Feature Object](https://datatracker.ietf.org/doc/html/rfc7946#section-3.2) represents a spatially bounded thing

Property|Type|Description
:-------|:---|:----------
[geometry](./Org.OData.Core.V1.xml#L550:~:text=<ComplexType%20Name="-,GeometryFeatureType,-")|Geometry?|Location of the Feature
[properties](./Org.OData.Core.V1.xml#L553:~:text=<ComplexType%20Name="-,GeometryFeatureType,-")|[Dictionary?](#Dictionary)|Properties of the Feature
[id](./Org.OData.Core.V1.xml#L556:~:text=<ComplexType%20Name="-,GeometryFeatureType,-")|String?|Commonly used identifer for a Feature

-------

# <a name="CapabilitiesVocabulary" href="#CapabilitiesVocabulary">2 Capabilities Vocabulary</a>

**Namespace: [Org.OData.Capabilities.V1](Org.OData.Capabilities.V1.xml)**

Terms describing capabilities of a service


There are some capabilities which are strongly recommended for services to support even
though they are optional. Support for $top and $skip is a good example as
supporting these query options helps with performance of a service and are essential. Such
capabilities are assumed to be default capabilities of an OData service even in
the case that a capabilities annotation doesn’t exist. Capabilities annotations are
mainly expected to be used to explicitly specify that a service doesn’t support such
capabilities. Capabilities annotations can as well be used to declaratively
specify the support of such capabilities.

On the other hand, there are some capabilities that a service may choose to support or
not support and in varying degrees. $filter and $orderby are such good examples.
This vocabulary aims to define terms to specify support or no support for such
capabilities.

A service is assumed to support by default the following capabilities even though an
annotation doesn’t exist:
- Countability ($count)
- Client pageability ($top, $skip)
- Expandability ($expand)
- Indexability by key
- Batch support ($batch)
- Navigability of navigation properties

A service is expected to support the following capabilities. If not supported, the
service is expected to call out the restrictions using annotations:
- Filterability ($filter)
- Sortability ($orderby)
- Queryability of top level entity sets
- Query functions

A client cannot assume that a service supports certain capabilities. A client can try, but
it needs to be prepared to handle an error in case the following capabilities are not
supported:
- Insertability
- Updatability
- Deletability
        


## Terms

Term|Type|Description
:---|:---|:----------
[ConformanceLevel](./Org.OData.Capabilities.V1.xml#L115:~:text=<Term%20Name="-,ConformanceLevel,-")|[ConformanceLevelType](#ConformanceLevelType)|<a name="ConformanceLevel"></a>The conformance level achieved by this service
[SupportedFormats](./Org.OData.Capabilities.V1.xml#L132:~:text=<Term%20Name="-,SupportedFormats,-")|\[MediaType\]|<a name="SupportedFormats"></a>Media types of supported formats, including format parameters
[SupportedMetadataFormats](./Org.OData.Capabilities.V1.xml#L137:~:text=<Term%20Name="-,SupportedMetadataFormats,-")|\[MediaType\]|<a name="SupportedMetadataFormats"></a>Media types of supported formats for $metadata, including format parameters
[AcceptableEncodings](./Org.OData.Capabilities.V1.xml#L142:~:text=<Term%20Name="-,AcceptableEncodings,-")|\[String\]|<a name="AcceptableEncodings"></a>List of acceptable compression methods for ($batch) requests, e.g. gzip
[AsynchronousRequestsSupported](./Org.OData.Capabilities.V1.xml#L148:~:text=<Term%20Name="-,AsynchronousRequestsSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AsynchronousRequestsSupported"></a>Service supports the asynchronous request preference
[BatchContinueOnErrorSupported](./Org.OData.Capabilities.V1.xml#L152:~:text=<Term%20Name="-,BatchContinueOnErrorSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchContinueOnErrorSupported"></a>Service supports the continue on error preference. Supports $batch requests. Services that apply the BatchContinueOnErrorSupported term should also specify the ContinueOnErrorSupported property from the BatchSupport term.
[IsolationSupported](./Org.OData.Capabilities.V1.xml#L156:~:text=<Term%20Name="-,IsolationSupported,-")|[IsolationLevel](#IsolationLevel)|<a name="IsolationSupported"></a>Supported odata.isolation levels
[CrossJoinSupported](./Org.OData.Capabilities.V1.xml#L165:~:text=<Term%20Name="-,CrossJoinSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="CrossJoinSupported"></a>Supports cross joins for the entity sets in this container
[CallbackSupported](./Org.OData.Capabilities.V1.xml#L169:~:text=<Term%20Name="-,CallbackSupported,-")|[CallbackType](#CallbackType)|<a name="CallbackSupported"></a>Supports callbacks for the specified protocols
[ChangeTracking](./Org.OData.Capabilities.V1.xml#L191:~:text=<Term%20Name="-,ChangeTracking,-")|[ChangeTrackingType](#ChangeTrackingType)|<a name="ChangeTracking"></a>Change tracking capabilities of this service or entity set
[CountRestrictions](./Org.OData.Capabilities.V1.xml#L212:~:text=<Term%20Name="-,CountRestrictions,-")|[CountRestrictionsType](#CountRestrictionsType)|<a name="CountRestrictions"></a>Restrictions on /$count path suffix and $count=true system query option
[NavigationRestrictions](./Org.OData.Capabilities.V1.xml#L230:~:text=<Term%20Name="-,NavigationRestrictions,-")|[NavigationRestrictionsType](#NavigationRestrictionsType)|<a name="NavigationRestrictions"></a>Restrictions on navigating properties according to OData URL conventions<br>Restrictions specified on an entity set are valid whether the request is directly to the entity set or through a navigation property bound to that entity set. Services can specify a different set of restrictions specific to a path, in which case the more specific restrictions take precedence.
[IndexableByKey](./Org.OData.Capabilities.V1.xml#L321:~:text=<Term%20Name="-,IndexableByKey,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="IndexableByKey"></a>Supports key values according to OData URL conventions
[TopSupported](./Org.OData.Capabilities.V1.xml#L326:~:text=<Term%20Name="-,TopSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="TopSupported"></a>Supports $top
[SkipSupported](./Org.OData.Capabilities.V1.xml#L331:~:text=<Term%20Name="-,SkipSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="SkipSupported"></a>Supports $skip
[ComputeSupported](./Org.OData.Capabilities.V1.xml#L336:~:text=<Term%20Name="-,ComputeSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="ComputeSupported"></a>Supports $compute
[SelectSupport](./Org.OData.Capabilities.V1.xml#L341:~:text=<Term%20Name="-,SelectSupport,-")|[SelectSupportType](#SelectSupportType)|<a name="SelectSupport"></a>Support for $select and nested query options within $select
[BatchSupported](./Org.OData.Capabilities.V1.xml#L378:~:text=<Term%20Name="-,BatchSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="BatchSupported"></a>Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.
[BatchSupport](./Org.OData.Capabilities.V1.xml#L382:~:text=<Term%20Name="-,BatchSupport,-")|[BatchSupportType](#BatchSupportType)|<a name="BatchSupport"></a>Batch Support for the service
[FilterFunctions](./Org.OData.Capabilities.V1.xml#L428:~:text=<Term%20Name="-,FilterFunctions,-")|\[String\]|<a name="FilterFunctions"></a>List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](./Org.OData.Capabilities.V1.xml#L434:~:text=<Term%20Name="-,FilterRestrictions,-")|[FilterRestrictionsType](#FilterRestrictionsType)|<a name="FilterRestrictions"></a>Restrictions on filter expressions
[SortRestrictions](./Org.OData.Capabilities.V1.xml#L506:~:text=<Term%20Name="-,SortRestrictions,-")|[SortRestrictionsType](#SortRestrictionsType)|<a name="SortRestrictions"></a>Restrictions on orderby expressions
[ExpandRestrictions](./Org.OData.Capabilities.V1.xml#L532:~:text=<Term%20Name="-,ExpandRestrictions,-")|[ExpandRestrictionsType](#ExpandRestrictionsType)|<a name="ExpandRestrictions"></a>Restrictions on expand expressions
[SearchRestrictions](./Org.OData.Capabilities.V1.xml#L562:~:text=<Term%20Name="-,SearchRestrictions,-")|[SearchRestrictionsType](#SearchRestrictionsType)|<a name="SearchRestrictions"></a>Restrictions on search expressions
[KeyAsSegmentSupported](./Org.OData.Capabilities.V1.xml#L600:~:text=<Term%20Name="-,KeyAsSegmentSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="KeyAsSegmentSupported"></a>Supports [key-as-segment convention](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_KeyasSegmentConvention) for addressing entities within a collection
[QuerySegmentSupported](./Org.OData.Capabilities.V1.xml#L604:~:text=<Term%20Name="-,QuerySegmentSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="QuerySegmentSupported"></a>Supports [passing query options in the request body](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part2-url-conventions.html#sec_PassingQueryOptionsintheRequestBody)
[InsertRestrictions](./Org.OData.Capabilities.V1.xml#L610:~:text=<Term%20Name="-,InsertRestrictions,-")|[InsertRestrictionsType](#InsertRestrictionsType)|<a name="InsertRestrictions"></a>Restrictions on insert operations
[DeepInsertSupport](./Org.OData.Capabilities.V1.xml#L689:~:text=<Term%20Name="-,DeepInsertSupport,-")|[DeepInsertSupportType?](#DeepInsertSupportType)|<a name="DeepInsertSupport"></a>Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](./Org.OData.Capabilities.V1.xml#L702:~:text=<Term%20Name="-,UpdateRestrictions,-")|[UpdateRestrictionsType](#UpdateRestrictionsType)|<a name="UpdateRestrictions"></a>Restrictions on update operations
[DeepUpdateSupport](./Org.OData.Capabilities.V1.xml#L788:~:text=<Term%20Name="-,DeepUpdateSupport,-")|[DeepUpdateSupportType](#DeepUpdateSupportType)|<a name="DeepUpdateSupport"></a>Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](./Org.OData.Capabilities.V1.xml#L801:~:text=<Term%20Name="-,DeleteRestrictions,-")|[DeleteRestrictionsType](#DeleteRestrictionsType)|<a name="DeleteRestrictions"></a>Restrictions on delete operations
[CollectionPropertyRestrictions](./Org.OData.Capabilities.V1.xml#L845:~:text=<Term%20Name="-,CollectionPropertyRestrictions,-")|\[[CollectionPropertyRestrictionsType](#CollectionPropertyRestrictionsType)\]|<a name="CollectionPropertyRestrictions"></a>Describes restrictions on operations applied to collection-valued structural properties
[OperationRestrictions](./Org.OData.Capabilities.V1.xml#L886:~:text=<Term%20Name="-,OperationRestrictions,-")|[OperationRestrictionsType](#OperationRestrictionsType)|<a name="OperationRestrictions"></a>Restrictions for function or action operation
[AnnotationValuesInQuerySupported](./Org.OData.Capabilities.V1.xml#L906:~:text=<Term%20Name="-,AnnotationValuesInQuerySupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="AnnotationValuesInQuerySupported"></a>Supports annotation values within system query options
[ModificationQueryOptions](./Org.OData.Capabilities.V1.xml#L910:~:text=<Term%20Name="-,ModificationQueryOptions,-")|[ModificationQueryOptionsType](#ModificationQueryOptionsType)|<a name="ModificationQueryOptions"></a>Support for query options with modification requests (insert, update, action invocation)
[ReadRestrictions](./Org.OData.Capabilities.V1.xml#L934:~:text=<Term%20Name="-,ReadRestrictions,-")|[ReadRestrictionsType](#ReadRestrictionsType)|<a name="ReadRestrictions"></a>Restrictions for retrieving a collection of entities, retrieving a singleton instance.
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L976:~:text=<Term%20Name="-,CustomHeaders,-")|\[[CustomParameter](#CustomParameter)\]|<a name="CustomHeaders"></a>Custom headers that are supported/required for the annotated resource ([Example](./Org.OData.Capabilities.V1.xml#L978))
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L1002:~:text=<Term%20Name="-,CustomQueryOptions,-")|\[[CustomParameter](#CustomParameter)\]|<a name="CustomQueryOptions"></a>Custom query options that are supported/required for the annotated resource ([Example](./Org.OData.Capabilities.V1.xml#L1005))<br>If the entity container is annotated, the query option is supported/required by all resources in that container.
[MediaLocationUpdateSupported](./Org.OData.Capabilities.V1.xml#L1054:~:text=<Term%20Name="-,MediaLocationUpdateSupported,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="MediaLocationUpdateSupported"></a>Stream property or media stream supports update of its media edit URL and/or media read URL
[DefaultCapabilities](./Org.OData.Capabilities.V1.xml#L1059:~:text=<Term%20Name="-,DefaultCapabilities,-")|[DefaultCapabilitiesType](#DefaultCapabilitiesType)|<a name="DefaultCapabilities"></a>Default capability settings for all collection-valued resources in the container<br><p>Annotating a specific capability term, which is included as property in <code>DefaultCapabilitiesType</code>, for a specific collection-valued resource overrides the default capability with the specified properties using PATCH semantics:</p> <ul> <li>Primitive or collection-valued properties specified in the specific capability term replace the corresponding properties specified in <code>DefaultCapabilities</code></li> <li>Complex-valued properties specified in the specific capability term override the corresponding properties specified in <code>DefaultCapabilities</code> using PATCH semantics recursively</li> <li>Properties specified neither in the specific term nor in <code>DefaultCapabilities</code> have their default value</li> </ul> 

<a name="ConformanceLevelType"></a>
## [ConformanceLevelType](./Org.OData.Capabilities.V1.xml#L118:~:text=<EnumType%20Name="-,ConformanceLevelType,-")


Member|Value|Description
:-----|----:|:----------
[Minimal](./Org.OData.Capabilities.V1.xml#L119:~:text=<EnumType%20Name="-,ConformanceLevelType,-")|0|Minimal conformance level
[Intermediate](./Org.OData.Capabilities.V1.xml#L122:~:text=<EnumType%20Name="-,ConformanceLevelType,-")|1|Intermediate conformance level
[Advanced](./Org.OData.Capabilities.V1.xml#L125:~:text=<EnumType%20Name="-,ConformanceLevelType,-")|2|Advanced conformance level

<a name="IsolationLevel"></a>
## [IsolationLevel](./Org.OData.Capabilities.V1.xml#L159:~:text=<EnumType%20Name="-,IsolationLevel,-")


Flag Member|Value|Description
:-----|----:|:----------
[Snapshot](./Org.OData.Capabilities.V1.xml#L160:~:text=<EnumType%20Name="-,IsolationLevel,-")|1|All data returned for a request, including multiple requests within a batch or results retrieved across multiple pages, will be consistent as of a single point in time

<a name="CallbackType"></a>
## [CallbackType](./Org.OData.Capabilities.V1.xml#L172:~:text=<ComplexType%20Name="-,CallbackType,-")
A non-empty collection lists the full set of supported protocols. A empty collection means 'only HTTP is supported'

Property|Type|Description
:-------|:---|:----------
[CallbackProtocols](./Org.OData.Capabilities.V1.xml#L173:~:text=<ComplexType%20Name="-,CallbackType,-")|\[[CallbackProtocol](#CallbackProtocol)\]|List of supported callback protocols, e.g. `http` or `wss`

<a name="CallbackProtocol"></a>
## [CallbackProtocol](./Org.OData.Capabilities.V1.xml#L178:~:text=<ComplexType%20Name="-,CallbackProtocol,-")


Property|Type|Description
:-------|:---|:----------
[Id](./Org.OData.Capabilities.V1.xml#L179:~:text=<ComplexType%20Name="-,CallbackProtocol,-")|String?|Protocol Identifier
[UrlTemplate](./Org.OData.Capabilities.V1.xml#L182:~:text=<ComplexType%20Name="-,CallbackProtocol,-")|String?|URL Template including parameters. Parameters are enclosed in curly braces {} as defined in RFC6570
[DocumentationUrl](./Org.OData.Capabilities.V1.xml#L185:~:text=<ComplexType%20Name="-,CallbackProtocol,-")|URL?|Human readable description of the meaning of the URL Template parameters

<a name="ChangeTrackingBase"></a>
## [ChangeTrackingBase](./Org.OData.Capabilities.V1.xml#L194:~:text=<ComplexType%20Name="-,ChangeTrackingBase,-")


**Derived Types:**
- [ChangeTrackingType](#ChangeTrackingType)

Property|Type|Description
:-------|:---|:----------
[Supported](./Org.OData.Capabilities.V1.xml#L195:~:text=<ComplexType%20Name="-,ChangeTrackingBase,-")|Boolean|odata.track-changes preference is supported

<a name="ChangeTrackingType"></a>
## [ChangeTrackingType](./Org.OData.Capabilities.V1.xml#L199:~:text=<ComplexType%20Name="-,ChangeTrackingType,-"): [ChangeTrackingBase](#ChangeTrackingBase)


Property|Type|Description
:-------|:---|:----------
[*Supported*](./Org.OData.Capabilities.V1.xml#L195:~:text=<ComplexType%20Name="-,ChangeTrackingBase,-")|Boolean|odata.track-changes preference is supported
[FilterableProperties](./Org.OData.Capabilities.V1.xml#L200:~:text=<ComplexType%20Name="-,ChangeTrackingType,-")|\[PropertyPath\]|Change tracking supports filters on these properties<br>If no properties are specified or FilterableProperties is omitted, clients cannot assume support for filtering on any properties in combination with change tracking.
[ExpandableProperties](./Org.OData.Capabilities.V1.xml#L204:~:text=<ComplexType%20Name="-,ChangeTrackingType,-")|\[NavigationPropertyPath\]|Change tracking supports these properties expanded<br>If no properties are specified or ExpandableProperties is omitted, clients cannot assume support for expanding any properties in combination with change tracking.

<a name="CountRestrictionsBase"></a>
## [CountRestrictionsBase](./Org.OData.Capabilities.V1.xml#L216:~:text=<ComplexType%20Name="-,CountRestrictionsBase,-")


**Derived Types:**
- [CountRestrictionsType](#CountRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Countable](./Org.OData.Capabilities.V1.xml#L217:~:text=<ComplexType%20Name="-,CountRestrictionsBase,-")|Boolean|Instances can be counted in requests targeting a collection

<a name="CountRestrictionsType"></a>
## [CountRestrictionsType](./Org.OData.Capabilities.V1.xml#L221:~:text=<ComplexType%20Name="-,CountRestrictionsType,-"): [CountRestrictionsBase](#CountRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Countable*](./Org.OData.Capabilities.V1.xml#L217:~:text=<ComplexType%20Name="-,CountRestrictionsBase,-")|Boolean|Instances can be counted in requests targeting a collection
[NonCountableProperties](./Org.OData.Capabilities.V1.xml#L222:~:text=<ComplexType%20Name="-,CountRestrictionsType,-")|\[PropertyPath\]|Members of these collection properties cannot be counted
[NonCountableNavigationProperties](./Org.OData.Capabilities.V1.xml#L225:~:text=<ComplexType%20Name="-,CountRestrictionsType,-")|\[NavigationPropertyPath\]|Members of these navigation properties cannot be counted

<a name="NavigationRestrictionsType"></a>
## [NavigationRestrictionsType](./Org.OData.Capabilities.V1.xml#L235:~:text=<ComplexType%20Name="-,NavigationRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[Navigability](./Org.OData.Capabilities.V1.xml#L236:~:text=<ComplexType%20Name="-,NavigationRestrictionsType,-")|[NavigationType?](#NavigationType)|Default navigability for all navigation properties of the annotation target. Individual navigation properties can override this value via `RestrictedProperties/Navigability`.
[RestrictedProperties](./Org.OData.Capabilities.V1.xml#L239:~:text=<ComplexType%20Name="-,NavigationRestrictionsType,-")|\[[NavigationPropertyRestriction](#NavigationPropertyRestriction)\]|List of navigation properties with restrictions

<a name="NavigationPropertyRestriction"></a>
## [NavigationPropertyRestriction](./Org.OData.Capabilities.V1.xml#L243:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")


Using a property of `NavigationPropertyRestriction` in a [`NavigationRestrictions`](#NavigationRestrictions) annotation
          is discouraged in favor of using an annotation with the corresponding term from this vocabulary and a target path starting with a container and ending in the `NavigationProperty`,
          unless the favored alternative is impossible because a dynamic expression requires an instance path whose evaluation
          starts at the target of the `NavigationRestrictions` annotation. See [this example](../examples/Org.OData.Capabilities.V1.capabilities.md).

Property|Type|Description
:-------|:---|:----------
[NavigationProperty](./Org.OData.Capabilities.V1.xml#L250:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|NavigationPropertyPath|Navigation properties can be navigated<br>The target path of a [`NavigationRestrictions`](#NavigationRestrictions) annotation followed by this navigation property path addresses the resource to which the other properties of `NavigationPropertyRestriction` apply. Instance paths that occur in dynamic expressions are evaluated starting at the boundary between both paths, which must therefore be chosen accordingly.
[Navigability](./Org.OData.Capabilities.V1.xml#L259:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|[NavigationType?](#NavigationType)|Supported navigability of this navigation property
[FilterFunctions](./Org.OData.Capabilities.V1.xml#L262:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|\[String\]|List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](./Org.OData.Capabilities.V1.xml#L266:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|[FilterRestrictionsType?](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](./Org.OData.Capabilities.V1.xml#L269:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](./Org.OData.Capabilities.V1.xml#L272:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|[SortRestrictionsType?](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](./Org.OData.Capabilities.V1.xml#L275:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|Boolean|Supports $top
[SkipSupported](./Org.OData.Capabilities.V1.xml#L278:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|Boolean|Supports $skip
[SelectSupport](./Org.OData.Capabilities.V1.xml#L281:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|[SelectSupportType?](#SelectSupportType)|Support for $select
[IndexableByKey](./Org.OData.Capabilities.V1.xml#L284:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|Boolean|Supports key values according to OData URL conventions
[InsertRestrictions](./Org.OData.Capabilities.V1.xml#L287:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|[InsertRestrictionsType?](#InsertRestrictionsType)|Restrictions on insert operations
[DeepInsertSupport](./Org.OData.Capabilities.V1.xml#L290:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|[DeepInsertSupportType?](#DeepInsertSupportType)|Deep Insert Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[UpdateRestrictions](./Org.OData.Capabilities.V1.xml#L293:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|[UpdateRestrictionsType?](#UpdateRestrictionsType)|Restrictions on update operations
[DeepUpdateSupport](./Org.OData.Capabilities.V1.xml#L296:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|[DeepUpdateSupportType?](#DeepUpdateSupportType)|Deep Update Support of the annotated resource (the whole service, an entity set, or a collection-valued resource)
[DeleteRestrictions](./Org.OData.Capabilities.V1.xml#L299:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|[DeleteRestrictionsType?](#DeleteRestrictionsType)|Restrictions on delete operations
[OptimisticConcurrencyControl](./Org.OData.Capabilities.V1.xml#L302:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|Boolean|Data modification (including insert) along this navigation property requires the use of ETags
[ReadRestrictions](./Org.OData.Capabilities.V1.xml#L305:~:text=<ComplexType%20Name="-,NavigationPropertyRestriction,-")|[ReadRestrictionsType?](#ReadRestrictionsType)|Restrictions for retrieving entities

<a name="NavigationType"></a>
## [NavigationType](./Org.OData.Capabilities.V1.xml#L309:~:text=<EnumType%20Name="-,NavigationType,-")


Member|Value|Description
:-----|----:|:----------
[Recursive](./Org.OData.Capabilities.V1.xml#L310:~:text=<EnumType%20Name="-,NavigationType,-")|0|Navigation properties can be recursively navigated
[Single](./Org.OData.Capabilities.V1.xml#L313:~:text=<EnumType%20Name="-,NavigationType,-")|1|Navigation properties can be navigated to a single level
[None](./Org.OData.Capabilities.V1.xml#L316:~:text=<EnumType%20Name="-,NavigationType,-")|2|Navigation properties are not navigable

<a name="SelectSupportType"></a>
## [SelectSupportType](./Org.OData.Capabilities.V1.xml#L345:~:text=<ComplexType%20Name="-,SelectSupportType,-")


Property|Type|Description
:-------|:---|:----------
[Supported](./Org.OData.Capabilities.V1.xml#L346:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|Supports $select
[InstanceAnnotationsSupported](./Org.OData.Capabilities.V1.xml#L349:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|Supports instance annotations in $select list
[Expandable](./Org.OData.Capabilities.V1.xml#L352:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|$expand within $select is supported
[Filterable](./Org.OData.Capabilities.V1.xml#L355:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|$filter within $select is supported
[Searchable](./Org.OData.Capabilities.V1.xml#L358:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|$search within $select is supported
[TopSupported](./Org.OData.Capabilities.V1.xml#L361:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|$top within $select is supported
[SkipSupported](./Org.OData.Capabilities.V1.xml#L364:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|$skip within $select is supported
[ComputeSupported](./Org.OData.Capabilities.V1.xml#L367:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|$compute within $select is supported
[Countable](./Org.OData.Capabilities.V1.xml#L370:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|$count within $select is supported
[Sortable](./Org.OData.Capabilities.V1.xml#L373:~:text=<ComplexType%20Name="-,SelectSupportType,-")|Boolean|$orderby within $select is supported

<a name="BatchSupportType"></a>
## [BatchSupportType](./Org.OData.Capabilities.V1.xml#L385:~:text=<ComplexType%20Name="-,BatchSupportType,-")


Property|Type|Description
:-------|:---|:----------
[Supported](./Org.OData.Capabilities.V1.xml#L392:~:text=<ComplexType%20Name="-,BatchSupportType,-")|Boolean|Service supports requests to $batch
[ContinueOnErrorSupported](./Org.OData.Capabilities.V1.xml#L395:~:text=<ComplexType%20Name="-,BatchSupportType,-")|Boolean|Service supports the continue on error preference
[ReferencesInRequestBodiesSupported](./Org.OData.Capabilities.V1.xml#L398:~:text=<ComplexType%20Name="-,BatchSupportType,-")|Boolean|Service supports Content-ID referencing in request bodies
[ReferencesAcrossChangeSetsSupported](./Org.OData.Capabilities.V1.xml#L401:~:text=<ComplexType%20Name="-,BatchSupportType,-")|Boolean|Service supports Content-ID referencing across change sets
[EtagReferencesSupported](./Org.OData.Capabilities.V1.xml#L404:~:text=<ComplexType%20Name="-,BatchSupportType,-")|Boolean|Service supports referencing Etags from previous requests
[RequestDependencyConditionsSupported](./Org.OData.Capabilities.V1.xml#L407:~:text=<ComplexType%20Name="-,BatchSupportType,-")|Boolean|Service supports the `if` member in JSON batch requests
[SupportedFormats](./Org.OData.Capabilities.V1.xml#L410:~:text=<ComplexType%20Name="-,BatchSupportType,-")|\[MediaType\]|Media types of supported formats for $batch<dl>Allowed values:<dt>[multipart/mixed](./Org.OData.Capabilities.V1.xml#L415)<dd>[Multipart Batch Format](http://docs.oasis-open.org/odata/odata/v4.01/cs01/part1-protocol/odata-v4.01-cs01-part1-protocol.html#sec_MultipartBatchFormat)<dt>[application/json](./Org.OData.Capabilities.V1.xml#L419)<dd>[JSON Batch Format](http://docs.oasis-open.org/odata/odata-json-format/v4.01/cs01/odata-json-format-v4.01-cs01.html#sec_BatchRequestsandResponses)</dl>

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)
- [LongDescription](Org.OData.Core.V1.md#LongDescription)

<a name="FilterRestrictionsBase"></a>
## [FilterRestrictionsBase](./Org.OData.Capabilities.V1.xml#L438:~:text=<ComplexType%20Name="-,FilterRestrictionsBase,-")


**Derived Types:**
- [FilterRestrictionsType](#FilterRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Filterable](./Org.OData.Capabilities.V1.xml#L444:~:text=<ComplexType%20Name="-,FilterRestrictionsBase,-")|Boolean|$filter is supported
[RequiresFilter](./Org.OData.Capabilities.V1.xml#L447:~:text=<ComplexType%20Name="-,FilterRestrictionsBase,-")|Boolean|$filter is required
[MaxLevels](./Org.OData.Capabilities.V1.xml#L450:~:text=<ComplexType%20Name="-,FilterRestrictionsBase,-")|Int32|The maximum number of levels (including recursion) that can be traversed in a filter expression. A value of -1 indicates there is no restriction.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="FilterRestrictionsType"></a>
## [FilterRestrictionsType](./Org.OData.Capabilities.V1.xml#L454:~:text=<ComplexType%20Name="-,FilterRestrictionsType,-"): [FilterRestrictionsBase](#FilterRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Filterable*](./Org.OData.Capabilities.V1.xml#L444:~:text=<ComplexType%20Name="-,FilterRestrictionsBase,-")|Boolean|$filter is supported
[*RequiresFilter*](./Org.OData.Capabilities.V1.xml#L447:~:text=<ComplexType%20Name="-,FilterRestrictionsBase,-")|Boolean|$filter is required
[*MaxLevels*](./Org.OData.Capabilities.V1.xml#L450:~:text=<ComplexType%20Name="-,FilterRestrictionsBase,-")|Int32|The maximum number of levels (including recursion) that can be traversed in a filter expression. A value of -1 indicates there is no restriction.
[RequiredProperties](./Org.OData.Capabilities.V1.xml#L455:~:text=<ComplexType%20Name="-,FilterRestrictionsType,-")|\[PropertyPath\]|These properties must be specified in the $filter clause (properties of derived types are not allowed here)
[NonFilterableProperties](./Org.OData.Capabilities.V1.xml#L458:~:text=<ComplexType%20Name="-,FilterRestrictionsType,-")|\[PropertyPath\]|These structural properties cannot be used in filter expressions
[FilterExpressionRestrictions](./Org.OData.Capabilities.V1.xml#L461:~:text=<ComplexType%20Name="-,FilterRestrictionsType,-")|\[[FilterExpressionRestrictionType](#FilterExpressionRestrictionType)\]|These properties only allow a subset of filter expressions. A valid filter expression for a single property can be enclosed in parentheses and combined by `and` with valid expressions for other properties.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="FilterExpressionRestrictionType"></a>
## [FilterExpressionRestrictionType](./Org.OData.Capabilities.V1.xml#L465:~:text=<ComplexType%20Name="-,FilterExpressionRestrictionType,-")


Property|Type|Description
:-------|:---|:----------
[Property](./Org.OData.Capabilities.V1.xml#L466:~:text=<ComplexType%20Name="-,FilterExpressionRestrictionType,-")|PropertyPath?|Path to the restricted property
[AllowedExpressions](./Org.OData.Capabilities.V1.xml#L469:~:text=<ComplexType%20Name="-,FilterExpressionRestrictionType,-")|[FilterExpressionType?](#FilterExpressionType)|Allowed subset of expressions

<a name="FilterExpressionType"></a>
## [FilterExpressionType](./Org.OData.Capabilities.V1.xml#L473:~:text=<TypeDefinition%20Name="-,FilterExpressionType,-")
**Type:** String



Allowed Value|Description
:------------|:----------
[SingleValue](./Org.OData.Capabilities.V1.xml#L476:~:text=<TypeDefinition%20Name="-,FilterExpressionType,-")|Property can be used in a single `eq` clause
[MultiValue](./Org.OData.Capabilities.V1.xml#L480:~:text=<TypeDefinition%20Name="-,FilterExpressionType,-")|Property can be used in multiple `eq` and `in` clauses, combined by `or` (which is logically equivalent to a single `in` clause)
[SingleRange](./Org.OData.Capabilities.V1.xml#L484:~:text=<TypeDefinition%20Name="-,FilterExpressionType,-")|Property can be used in at most one `ge` and/or one `le` clause, separated by `and`
[MultiRange](./Org.OData.Capabilities.V1.xml#L488:~:text=<TypeDefinition%20Name="-,FilterExpressionType,-")|Property can be compared to a union of one or more closed, half-open, or open intervals<br>The filter expression for this property consists of one or more interval expressions combined by `or`. A single interval expression is either a single comparison of the property and a literal value with `eq`, `le`, `lt`, `ge`, or `gt`, or pair of boundaries combined by `and` and enclosed in parentheses. The lower boundary is either `ge` or `gt`, the upper boundary either `le` or `lt`.
[SearchExpression](./Org.OData.Capabilities.V1.xml#L493:~:text=<TypeDefinition%20Name="-,FilterExpressionType,-")|String property can be used as first operand in `startswith`, `endswith`, and `contains` clauses
[MultiRangeOrSearchExpression](./Org.OData.Capabilities.V1.xml#L497:~:text=<TypeDefinition%20Name="-,FilterExpressionType,-")|Property can be compared to a union of zero or more closed, half-open, or open intervals plus zero or more simple string patterns<br>The filter expression for this property consists of one or more interval expressions or string comparison functions combined by `or`. See MultiRange for a definition of an interval expression. See SearchExpression for the allowed string comparison functions.

<a name="SortRestrictionsBase"></a>
## [SortRestrictionsBase](./Org.OData.Capabilities.V1.xml#L510:~:text=<ComplexType%20Name="-,SortRestrictionsBase,-")


**Derived Types:**
- [SortRestrictionsType](#SortRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Sortable](./Org.OData.Capabilities.V1.xml#L516:~:text=<ComplexType%20Name="-,SortRestrictionsBase,-")|Boolean|$orderby is supported

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="SortRestrictionsType"></a>
## [SortRestrictionsType](./Org.OData.Capabilities.V1.xml#L520:~:text=<ComplexType%20Name="-,SortRestrictionsType,-"): [SortRestrictionsBase](#SortRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Sortable*](./Org.OData.Capabilities.V1.xml#L516:~:text=<ComplexType%20Name="-,SortRestrictionsBase,-")|Boolean|$orderby is supported
[AscendingOnlyProperties](./Org.OData.Capabilities.V1.xml#L521:~:text=<ComplexType%20Name="-,SortRestrictionsType,-")|\[PropertyPath\]|These properties can only be used for sorting in Ascending order
[DescendingOnlyProperties](./Org.OData.Capabilities.V1.xml#L524:~:text=<ComplexType%20Name="-,SortRestrictionsType,-")|\[PropertyPath\]|These properties can only be used for sorting in Descending order
[NonSortableProperties](./Org.OData.Capabilities.V1.xml#L527:~:text=<ComplexType%20Name="-,SortRestrictionsType,-")|\[PropertyPath\]|These structural properties cannot be used in orderby expressions

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="ExpandRestrictionsBase"></a>
## [ExpandRestrictionsBase](./Org.OData.Capabilities.V1.xml#L536:~:text=<ComplexType%20Name="-,ExpandRestrictionsBase,-")


**Derived Types:**
- [ExpandRestrictionsType](#ExpandRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Expandable](./Org.OData.Capabilities.V1.xml#L542:~:text=<ComplexType%20Name="-,ExpandRestrictionsBase,-")|Boolean|$expand is supported
[StreamsExpandable](./Org.OData.Capabilities.V1.xml#L545:~:text=<ComplexType%20Name="-,ExpandRestrictionsBase,-")|Boolean|$expand is supported for stream properties and media streams
[MaxLevels](./Org.OData.Capabilities.V1.xml#L548:~:text=<ComplexType%20Name="-,ExpandRestrictionsBase,-")|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="ExpandRestrictionsType"></a>
## [ExpandRestrictionsType](./Org.OData.Capabilities.V1.xml#L552:~:text=<ComplexType%20Name="-,ExpandRestrictionsType,-"): [ExpandRestrictionsBase](#ExpandRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Expandable*](./Org.OData.Capabilities.V1.xml#L542:~:text=<ComplexType%20Name="-,ExpandRestrictionsBase,-")|Boolean|$expand is supported
[*StreamsExpandable*](./Org.OData.Capabilities.V1.xml#L545:~:text=<ComplexType%20Name="-,ExpandRestrictionsBase,-")|Boolean|$expand is supported for stream properties and media streams
[*MaxLevels*](./Org.OData.Capabilities.V1.xml#L548:~:text=<ComplexType%20Name="-,ExpandRestrictionsBase,-")|Int32|The maximum number of levels that can be expanded in a expand expression. A value of -1 indicates there is no restriction.
[NonExpandableProperties](./Org.OData.Capabilities.V1.xml#L553:~:text=<ComplexType%20Name="-,ExpandRestrictionsType,-")|\[NavigationPropertyPath\]|These properties cannot be used in expand expressions
[NonExpandableStreamProperties](./Org.OData.Capabilities.V1.xml#L556:~:text=<ComplexType%20Name="-,ExpandRestrictionsType,-")|\[PropertyPath\]|These stream properties cannot be used in expand expressions

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="SearchRestrictionsType"></a>
## [SearchRestrictionsType](./Org.OData.Capabilities.V1.xml#L566:~:text=<ComplexType%20Name="-,SearchRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[Searchable](./Org.OData.Capabilities.V1.xml#L572:~:text=<ComplexType%20Name="-,SearchRestrictionsType,-")|Boolean|$search is supported
[UnsupportedExpressions](./Org.OData.Capabilities.V1.xml#L575:~:text=<ComplexType%20Name="-,SearchRestrictionsType,-")|[SearchExpressions](#SearchExpressions)|Expressions not supported in $search

**Applicable Annotation Terms:**

- [Description](Org.OData.Core.V1.md#Description)

<a name="SearchExpressions"></a>
## [SearchExpressions](./Org.OData.Capabilities.V1.xml#L579:~:text=<EnumType%20Name="-,SearchExpressions,-")


Flag Member|Value|Description
:-----|----:|:----------
[none](./Org.OData.Capabilities.V1.xml#L580:~:text=<EnumType%20Name="-,SearchExpressions,-")|0|Single search term
[AND](./Org.OData.Capabilities.V1.xml#L583:~:text=<EnumType%20Name="-,SearchExpressions,-")|1|Multiple search terms, optionally separated by `AND`
[OR](./Org.OData.Capabilities.V1.xml#L586:~:text=<EnumType%20Name="-,SearchExpressions,-")|2|Multiple search terms separated by `OR`
[NOT](./Org.OData.Capabilities.V1.xml#L589:~:text=<EnumType%20Name="-,SearchExpressions,-")|4|Search terms preceded by `NOT`
[phrase](./Org.OData.Capabilities.V1.xml#L592:~:text=<EnumType%20Name="-,SearchExpressions,-")|8|Search phrases enclosed in double quotes
[group](./Org.OData.Capabilities.V1.xml#L595:~:text=<EnumType%20Name="-,SearchExpressions,-")|16|Precedence grouping of search expressions with parentheses

<a name="InsertRestrictionsBase"></a>
## [InsertRestrictionsBase](./Org.OData.Capabilities.V1.xml#L614:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")


**Derived Types:**
- [InsertRestrictionsType](#InsertRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Insertable](./Org.OData.Capabilities.V1.xml#L615:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|Boolean|Entities can be inserted
[MaxLevels](./Org.OData.Capabilities.V1.xml#L618:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to insert into. A value of -1 indicates there is no restriction.
[TypecastSegmentSupported](./Org.OData.Capabilities.V1.xml#L621:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|Boolean|Entities of a specific derived type can be created by specifying a type-cast segment
[QueryOptions](./Org.OData.Capabilities.V1.xml#L624:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with insert requests
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L627:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L630:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](./Org.OData.Capabilities.V1.xml#L633:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|String?|A brief description of the request
[LongDescription](./Org.OData.Capabilities.V1.xml#L637:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|String?|A long description of the request
[ErrorResponses](./Org.OData.Capabilities.V1.xml#L641:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="InsertRestrictionsType"></a>
## [InsertRestrictionsType](./Org.OData.Capabilities.V1.xml#L645:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-"): [InsertRestrictionsBase](#InsertRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Insertable*](./Org.OData.Capabilities.V1.xml#L615:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|Boolean|Entities can be inserted
[*MaxLevels*](./Org.OData.Capabilities.V1.xml#L618:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to insert into. A value of -1 indicates there is no restriction.
[*TypecastSegmentSupported*](./Org.OData.Capabilities.V1.xml#L621:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|Boolean|Entities of a specific derived type can be created by specifying a type-cast segment
[*QueryOptions*](./Org.OData.Capabilities.V1.xml#L624:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with insert requests
[*CustomHeaders*](./Org.OData.Capabilities.V1.xml#L627:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](./Org.OData.Capabilities.V1.xml#L630:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](./Org.OData.Capabilities.V1.xml#L633:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|String?|A brief description of the request
[*LongDescription*](./Org.OData.Capabilities.V1.xml#L637:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|String?|A long description of the request
[*ErrorResponses*](./Org.OData.Capabilities.V1.xml#L641:~:text=<ComplexType%20Name="-,InsertRestrictionsBase,-")|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.
[NonInsertableProperties](./Org.OData.Capabilities.V1.xml#L646:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|\[PropertyPath\]|These structural properties cannot be specified on insert
[NonInsertableNavigationProperties](./Org.OData.Capabilities.V1.xml#L649:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|\[NavigationPropertyPath\]|These navigation properties do not allow deep inserts
[RequiredProperties](./Org.OData.Capabilities.V1.xml#L652:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|\[PropertyPath\]|These structural properties must be specified on insert
[Permissions](./Org.OData.Capabilities.V1.xml#L655:~:text=<ComplexType%20Name="-,InsertRestrictionsType,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the insert.

<a name="PermissionType"></a>
## [PermissionType](./Org.OData.Capabilities.V1.xml#L660:~:text=<ComplexType%20Name="-,PermissionType,-")


Property|Type|Description
:-------|:---|:----------
[SchemeName](./Org.OData.Capabilities.V1.xml#L661:~:text=<ComplexType%20Name="-,PermissionType,-")|[SchemeName](Org.OData.Authorization.V1.md#SchemeName)|Authorization flow scheme name
[Scopes](./Org.OData.Capabilities.V1.xml#L664:~:text=<ComplexType%20Name="-,PermissionType,-")|\[[ScopeType](#ScopeType)\]|List of scopes that can provide access to the resource

<a name="ScopeType"></a>
## [ScopeType](./Org.OData.Capabilities.V1.xml#L669:~:text=<ComplexType%20Name="-,ScopeType,-")


Property|Type|Description
:-------|:---|:----------
[Scope](./Org.OData.Capabilities.V1.xml#L670:~:text=<ComplexType%20Name="-,ScopeType,-")|String|Name of the scope.
[RestrictedProperties](./Org.OData.Capabilities.V1.xml#L673:~:text=<ComplexType%20Name="-,ScopeType,-")|String?|Comma-separated string value of all properties that will be included or excluded when using the scope.<br>Possible string value identifiers when specifying properties are `*`, _PropertyName_, `-`_PropertyName_.<br/>`*` denotes all properties are accessible.<br/>`-`_PropertyName_ excludes that specific property.<br/>_PropertyName_ explicitly provides access to the specific property.<br/>The absence of `RestrictedProperties` denotes all properties are accessible using that scope.

<a name="DeepInsertSupportType"></a>
## [DeepInsertSupportType](./Org.OData.Capabilities.V1.xml#L693:~:text=<ComplexType%20Name="-,DeepInsertSupportType,-")


Property|Type|Description
:-------|:---|:----------
[Supported](./Org.OData.Capabilities.V1.xml#L694:~:text=<ComplexType%20Name="-,DeepInsertSupportType,-")|Boolean|Annotation target supports deep inserts
[ContentIDSupported](./Org.OData.Capabilities.V1.xml#L697:~:text=<ComplexType%20Name="-,DeepInsertSupportType,-")|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

<a name="UpdateRestrictionsBase"></a>
## [UpdateRestrictionsBase](./Org.OData.Capabilities.V1.xml#L706:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")


**Derived Types:**
- [UpdateRestrictionsType](#UpdateRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Updatable](./Org.OData.Capabilities.V1.xml#L707:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|Boolean|Entities can be updated
[Upsertable](./Org.OData.Capabilities.V1.xml#L710:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|Boolean|Entities can be upserted
[DeltaUpdateSupported](./Org.OData.Capabilities.V1.xml#L713:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|Boolean|Entities can be inserted, updated, and deleted via a PATCH request with a delta payload
[UpdateMethod](./Org.OData.Capabilities.V1.xml#L716:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|[HttpMethod?](#HttpMethod)|Supported HTTP Methods (PUT or PATCH) for updating an entity. If null, PATCH SHOULD be supported and PUT MAY be supported.
[FilterSegmentSupported](./Org.OData.Capabilities.V1.xml#L719:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|Boolean|Members of collections can be updated via a PATCH request with a `/$filter(...)/$each` segment
[TypecastSegmentSupported](./Org.OData.Capabilities.V1.xml#L722:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|Boolean|Members of collections can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[MaxLevels](./Org.OData.Capabilities.V1.xml#L725:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|Int32|The maximum number of navigation properties that can be traversed when addressing the collection or entity to update. A value of -1 indicates there is no restriction.
[Permissions](./Org.OData.Capabilities.V1.xml#L728:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the update.
[QueryOptions](./Org.OData.Capabilities.V1.xml#L731:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with update requests
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L734:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L737:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](./Org.OData.Capabilities.V1.xml#L740:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|String?|A brief description of the request
[LongDescription](./Org.OData.Capabilities.V1.xml#L744:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|String?|A long description of the request
[ErrorResponses](./Org.OData.Capabilities.V1.xml#L748:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="UpdateRestrictionsType"></a>
## [UpdateRestrictionsType](./Org.OData.Capabilities.V1.xml#L752:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-"): [UpdateRestrictionsBase](#UpdateRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Updatable*](./Org.OData.Capabilities.V1.xml#L707:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|Boolean|Entities can be updated
[*Upsertable*](./Org.OData.Capabilities.V1.xml#L710:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|Boolean|Entities can be upserted
[*DeltaUpdateSupported*](./Org.OData.Capabilities.V1.xml#L713:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|Boolean|Entities can be inserted, updated, and deleted via a PATCH request with a delta payload
[*UpdateMethod*](./Org.OData.Capabilities.V1.xml#L716:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|[HttpMethod?](#HttpMethod)|Supported HTTP Methods (PUT or PATCH) for updating an entity. If null, PATCH SHOULD be supported and PUT MAY be supported.
[*FilterSegmentSupported*](./Org.OData.Capabilities.V1.xml#L719:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|Boolean|Members of collections can be updated via a PATCH request with a `/$filter(...)/$each` segment
[*TypecastSegmentSupported*](./Org.OData.Capabilities.V1.xml#L722:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|Boolean|Members of collections can be updated via a PATCH request with a type-cast segment and a `/$each` segment
[*MaxLevels*](./Org.OData.Capabilities.V1.xml#L725:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|Int32|The maximum number of navigation properties that can be traversed when addressing the collection or entity to update. A value of -1 indicates there is no restriction.
[*Permissions*](./Org.OData.Capabilities.V1.xml#L728:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the update.
[*QueryOptions*](./Org.OData.Capabilities.V1.xml#L731:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|[ModificationQueryOptionsType?](#ModificationQueryOptionsType)|Support for query options with update requests
[*CustomHeaders*](./Org.OData.Capabilities.V1.xml#L734:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](./Org.OData.Capabilities.V1.xml#L737:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](./Org.OData.Capabilities.V1.xml#L740:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|String?|A brief description of the request
[*LongDescription*](./Org.OData.Capabilities.V1.xml#L744:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|String?|A long description of the request
[*ErrorResponses*](./Org.OData.Capabilities.V1.xml#L748:~:text=<ComplexType%20Name="-,UpdateRestrictionsBase,-")|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.
[NonUpdatableProperties](./Org.OData.Capabilities.V1.xml#L753:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|\[PropertyPath\]|These structural properties cannot be specified on update
[NonUpdatableNavigationProperties](./Org.OData.Capabilities.V1.xml#L756:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|\[NavigationPropertyPath\]|These navigation properties do not allow rebinding
[RequiredProperties](./Org.OData.Capabilities.V1.xml#L759:~:text=<ComplexType%20Name="-,UpdateRestrictionsType,-")|\[PropertyPath\]|These structural properties must be specified on update

<a name="HttpMethod"></a>
## [HttpMethod](./Org.OData.Capabilities.V1.xml#L764:~:text=<EnumType%20Name="-,HttpMethod,-")


Flag Member|Value|Description
:-----|----:|:----------
[GET](./Org.OData.Capabilities.V1.xml#L765:~:text=<EnumType%20Name="-,HttpMethod,-")|1|The HTTP GET Method
[PATCH](./Org.OData.Capabilities.V1.xml#L768:~:text=<EnumType%20Name="-,HttpMethod,-")|2|The HTTP PATCH Method
[PUT](./Org.OData.Capabilities.V1.xml#L771:~:text=<EnumType%20Name="-,HttpMethod,-")|4|The HTTP PUT Method
[POST](./Org.OData.Capabilities.V1.xml#L774:~:text=<EnumType%20Name="-,HttpMethod,-")|8|The HTTP POST Method
[DELETE](./Org.OData.Capabilities.V1.xml#L777:~:text=<EnumType%20Name="-,HttpMethod,-")|16|The HTTP DELETE Method
[OPTIONS](./Org.OData.Capabilities.V1.xml#L780:~:text=<EnumType%20Name="-,HttpMethod,-")|32|The HTTP OPTIONS Method
[HEAD](./Org.OData.Capabilities.V1.xml#L783:~:text=<EnumType%20Name="-,HttpMethod,-")|64|The HTTP HEAD Method

<a name="DeepUpdateSupportType"></a>
## [DeepUpdateSupportType](./Org.OData.Capabilities.V1.xml#L792:~:text=<ComplexType%20Name="-,DeepUpdateSupportType,-")


Property|Type|Description
:-------|:---|:----------
[Supported](./Org.OData.Capabilities.V1.xml#L793:~:text=<ComplexType%20Name="-,DeepUpdateSupportType,-")|Boolean|Annotation target supports deep updates
[ContentIDSupported](./Org.OData.Capabilities.V1.xml#L796:~:text=<ComplexType%20Name="-,DeepUpdateSupportType,-")|Boolean|Annotation target supports accepting and returning nested entities annotated with the `Core.ContentID` instance annotation.

<a name="DeleteRestrictionsBase"></a>
## [DeleteRestrictionsBase](./Org.OData.Capabilities.V1.xml#L805:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")


**Derived Types:**
- [DeleteRestrictionsType](#DeleteRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Deletable](./Org.OData.Capabilities.V1.xml#L806:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|Boolean|Entities can be deleted
[MaxLevels](./Org.OData.Capabilities.V1.xml#L809:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to delete from or the entity to delete. A value of -1 indicates there is no restriction.
[FilterSegmentSupported](./Org.OData.Capabilities.V1.xml#L812:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|Boolean|Members of collections can be deleted via a DELETE request with a `/$filter(...)/$each` segment
[TypecastSegmentSupported](./Org.OData.Capabilities.V1.xml#L815:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|Boolean|Members of collections can be deleted via a DELETE request with a type-cast segment and a `/$each` segment
[Permissions](./Org.OData.Capabilities.V1.xml#L818:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the delete.
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L821:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L824:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](./Org.OData.Capabilities.V1.xml#L827:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|String?|A brief description of the request
[LongDescription](./Org.OData.Capabilities.V1.xml#L831:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|String?|A long description of the request
[ErrorResponses](./Org.OData.Capabilities.V1.xml#L835:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="DeleteRestrictionsType"></a>
## [DeleteRestrictionsType](./Org.OData.Capabilities.V1.xml#L839:~:text=<ComplexType%20Name="-,DeleteRestrictionsType,-"): [DeleteRestrictionsBase](#DeleteRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Deletable*](./Org.OData.Capabilities.V1.xml#L806:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|Boolean|Entities can be deleted
[*MaxLevels*](./Org.OData.Capabilities.V1.xml#L809:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|Int32|The maximum number of navigation properties that can be traversed when addressing the collection to delete from or the entity to delete. A value of -1 indicates there is no restriction.
[*FilterSegmentSupported*](./Org.OData.Capabilities.V1.xml#L812:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|Boolean|Members of collections can be deleted via a DELETE request with a `/$filter(...)/$each` segment
[*TypecastSegmentSupported*](./Org.OData.Capabilities.V1.xml#L815:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|Boolean|Members of collections can be deleted via a DELETE request with a type-cast segment and a `/$each` segment
[*Permissions*](./Org.OData.Capabilities.V1.xml#L818:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to perform the delete.
[*CustomHeaders*](./Org.OData.Capabilities.V1.xml#L821:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](./Org.OData.Capabilities.V1.xml#L824:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](./Org.OData.Capabilities.V1.xml#L827:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|String?|A brief description of the request
[*LongDescription*](./Org.OData.Capabilities.V1.xml#L831:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|String?|A long description of the request
[*ErrorResponses*](./Org.OData.Capabilities.V1.xml#L835:~:text=<ComplexType%20Name="-,DeleteRestrictionsBase,-")|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.
[NonDeletableNavigationProperties](./Org.OData.Capabilities.V1.xml#L840:~:text=<ComplexType%20Name="-,DeleteRestrictionsType,-")|\[NavigationPropertyPath\]|These navigation properties do not allow DeleteLink requests

<a name="CollectionPropertyRestrictionsType"></a>
## [CollectionPropertyRestrictionsType](./Org.OData.Capabilities.V1.xml#L848:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[CollectionProperty](./Org.OData.Capabilities.V1.xml#L849:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|PropertyPath?|Restricted Collection-valued property
[FilterFunctions](./Org.OData.Capabilities.V1.xml#L852:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|\[String\]|List of functions and operators supported in filter expressions<br>If not specified, null, or empty, all functions and operators may be attempted.
[FilterRestrictions](./Org.OData.Capabilities.V1.xml#L856:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|[FilterRestrictionsType?](#FilterRestrictionsType)|Restrictions on filter expressions
[SearchRestrictions](./Org.OData.Capabilities.V1.xml#L859:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[SortRestrictions](./Org.OData.Capabilities.V1.xml#L862:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|[SortRestrictionsType?](#SortRestrictionsType)|Restrictions on orderby expressions
[TopSupported](./Org.OData.Capabilities.V1.xml#L865:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|Boolean|Supports $top
[SkipSupported](./Org.OData.Capabilities.V1.xml#L868:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|Boolean|Supports $skip
[SelectSupport](./Org.OData.Capabilities.V1.xml#L871:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|[SelectSupportType?](#SelectSupportType)|Support for $select
[Insertable](./Org.OData.Capabilities.V1.xml#L874:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|Boolean|Members can be inserted into this collection<br>If additionally annotated with [Core.PositionalInsert](Org.OData.Core.V1.md#PositionalInsert), members can be inserted at a specific position
[Updatable](./Org.OData.Capabilities.V1.xml#L878:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|Boolean|Members of this ordered collection can be updated by ordinal
[Deletable](./Org.OData.Capabilities.V1.xml#L881:~:text=<ComplexType%20Name="-,CollectionPropertyRestrictionsType,-")|Boolean|Members of this ordered collection can be deleted by ordinal

<a name="OperationRestrictionsType"></a>
## [OperationRestrictionsType](./Org.OData.Capabilities.V1.xml#L889:~:text=<ComplexType%20Name="-,OperationRestrictionsType,-")


Property|Type|Description
:-------|:---|:----------
[FilterSegmentSupported](./Org.OData.Capabilities.V1.xml#L890:~:text=<ComplexType%20Name="-,OperationRestrictionsType,-")|Boolean|Bound action or function can be invoked on a collection-valued binding parameter path with a `/$filter(...)` segment
[Permissions](./Org.OData.Capabilities.V1.xml#L893:~:text=<ComplexType%20Name="-,OperationRestrictionsType,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to invoke an action or function
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L896:~:text=<ComplexType%20Name="-,OperationRestrictionsType,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L899:~:text=<ComplexType%20Name="-,OperationRestrictionsType,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[ErrorResponses](./Org.OData.Capabilities.V1.xml#L902:~:text=<ComplexType%20Name="-,OperationRestrictionsType,-")|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="ModificationQueryOptionsType"></a>
## [ModificationQueryOptionsType](./Org.OData.Capabilities.V1.xml#L913:~:text=<ComplexType%20Name="-,ModificationQueryOptionsType,-")


Property|Type|Description
:-------|:---|:----------
[ExpandSupported](./Org.OData.Capabilities.V1.xml#L914:~:text=<ComplexType%20Name="-,ModificationQueryOptionsType,-")|Boolean|Supports $expand with modification requests
[SelectSupported](./Org.OData.Capabilities.V1.xml#L917:~:text=<ComplexType%20Name="-,ModificationQueryOptionsType,-")|Boolean|Supports $select with modification requests
[ComputeSupported](./Org.OData.Capabilities.V1.xml#L920:~:text=<ComplexType%20Name="-,ModificationQueryOptionsType,-")|Boolean|Supports $compute with modification requests
[FilterSupported](./Org.OData.Capabilities.V1.xml#L923:~:text=<ComplexType%20Name="-,ModificationQueryOptionsType,-")|Boolean|Supports $filter with modification requests
[SearchSupported](./Org.OData.Capabilities.V1.xml#L926:~:text=<ComplexType%20Name="-,ModificationQueryOptionsType,-")|Boolean|Supports $search with modification requests
[SortSupported](./Org.OData.Capabilities.V1.xml#L929:~:text=<ComplexType%20Name="-,ModificationQueryOptionsType,-")|Boolean|Supports $orderby with modification requests

<a name="ReadRestrictionsBase"></a>
## [*ReadRestrictionsBase*](./Org.OData.Capabilities.V1.xml#L938:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")


**Derived Types:**
- [ReadByKeyRestrictionsType](#ReadByKeyRestrictionsType)
- [ReadRestrictionsType](#ReadRestrictionsType)

Property|Type|Description
:-------|:---|:----------
[Readable](./Org.OData.Capabilities.V1.xml#L939:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|Boolean|Entities can be retrieved
[Permissions](./Org.OData.Capabilities.V1.xml#L942:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[CustomHeaders](./Org.OData.Capabilities.V1.xml#L945:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[CustomQueryOptions](./Org.OData.Capabilities.V1.xml#L948:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[Description](./Org.OData.Capabilities.V1.xml#L951:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|String?|A brief description of the request
[LongDescription](./Org.OData.Capabilities.V1.xml#L955:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|String?|A long description of the request
[ErrorResponses](./Org.OData.Capabilities.V1.xml#L959:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="ReadByKeyRestrictionsType"></a>
## [ReadByKeyRestrictionsType](./Org.OData.Capabilities.V1.xml#L963:~:text=<ComplexType%20Name="-,ReadByKeyRestrictionsType,-"): [ReadRestrictionsBase](#ReadRestrictionsBase)
Restrictions for retrieving an entity by key

Property|Type|Description
:-------|:---|:----------
[*Readable*](./Org.OData.Capabilities.V1.xml#L939:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|Boolean|Entities can be retrieved
[*Permissions*](./Org.OData.Capabilities.V1.xml#L942:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[*CustomHeaders*](./Org.OData.Capabilities.V1.xml#L945:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](./Org.OData.Capabilities.V1.xml#L948:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](./Org.OData.Capabilities.V1.xml#L951:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|String?|A brief description of the request
[*LongDescription*](./Org.OData.Capabilities.V1.xml#L955:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|String?|A long description of the request
[*ErrorResponses*](./Org.OData.Capabilities.V1.xml#L959:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.

<a name="ReadRestrictionsType"></a>
## [ReadRestrictionsType](./Org.OData.Capabilities.V1.xml#L966:~:text=<ComplexType%20Name="-,ReadRestrictionsType,-"): [ReadRestrictionsBase](#ReadRestrictionsBase)


Property|Type|Description
:-------|:---|:----------
[*Readable*](./Org.OData.Capabilities.V1.xml#L939:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|Boolean|Entities can be retrieved
[*Permissions*](./Org.OData.Capabilities.V1.xml#L942:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[PermissionType?](#PermissionType)\]|Required permissions. One of the specified sets of scopes is required to read.
[*CustomHeaders*](./Org.OData.Capabilities.V1.xml#L945:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom headers
[*CustomQueryOptions*](./Org.OData.Capabilities.V1.xml#L948:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[CustomParameter](#CustomParameter)\]|Supported or required custom query options
[*Description*](./Org.OData.Capabilities.V1.xml#L951:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|String?|A brief description of the request
[*LongDescription*](./Org.OData.Capabilities.V1.xml#L955:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|String?|A long description of the request
[*ErrorResponses*](./Org.OData.Capabilities.V1.xml#L959:~:text=<ComplexType%20Name="-,ReadRestrictionsBase,-")|\[[HttpResponse](#HttpResponse)\]|Possible error responses returned by the request.
[TypecastSegmentSupported](./Org.OData.Capabilities.V1.xml#L967:~:text=<ComplexType%20Name="-,ReadRestrictionsType,-")|Boolean|Entities of a specific derived type can be read by specifying a type-cast segment
[ReadByKeyRestrictions](./Org.OData.Capabilities.V1.xml#L970:~:text=<ComplexType%20Name="-,ReadRestrictionsType,-")|[ReadByKeyRestrictionsType?](#ReadByKeyRestrictionsType)|Restrictions for retrieving an entity by key<br>Only valid when applied to a collection. If a property of `ReadByKeyRestrictions` is not specified, the corresponding property value of `ReadRestrictions` applies.

<a name="CustomParameter"></a>
## [CustomParameter](./Org.OData.Capabilities.V1.xml#L1033:~:text=<ComplexType%20Name="-,CustomParameter,-")
A custom parameter is either a header or a query option

The type of a custom parameter is always a string. Restrictions on the parameter values can be expressed by annotating the record expression describing the parameter with terms from the Validation vocabulary, e.g. Validation.Pattern or Validation.AllowedValues.

Property|Type|Description
:-------|:---|:----------
[Name](./Org.OData.Capabilities.V1.xml#L1036:~:text=<ComplexType%20Name="-,CustomParameter,-")|String|Name of the custom parameter
[Description](./Org.OData.Capabilities.V1.xml#L1039:~:text=<ComplexType%20Name="-,CustomParameter,-")|String?|Description of the custom parameter
[DocumentationURL](./Org.OData.Capabilities.V1.xml#L1042:~:text=<ComplexType%20Name="-,CustomParameter,-")|URL?|URL of related documentation
[Required](./Org.OData.Capabilities.V1.xml#L1046:~:text=<ComplexType%20Name="-,CustomParameter,-")|Boolean|true: parameter is required, false or not specified: parameter is optional
[ExampleValues](./Org.OData.Capabilities.V1.xml#L1049:~:text=<ComplexType%20Name="-,CustomParameter,-")|\[[PrimitiveExampleValue](Org.OData.Core.V1.md#PrimitiveExampleValue)\]|Example values for the custom parameter

<a name="DefaultCapabilitiesType"></a>
## [DefaultCapabilitiesType](./Org.OData.Capabilities.V1.xml#L1068:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")


Property|Type|Description
:-------|:---|:----------
[ChangeTracking](./Org.OData.Capabilities.V1.xml#L1069:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")|[ChangeTrackingBase?](#ChangeTrackingBase)|Change tracking capabilities
[CountRestrictions](./Org.OData.Capabilities.V1.xml#L1072:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")|[CountRestrictionsBase?](#CountRestrictionsBase)|Restrictions on /$count path suffix and $count=true system query option
[IndexableByKey](./Org.OData.Capabilities.V1.xml#L1075:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")|[Tag?](Org.OData.Core.V1.md#Tag)|Supports key values according to OData URL conventions
[TopSupported](./Org.OData.Capabilities.V1.xml#L1078:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")|[Tag?](Org.OData.Core.V1.md#Tag)|Supports $top
[SkipSupported](./Org.OData.Capabilities.V1.xml#L1081:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")|[Tag?](Org.OData.Core.V1.md#Tag)|Supports $skip
[ComputeSupported](./Org.OData.Capabilities.V1.xml#L1084:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")|[Tag?](Org.OData.Core.V1.md#Tag)|Supports $compute
[SelectSupport](./Org.OData.Capabilities.V1.xml#L1087:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")|[SelectSupportType?](#SelectSupportType)|Support for $select and nested query options within $select
[FilterRestrictions](./Org.OData.Capabilities.V1.xml#L1090:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")|[FilterRestrictionsBase?](#FilterRestrictionsBase)|Restrictions on filter expressions
[SortRestrictions](./Org.OData.Capabilities.V1.xml#L1093:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")|[SortRestrictionsBase?](#SortRestrictionsBase)|Restrictions on orderby expressions
[ExpandRestrictions](./Org.OData.Capabilities.V1.xml#L1096:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")|[ExpandRestrictionsBase?](#ExpandRestrictionsBase)|Restrictions on expand expressions
[SearchRestrictions](./Org.OData.Capabilities.V1.xml#L1099:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")|[SearchRestrictionsType?](#SearchRestrictionsType)|Restrictions on search expressions
[InsertRestrictions](./Org.OData.Capabilities.V1.xml#L1102:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")|[InsertRestrictionsBase?](#InsertRestrictionsBase)|Restrictions on insert operations
[UpdateRestrictions](./Org.OData.Capabilities.V1.xml#L1105:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")|[UpdateRestrictionsBase?](#UpdateRestrictionsBase)|Restrictions on update operations
[DeleteRestrictions](./Org.OData.Capabilities.V1.xml#L1108:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")|[DeleteRestrictionsBase?](#DeleteRestrictionsBase)|Restrictions on delete operations
[OperationRestrictions](./Org.OData.Capabilities.V1.xml#L1111:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")|[OperationRestrictionsType?](#OperationRestrictionsType)|Restrictions for function or action operations
[ReadRestrictions](./Org.OData.Capabilities.V1.xml#L1114:~:text=<ComplexType%20Name="-,DefaultCapabilitiesType,-")|[ReadRestrictionsType?](#ReadRestrictionsType)|Restrictions for retrieving a collection of entities, retrieving a singleton instance

<a name="HttpResponse"></a>
## [HttpResponse](./Org.OData.Capabilities.V1.xml#L1119:~:text=<ComplexType%20Name="-,HttpResponse,-")


Property|Type|Description
:-------|:---|:----------
[StatusCode](./Org.OData.Capabilities.V1.xml#L1120:~:text=<ComplexType%20Name="-,HttpResponse,-")|String|HTTP response status code, for example 400, 403, 501
[Description](./Org.OData.Capabilities.V1.xml#L1123:~:text=<ComplexType%20Name="-,HttpResponse,-")|String|Human-readable description of the response

-------

# <a name="MeasuresVocabulary" href="#MeasuresVocabulary">3 Measures Vocabulary</a>

**Namespace: [Org.OData.Measures.V1](Org.OData.Measures.V1.xml)**

Terms describing monetary amounts and measured quantities


## Terms

Term|Type|Description
:---|:---|:----------
[ISOCurrency](./Org.OData.Measures.V1.xml#L70:~:text=<Term%20Name="-,ISOCurrency,-")|String|<a name="ISOCurrency"></a>The currency for this monetary amount as an ISO 4217 currency code
[Scale](./Org.OData.Measures.V1.xml#L74:~:text=<Term%20Name="-,Scale,-")|Byte|<a name="Scale"></a>The number of significant decimal places in the scale part (less than or equal to the number declared in the Scale facet)
[Unit](./Org.OData.Measures.V1.xml#L79:~:text=<Term%20Name="-,Unit,-")|String|<a name="Unit"></a>The unit of measure for this measured quantity, e.g. cm for centimeters or % for percentages
[UNECEUnit](./Org.OData.Measures.V1.xml#L83:~:text=<Term%20Name="-,UNECEUnit,-")|String|<a name="UNECEUnit"></a>The unit of measure for this measured quantity, according to the [UN/CEFACT Recommendation 20](http://tfig.unece.org/contents/recommendation-20.htm)
[DurationGranularity](./Org.OData.Measures.V1.xml#L87:~:text=<Term%20Name="-,DurationGranularity,-")|[DurationGranularityType](#DurationGranularityType)|<a name="DurationGranularity"></a>The minimum granularity of duration values.<br>Absence of this annotation means a granularity of seconds with sub-seconds according to the Precision facet.

<a name="DurationGranularityType"></a>
## [DurationGranularityType](./Org.OData.Measures.V1.xml#L92:~:text=<TypeDefinition%20Name="-,DurationGranularityType,-")
**Type:** String



Allowed Value|Description
:------------|:----------
[days](./Org.OData.Measures.V1.xml#L95:~:text=<TypeDefinition%20Name="-,DurationGranularityType,-")|Duration in days, e.g. `P1D`
[hours](./Org.OData.Measures.V1.xml#L99:~:text=<TypeDefinition%20Name="-,DurationGranularityType,-")|Duration in days and hours, e.g. `P1DT23H`
[minutes](./Org.OData.Measures.V1.xml#L103:~:text=<TypeDefinition%20Name="-,DurationGranularityType,-")|Duration in days, hours, and minutes, e.g. `P1DT23H59M`

-------

# <a name="ValidationVocabulary" href="#ValidationVocabulary">4 Validation Vocabulary</a>

**Namespace: [Org.OData.Validation.V1](Org.OData.Validation.V1.xml)**

Terms describing validation rules


## Terms

Term|Type|Description
:---|:---|:----------
[Pattern](./Org.OData.Validation.V1.xml#L67:~:text=<Term%20Name="-,Pattern,-")|String|<a name="Pattern"></a>The pattern that a string property, parameter, or term must match. This SHOULD be a valid regular expression, according to the ECMA 262 regular expression dialect.
[Minimum](./Org.OData.Validation.V1.xml#L72:~:text=<Term%20Name="-,Minimum,-")|PrimitiveType|<a name="Minimum"></a>Minimum value that a property, parameter, or term can have.<br>Can be annotated with:<ul><li>[Exclusive](#Exclusive)</li></ul>
[Maximum](./Org.OData.Validation.V1.xml#L81:~:text=<Term%20Name="-,Maximum,-")|PrimitiveType|<a name="Maximum"></a>Maximum value that a property, parameter, or term can have.<br>Can be annotated with:<ul><li>[Exclusive](#Exclusive)</li></ul>
[Exclusive](./Org.OData.Validation.V1.xml#L90:~:text=<Term%20Name="-,Exclusive,-")|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Exclusive"></a>Tags a Minimum or Maximum as exclusive, i.e. an open interval boundary.
[AllowedValues](./Org.OData.Validation.V1.xml#L94:~:text=<Term%20Name="-,AllowedValues,-")|\[[AllowedValue](#AllowedValue)\]|<a name="AllowedValues"></a>A collection of valid values for the annotated property, parameter, or type definition
[MultipleOf](./Org.OData.Validation.V1.xml#L108:~:text=<Term%20Name="-,MultipleOf,-")|Decimal|<a name="MultipleOf"></a>The value of the annotated property, parameter, or term must be an integer multiple of this positive value. For temporal types, the value is measured in seconds.
[Constraint](./Org.OData.Validation.V1.xml#L112:~:text=<Term%20Name="-,Constraint,-")|[ConstraintType](#ConstraintType)|<a name="Constraint"></a>Condition that the annotation target has to fulfill
[ItemsOf](./Org.OData.Validation.V1.xml#L125:~:text=<Term%20Name="-,ItemsOf,-")|\[[ItemsOfType](#ItemsOfType)\]|<a name="ItemsOf"></a>A list of constraints describing that entities related via one navigation property MUST also be related via another, collection-valued navigation property. The same `path` value MUST NOT occur more than once.<br>Example: entity type `Customer` has navigation properties `AllOrders`, `OpenOrders`, and `ClosedOrders`. The term allows to express that items of `OpenOrders` and `ClosedOrders` are also items of the `AllOrders` navigation property, even though they are defined in an `Orders` entity set.
[OpenPropertyTypeConstraint](./Org.OData.Validation.V1.xml#L143:~:text=<Term%20Name="-,OpenPropertyTypeConstraint,-")|\[[SingleOrCollectionType](#SingleOrCollectionType)\]|<a name="OpenPropertyTypeConstraint"></a>Dynamic properties added to the annotated open structured type are restricted to the listed types.
[DerivedTypeConstraint](./Org.OData.Validation.V1.xml#L147:~:text=<Term%20Name="-,DerivedTypeConstraint,-")|\[[SingleOrCollectionType](#SingleOrCollectionType)\]|<a name="DerivedTypeConstraint"></a>Values are restricted to types that are both identical to or derived from the declared type and a type listed in this collection.<br>This allows restricting values to certain sub-trees of an inheritance hierarchy, including hierarchies starting at the [Built-In Abstract Types](https://docs.oasis-open.org/odata/odata-csdl-json/v4.01/odata-csdl-json-v4.01.html#sec_BuiltInAbstractTypes). Types listed in this collection are ignored if they are not derived from the declared type of the annotated model element or would not be allowed as declared type of the annotated model element.<br/> When applied to a collection-valued element, this annotation specifies the types allowed for members of the collection without mentioning the `Collection()` wrapper. The SingleOrCollectionType may only include the `Collection()` wrapper if the annotation is applied to an element with declared type `Edm.Untyped`.
[AllowedTerms](./Org.OData.Validation.V1.xml#L166:~:text=<Term%20Name="-,AllowedTerms,-")|\[[QualifiedTermName](Org.OData.Core.V1.md#QualifiedTermName)\]|<a name="AllowedTerms"></a>Annotate a term of type Edm.AnnotationPath, or a property of type Edm.AnnotationPath that is used within a structured term, to restrict the terms that can be targeted by the path.<br>The annotation path expression is intended to end in a path segment with one of the listed terms. For forward compatibility, clients should be prepared for the annotation to reference terms besides those listed.
[ApplicableTerms](./Org.OData.Validation.V1.xml#L172:~:text=<Term%20Name="-,ApplicableTerms,-")|\[[QualifiedTermName](Org.OData.Core.V1.md#QualifiedTermName)\]|<a name="ApplicableTerms"></a>Names of specific terms that are applicable and may be applied in the current context. This annotation does not restrict the use of other terms.
[MaxItems](./Org.OData.Validation.V1.xml#L176:~:text=<Term%20Name="-,MaxItems,-")|Int64|<a name="MaxItems"></a>The annotated collection must have at most the specified number of items.
[MinItems](./Org.OData.Validation.V1.xml#L180:~:text=<Term%20Name="-,MinItems,-")|Int64|<a name="MinItems"></a>The annotated collection must have at least the specified number of items.

<a name="AllowedValue"></a>
## [AllowedValue](./Org.OData.Validation.V1.xml#L97:~:text=<ComplexType%20Name="-,AllowedValue,-")


Property|Type|Description
:-------|:---|:----------
[Value](./Org.OData.Validation.V1.xml#L103:~:text=<ComplexType%20Name="-,AllowedValue,-")|PrimitiveType?|An allowed value for the property, parameter, or type definition

**Applicable Annotation Terms:**

- [SymbolicName](Org.OData.Core.V1.md#SymbolicName)

<a name="ConstraintType"></a>
## [ConstraintType](./Org.OData.Validation.V1.xml#L115:~:text=<ComplexType%20Name="-,ConstraintType,-")


Property|Type|Description
:-------|:---|:----------
[FailureMessage](./Org.OData.Validation.V1.xml#L116:~:text=<ComplexType%20Name="-,ConstraintType,-")|String?|Human-readable message that can be shown to end users if the constraint is not fulfilled
[Condition](./Org.OData.Validation.V1.xml#L120:~:text=<ComplexType%20Name="-,ConstraintType,-")|Boolean|Value MUST be a dynamic expression that evaluates to true if and only if the constraint is fulfilled

<a name="ItemsOfType"></a>
## [ItemsOfType](./Org.OData.Validation.V1.xml#L133:~:text=<ComplexType%20Name="-,ItemsOfType,-")
Entities related via the single- or collection-valued navigation property identified by `path` are also related via the collection-valued navigation property identified by `target`.

Property|Type|Description
:-------|:---|:----------
[path](./Org.OData.Validation.V1.xml#L135:~:text=<ComplexType%20Name="-,ItemsOfType,-")|NavigationPropertyPath|A path to a single- or collection-valued navigation property
[target](./Org.OData.Validation.V1.xml#L138:~:text=<ComplexType%20Name="-,ItemsOfType,-")|NavigationPropertyPath|A path to a collection-valued navigation property

<a name="SingleOrCollectionType"></a>
## [SingleOrCollectionType](./Org.OData.Validation.V1.xml#L162:~:text=<TypeDefinition%20Name="-,SingleOrCollectionType,-")
**Type:** String

The qualified name of a type in scope, optionally wrapped in `Collection()` to denote a collection of instances of the type

-------

# <a name="AggregationVocabulary" href="#AggregationVocabulary">5 Aggregation Vocabulary</a>

**Namespace: [Org.OData.Aggregation.V1](Org.OData.Aggregation.V1.xml)**

Terms to describe which data in a given entity model can be aggregated, and how.

Related to the specification document [OData-Data-Agg-v4.0](http://docs.oasis-open.org/odata/odata-data-aggregation-ext/v4.0/odata-data-aggregation-ext-v4.0.html).


## Terms

Term|Type|Description
:---|:---|:----------
[ApplySupported](./Org.OData.Aggregation.V1.xml#L82:~:text=<Term%20Name="-,ApplySupported,-")|[ApplySupportedType](#ApplySupportedType)|<a name="ApplySupported"></a>This entity set or collection supports the `$apply` system query option
[ApplySupportedDefaults](./Org.OData.Aggregation.V1.xml#L88:~:text=<Term%20Name="-,ApplySupportedDefaults,-")|[ApplySupportedBase](#ApplySupportedBase)|<a name="ApplySupportedDefaults"></a>Default support of the `$apply` system query option for all collection-valued resources in the container<br><p>Annotating term <a href="#ApplySupported"><code>ApplySupported</code></a> for a specific collection-valued resource overrides the default support with the specified properties using PATCH semantics:</p> <ul> <li>Primitive or collection-valued properties specified in <code>ApplySupported</code> replace the corresponding properties specified in <code>ApplySupportedDefaults</code></li> <li>Complex-valued properties specified in <code>ApplySupported</code> override the corresponding properties specified in <code>ApplySupportedDefaults</code> using PATCH semantics recursively</li> <li>Properties specified neither in <code>ApplySupported</code> nor in <code>ApplySupportedDefaults</code> have their default value</li> </ul> 
[Groupable](./Org.OData.Aggregation.V1.xml#L305:~:text=<Term%20Name="-,Groupable,-") *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Groupable"></a>Deprecated in favor of [`ApplySupported/GroupableProperties`](#ApplySupported)
[Aggregatable](./Org.OData.Aggregation.V1.xml#L317:~:text=<Term%20Name="-,Aggregatable,-") *(Deprecated)*|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Aggregatable"></a>Deprecated in favor of [`ApplySupported/AggregatableProperties`](#ApplySupported)
[CustomAggregate](./Org.OData.Aggregation.V1.xml#L329:~:text=<Term%20Name="-,CustomAggregate,-")|String|<a name="CustomAggregate"></a>Dynamic property that can be used in the `aggregate` transformation<br>This term MUST be applied with a Qualifier, the Qualifier value is the name of the dynamic property. The value of the annotation MUST be the qualified name of a primitive type. The aggregated value will be of that type.
[ContextDefiningProperties](./Org.OData.Aggregation.V1.xml#L335:~:text=<Term%20Name="-,ContextDefiningProperties,-")|\[PropertyPath\]|<a name="ContextDefiningProperties"></a>The annotated property or custom aggregate is only well-defined in the context of these properties<br>The context-defining properties need either be part of the result entities, or be restricted to a single value by a pre-filter operation. Examples are postal codes within a country, or monetary amounts whose context is the unit of currency.
[LeveledHierarchy](./Org.OData.Aggregation.V1.xml#L342:~:text=<Term%20Name="-,LeveledHierarchy,-")|\[PropertyPath\]|<a name="LeveledHierarchy"></a>Defines a leveled hierarchy (OData-Data-Agg-v4.0, section 5.5.1)
[RecursiveHierarchy](./Org.OData.Aggregation.V1.xml#L346:~:text=<Term%20Name="-,RecursiveHierarchy,-")|[RecursiveHierarchyType](#RecursiveHierarchyType)|<a name="RecursiveHierarchy"></a>Defines a recursive hierarchy (OData-Data-Agg-v4.0, section 5.5.2)
[UpPath](./Org.OData.Aggregation.V1.xml#L519:~:text=<Term%20Name="-,UpPath,-")|\[String\]|<a name="UpPath"></a>The string values of the node identifiers in a path from the annotated node to a start node in a traversal of a recursive hierarchy<br>This instance annotation occurs in the result set after a `traverse` transformation (OData-Data-Agg-v4.0, section 6.2.2.2). A use case for this is traversal with multiple parents, when this annotation takes as value one parent node identifier followed by one grandparent node identifier and so on.
[AvailableOnAggregates](./Org.OData.Aggregation.V1.xml#L528:~:text=<Term%20Name="-,AvailableOnAggregates,-")|[AvailableOnAggregatesType](#AvailableOnAggregatesType)|<a name="AvailableOnAggregates"></a>This function is available on aggregated entities if the `RequiredProperties` are still defined


## Functions

<a name="isnode"></a>
### [isnode](./Org.OData.Aggregation.V1.xml#L371:~:text=<Function%20Name="-,isnode,-")

Is the entity a node of the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`)? (See OData-Data-Agg-v4.0, section 5.5.2.1)

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L374:~:text=<Function%20Name="-,isnode,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L377:~:text=<Function%20Name="-,isnode,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L378:~:text=<Function%20Name="-,isnode,-")|PrimitiveType?|Node identifier of the putative node
[&rarr;](./Org.OData.Aggregation.V1.xml#L381:~:text=<Function%20Name="-,isnode,-")|Boolean?|


<a name="isroot"></a>
### [isroot](./Org.OData.Aggregation.V1.xml#L384:~:text=<Function%20Name="-,isroot,-")

Is the entity a root node of the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`)?

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L387:~:text=<Function%20Name="-,isroot,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L390:~:text=<Function%20Name="-,isroot,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L391:~:text=<Function%20Name="-,isroot,-")|PrimitiveType?|Node identifier of the putative root
[&rarr;](./Org.OData.Aggregation.V1.xml#L394:~:text=<Function%20Name="-,isroot,-")|Boolean?|


<a name="isdescendant"></a>
### [isdescendant](./Org.OData.Aggregation.V1.xml#L397:~:text=<Function%20Name="-,isdescendant,-")

Is the entity a descendant node of the ancestor node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`) with at most the specified distance? (See OData-Data-Agg-v4.0, section 5.5.2.1)

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L400:~:text=<Function%20Name="-,isdescendant,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L403:~:text=<Function%20Name="-,isdescendant,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L404:~:text=<Function%20Name="-,isdescendant,-")|PrimitiveType?|Node identifier of the putative descendant
[Ancestor](./Org.OData.Aggregation.V1.xml#L407:~:text=<Function%20Name="-,isdescendant,-")|PrimitiveType?|Node identifier of the ancestor node
*[MaxDistance](./Org.OData.Aggregation.V1.xml#L410:~:text=<Function%20Name="-,isdescendant,-")*|Int16|*Optional parameter*
*[IncludeSelf](./Org.OData.Aggregation.V1.xml#L418:~:text=<Function%20Name="-,isdescendant,-")*|Boolean|*Optional parameter:* Whether to include the node itself in the result
[&rarr;](./Org.OData.Aggregation.V1.xml#L426:~:text=<Function%20Name="-,isdescendant,-")|Boolean?|


<a name="isancestor"></a>
### [isancestor](./Org.OData.Aggregation.V1.xml#L429:~:text=<Function%20Name="-,isancestor,-")

Is the entity an ancestor node of the descendant node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`) with at most the specified distance? (See OData-Data-Agg-v4.0, section 5.5.2.1)

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L432:~:text=<Function%20Name="-,isancestor,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L435:~:text=<Function%20Name="-,isancestor,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L436:~:text=<Function%20Name="-,isancestor,-")|PrimitiveType?|Node identifier of the putative ancestor
[Descendant](./Org.OData.Aggregation.V1.xml#L439:~:text=<Function%20Name="-,isancestor,-")|PrimitiveType?|Node identifier of the descendant node
*[MaxDistance](./Org.OData.Aggregation.V1.xml#L442:~:text=<Function%20Name="-,isancestor,-")*|Int16|*Optional parameter*
*[IncludeSelf](./Org.OData.Aggregation.V1.xml#L450:~:text=<Function%20Name="-,isancestor,-")*|Boolean|*Optional parameter:* Whether to include the node itself in the result
[&rarr;](./Org.OData.Aggregation.V1.xml#L458:~:text=<Function%20Name="-,isancestor,-")|Boolean?|


<a name="issibling"></a>
### [issibling](./Org.OData.Aggregation.V1.xml#L461:~:text=<Function%20Name="-,issibling,-")

Is the entity a sibling node of the other node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`)? (See OData-Data-Agg-v4.0, section 5.5.2.1)

A node is not a sibling of itself. If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L464:~:text=<Function%20Name="-,issibling,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L467:~:text=<Function%20Name="-,issibling,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L468:~:text=<Function%20Name="-,issibling,-")|PrimitiveType?|Node identifier of the putative sibling
[Other](./Org.OData.Aggregation.V1.xml#L471:~:text=<Function%20Name="-,issibling,-")|PrimitiveType?|Node identifier of the other node
[&rarr;](./Org.OData.Aggregation.V1.xml#L474:~:text=<Function%20Name="-,issibling,-")|Boolean?|


<a name="isleaf"></a>
### [isleaf](./Org.OData.Aggregation.V1.xml#L477:~:text=<Function%20Name="-,isleaf,-")

Is the entity a leaf node in the hierarchy specified by the [parameter pair](#HierarchyQualifier) (`HierarchyNodes`, `HierarchyQualifier`)? (See OData-Data-Agg-v4.0, section 5.5.2.1)

If a node identifier passed to the function is null, the function returns null.

Parameter|Type|Description
:--------|:---|:----------
[HierarchyNodes](./Org.OData.Aggregation.V1.xml#L480:~:text=<Function%20Name="-,isleaf,-")|\[EntityType\]|A collection, given through a `$root` expression
[HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L483:~:text=<Function%20Name="-,isleaf,-")|[HierarchyQualifier](#HierarchyQualifier)|
[Node](./Org.OData.Aggregation.V1.xml#L484:~:text=<Function%20Name="-,isleaf,-")|PrimitiveType?|Node identifier of the putative leaf
[&rarr;](./Org.OData.Aggregation.V1.xml#L487:~:text=<Function%20Name="-,isleaf,-")|Boolean?|


<a name="rollupnode"></a>
### [rollupnode](./Org.OData.Aggregation.V1.xml#L490:~:text=<Function%20Name="-,rollupnode,-")

During `rolluprecursive` for a hierarchy node, this function returns the node

This function may only occur in the second parameter of a `groupby` transformation whose first parameter
contains `rolluprecursive(...)`. It is evaluated as part of the transformation `R(x)` in the "`rolluprecursive` algorithm"
(OData-Data-Agg-v4.0, section 6.3). Its behavior is undefined outside of this algorithm.
```
Sales?$apply=groupby((rolluprecursive(...)), filter(SalesOrganization eq Aggregation.rollupnode())/aggregate(...))
```
constructs a rollup that contains aggregates per hierarchy node while excluding descendants from the aggregation.

Parameter|Type|Description
:--------|:---|:----------
*[Position](./Org.OData.Aggregation.V1.xml#L501:~:text=<Function%20Name="-,rollupnode,-")*|Int16|*Optional parameter:* Position N among the `rolluprecursive` operators in the first argument of `groupby`<br>Every instance in the output set of a `groupby` transformation with M `rolluprecursive` operators has M relationships to M nodes in M recursive hierarchies. This function returns the node x with path r to the root in relationship number N. If several such `groupby` transformations are nested, this function refers to the innermost one.
[&rarr;](./Org.OData.Aggregation.V1.xml#L516:~:text=<Function%20Name="-,rollupnode,-")|EntityType|


<a name="ApplySupportedBase"></a>
## [ApplySupportedBase](./Org.OData.Aggregation.V1.xml#L99:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")


Services that do not fully implement a certain aggregation-related functionality may document
          this by annotating the [`ApplySupported`](#ApplySupported) or [`ApplySupportedDefaults`](#ApplySupportedDefaults)
          annotation with a description.

**Derived Types:**
- [ApplySupportedType](#ApplySupportedType)

Property|Type|Description
:-------|:---|:----------
[Transformations](./Org.OData.Aggregation.V1.xml#L105:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[[Transformation](#Transformation)\]|Transformations that can be used in `$apply`
[CustomAggregationMethods](./Org.OData.Aggregation.V1.xml#L108:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[Rollup](./Org.OData.Aggregation.V1.xml#L111:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation
[From](./Org.OData.Aggregation.V1.xml#L114:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|Boolean|The service supports the `from` keyword in an `aggregate` transformation

<a name="ApplySupportedType"></a>
## [ApplySupportedType](./Org.OData.Aggregation.V1.xml#L118:~:text=<ComplexType%20Name="-,ApplySupportedType,-"): [ApplySupportedBase](#ApplySupportedBase)


Property|Type|Description
:-------|:---|:----------
[*Transformations*](./Org.OData.Aggregation.V1.xml#L105:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[[Transformation](#Transformation)\]|Transformations that can be used in `$apply`
[*CustomAggregationMethods*](./Org.OData.Aggregation.V1.xml#L108:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|\[String\]|Qualified names of custom aggregation methods that can be used in `aggregate(...with...)`
[*Rollup*](./Org.OData.Aggregation.V1.xml#L111:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|[RollupType](#RollupType)|The service supports rollup hierarchies in a `groupby` transformation
[*From*](./Org.OData.Aggregation.V1.xml#L114:~:text=<ComplexType%20Name="-,ApplySupportedBase,-")|Boolean|The service supports the `from` keyword in an `aggregate` transformation
[PropertyRestrictions](./Org.OData.Aggregation.V1.xml#L119:~:text=<ComplexType%20Name="-,ApplySupportedType,-") *(Deprecated)*|Boolean|Deprecated since [`Groupable`](#Groupable) and [`Aggregatable`](#Aggregatable) are deprecated
[GroupableProperties](./Org.OData.Aggregation.V1.xml#L130:~:text=<ComplexType%20Name="-,ApplySupportedType,-")|\[AnyPropertyPath\]|A non-empty collection indicates that only the listed properties of the annotated target are supported by the `groupby` transformation
[AggregatableProperties](./Org.OData.Aggregation.V1.xml#L133:~:text=<ComplexType%20Name="-,ApplySupportedType,-")|\[[AggregatablePropertyType](#AggregatablePropertyType)\]|A non-empty collection indicates that only the listed properties of the annotated target can be used in the `aggregate` transformation, optionally restricted to the specified aggregation methods

<a name="AggregatablePropertyType"></a>
## [AggregatablePropertyType](./Org.OData.Aggregation.V1.xml#L137:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")


Property|Type|Description
:-------|:---|:----------
[Property](./Org.OData.Aggregation.V1.xml#L138:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|PropertyPath|Aggregatable property
[SupportedAggregationMethods](./Org.OData.Aggregation.V1.xml#L143:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|\[[AggregationMethod](#AggregationMethod)\]|Standard and custom aggregation methods that can be applied to the property. If omitted, all aggregation methods can be applied
[RecommendedAggregationMethod](./Org.OData.Aggregation.V1.xml#L148:~:text=<ComplexType%20Name="-,AggregatablePropertyType,-")|[AggregationMethod?](#AggregationMethod)|Recommended method for aggregating values of the property

<a name="Transformation"></a>
## [Transformation](./Org.OData.Aggregation.V1.xml#L155:~:text=<TypeDefinition%20Name="-,Transformation,-")
**Type:** String

A transformation that can be used in `$apply`

Allowed Value|Description
:------------|:----------
[aggregate](./Org.OData.Aggregation.V1.xml#L159:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.2.1
[groupby](./Org.OData.Aggregation.V1.xml#L163:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.2.3
[concat](./Org.OData.Aggregation.V1.xml#L167:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.2.2
[identity](./Org.OData.Aggregation.V1.xml#L171:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.4.1
[filter](./Org.OData.Aggregation.V1.xml#L175:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.2
[search](./Org.OData.Aggregation.V1.xml#L179:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.4
[nest](./Org.OData.Aggregation.V1.xml#L183:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.5.2
[addnested](./Org.OData.Aggregation.V1.xml#L187:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.4.3
[join](./Org.OData.Aggregation.V1.xml#L191:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.5.1
[outerjoin](./Org.OData.Aggregation.V1.xml#L195:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.5.1
[compute](./Org.OData.Aggregation.V1.xml#L199:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.4.2
[bottomcount](./Org.OData.Aggregation.V1.xml#L203:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.1.1
[bottomsum](./Org.OData.Aggregation.V1.xml#L207:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.1.3
[bottompercent](./Org.OData.Aggregation.V1.xml#L211:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.1.2
[topcount](./Org.OData.Aggregation.V1.xml#L215:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.1.1
[topsum](./Org.OData.Aggregation.V1.xml#L219:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.1.3
[toppercent](./Org.OData.Aggregation.V1.xml#L223:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.1.2
[orderby](./Org.OData.Aggregation.V1.xml#L227:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.3
[top](./Org.OData.Aggregation.V1.xml#L231:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.6
[skip](./Org.OData.Aggregation.V1.xml#L235:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 3.3.5
[ancestors](./Org.OData.Aggregation.V1.xml#L239:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 6.2.1
[descendants](./Org.OData.Aggregation.V1.xml#L243:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 6.2.1
[traverse](./Org.OData.Aggregation.V1.xml#L247:~:text=<TypeDefinition%20Name="-,Transformation,-")|OData-Data-Agg-v4.0, section 6.2.2

<a name="AggregationMethod"></a>
## [AggregationMethod](./Org.OData.Aggregation.V1.xml#L255:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")
**Type:** String

Standard or custom aggregation method

Custom aggregation methods MUST use a namespace-qualified name, that is contain at least one dot. 

Allowed Value|Description
:------------|:----------
[sum](./Org.OData.Aggregation.V1.xml#L264:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Can be applied to numeric values to return the sum of the non-null values, or null if there are no non-null values or the input set is empty
[min](./Org.OData.Aggregation.V1.xml#L268:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Can be applied to values with a totally ordered domain to return the smallest of the non-null values, or null if there are no non-null values or the input set is empty
[max](./Org.OData.Aggregation.V1.xml#L272:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Can be applied to values with a totally ordered domain to return the largest of the non-null values, or null if there are no non-null values or the input set is empty
[average](./Org.OData.Aggregation.V1.xml#L276:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Can be applied to numeric values to return the sum of the non-null values divided by the count of the non-null values, or null if there are no non-null values or the input set is empty
[countdistinct](./Org.OData.Aggregation.V1.xml#L280:~:text=<TypeDefinition%20Name="-,AggregationMethod,-")|Counts the distinct values, omitting any null values<br>For navigation properties, it counts the distinct entities in the union of all entities related to entities in the input set. For collection-valued primitive properties, it counts the distinct items in the union of all collection values in the input set.

<a name="RollupType"></a>
## [RollupType](./Org.OData.Aggregation.V1.xml#L292:~:text=<EnumType%20Name="-,RollupType,-")
The number of `rollup` or `rolluprecursive` operators allowed in a `groupby` transformation

Member|Value|Description
:-----|----:|:----------
[None](./Org.OData.Aggregation.V1.xml#L294:~:text=<EnumType%20Name="-,RollupType,-")|0|No support for `rollup` or `rolluprecursive`
[SingleHierarchy](./Org.OData.Aggregation.V1.xml#L297:~:text=<EnumType%20Name="-,RollupType,-")|1|Only one `rollup` or `rolluprecursive` operator per `groupby`
[MultipleHierarchies](./Org.OData.Aggregation.V1.xml#L300:~:text=<EnumType%20Name="-,RollupType,-")|2|Full support for `rollup` and `rolluprecursive`

<a name="RecursiveHierarchyType"></a>
## [RecursiveHierarchyType](./Org.OData.Aggregation.V1.xml#L350:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")


Property|Type|Description
:-------|:---|:----------
[NodeProperty](./Org.OData.Aggregation.V1.xml#L351:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|PropertyPath|Primitive property holding the node identifier
[ParentNavigationProperty](./Org.OData.Aggregation.V1.xml#L354:~:text=<ComplexType%20Name="-,RecursiveHierarchyType,-")|NavigationPropertyPath|Property for navigating to the parent node(s). Its type MUST be the entity type annotated with this term, and it MUST be collection-valued or nullable single-valued.

<a name="HierarchyQualifier"></a>
## [HierarchyQualifier](./Org.OData.Aggregation.V1.xml#L359:~:text=<TypeDefinition%20Name="-,HierarchyQualifier,-")
**Type:** String

Qualifier of a [`RecursiveHierarchy`](#RecursiveHierarchy) annotation

Every recursive hierarchy function defined in this vocabulary has
- a parameter `HierarchyQualifier` of this type and
- a parameter `HierarchyNodes` that is a collection of entities of a common type without multiple occurrences of the same entity.

`HierarchyQualifier` is the qualifier of a `RecursiveHierarchy` annotation on the entity type of the collection
given by the `HierarchyNodes` parameter. This specifies a recursive hierarchy that is evaluated by the function.

<a name="AvailableOnAggregatesType"></a>
## [AvailableOnAggregatesType](./Org.OData.Aggregation.V1.xml#L531:~:text=<ComplexType%20Name="-,AvailableOnAggregatesType,-")


Property|Type|Description
:-------|:---|:----------
[RequiredProperties](./Org.OData.Aggregation.V1.xml#L532:~:text=<ComplexType%20Name="-,AvailableOnAggregatesType,-")|\[PropertyPath\]|Properties required to apply this function

<a name="NavigationPropertyAggregationCapabilities"></a>
## [NavigationPropertyAggregationCapabilities](./Org.OData.Aggregation.V1.xml#L537:~:text=<ComplexType%20Name="-,NavigationPropertyAggregationCapabilities,-"): [NavigationPropertyRestriction](Org.OData.Capabilities.V1.md#NavigationPropertyRestriction) *(Deprecated)*
[`Capabilities.NavigationRestrictions`](Org.OData.Capabilities.V1.md#NavigationRestrictions) that make use of the additional properties in this subtype are deprecated in favor of [`ApplySupported`](#ApplySupported) and [`CustomAggregate`](#CustomAggregate)

<a name="CustomAggregateType"></a>
## [CustomAggregateType](./Org.OData.Aggregation.V1.xml#L555:~:text=<ComplexType%20Name="-,CustomAggregateType,-") *(Deprecated)*
Deprecated since [`NavigationPropertyAggregationCapabilities`](#NavigationPropertyAggregationCapabilities) is also deprecated

-------

# <a name="AuthorizationVocabulary" href="#AuthorizationVocabulary">6 Authorization Vocabulary</a>

**Namespace: [Org.OData.Authorization.V1](Org.OData.Authorization.V1.xml)**

The Authorization Vocabulary provides terms for describing authorization requirements of the service


## Terms

Term|Type|Description
:---|:---|:----------
[SecuritySchemes](./Org.OData.Authorization.V1.xml#L65:~:text=<Term%20Name="-,SecuritySchemes,-")|\[[SecurityScheme](#SecurityScheme)\]|<a name="SecuritySchemes"></a>At least one of the specified security schemes are required to make a request against the service
[Authorizations](./Org.OData.Authorization.V1.xml#L78:~:text=<Term%20Name="-,Authorizations,-")|\[[Authorization](#Authorization)\]|<a name="Authorizations"></a>Lists the methods supported by the service to authorize access

<a name="SecurityScheme"></a>
## [SecurityScheme](./Org.OData.Authorization.V1.xml#L69:~:text=<ComplexType%20Name="-,SecurityScheme,-")


Property|Type|Description
:-------|:---|:----------
[Authorization](./Org.OData.Authorization.V1.xml#L70:~:text=<ComplexType%20Name="-,SecurityScheme,-")|[SchemeName](#SchemeName)|The name of a required authorization scheme
[RequiredScopes](./Org.OData.Authorization.V1.xml#L73:~:text=<ComplexType%20Name="-,SecurityScheme,-")|\[String\]|The names of scopes required from this authorization scheme

<a name="Authorization"></a>
## [*Authorization*](./Org.OData.Authorization.V1.xml#L82:~:text=<ComplexType%20Name="-,Authorization,-")
Base type for all Authorization types

**Derived Types:**
- [OpenIDConnect](#OpenIDConnect)
- [Http](#Http)
- *[OAuthAuthorization](#OAuthAuthorization)*
  - [OAuth2ClientCredentials](#OAuth2ClientCredentials)
  - [OAuth2Implicit](#OAuth2Implicit)
  - [OAuth2Password](#OAuth2Password)
  - [OAuth2AuthCode](#OAuth2AuthCode)
- [ApiKey](#ApiKey)

Property|Type|Description
:-------|:---|:----------
[Name](./Org.OData.Authorization.V1.xml#L84:~:text=<ComplexType%20Name="-,Authorization,-")|String|Name that can be used to reference the authorization scheme
[Description](./Org.OData.Authorization.V1.xml#L87:~:text=<ComplexType%20Name="-,Authorization,-")|String?|Description of the authorization scheme

<a name="OpenIDConnect"></a>
## [OpenIDConnect](./Org.OData.Authorization.V1.xml#L92:~:text=<ComplexType%20Name="-,OpenIDConnect,-"): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](./Org.OData.Authorization.V1.xml#L84:~:text=<ComplexType%20Name="-,Authorization,-")|String|Name that can be used to reference the authorization scheme
[*Description*](./Org.OData.Authorization.V1.xml#L87:~:text=<ComplexType%20Name="-,Authorization,-")|String?|Description of the authorization scheme
[IssuerUrl](./Org.OData.Authorization.V1.xml#L93:~:text=<ComplexType%20Name="-,OpenIDConnect,-")|URL|Issuer location for the OpenID Provider. Configuration information can be obtained by appending `/.well-known/openid-configuration` to this Url.

<a name="Http"></a>
## [Http](./Org.OData.Authorization.V1.xml#L99:~:text=<ComplexType%20Name="-,Http,-"): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](./Org.OData.Authorization.V1.xml#L84:~:text=<ComplexType%20Name="-,Authorization,-")|String|Name that can be used to reference the authorization scheme
[*Description*](./Org.OData.Authorization.V1.xml#L87:~:text=<ComplexType%20Name="-,Authorization,-")|String?|Description of the authorization scheme
[Scheme](./Org.OData.Authorization.V1.xml#L100:~:text=<ComplexType%20Name="-,Http,-")|String|HTTP Authorization scheme to be used in the Authorization header, as per RFC7235
[BearerFormat](./Org.OData.Authorization.V1.xml#L103:~:text=<ComplexType%20Name="-,Http,-")|String?|Format of the bearer token

<a name="OAuthAuthorization"></a>
## [*OAuthAuthorization*](./Org.OData.Authorization.V1.xml#L108:~:text=<ComplexType%20Name="-,OAuthAuthorization,-"): [Authorization](#Authorization)


**Derived Types:**
- [OAuth2ClientCredentials](#OAuth2ClientCredentials)
- [OAuth2Implicit](#OAuth2Implicit)
- [OAuth2Password](#OAuth2Password)
- [OAuth2AuthCode](#OAuth2AuthCode)

Property|Type|Description
:-------|:---|:----------
[*Name*](./Org.OData.Authorization.V1.xml#L84:~:text=<ComplexType%20Name="-,Authorization,-")|String|Name that can be used to reference the authorization scheme
[*Description*](./Org.OData.Authorization.V1.xml#L87:~:text=<ComplexType%20Name="-,Authorization,-")|String?|Description of the authorization scheme
[Scopes](./Org.OData.Authorization.V1.xml#L109:~:text=<ComplexType%20Name="-,OAuthAuthorization,-")|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[RefreshUrl](./Org.OData.Authorization.V1.xml#L112:~:text=<ComplexType%20Name="-,OAuthAuthorization,-")|URL?|Refresh Url

<a name="OAuth2ClientCredentials"></a>
## [OAuth2ClientCredentials](./Org.OData.Authorization.V1.xml#L118:~:text=<ComplexType%20Name="-,OAuth2ClientCredentials,-"): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](./Org.OData.Authorization.V1.xml#L84:~:text=<ComplexType%20Name="-,Authorization,-")|String|Name that can be used to reference the authorization scheme
[*Description*](./Org.OData.Authorization.V1.xml#L87:~:text=<ComplexType%20Name="-,Authorization,-")|String?|Description of the authorization scheme
[*Scopes*](./Org.OData.Authorization.V1.xml#L109:~:text=<ComplexType%20Name="-,OAuthAuthorization,-")|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](./Org.OData.Authorization.V1.xml#L112:~:text=<ComplexType%20Name="-,OAuthAuthorization,-")|URL?|Refresh Url
[TokenUrl](./Org.OData.Authorization.V1.xml#L119:~:text=<ComplexType%20Name="-,OAuth2ClientCredentials,-")|URL|Token Url

<a name="OAuth2Implicit"></a>
## [OAuth2Implicit](./Org.OData.Authorization.V1.xml#L125:~:text=<ComplexType%20Name="-,OAuth2Implicit,-"): [OAuthAuthorization](#OAuthAuthorization)
Security note: OAuth2 implicit grant is considered to be not secure and should not be used by clients, see [OAuth 2.0 Security Best Current Practice](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-security-topics.html#name-implicit-grant).

Property|Type|Description
:-------|:---|:----------
[*Name*](./Org.OData.Authorization.V1.xml#L84:~:text=<ComplexType%20Name="-,Authorization,-")|String|Name that can be used to reference the authorization scheme
[*Description*](./Org.OData.Authorization.V1.xml#L87:~:text=<ComplexType%20Name="-,Authorization,-")|String?|Description of the authorization scheme
[*Scopes*](./Org.OData.Authorization.V1.xml#L109:~:text=<ComplexType%20Name="-,OAuthAuthorization,-")|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](./Org.OData.Authorization.V1.xml#L112:~:text=<ComplexType%20Name="-,OAuthAuthorization,-")|URL?|Refresh Url
[AuthorizationUrl](./Org.OData.Authorization.V1.xml#L127:~:text=<ComplexType%20Name="-,OAuth2Implicit,-")|URL|Authorization URL

<a name="OAuth2Password"></a>
## [OAuth2Password](./Org.OData.Authorization.V1.xml#L133:~:text=<ComplexType%20Name="-,OAuth2Password,-"): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](./Org.OData.Authorization.V1.xml#L84:~:text=<ComplexType%20Name="-,Authorization,-")|String|Name that can be used to reference the authorization scheme
[*Description*](./Org.OData.Authorization.V1.xml#L87:~:text=<ComplexType%20Name="-,Authorization,-")|String?|Description of the authorization scheme
[*Scopes*](./Org.OData.Authorization.V1.xml#L109:~:text=<ComplexType%20Name="-,OAuthAuthorization,-")|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](./Org.OData.Authorization.V1.xml#L112:~:text=<ComplexType%20Name="-,OAuthAuthorization,-")|URL?|Refresh Url
[TokenUrl](./Org.OData.Authorization.V1.xml#L134:~:text=<ComplexType%20Name="-,OAuth2Password,-")|URL|Token Url

<a name="OAuth2AuthCode"></a>
## [OAuth2AuthCode](./Org.OData.Authorization.V1.xml#L140:~:text=<ComplexType%20Name="-,OAuth2AuthCode,-"): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](./Org.OData.Authorization.V1.xml#L84:~:text=<ComplexType%20Name="-,Authorization,-")|String|Name that can be used to reference the authorization scheme
[*Description*](./Org.OData.Authorization.V1.xml#L87:~:text=<ComplexType%20Name="-,Authorization,-")|String?|Description of the authorization scheme
[*Scopes*](./Org.OData.Authorization.V1.xml#L109:~:text=<ComplexType%20Name="-,OAuthAuthorization,-")|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](./Org.OData.Authorization.V1.xml#L112:~:text=<ComplexType%20Name="-,OAuthAuthorization,-")|URL?|Refresh Url
[AuthorizationUrl](./Org.OData.Authorization.V1.xml#L141:~:text=<ComplexType%20Name="-,OAuth2AuthCode,-")|URL|Authorization URL
[TokenUrl](./Org.OData.Authorization.V1.xml#L145:~:text=<ComplexType%20Name="-,OAuth2AuthCode,-")|URL|Token Url

<a name="AuthorizationScope"></a>
## [AuthorizationScope](./Org.OData.Authorization.V1.xml#L151:~:text=<ComplexType%20Name="-,AuthorizationScope,-")


Property|Type|Description
:-------|:---|:----------
[Scope](./Org.OData.Authorization.V1.xml#L152:~:text=<ComplexType%20Name="-,AuthorizationScope,-")|String|Scope name
[Grant](./Org.OData.Authorization.V1.xml#L155:~:text=<ComplexType%20Name="-,AuthorizationScope,-")|String?|Identity that has access to the scope or can grant access to the scope.
[Description](./Org.OData.Authorization.V1.xml#L159:~:text=<ComplexType%20Name="-,AuthorizationScope,-")|String|Description of the scope

<a name="ApiKey"></a>
## [ApiKey](./Org.OData.Authorization.V1.xml#L164:~:text=<ComplexType%20Name="-,ApiKey,-"): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](./Org.OData.Authorization.V1.xml#L84:~:text=<ComplexType%20Name="-,Authorization,-")|String|Name that can be used to reference the authorization scheme
[*Description*](./Org.OData.Authorization.V1.xml#L87:~:text=<ComplexType%20Name="-,Authorization,-")|String?|Description of the authorization scheme
[KeyName](./Org.OData.Authorization.V1.xml#L165:~:text=<ComplexType%20Name="-,ApiKey,-")|String|The name of the header or query parameter
[Location](./Org.OData.Authorization.V1.xml#L168:~:text=<ComplexType%20Name="-,ApiKey,-")|[KeyLocation](#KeyLocation)|Whether the API Key is passed in the header or as a query option

<a name="KeyLocation"></a>
## [KeyLocation](./Org.OData.Authorization.V1.xml#L173:~:text=<EnumType%20Name="-,KeyLocation,-")


Member|Value|Description
:-----|----:|:----------
[Header](./Org.OData.Authorization.V1.xml#L174:~:text=<EnumType%20Name="-,KeyLocation,-")|0|API Key is passed in the header
[QueryOption](./Org.OData.Authorization.V1.xml#L177:~:text=<EnumType%20Name="-,KeyLocation,-")|1|API Key is passed as a query option
[Cookie](./Org.OData.Authorization.V1.xml#L180:~:text=<EnumType%20Name="-,KeyLocation,-")|2|API Key is passed as a cookie

<a name="SchemeName"></a>
## [SchemeName](./Org.OData.Authorization.V1.xml#L185:~:text=<TypeDefinition%20Name="-,SchemeName,-")
**Type:** String

The name of the authorization scheme.

-------

# <a name="TemporalVocabulary" href="#TemporalVocabulary">7 Temporal Vocabulary</a>

**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms for describing time-dependent data


## Terms

Term|Type|Description
:---|:---|:----------
[ApplicationTimeSupport](./Org.OData.Temporal.V1.xml#L68:~:text=<Term%20Name="-,ApplicationTimeSupport,-")|[ApplicationTimeSupportType](#ApplicationTimeSupportType)|<a name="ApplicationTimeSupport"></a>This collection supports temporal requests


## Actions

<a name="Update"></a>
### [Update](./Org.OData.Temporal.V1.xml#L172:~:text=<Action%20Name="-,Update,-")

Updates existing time slices with values from delta time slices whose object keys match and whose periods overlap

The update behavior for a given object key is known from the [SQL statement](https://www.ibm.com/docs/en/db2oc?topic=statements-update)
          `UPDATE ... FOR PORTION OF BUSINESS_TIME ... WHERE ...`.

`deltaTimeslices` with non-matching object keys and non-overlapping sub-periods of `deltaTimeslices` are disregarded.

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](./Org.OData.Temporal.V1.xml#L180:~:text=<Action%20Name="-,Update,-")**|\[EntityType\]|**Binding parameter:** Time slices to modify
[deltaTimeslices](./Org.OData.Temporal.V1.xml#L183:~:text=<Action%20Name="-,Update,-")|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|New time slices whose property values are used to update the `timeslices` collection<br>The delta time slices need not contain all properties, but at least the boundary values of the period to change. An absent object key property matches any key property value. New time slices are processed in the order of the collection, which especially matters if some of the specified change periods overlap.
[&rarr;](./Org.OData.Temporal.V1.xml#L191:~:text=<Action%20Name="-,Update,-")|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|Modified time slices


<a name="Upsert"></a>
### [Upsert](./Org.OData.Temporal.V1.xml#L196:~:text=<Action%20Name="-,Upsert,-")

Like [`Update`](#Update), but additionally inserts those (sub-periods of) `deltaTimeslices` that `Update` disregards

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](./Org.OData.Temporal.V1.xml#L198:~:text=<Action%20Name="-,Upsert,-")**|\[EntityType\]|**Binding parameter:** Time slices to modify
[deltaTimeslices](./Org.OData.Temporal.V1.xml#L201:~:text=<Action%20Name="-,Upsert,-")|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|New time slices to be merged into the `timeslices` collection<br>The delta time slices must contain all properties that are needed for insertion. New time slices are processed in the order of the collection, which especially matters if some of the specified change periods overlap.
[&rarr;](./Org.OData.Temporal.V1.xml#L208:~:text=<Action%20Name="-,Upsert,-")|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|Modified time slices


<a name="Delete"></a>
### [Delete](./Org.OData.Temporal.V1.xml#L213:~:text=<Action%20Name="-,Delete,-")

Deletes (sub-periods of) existing time slices whose object keys match and whose periods overlap `deltaTimeslices`

The deletion behavior for a given object key is known from the [SQL statement](https://www.ibm.com/docs/en/db2oc?topic=statements-delete)
          `DELETE ... FOR PORTION OF BUSINESS_TIME ... WHERE ...`.
          The sub-period of an existing time slice that lies outside a given instance of `deltaTimeslices`
          is kept, effectively shortening the time slice.

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](./Org.OData.Temporal.V1.xml#L221:~:text=<Action%20Name="-,Delete,-")**|\[EntityType\]|**Binding parameter:** Time slices to modify
[deltaTimeslices](./Org.OData.Temporal.V1.xml#L224:~:text=<Action%20Name="-,Delete,-")|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|Time slices to be deleted from the `timeslices` collection<br>The delta time slices contain only the boundary values of the period to delete and (parts of) the object key. An absent object key property matches any key property value.
[&rarr;](./Org.OData.Temporal.V1.xml#L231:~:text=<Action%20Name="-,Delete,-")|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|Deleted (sub-periods of) time slices


<a name="ApplicationTimeSupportType"></a>
## [ApplicationTimeSupportType](./Org.OData.Temporal.V1.xml#L75:~:text=<ComplexType%20Name="-,ApplicationTimeSupportType,-")


Property|Type|Description
:-------|:---|:----------
[UnitOfTime](./Org.OData.Temporal.V1.xml#L76:~:text=<ComplexType%20Name="-,ApplicationTimeSupportType,-")|[UnitOfTime](#UnitOfTime)|Unit of time and other properties of a time period
[Timeline](./Org.OData.Temporal.V1.xml#L79:~:text=<ComplexType%20Name="-,ApplicationTimeSupportType,-")|[Timeline](#Timeline)|Describes how the history and future of the data are represented
[SupportedActions](./Org.OData.Temporal.V1.xml#L82:~:text=<ComplexType%20Name="-,ApplicationTimeSupportType,-")|\[[QualifiedActionName](Org.OData.Core.V1.md#QualifiedActionName)\]|List of supported temporal actions

<a name="UnitOfTime"></a>
## [*UnitOfTime*](./Org.OData.Temporal.V1.xml#L87:~:text=<ComplexType%20Name="-,UnitOfTime,-")
Unit of time and other properties of a time period

**Derived Types:**
- [UnitOfTimeDateTimeOffset](#UnitOfTimeDateTimeOffset)
- [UnitOfTimeDate](#UnitOfTimeDate)

<a name="UnitOfTimeDateTimeOffset"></a>
## [UnitOfTimeDateTimeOffset](./Org.OData.Temporal.V1.xml#L91:~:text=<ComplexType%20Name="-,UnitOfTimeDateTimeOffset,-"): [UnitOfTime](#UnitOfTime)
Period start and end are of type Edm.DateTimeOffset

Property|Type|Description
:-------|:---|:----------
[Precision](./Org.OData.Temporal.V1.xml#L93:~:text=<ComplexType%20Name="-,UnitOfTimeDateTimeOffset,-")|Byte|Precision of Edm.DateTimeOffset values for period start and end

<a name="UnitOfTimeDate"></a>
## [UnitOfTimeDate](./Org.OData.Temporal.V1.xml#L98:~:text=<ComplexType%20Name="-,UnitOfTimeDate,-"): [UnitOfTime](#UnitOfTime)
Period start and end are of type Edm.Date

The period is a contiguous set of days and does not consider the time of the day.

Property|Type|Description
:-------|:---|:----------
[ClosedClosedPeriods](./Org.OData.Temporal.V1.xml#L101:~:text=<ComplexType%20Name="-,UnitOfTimeDate,-")|Boolean|If `true`, the period end is the last day in the period; if `false`, the period end is the first day after the period

<a name="Timeline"></a>
## [*Timeline*](./Org.OData.Temporal.V1.xml#L107:~:text=<ComplexType%20Name="-,Timeline,-")
Describes how the history and future of the data are represented

**Derived Types:**
- [TimelineSnapshot](#TimelineSnapshot)
- [TimelineVisible](#TimelineVisible)

<a name="TimelineSnapshot"></a>
## [TimelineSnapshot](./Org.OData.Temporal.V1.xml#L111:~:text=<ComplexType%20Name="-,TimelineSnapshot,-"): [Timeline](#Timeline)
Each OData entity maps each point in application time to an instance of the entity type

To address an entity in a resource path or path to related resources, a point in application time must be specified as described in [OData-Temporal, section 4.2.1].
          The addressed entity is then a snapshot of the data at the given point in time.
          When an action defined in this vocabulary is applied to a collection of this entity type,
          the entity key plays the role of object key.

<a name="TimelineVisible"></a>
## [TimelineVisible](./Org.OData.Temporal.V1.xml#L121:~:text=<ComplexType%20Name="-,TimelineVisible,-"): [Timeline](#Timeline)
Each OData entity represents data during a period of application time

The temporal collection MUST NOT contain two entities with the same object key as defined by their `ObjectKey` properties
          and with overlapping application-time periods as defined by their `PeriodStart` and `PeriodEnd` properties.
          The temporal collection always contains all entities (with consecutive time periods) for a given object key.

Property|Type|Description
:-------|:---|:----------
[PeriodStart](./Org.OData.Temporal.V1.xml#L128:~:text=<ComplexType%20Name="-,TimelineVisible,-")|PropertyPath|Property containing lower boundary of a period
[PeriodEnd](./Org.OData.Temporal.V1.xml#L131:~:text=<ComplexType%20Name="-,TimelineVisible,-")|PropertyPath|Property containing upper boundary of a period<br>If an upper boundary property does not specify a default value, a default value of `max` is assumed.
[ObjectKey](./Org.OData.Temporal.V1.xml#L137:~:text=<ComplexType%20Name="-,TimelineVisible,-")|\[PropertyPath\]|The set of primitive properties that identify a temporal object<br>A temporal object is a set of facts whose changes over application time are tracked by the service. The entities in the annotated collection belong to potentially multiple temporal objects, and each temporal object is uniquely identified by the values of the specified object key properties. Object key properties follow the same rules as entity key properties. If no object key is specified, only a single temporal object belongs to the annotated collection.

<a name="TimesliceWithPeriod"></a>
## [TimesliceWithPeriod](./Org.OData.Temporal.V1.xml#L143:~:text=<ComplexType%20Name="-,TimesliceWithPeriod,-")
Delta time slices with validity period

The properties `PeriodStart` and `PeriodEnd` MUST NOT be present
          if the entity type of the `Timeslice` already contains period start and end, that is,
          if the collection on which the action is invoked has visible timeline.
          If present, they MUST have the same type, either `Edm.Date` or `Edm.DateTimeOffset`,
          and they are interpreted according to the [`ApplicationTimeSupport/UnitOfTime`](#ApplicationTimeSupportType) of the collection.
          In particular, `ApplicationTimeSupport/UnitOfTime/ClosedClosedPeriods` governs whether a `PeriodEnd` of type `Edm.Date`
          is the last day in the period or the first day after the period.
          If `PeriodStart` is present and `PeriodEnd` is absent, a default value of `max` is assumed for `PeriodEnd`.

Property|Type|Description
:-------|:---|:----------
[PeriodStart](./Org.OData.Temporal.V1.xml#L155:~:text=<ComplexType%20Name="-,TimesliceWithPeriod,-")|PrimitiveType?|Lower boundary of the time slice
[PeriodEnd](./Org.OData.Temporal.V1.xml#L158:~:text=<ComplexType%20Name="-,TimesliceWithPeriod,-")|PrimitiveType?|Upper boundary of the time slice
[Timeslice](./Org.OData.Temporal.V1.xml#L161:~:text=<NavigationProperty%20Name="-,Timeslice,-")|EntityType|A time slice with the same entity type as the binding parameter of the action<br>When it appears in the return type of an action in this vocabulary, the time slice has the same entity set as the binding parameter value.

