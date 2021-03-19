# Repeatability Vocabulary
**Namespace: [Org.OData.Repeatability.V1](Org.OData.Repeatability.V1.xml)**

Terms describing repeatable requests


## Terms

Term|Type|Description
:---|:---|:----------
[Supported](Org.OData.Repeatability.V1.xml#L69)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="Supported"></a>Repeatable requests are supported for the annotated service, entity set, or action <p>Annotations on entity set or action import level override an annotation on entity container level, and an annotation on action level override an annotation on action import level.</p>
[DeleteWithClientIDSupported](Org.OData.Repeatability.V1.xml#L74)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="DeleteWithClientIDSupported"></a>Deletion of remembered requests by client ID is supported <p>Clients that specify a `RepeatabilityClientID` header can delete all remembered requests for that client ID by sending a<br/>`DELETE $RepeatableRequestsWithClientID/{Repeatability-Client-ID}`<br/>request to the service root.</p>
[DeleteWithRequestIDSupported](Org.OData.Repeatability.V1.xml#L85)|[Tag](Org.OData.Core.V1.md#Tag)|<a name="DeleteWithRequestIDSupported"></a>Deletion of remembered requests by request ID is supported <p>Clients can delete a single remembered request by sending a<br/>`DELETE $RepeatableRequestWithRequestID/{Repeatability-Request-ID}`<br/>request to the service root.</p>
