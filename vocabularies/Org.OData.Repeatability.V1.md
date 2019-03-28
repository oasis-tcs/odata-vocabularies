# Repeatability Vocabulary
**Namespace: [Org.OData.Repeatability.V1](Org.OData.Repeatability.V1.xml)**

Terms describing repeatable requests


## Terms

Term|Type|Description
:---|:---|:----------
[Supported](Org.OData.Repeatability.V1.xml#L72)|[SupportType](#SupportType)|<a name="Supported"></a>Repeatable request capabilities of this service, entity set, or action

## <a name="SupportType"></a>[SupportType](Org.OData.Repeatability.V1.xml#L75)


Property|Type|Description
:-------|:---|:----------
[Supported](Org.OData.Repeatability.V1.xml#L76)|Boolean|Repeatable requests are supported
[DeletabilityByClientIDSupported](Org.OData.Repeatability.V1.xml#L79)|Boolean|Deletion of remembered requests by client ID is supported<p>Clients that specify a `RepeatabilityClientID` header can delete all remembered requests for that client ID by sending a<br/>`DELETE $RepeatableRequests/{ClientID}`<br/>request to the service root.</p>
[DeletabilityByRequestIDSupported](Org.OData.Repeatability.V1.xml#L89)|Boolean|Deletion of remembered requests by request ID is supported<p>Clients can delete a single remembered request by sending a<br/>`DELETE $RepeatableRequest/{RequestID}`<br/>request to the service root.</p>
