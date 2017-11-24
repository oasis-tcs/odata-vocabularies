# Authorization Vocabulary
**Namespace: [Org.OData.Authorization.V1](Org.OData.Authorization.V1.xml)**

The Authorization Vocabulary provides terms for describing a web authorization flow

Term|Type|Description
:---|:---|:----------
[Authorizations](Org.OData.Authorization.V1.xml#L68)|\[[Authorization](#Authorization)\]|<a name="Authorizations"></a>Lists the methods available to authorize access to the annotated resource

## <a name="Authorization"></a>[*Authorization*](Org.OData.Authorization.V1.xml#L72)
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
[Description](Org.OData.Authorization.V1.xml#L74)|String|Description of the authorization method

## <a name="OpenIDConnect"></a>[OpenIDConnect](Org.OData.Authorization.V1.xml#L79): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L74)|String|Description of the authorization method
[IssuerUrl](Org.OData.Authorization.V1.xml#L80)|URL|Issuer location for the OpenID Provider. Configuration information can be obtained by appending `/.well-known/openid-configuration` to this Url.

## <a name="Http"></a>[Http](Org.OData.Authorization.V1.xml#L87): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L74)|String|Description of the authorization method
[Scheme](Org.OData.Authorization.V1.xml#L88)|String|HTTP Authorization scheme to be used in the Authorization header, as per RFC7235
[BearerFormat](Org.OData.Authorization.V1.xml#L91)|String|Format of the bearer token

## <a name="OAuthAuthorization"></a>[*OAuthAuthorization*](Org.OData.Authorization.V1.xml#L96): [Authorization](#Authorization)


**Derived Types:**
- [OAuth2ClientCredentials](#OAuth2ClientCredentials)
- [OAuth2Implicit](#OAuth2Implicit)
- [OAuth2Password](#OAuth2Password)
- [OAuth2AuthCode](#OAuth2AuthCode)

Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L74)|String|Description of the authorization method
[Scopes](Org.OData.Authorization.V1.xml#L97)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[RefreshUrl](Org.OData.Authorization.V1.xml#L100)|URL|Refresh Url

## <a name="OAuth2ClientCredentials"></a>[OAuth2ClientCredentials](Org.OData.Authorization.V1.xml#L106): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L74)|String|Description of the authorization method
[*Scopes*](Org.OData.Authorization.V1.xml#L97)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L100)|URL|Refresh Url
[TokenUrl](Org.OData.Authorization.V1.xml#L107)|URL|Token Url

## <a name="OAuth2Implicit"></a>[OAuth2Implicit](Org.OData.Authorization.V1.xml#L113): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L74)|String|Description of the authorization method
[*Scopes*](Org.OData.Authorization.V1.xml#L97)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L100)|URL|Refresh Url
[AuthorizationUrl](Org.OData.Authorization.V1.xml#L114)|URL|Authorization URL

## <a name="OAuth2Password"></a>[OAuth2Password](Org.OData.Authorization.V1.xml#L120): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L74)|String|Description of the authorization method
[*Scopes*](Org.OData.Authorization.V1.xml#L97)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L100)|URL|Refresh Url
[TokenUrl](Org.OData.Authorization.V1.xml#L121)|URL|Token Url

## <a name="OAuth2AuthCode"></a>[OAuth2AuthCode](Org.OData.Authorization.V1.xml#L127): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L74)|String|Description of the authorization method
[*Scopes*](Org.OData.Authorization.V1.xml#L97)|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](Org.OData.Authorization.V1.xml#L100)|URL|Refresh Url
[AuthorizationUrl](Org.OData.Authorization.V1.xml#L128)|URL|Authorization URL
[TokenUrl](Org.OData.Authorization.V1.xml#L132)|URL|Token Url

## <a name="AuthorizationScope"></a>[AuthorizationScope](Org.OData.Authorization.V1.xml#L138)


Property|Type|Description
:-------|:---|:----------
[Scope](Org.OData.Authorization.V1.xml#L139)|String|Scope name
[Description](Org.OData.Authorization.V1.xml#L142)|String|Description of the scope

## <a name="ApiKey"></a>[ApiKey](Org.OData.Authorization.V1.xml#L147): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Description*](Org.OData.Authorization.V1.xml#L74)|String|Description of the authorization method
[KeyName](Org.OData.Authorization.V1.xml#L148)|String|The name of the header or query parameter
[Location](Org.OData.Authorization.V1.xml#L151)|[KeyLocation](#KeyLocation)|Whether the API Key is passed in the header or as a query option

## <a name="KeyLocation"></a>[KeyLocation](Org.OData.Authorization.V1.xml#L156)


Member|Value|Description
:-----|----:|:----------
[Header](Org.OData.Authorization.V1.xml#L157)|0|API Key is passed in the header
[QueryOption](Org.OData.Authorization.V1.xml#L160)|1|API Key is passed as a query option
