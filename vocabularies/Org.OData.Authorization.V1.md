# Authorization Vocabulary
**Namespace: [Org.OData.Authorization.V1](Org.OData.Authorization.V1.xml)**

The Authorization Vocabulary provides terms for describing a web authorization flow

Term|Type|Description
----|----|-----------
Authorizations|\[[Authorization](#Authorization)\]|Lists the methods available to authorize access to the annotated resource.

## <a name="Authorization"></a>Authorization
Base type for all Authorization types.

Property|Type|Description
--------|----|-----------
Description|*String*|

## <a name="OpenIDConnect"></a>OpenIDConnect


Property|Type|Description
--------|----|-----------
IssuerUrl|*String*|Issuer location for the OpenID Provider. Configuration information can be obtained by appending /.well-known/openid-configuration to this Url.

## <a name="Http"></a>Http


Property|Type|Description
--------|----|-----------
Scheme|*String*|HTTP Authorization scheme to be used in the Authorization header, as per RFC7235.
BearerFormat|*String*|Format of the bearer token.

## <a name="OAuthAuthorization"></a>OAuthAuthorization


Property|Type|Description
--------|----|-----------
Scopes|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes.
RefreshUrl|*String*|Refresh Url.

## <a name="OAuth2ClientCredentials"></a>OAuth2ClientCredentials


Property|Type|Description
--------|----|-----------
TokenUrl|*String*|Token Url.

## <a name="OAuth2Implicit"></a>OAuth2Implicit


Property|Type|Description
--------|----|-----------
AuthorizationUrl|*String*|Authorization URL.

## <a name="OAuth2Password"></a>OAuth2Password


Property|Type|Description
--------|----|-----------
TokenUrl|*String*|Token Url.

## <a name="OAuth2AuthCode"></a>OAuth2AuthCode


Property|Type|Description
--------|----|-----------
AuthorizationUrl|*String*|Authorization URL.
TokenUrl|*String*|Token Url.

## <a name="AuthorizationScope"></a>AuthorizationScope


Property|Type|Description
--------|----|-----------
Scope|*String*|Scope name.
Description|*String*|Description of the scope.

## <a name="ApiKey"></a>ApiKey


Property|Type|Description
--------|----|-----------
KeyName|*String*|The name of the header or query parameter
Location|[KeyLocation](#KeyLocation)|Whether the API Key is passed in the header or as a query option

## <a name="KeyLocation"></a>KeyLocation


Name|Value|Description
----|----:|-----------
`Header`|0|
`QueryOption`|1|
