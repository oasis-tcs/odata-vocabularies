# Authorization Vocabulary
**Namespace: [Org.OData.Authorization.V1](Org.OData.Authorization.V1.xml)**

The Authorization Vocabulary provides terms for describing authorization requirements of the service


## Terms

Term|Type|Description
:---|:---|:----------
[SecuritySchemes](./Org.OData.Authorization.V1.xml#L65:~:text=Term Name="-,SecuritySchemes,-")|\[[SecurityScheme](#SecurityScheme)\]|<a name="SecuritySchemes"></a>At least one of the specified security schemes are required to make a request against the service
[Authorizations](./Org.OData.Authorization.V1.xml#L78:~:text=Term Name="-,Authorizations,-")|\[[Authorization](#Authorization)\]|<a name="Authorizations"></a>Lists the methods supported by the service to authorize access

## <a name="SecurityScheme"></a>[SecurityScheme](./Org.OData.Authorization.V1.xml#L69:~:text=ComplexType Name="-,SecurityScheme,-")


Property|Type|Description
:-------|:---|:----------
[Authorization](./Org.OData.Authorization.V1.xml#L70:~:text=undefined Name="-,Authorization,-")|[SchemeName](#SchemeName)|The name of a required authorization scheme
[RequiredScopes](./Org.OData.Authorization.V1.xml#L73:~:text=undefined Name="-,RequiredScopes,-")|\[String\]|The names of scopes required from this authorization scheme

## <a name="Authorization"></a>[*Authorization*](./Org.OData.Authorization.V1.xml#L82:~:text=ComplexType Name="-,Authorization,-")
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
[Name](./Org.OData.Authorization.V1.xml#L84:~:text=undefined Name="-,Name,-")|String|Name that can be used to reference the authorization scheme
[Description](./Org.OData.Authorization.V1.xml#L87:~:text=undefined Name="-,Description,-")|String?|Description of the authorization scheme

## <a name="OpenIDConnect"></a>[OpenIDConnect](./Org.OData.Authorization.V1.xml#L92:~:text=ComplexType Name="-,OpenIDConnect,-"): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](./Org.OData.Authorization.V1.xml#L84:~:text=undefined Name="-,Name,-")|String|Name that can be used to reference the authorization scheme
[*Description*](./Org.OData.Authorization.V1.xml#L87:~:text=undefined Name="-,Description,-")|String?|Description of the authorization scheme
[IssuerUrl](./Org.OData.Authorization.V1.xml#L93:~:text=undefined Name="-,IssuerUrl,-")|URL|Issuer location for the OpenID Provider. Configuration information can be obtained by appending `/.well-known/openid-configuration` to this Url.

## <a name="Http"></a>[Http](./Org.OData.Authorization.V1.xml#L99:~:text=ComplexType Name="-,Http,-"): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](./Org.OData.Authorization.V1.xml#L84:~:text=undefined Name="-,Name,-")|String|Name that can be used to reference the authorization scheme
[*Description*](./Org.OData.Authorization.V1.xml#L87:~:text=undefined Name="-,Description,-")|String?|Description of the authorization scheme
[Scheme](./Org.OData.Authorization.V1.xml#L100:~:text=undefined Name="-,Scheme,-")|String|HTTP Authorization scheme to be used in the Authorization header, as per RFC7235
[BearerFormat](./Org.OData.Authorization.V1.xml#L103:~:text=undefined Name="-,BearerFormat,-")|String?|Format of the bearer token

## <a name="OAuthAuthorization"></a>[*OAuthAuthorization*](./Org.OData.Authorization.V1.xml#L108:~:text=ComplexType Name="-,OAuthAuthorization,-"): [Authorization](#Authorization)


**Derived Types:**
- [OAuth2ClientCredentials](#OAuth2ClientCredentials)
- [OAuth2Implicit](#OAuth2Implicit)
- [OAuth2Password](#OAuth2Password)
- [OAuth2AuthCode](#OAuth2AuthCode)

Property|Type|Description
:-------|:---|:----------
[*Name*](./Org.OData.Authorization.V1.xml#L84:~:text=undefined Name="-,Name,-")|String|Name that can be used to reference the authorization scheme
[*Description*](./Org.OData.Authorization.V1.xml#L87:~:text=undefined Name="-,Description,-")|String?|Description of the authorization scheme
[Scopes](./Org.OData.Authorization.V1.xml#L109:~:text=undefined Name="-,Scopes,-")|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[RefreshUrl](./Org.OData.Authorization.V1.xml#L112:~:text=undefined Name="-,RefreshUrl,-")|URL?|Refresh Url

## <a name="OAuth2ClientCredentials"></a>[OAuth2ClientCredentials](./Org.OData.Authorization.V1.xml#L118:~:text=ComplexType Name="-,OAuth2ClientCredentials,-"): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](./Org.OData.Authorization.V1.xml#L84:~:text=undefined Name="-,Name,-")|String|Name that can be used to reference the authorization scheme
[*Description*](./Org.OData.Authorization.V1.xml#L87:~:text=undefined Name="-,Description,-")|String?|Description of the authorization scheme
[*Scopes*](./Org.OData.Authorization.V1.xml#L109:~:text=undefined Name="-,Scopes,-")|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](./Org.OData.Authorization.V1.xml#L112:~:text=undefined Name="-,RefreshUrl,-")|URL?|Refresh Url
[TokenUrl](./Org.OData.Authorization.V1.xml#L119:~:text=undefined Name="-,TokenUrl,-")|URL|Token Url

## <a name="OAuth2Implicit"></a>[OAuth2Implicit](./Org.OData.Authorization.V1.xml#L125:~:text=ComplexType Name="-,OAuth2Implicit,-"): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](./Org.OData.Authorization.V1.xml#L84:~:text=undefined Name="-,Name,-")|String|Name that can be used to reference the authorization scheme
[*Description*](./Org.OData.Authorization.V1.xml#L87:~:text=undefined Name="-,Description,-")|String?|Description of the authorization scheme
[*Scopes*](./Org.OData.Authorization.V1.xml#L109:~:text=undefined Name="-,Scopes,-")|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](./Org.OData.Authorization.V1.xml#L112:~:text=undefined Name="-,RefreshUrl,-")|URL?|Refresh Url
[AuthorizationUrl](./Org.OData.Authorization.V1.xml#L126:~:text=undefined Name="-,AuthorizationUrl,-")|URL|Authorization URL

## <a name="OAuth2Password"></a>[OAuth2Password](./Org.OData.Authorization.V1.xml#L132:~:text=ComplexType Name="-,OAuth2Password,-"): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](./Org.OData.Authorization.V1.xml#L84:~:text=undefined Name="-,Name,-")|String|Name that can be used to reference the authorization scheme
[*Description*](./Org.OData.Authorization.V1.xml#L87:~:text=undefined Name="-,Description,-")|String?|Description of the authorization scheme
[*Scopes*](./Org.OData.Authorization.V1.xml#L109:~:text=undefined Name="-,Scopes,-")|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](./Org.OData.Authorization.V1.xml#L112:~:text=undefined Name="-,RefreshUrl,-")|URL?|Refresh Url
[TokenUrl](./Org.OData.Authorization.V1.xml#L133:~:text=undefined Name="-,TokenUrl,-")|URL|Token Url

## <a name="OAuth2AuthCode"></a>[OAuth2AuthCode](./Org.OData.Authorization.V1.xml#L139:~:text=ComplexType Name="-,OAuth2AuthCode,-"): [OAuthAuthorization](#OAuthAuthorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](./Org.OData.Authorization.V1.xml#L84:~:text=undefined Name="-,Name,-")|String|Name that can be used to reference the authorization scheme
[*Description*](./Org.OData.Authorization.V1.xml#L87:~:text=undefined Name="-,Description,-")|String?|Description of the authorization scheme
[*Scopes*](./Org.OData.Authorization.V1.xml#L109:~:text=undefined Name="-,Scopes,-")|\[[AuthorizationScope](#AuthorizationScope)\]|Available scopes
[*RefreshUrl*](./Org.OData.Authorization.V1.xml#L112:~:text=undefined Name="-,RefreshUrl,-")|URL?|Refresh Url
[AuthorizationUrl](./Org.OData.Authorization.V1.xml#L140:~:text=undefined Name="-,AuthorizationUrl,-")|URL|Authorization URL
[TokenUrl](./Org.OData.Authorization.V1.xml#L144:~:text=undefined Name="-,TokenUrl,-")|URL|Token Url

## <a name="AuthorizationScope"></a>[AuthorizationScope](./Org.OData.Authorization.V1.xml#L150:~:text=ComplexType Name="-,AuthorizationScope,-")


Property|Type|Description
:-------|:---|:----------
[Scope](./Org.OData.Authorization.V1.xml#L151:~:text=undefined Name="-,Scope,-")|String|Scope name
[Grant](./Org.OData.Authorization.V1.xml#L154:~:text=undefined Name="-,Grant,-")|String?|Identity that has access to the scope or can grant access to the scope.
[Description](./Org.OData.Authorization.V1.xml#L158:~:text=undefined Name="-,Description,-")|String|Description of the scope

## <a name="ApiKey"></a>[ApiKey](./Org.OData.Authorization.V1.xml#L163:~:text=ComplexType Name="-,ApiKey,-"): [Authorization](#Authorization)


Property|Type|Description
:-------|:---|:----------
[*Name*](./Org.OData.Authorization.V1.xml#L84:~:text=undefined Name="-,Name,-")|String|Name that can be used to reference the authorization scheme
[*Description*](./Org.OData.Authorization.V1.xml#L87:~:text=undefined Name="-,Description,-")|String?|Description of the authorization scheme
[KeyName](./Org.OData.Authorization.V1.xml#L164:~:text=undefined Name="-,KeyName,-")|String|The name of the header or query parameter
[Location](./Org.OData.Authorization.V1.xml#L167:~:text=undefined Name="-,Location,-")|[KeyLocation](#KeyLocation)|Whether the API Key is passed in the header or as a query option

## <a name="KeyLocation"></a>[KeyLocation](./Org.OData.Authorization.V1.xml#L172:~:text=EnumType Name="-,KeyLocation,-")


Member|Value|Description
:-----|----:|:----------
[Header](./Org.OData.Authorization.V1.xml#L173:~:text=undefined Name="-,Header,-")|0|API Key is passed in the header
[QueryOption](./Org.OData.Authorization.V1.xml#L176:~:text=undefined Name="-,QueryOption,-")|1|API Key is passed as a query option
[Cookie](./Org.OData.Authorization.V1.xml#L179:~:text=undefined Name="-,Cookie,-")|2|API Key is passed as a cookie

## <a name="SchemeName"></a>[SchemeName](./Org.OData.Authorization.V1.xml#L184:~:text=TypeDefinition Name="-,SchemeName,-")
**Type:** String

The name of the authorization scheme.
