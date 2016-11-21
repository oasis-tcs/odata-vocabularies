# Core Vocabulary

Core terms needed to write vocabularies

**Namespace: Org.OData.Core.V1**

<table width="100%" style="border: 1px solid #000000;" border="1">
<tbody><tr><th><strong>Term</strong></th><th><strong>Description</strong></th></tr>
<tr><td>ODataVersions</td>
<td>A space-separated list of supported versions of the OData Protocol. Note that 4.0 is implied by 4.01 and does not need to be separately listed.</td></tr>
<tr><td>SchemaVersion</td>
<td>Service-defined value representing the version of the schema. Services MAY use semantic versioning, but clients MUST NOT assume this is the case.</td></tr>
<tr><td>Description</td>
<td>A brief description of a model element</td></tr>
<tr><td>LongDescription</td>
<td>A lengthy description of a model element</td></tr>
<tr><td>NumericValueException</td>
<td>Used in place of a property value to annotate a property whose value is not representable according to its numeric type.</td></tr>
<tr><td>Messages</td>
<td>Instance annotation for warning and info messages</td></tr>
<tr><td>IsLanguageDependent</td>
<td>Properties and terms annotated with this term are language-dependent</td></tr>
<tr><td>RequiresType</td>
<td>Terms annotated with this term can only be applied to elements that have a type that is identical to or derived from the given type name</td></tr>
<tr><td>ResourcePath</td>
<td>Resource path for entity container child, can be relative to xml:base and the request URL</td></tr>
<tr><td>DereferenceableIDs</td>
<td>Entity-ids are URLs that locate the identified entity</td></tr>
<tr><td>ConventionalIDs</td>
<td>Entity-ids follow OData URL conventions</td></tr>
<tr><td>Permissions</td>
<td>Permissions for accessing a resource</td></tr>
<tr><td>ContentID</td>
<td>A unique identifier for nested entities within a request.</td></tr>
<tr><td>DefaultNamespace</td>
<td>Functions, actions and types in this namespace can be referenced in URLs with or without namespace- or alias- qualification.</td></tr>
<tr><td>Immutable</td>
<td>A value for this non-key property can be provided on insert and remains unchanged on update</td></tr>
<tr><td>Computed</td>
<td>A value for this property is generated on both insert and update</td></tr>
<tr><td>IsURL</td>
<td>Properties and terms annotated with this term MUST contain a valid URL</td></tr>
<tr><td>AcceptableMediaTypes</td>
<td>Lists the MIME types acceptable for the annotated entity type marked with HasStream="true" or the annotated stream property</td></tr>
<tr><td>MediaType</td>
<td>The media type of a binary resource</td></tr>
<tr><td>IsMediaType</td>
<td>Properties and terms annotated with this term MUST contain a valid MIME type</td></tr>
<tr><td>OptimisticConcurrency</td>
<td>Data modification requires the use of ETags. A non-empty collection contains the set of properties that are used to compute the ETag.</td></tr>
<tr><td>AdditionalProperties</td>
<td>Instances of this type may contain properties in addition to those declared in $metadata</td></tr>
<tr><td>AutoExpand</td>
<td>The service will automatically expand this navigation property even if not requested with $expand</td></tr>
<tr><td>AutoExpandReferences</td>
<td>The service will automatically expand this navigation property as entity references even if not requested with $expand=.../$ref</td></tr>
<tr><td>MayImplement</td>
<td>A collection of qualified type names outside of the type hierarchy that instances of this type might be addressable as by using a type segment.</td></tr>
<tr><td>Ordered</td>
<td>Collection has a stable order. Ordered collections of primitive or complex types can be indexed by ordinal.</td></tr>
<tr><td>PositionalInsert</td>
<td>Items can be inserted at a given ordinal index.</td></tr>
<tr><td>AlternateKeys</td>
<td>Communicates available alternate keys</td></tr>
</tbody></table>

[XML Source](Org.OData.Core.V1.xml)