<body xmlns:ac="remove this before pressing 'Apply'">
<h1>Capabilities Vocabulary</h1>
<p>Terms describing capabilities of a service</p>
<p>
<strong>Namespace: Org.OData.Capabilities.V1</strong>
</p>
<p></p>
<table width="100%" style="border: 1px solid #000000;" border="1">
<tbody>
<tr>
<th><strong>Term</strong></th><th><strong>Description</strong></th>
</tr>
<tr>
<td>ConformanceLevel</td><td>The conformance level achieved by this service</td>
</tr>
<tr>
<td>SupportedFormats</td><td>Media types of supported formats, including format parameters</td>
</tr>
<tr>
<td>SupportedMetadataFormats</td><td>Media types of supported formats for $metadata, including format parameters</td>
</tr>
<tr>
<td>AcceptableEncodings</td><td>List of acceptable compression methods for ($batch) requests, e.g. gzip</td>
</tr>
<tr>
<td>AsynchronousRequestsSupported</td><td>Service supports the asynchronous request preference</td>
</tr>
<tr>
<td>BatchContinueOnErrorSupported</td><td>Service supports the continue on error preference. Supports $batch requests. Services that apply the BatchContinueOnErrorSupported term should also specify the ContinueOnErrorSupported property from the BatchSupport term.</td>
</tr>
<tr>
<td>IsolationSupported</td><td>Supported odata.isolation levels</td>
</tr>
<tr>
<td>CallbackSupported</td><td>Supports callbacks for the specified protocols</td>
</tr>
<tr>
<td>CrossJoinSupported</td><td>Supports cross joins for the entity sets in this container</td>
</tr>
<tr>
<td>ChangeTracking</td><td>Change tracking capabilities of this service or entity set</td>
</tr>
<tr>
<td>CountRestrictions</td><td>Restrictions on /$count path suffix and $count=true system query option</td>
</tr>
<tr>
<td>NavigationRestrictions</td><td>Restrictions on navigating properties according to OData URL conventions</td>
</tr>
<tr>
<td>IndexableByKey</td><td>Supports key values according to OData URL conventions</td>
</tr>
<tr>
<td>TopSupported</td><td>Supports $top</td>
</tr>
<tr>
<td>SkipSupported</td><td>Supports $skip</td>
</tr>
<tr>
<td>BatchSupported</td><td>Supports $batch requests. Services that apply the BatchSupported term should also apply the more comprehensive BatchSupport term.</td>
</tr>
<tr>
<td>BatchSupport</td><td>Batch Support for the service</td>
</tr>
<tr>
<td>FilterFunctions</td><td>List of functions and operators supported in $filter</td>
</tr>
<tr>
<td>FilterRestrictions</td><td>Restrictions on $filter expressions</td>
</tr>
<tr>
<td>SortRestrictions</td><td>Restrictions on $orderby expressions</td>
</tr>
<tr>
<td>ExpandRestrictions</td><td>Restrictions on $expand expressions</td>
</tr>
<tr>
<td>SearchRestrictions</td><td>Restrictions on $search expressions</td>
</tr>
<tr>
<td>InsertRestrictions</td><td>Restrictions on insert operations</td>
</tr>
<tr>
<td>DeepInsertSupport</td><td>Deep Insert Support for the service</td>
</tr>
<tr>
<td>UpdateRestrictions</td><td>Restrictions on update operations</td>
</tr>
<tr>
<td>DeleteRestrictions</td><td>Restrictions on delete operations</td>
</tr>
</tbody>
</table>
</body>
