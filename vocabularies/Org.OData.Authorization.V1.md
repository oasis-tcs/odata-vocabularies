# Authorization Vocabulary
**Namespace: [Org.OData.Authorization.V1](Org.OData.Authorization.V1.xml)**

The Authorization Vocabulary provides terms for describing authorization requirements of the service


## Terms

Term|Type|Description
:---|:---|:----------
[SecuritySchemes](Org.OData.Authorization.V1.xml#L65)|\[[SecurityScheme](#SecurityScheme)\]|<a name="SecuritySchemes"></a>At least one of the specified security schemes are required to make a request against the service
[Authorizations](Org.OData.Authorization.V1.xml#L78)|\[[Authorization](#Authorization)\]|<a name="Authorizations"></a>Lists the methods supported by the service to authorize access

## <a name="SecurityScheme"></a>[SecurityScheme](Org.OData.Authorization.V1.xml#L69)


Property|Type|Description
:-------|:---|:----------
[Authorization](Org.OData.Authorization.V1.xml#L70)|[SchemeName](#SchemeName)|The name of a required authorization scheme
[RequiredScopes](Org.OData.Authorization.V1.xml#L73)|\[String\]|The names of scopes required from this authorization scheme

## <a name="Authorization"></a>[*Authorization*](Org.OData.Authorization.V1.xml#L82)
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
[Name](Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[Description](Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme

## <a name="OpenIDConnect"></a>[OpenIDConnect](Org.OData.Authorization.V1.xml#L92): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[*Description*](Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme
[IssuerUrl](Org.OData.Authorization.V1.xml#L93)|URL|Issuer location for the OpenID Provider. Configuration information can be obtained by appending `/.well-known/openid-configuration` to this Url.

## <a name="Http"></a>[Http](Org.OData.Authorization.V1.xml#L99): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[*Description*](Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme
[Scheme](Org.OData.Authorization.V1.xml#L100)|String|HTTP Authorization scheme to be used in the Authorization header, as per RFC7235
[BearerFormat](Org.OData.Authorization.V1.xml#L103)|String?|Format of the bearer token

## <a name="OAuthAuthorization"></a>[*OAuthAuthorization*](Org.OData.Authorization.V1.xml#L108): [Authorization](#Authorization)


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

## <a name="OAuth2ClientCredentials"></a>[OAuth2ClientCredentials](Org.OData.Authorization.V1.xml#L118): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[*Description*](Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme
[*Scopes*](Org.OData.Authorization.V1.xml#L109)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L112)|URL?|Refresh Url
[TokenUrl](Org.OData.Authorization.V1.xml#L119)|URL|Token Url

## <a name="OAuth2Implicit"></a>[OAuth2Implicit](Org.OData.Authorization.V1.xml#L125): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[*Description*](Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme
[*Scopes*](Org.OData.Authorization.V1.xml#L109)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L112)|URL?|Refresh Url
[AuthorizationUrl](Org.OData.Authorization.V1.xml#L126)|URL|Authorization URL

## <a name="OAuth2Password"></a>[OAuth2Password](Org.OData.Authorization.V1.xml#L132): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[*Description*](Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme
[*Scopes*](Org.OData.Authorization.V1.xml#L109)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L112)|URL?|Refresh Url
[TokenUrl](Org.OData.Authorization.V1.xml#L133)|URL|Token Url

## <a name="OAuth2AuthCode"></a>[OAuth2AuthCode](Org.OData.Authorization.V1.xml#L139): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[*Description*](Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme
[*Scopes*](Org.OData.Authorization.V1.xml#L109)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L112)|URL?|Refresh Url
[AuthorizationUrl](Org.OData.Authorization.V1.xml#L140)|URL|Authorization URL
[TokenUrl](Org.OData.Authorization.V1.xml#L144)|URL|Token Url

## <a name="AuthorizationScope"></a>[AuthorizationScope](Org.OData.Authorization.V1.xml#L150)


Property|Type|Description
:-------|:---|:----------
[Scope](Org.OData.Authorization.V1.xml#L151)|String|Scope name
[Grant](Org.OData.Authorization.V1.xml#L154)|String?|Identity that has access to the scope or can grant access to the scope.
[Description](Org.OData.Authorization.V1.xml#L158)|String|Description of the scope

## <a name="ApiKey"></a>[ApiKey](Org.OData.Authorization.V1.xml#L163): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](Org.OData.Authorization.V1.xml#L84)|String|Name that can be used to reference the authorization scheme
[*Description*](Org.OData.Authorization.V1.xml#L87)|String?|Description of the authorization scheme
[KeyName](Org.OData.Authorization.V1.xml#L164)|String|The name of the header or query parameter
[Location](Org.OData.Authorization.V1.xml#L167)|[KeyLocation](#KeyLocation)|Whether the API Key is passed in the header or as a query option

## <a name="KeyLocation"></a>[KeyLocation](Org.OData.Authorization.V1.xml#L172)


Member|Value|Description
:-----|----:|:----------
[Header](Org.OData.Authorization.V1.xml#L173)|0|API Key is passed in the header
[QueryOption](Org.OData.Authorization.V1.xml#L176)|1|API Key is passed as a query option
[Cookie](Org.OData.Authorization.V1.xml#L179)|2|API Key is passed as a cookie

## <a name="SchemeName"></a>[SchemeName](Org.OData.Authorization.V1.xml#L184)
**Type:** String

The name of the authorization scheme.
