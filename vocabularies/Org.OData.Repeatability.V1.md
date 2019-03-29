# Repeatability Vocabulary
**Namespace: [Org.OData.Repeatability.V1](Org.OData.Repeatability.V1.xml)**

Terms describing repeatable requests


## Terms

Term|Type|Description
:---|:---|:----------
[Supported](Org.OData.Repeatability.V1.xml#L74)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Supported"></a>Repeatable requests are supported for the annotated service, entity set, or action
[DeleteByClientIDSupported](Org.OData.Repeatability.V1.xml#L78)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="DeleteByClientIDSupported"></a>Deletion of remembered requests by client ID is supported<p>Clients that specify a `RepeatabilityClientID` header can delete all remembered requests for that client ID by sending a<br/>`DELETE $RepeatableRequests/{ClientID}`<br/>request to the service root.</p>
[DeleteByRequestIDSupported](Org.OData.Repeatability.V1.xml#L88)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="DeleteByRequestIDSupported"></a>Deletion of remembered requests by request ID is supported<p>Clients can delete a single remembered request by sending a<br/>`DELETE $RepeatableRequest/{RequestID}`<br/>request to the service root.</p>
