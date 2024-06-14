# Authorization Vocabulary
**Namespace: [Org.OData.Authorization.V1](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml)**

The Authorization Vocabulary provides terms for describing authorization requirements of the service


## Terms

Term|Type|Description
:---|:---|:----------
[SecuritySchemes](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L65)|\[[SecurityScheme](#SecurityScheme)\]|<a name="SecuritySchemes"></a>At least one of the specified security schemes are required to make a request against the service
[Authorizations](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L78)|\[[Authorization](#Authorization)\]|<a name="Authorizations"></a>Lists the methods supported by the service to authorize access

<a name="SecurityScheme"></a>
## [SecurityScheme](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L69)


Property|Type|Description
:-------|:---|:----------
[Authorization](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L70)|[SchemeName](#SchemeName)|The name of a required authorization scheme
[RequiredScopes](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L73)|\[String\]|The names of scopes required from this authorization scheme

<a name="Authorization"></a>
## [*Authorization*](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L82)
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
[Name](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[Description](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme

<a name="OpenIDConnect"></a>
## [OpenIDConnect](Org.OData.Authorization.V1.xml#L92): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[*Description*](Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme
[IssuerUrl](Org.OData.Authorization.V1.xml#L93)|URL|Issuer location for the OpenID Provider. Configuration information can be obtained by appending `/.well-known/openid-configuration` to this Url.

<a name="Http"></a>
## [Http](Org.OData.Authorization.V1.xml#L99): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[*Description*](Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme
[Scheme](Org.OData.Authorization.V1.xml#L100)|String|HTTP Authorization scheme to be used in the Authorization header, as per RFC7235
[BearerFormat](Org.OData.Authorization.V1.xml#L103)|String?|Format of the bearer token

<a name="OAuthAuthorization"></a>
## [*OAuthAuthorization*](Org.OData.Authorization.V1.xml#L108): [Authorization](#Authorization)


**Derived Types:**
- [OAuth2ClientCredentials](#OAuth2ClientCredentials)
- [OAuth2Implicit](#OAuth2Implicit)
- [OAuth2Password](#OAuth2Password)
- [OAuth2AuthCode](#OAuth2AuthCode)

Property|Type|Description
:-------|:---|:----------
[*Name*](Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[*Description*](Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme
[Scopes](Org.OData.Authorization.V1.xml#L109)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[RefreshUrl](Org.OData.Authorization.V1.xml#L112)|URL?|Refresh Url

<a name="OAuth2ClientCredentials"></a>
## [OAuth2ClientCredentials](Org.OData.Authorization.V1.xml#L118): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[*Description*](Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme
[*Scopes*](Org.OData.Authorization.V1.xml#L109)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L112)|URL?|Refresh Url
[TokenUrl](Org.OData.Authorization.V1.xml#L119)|URL|Token Url

<a name="OAuth2Implicit"></a>
## [OAuth2Implicit](Org.OData.Authorization.V1.xml#L125): [OAuthAuthorization](#OAuthAuthorization)
Security note: OAuth2 implicit grant is considered to be not secure and should not be used by clients, see [OAuth 2.0 Security Best Current Practice](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-security-topics.html#name-implicit-grant).

Property|Type|Description
:-------|:---|:----------
[*Name*](Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[*Description*](Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme
[*Scopes*](Org.OData.Authorization.V1.xml#L109)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L112)|URL?|Refresh Url
[AuthorizationUrl](Org.OData.Authorization.V1.xml#L127)|URL|Authorization URL

<a name="OAuth2Password"></a>
## [OAuth2Password](Org.OData.Authorization.V1.xml#L133): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[*Description*](Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme
[*Scopes*](Org.OData.Authorization.V1.xml#L109)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L112)|URL?|Refresh Url
[TokenUrl](Org.OData.Authorization.V1.xml#L134)|URL|Token Url

<a name="OAuth2AuthCode"></a>
## [OAuth2AuthCode](Org.OData.Authorization.V1.xml#L140): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[*Description*](Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme
[*Scopes*](Org.OData.Authorization.V1.xml#L109)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L112)|URL?|Refresh Url
[AuthorizationUrl](Org.OData.Authorization.V1.xml#L141)|URL|Authorization URL
[TokenUrl](Org.OData.Authorization.V1.xml#L145)|URL|Token Url

<a name="AuthorizationScope"></a>
## [AuthorizationScope](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L151)


Property|Type|Description
:-------|:---|:----------
[Scope](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L152)|String|Scope name
[Grant](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L155)|String?|Identity that has access to the scope or can grant access to the scope.
[Description](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L159)|String|Description of the scope

<a name="ApiKey"></a>
## [ApiKey](Org.OData.Authorization.V1.xml#L164): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[*Description*](Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme
[KeyName](Org.OData.Authorization.V1.xml#L165)|String|The name of the header or query parameter
[Location](Org.OData.Authorization.V1.xml#L168)|[KeyLocation](#KeyLocation)|Whether the API Key is passed in the header or as a query option

<a name="KeyLocation"></a>
## [KeyLocation](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L173)


Member|Value|Description
:-----|----:|:----------
[Header](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L174)|0|API Key is passed in the header
[QueryOption](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L177)|1|API Key is passed as a query option
[Cookie](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L180)|2|API Key is passed as a cookie

<a name="SchemeName"></a>
## [SchemeName](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Authorization.V1.xml#L185)
**Type:** String

The name of the authorization scheme.
