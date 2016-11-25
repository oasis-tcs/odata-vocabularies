# Authorization Vocabulary
**Namespace: [Org.OData.Authorization.V1](Org.OData.Authorization.V1.xml)**

The Authorization Vocabulary provides terms for describing a web authorization flow

Term|Type|Description
----|----|-----------
Authorizations|\[[Authorization](#Authorization)\]|Lists the methods available to authorize access to the annotated resource

## <a name="Authorization"></a>*Authorization*
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
--------|----|-----------
Description|String|Description of the authorization method

## <a name="OpenIDConnect"></a>OpenIDConnect: [Authorization](#Authorization)


Property|Type|Description
--------|----|-----------
*Description*|String|Description of the authorization method
IssuerUrl|URL|Issuer location for the OpenID Provider. Configuration information can be obtained by appending `/.well-known/openid-configuration` to this Url.

## <a name="Http"></a>Http: [Authorization](#Authorization)


Property|Type|Description
--------|----|-----------
*Description*|String|Description of the authorization method
Scheme|String|HTTP Authorization scheme to be used in the Authorization header, as per RFC7235
BearerFormat|String|Format of the bearer token

## <a name="OAuthAuthorization"></a>*OAuthAuthorization*: [Authorization](#Authorization)


**Derived Types:**
- [OAuth2ClientCredentials](#OAuth2ClientCredentials)
- [OAuth2Implicit](#OAuth2Implicit)
- [OAuth2Password](#OAuth2Password)
- [OAuth2AuthCode](#OAuth2AuthCode)

Property|Type|Description
--------|----|-----------
*Description*|String|Description of the authorization method
Scopes|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
RefreshUrl|URL|Refresh Url

## <a name="OAuth2ClientCredentials"></a>OAuth2ClientCredentials: [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
--------|----|-----------
*Description*|String|Description of the authorization method
*Scopes*|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
*RefreshUrl*|URL|Refresh Url
TokenUrl|URL|Token Url

## <a name="OAuth2Implicit"></a>OAuth2Implicit: [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
--------|----|-----------
*Description*|String|Description of the authorization method
*Scopes*|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
*RefreshUrl*|URL|Refresh Url
AuthorizationUrl|URL|Authorization URL

## <a name="OAuth2Password"></a>OAuth2Password: [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
--------|----|-----------
*Description*|String|Description of the authorization method
*Scopes*|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
*RefreshUrl*|URL|Refresh Url
TokenUrl|URL|Token Url

## <a name="OAuth2AuthCode"></a>OAuth2AuthCode: [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
--------|----|-----------
*Description*|String|Description of the authorization method
*Scopes*|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
*RefreshUrl*|URL|Refresh Url
AuthorizationUrl|URL|Authorization URL
TokenUrl|URL|Token Url

## <a name="AuthorizationScope"></a>AuthorizationScope


Property|Type|Description
--------|----|-----------
Scope|String|Scope name
Description|String|Description of the scope

## <a name="ApiKey"></a>ApiKey: [Authorization](#Authorization)


Property|Type|Description
--------|----|-----------
*Description*|String|Description of the authorization method
KeyName|String|The name of the header or query parameter
Location|[KeyLocation](#KeyLocation)|Whether the API Key is passed in the header or as a query option

## <a name="KeyLocation"></a>KeyLocation


Member|Value|Description
------|----:|-----------
Header|0|API Key is passed in the header
QueryOption|1|API Key is passed as a query option
