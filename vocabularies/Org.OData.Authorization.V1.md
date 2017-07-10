# Authorization Vocabulary
**Namespace: [Org.OData.Authorization.V1](Org.OData.Authorization.V1.xml)**

The Authorization Vocabulary provides terms for describing a web authorization flow

Term|Type|Description
:---|:---|:----------
[Authorizations](Org.OData.Authorization.V1.xml#L63)|\[[Authorization](#Authorization)\]|<a name="Authorizations"></a>Lists the methods available to authorize access to the annotated resource

## <a name="Authorization"></a>[*Authorization*](Org.OData.Authorization.V1.xml#L67)
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
[Description](Org.OData.Authorization.V1.xml#L69)|String|Description of the authorization method

## <a name="OpenIDConnect"></a>[OpenIDConnect](Org.OData.Authorization.V1.xml#L74): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L69)|String|Description of the authorization method
[IssuerUrl](Org.OData.Authorization.V1.xml#L75)|URL|Issuer location for the OpenID Provider. Configuration information can be obtained by appending `/.well-known/openid-configuration` to this Url.

## <a name="Http"></a>[Http](Org.OData.Authorization.V1.xml#L82): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L69)|String|Description of the authorization method
[Scheme](Org.OData.Authorization.V1.xml#L83)|String|HTTP Authorization scheme to be used in the Authorization header, as per RFC7235
[BearerFormat](Org.OData.Authorization.V1.xml#L86)|String|Format of the bearer token

## <a name="OAuthAuthorization"></a>[*OAuthAuthorization*](Org.OData.Authorization.V1.xml#L91): [Authorization](#Authorization)


**Derived Types:**
- [OAuth2ClientCredentials](#OAuth2ClientCredentials)
- [OAuth2Implicit](#OAuth2Implicit)
- [OAuth2Password](#OAuth2Password)
- [OAuth2AuthCode](#OAuth2AuthCode)

Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L69)|String|Description of the authorization method
[Scopes](Org.OData.Authorization.V1.xml#L92)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[RefreshUrl](Org.OData.Authorization.V1.xml#L95)|URL|Refresh Url

## <a name="OAuth2ClientCredentials"></a>[OAuth2ClientCredentials](Org.OData.Authorization.V1.xml#L101): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L69)|String|Description of the authorization method
[*Scopes*](Org.OData.Authorization.V1.xml#L92)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L95)|URL|Refresh Url
[TokenUrl](Org.OData.Authorization.V1.xml#L102)|URL|Token Url

## <a name="OAuth2Implicit"></a>[OAuth2Implicit](Org.OData.Authorization.V1.xml#L108): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L69)|String|Description of the authorization method
[*Scopes*](Org.OData.Authorization.V1.xml#L92)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L95)|URL|Refresh Url
[AuthorizationUrl](Org.OData.Authorization.V1.xml#L109)|URL|Authorization URL

## <a name="OAuth2Password"></a>[OAuth2Password](Org.OData.Authorization.V1.xml#L115): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L69)|String|Description of the authorization method
[*Scopes*](Org.OData.Authorization.V1.xml#L92)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L95)|URL|Refresh Url
[TokenUrl](Org.OData.Authorization.V1.xml#L116)|URL|Token Url

## <a name="OAuth2AuthCode"></a>[OAuth2AuthCode](Org.OData.Authorization.V1.xml#L122): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L69)|String|Description of the authorization method
[*Scopes*](Org.OData.Authorization.V1.xml#L92)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L95)|URL|Refresh Url
[AuthorizationUrl](Org.OData.Authorization.V1.xml#L123)|URL|Authorization URL
[TokenUrl](Org.OData.Authorization.V1.xml#L127)|URL|Token Url

## <a name="AuthorizationScope"></a>[AuthorizationScope](Org.OData.Authorization.V1.xml#L133)


Property|Type|Description
:-------|:---|:----------
[Scope](Org.OData.Authorization.V1.xml#L134)|String|Scope name
[Description](Org.OData.Authorization.V1.xml#L137)|String|Description of the scope

## <a name="ApiKey"></a>[ApiKey](Org.OData.Authorization.V1.xml#L142): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L69)|String|Description of the authorization method
[KeyName](Org.OData.Authorization.V1.xml#L143)|String|The name of the header or query parameter
[Location](Org.OData.Authorization.V1.xml#L146)|[KeyLocation](#KeyLocation)|Whether the API Key is passed in the header or as a query option

## <a name="KeyLocation"></a>[KeyLocation](Org.OData.Authorization.V1.xml#L151)


Member|Value|Description
:-----|----:|:----------
[Header](Org.OData.Authorization.V1.xml#L152)|0|API Key is passed in the header
[QueryOption](Org.OData.Authorization.V1.xml#L155)|1|API Key is passed as a query option
