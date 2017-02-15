# Authorization Vocabulary
**Namespace: [Org.OData.Authorization.V1](Org.OData.Authorization.V1.xml)**

The Authorization Vocabulary provides terms for describing a web authorization flow

Term|Type|Description
:---|:---|:----------
[Authorizations](Org.OData.Authorization.V1.xml#L58)|\[[Authorization](#Authorization)\]|<a name="Authorizations"></a>Lists the methods available to authorize access to the annotated resource

## <a name="Authorization"></a>[*Authorization*](Org.OData.Authorization.V1.xml#L62)
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
[Description](Org.OData.Authorization.V1.xml#L64)|String|Description of the authorization method

## <a name="OpenIDConnect"></a>[OpenIDConnect](Org.OData.Authorization.V1.xml#L69): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L64)|String|Description of the authorization method
[IssuerUrl](Org.OData.Authorization.V1.xml#L70)|URL|Issuer location for the OpenID Provider. Configuration information can be obtained by appending `/.well-known/openid-configuration` to this Url.

## <a name="Http"></a>[Http](Org.OData.Authorization.V1.xml#L77): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L64)|String|Description of the authorization method
[Scheme](Org.OData.Authorization.V1.xml#L78)|String|HTTP Authorization scheme to be used in the Authorization header, as per RFC7235
[BearerFormat](Org.OData.Authorization.V1.xml#L81)|String|Format of the bearer token

## <a name="OAuthAuthorization"></a>[*OAuthAuthorization*](Org.OData.Authorization.V1.xml#L86): [Authorization](#Authorization)


**Derived Types:**
- [OAuth2ClientCredentials](#OAuth2ClientCredentials)
- [OAuth2Implicit](#OAuth2Implicit)
- [OAuth2Password](#OAuth2Password)
- [OAuth2AuthCode](#OAuth2AuthCode)

Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L64)|String|Description of the authorization method
[Scopes](Org.OData.Authorization.V1.xml#L87)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[RefreshUrl](Org.OData.Authorization.V1.xml#L90)|URL|Refresh Url

## <a name="OAuth2ClientCredentials"></a>[OAuth2ClientCredentials](Org.OData.Authorization.V1.xml#L96): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L64)|String|Description of the authorization method
[*Scopes*](Org.OData.Authorization.V1.xml#L87)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L90)|URL|Refresh Url
[TokenUrl](Org.OData.Authorization.V1.xml#L97)|URL|Token Url

## <a name="OAuth2Implicit"></a>[OAuth2Implicit](Org.OData.Authorization.V1.xml#L103): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L64)|String|Description of the authorization method
[*Scopes*](Org.OData.Authorization.V1.xml#L87)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L90)|URL|Refresh Url
[AuthorizationUrl](Org.OData.Authorization.V1.xml#L104)|URL|Authorization URL

## <a name="OAuth2Password"></a>[OAuth2Password](Org.OData.Authorization.V1.xml#L110): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L64)|String|Description of the authorization method
[*Scopes*](Org.OData.Authorization.V1.xml#L87)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L90)|URL|Refresh Url
[TokenUrl](Org.OData.Authorization.V1.xml#L111)|URL|Token Url

## <a name="OAuth2AuthCode"></a>[OAuth2AuthCode](Org.OData.Authorization.V1.xml#L117): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L64)|String|Description of the authorization method
[*Scopes*](Org.OData.Authorization.V1.xml#L87)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L90)|URL|Refresh Url
[AuthorizationUrl](Org.OData.Authorization.V1.xml#L118)|URL|Authorization URL
[TokenUrl](Org.OData.Authorization.V1.xml#L122)|URL|Token Url

## <a name="AuthorizationScope"></a>[AuthorizationScope](Org.OData.Authorization.V1.xml#L128)


Property|Type|Description
:-------|:---|:----------
[Scope](Org.OData.Authorization.V1.xml#L129)|String|Scope name
[Description](Org.OData.Authorization.V1.xml#L132)|String|Description of the scope

## <a name="ApiKey"></a>[ApiKey](Org.OData.Authorization.V1.xml#L137): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L64)|String|Description of the authorization method
[KeyName](Org.OData.Authorization.V1.xml#L138)|String|The name of the header or query parameter
[Location](Org.OData.Authorization.V1.xml#L141)|[KeyLocation](#KeyLocation)|Whether the API Key is passed in the header or as a query option

## <a name="KeyLocation"></a>[KeyLocation](Org.OData.Authorization.V1.xml#L146)


Member|Value|Description
:-----|----:|:----------
[Header](Org.OData.Authorization.V1.xml#L147)|0|API Key is passed in the header
[QueryOption](Org.OData.Authorization.V1.xml#L150)|1|API Key is passed as a query option
