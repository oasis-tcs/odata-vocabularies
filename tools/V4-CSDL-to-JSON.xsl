<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:edmx="http://docs.oasis-open.org/odata/ns/edmx"
  xmlns:edm="http://docs.oasis-open.org/odata/ns/edm" xmlns:json="http://json.org/" xmlns:nodeinfo="xalan://org.apache.xalan.lib.NodeInfo"
>
  <!--
    This style sheet transforms OData 4.0 CSDL XML documents into CSDL JSON

    Latest version: https://github.com/oasis-tcs/odata-vocabularies/blob/master/tools/V4-CSDL-to-JSON.xsl
    
    TODO:
    - $DefaultValue depending on @Type and IEEE754Compatible
    - Parameter for IEEE754Compatible
    - - $Decimal as string or number
    - - $Int as string or number
  -->

  <xsl:output method="text" indent="yes" encoding="UTF-8" omit-xml-declaration="yes" />

  <xsl:key name="methods" match="//edm:Action|//edm:Function" use="concat(../@Namespace,'.',@Name)" />

  <xsl:key name="targets" match="//edm:Annotations" use="concat(../@Namespace,'/',@Target)" />

  <xsl:template match="edmx:Edmx">
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="@*[local-name()=name()]" mode="list" />
    <xsl:apply-templates select="//edm:EntityContainer" mode="top" />
    <xsl:apply-templates select="//edmx:Reference" mode="hash">
      <xsl:with-param name="key" select="'Uri'" />
    </xsl:apply-templates>
    <xsl:apply-templates select="//edm:Schema" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="edmx:Reference" mode="hashpair">
    <xsl:text>"</xsl:text>
    <xsl:call-template name="json-url">
      <xsl:with-param name="url" select="@Uri" />
    </xsl:call-template>
    <xsl:text>":{</xsl:text>
    <xsl:apply-templates select="edm:Annotation" mode="list" />
    <xsl:apply-templates select="edmx:Include" mode="array">
      <xsl:with-param name="after" select="edm:Annotation" />
    </xsl:apply-templates>
    <xsl:apply-templates select="edmx:IncludeAnnotations" mode="array">
      <xsl:with-param name="after" select="edm:Annotation|edmx:Include" />
    </xsl:apply-templates>
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="edm:Schema">
    <xsl:text>,"</xsl:text>
    <xsl:value-of select="@Namespace" />
    <xsl:text>":{"$Kind":"Schema"</xsl:text>
    <xsl:apply-templates select="@Alias" mode="list2" />
    <xsl:apply-templates select="edm:Annotation" mode="list2" />
    <xsl:apply-templates select="edm:Annotations[generate-id() = generate-id(key('targets', concat(../@Namespace,'/',@Target))[1])]" />
    <xsl:apply-templates
      select="edm:EntityType|edm:ComplexType|edm:TypeDefinition|edm:EnumType|edm:Term|edm:Action[generate-id()=generate-id(key('methods',concat(../@Namespace,'.',@Name))[1])]|edm:Function[generate-id()=generate-id(key('methods',concat(../@Namespace,'.',@Name))[1])]" />
    <xsl:apply-templates select="edm:EntityContainer" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="edm:EntityContainer" mode="top">
    <xsl:text>,"$EntityContainer":"</xsl:text>
    <xsl:value-of select="../@Namespace" />
    <xsl:text>.</xsl:text>
    <xsl:value-of select="@Name" />
    <xsl:text>"</xsl:text>
  </xsl:template>

  <xsl:template match="edm:EntityContainer">
    <xsl:text>,"</xsl:text>
    <xsl:value-of select="@Name" />
    <xsl:text>":{"$Kind":"EntityContainer"</xsl:text>
    <xsl:apply-templates select="@*[name()!='Name']|edm:Annotation" mode="list2" />
    <xsl:apply-templates select="edm:EntitySet" />
    <xsl:apply-templates select="edm:Singleton" />
    <xsl:apply-templates select="edm:ActionImport" />
    <xsl:apply-templates select="edm:FunctionImport" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="edm:EntitySet|edm:Singleton">
    <xsl:text>,"</xsl:text>
    <xsl:value-of select="@Name" />
    <xsl:text>":{"$Kind":"</xsl:text>
    <xsl:value-of select="local-name()" />
    <xsl:text>"</xsl:text>
    <xsl:apply-templates select="@*[name()!='Name']" mode="list2" />
    <xsl:apply-templates select="edm:NavigationPropertyBinding" mode="hash">
      <xsl:with-param name="key" select="'Path'" />
    </xsl:apply-templates>
    <xsl:apply-templates select="edm:Annotation" mode="list2" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="edm:NavigationPropertyBinding" mode="hashpair">
    <xsl:text>"</xsl:text>
    <xsl:call-template name="normalizedPath">
      <xsl:with-param name="path" select="@Path" />
    </xsl:call-template>
    <xsl:text>":"</xsl:text>
    <xsl:choose>
      <xsl:when test="contains(@Target,'/') and substring-before(@Target,'/') = concat(../../../@Namespace,'.',../../@Name)">
        <xsl:call-template name="normalizedPath">
          <xsl:with-param name="path" select="substring-after(@Target,'/')" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains(@Target,'/') and substring-before(@Target,'/') = concat(../../../@Alias,'.',../../@Name)">
        <xsl:call-template name="normalizedPath">
          <xsl:with-param name="path" select="substring-after(@Target,'/')" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="normalizedPath">
          <xsl:with-param name="path" select="@Target" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>"</xsl:text>
  </xsl:template>

  <xsl:template match="edm:EntitySet/@EntityType">
    <xsl:text>"$Type":"</xsl:text>
    <xsl:call-template name="normalizedQualifiedName">
      <xsl:with-param name="qualifiedName" select="." />
    </xsl:call-template>
    <xsl:text>"</xsl:text>
  </xsl:template>

  <xsl:template match="edm:ActionImport|edm:FunctionImport">
    <xsl:text>,"</xsl:text>
    <xsl:value-of select="@Name" />
    <xsl:text>":{"$Kind":"</xsl:text>
    <xsl:value-of select="local-name()" />
    <xsl:text>"</xsl:text>
    <xsl:apply-templates select="@*[name()!='Name']" mode="list2" />
    <xsl:apply-templates select="edm:Annotation" mode="list2" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="@EntitySet">
    <xsl:variable name="prefix" select="substring-before(.,'/')" />
    <xsl:text>"$</xsl:text>
    <xsl:value-of select="name()" />
    <xsl:text>":"</xsl:text>
    <xsl:choose>
      <xsl:when test="$prefix=''">
        <xsl:value-of select="." />
      </xsl:when>
      <xsl:when test="$prefix=concat(../../../@Namespace,'.',../../@Name) or $prefix=concat(../../../@Alias,'.',../../@Name)">
        <xsl:value-of select="substring-after(.,'/')" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="normalizedPath">
          <xsl:with-param name="path" select="." />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>"</xsl:text>
  </xsl:template>

  <xsl:template match="edm:EntityType|edm:ComplexType|edm:Term|edm:TypeDefinition">
    <xsl:text>,"</xsl:text>
    <xsl:value-of select="@Name" />
    <xsl:text>":{</xsl:text>
    <xsl:text>"$Kind":"</xsl:text>
    <xsl:value-of select="local-name()" />
    <xsl:text>"</xsl:text>
    <xsl:apply-templates select="@*[name()!='Name']|edm:*" mode="list2" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="edm:Key">
    <xsl:text>"$Key":[</xsl:text>
    <xsl:apply-templates select="edm:PropertyRef" mode="list" />
    <xsl:text>]</xsl:text>
  </xsl:template>

  <xsl:template match="edm:PropertyRef">
    <xsl:choose>
      <xsl:when test="@Alias">
        <xsl:text>{"</xsl:text>
        <xsl:value-of select="@Alias" />
        <xsl:text>":"</xsl:text>
        <xsl:value-of select="@Name" />
        <xsl:text>"}</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>"</xsl:text>
        <xsl:value-of select="@Name" />
        <xsl:text>"</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="edm:Property">
    <xsl:text>"</xsl:text>
    <xsl:value-of select="@Name" />
    <xsl:text>":{</xsl:text>
    <xsl:apply-templates
      select="@*[local-name()=name() and name()!='Name' and not(name()='Type' and .='Edm.String') and not(name()='Nullable' and .='true') and not(name()='MaxLength' and .='max') and not(name()='Unicode' and .='true')]|edm:*"
      mode="list" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="edm:NavigationProperty">
    <xsl:text>"</xsl:text>
    <xsl:value-of select="@Name" />
    <xsl:text>":{"$Kind":"</xsl:text>
    <xsl:value-of select="local-name()" />
    <xsl:text>"</xsl:text>
    <xsl:apply-templates select="@*[name()!='Name']|*[name()!='ReferentialConstraint']" mode="list2" />
    <xsl:apply-templates select="edm:ReferentialConstraint" mode="hash" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="@BaseType|@UnderlyingType|@Action|@Function">
    <xsl:text>"$</xsl:text>
    <xsl:value-of select="name()" />
    <xsl:text>":"</xsl:text>
    <xsl:call-template name="normalizedQualifiedName">
      <xsl:with-param name="qualifiedName" select="." />
    </xsl:call-template>
    <xsl:text>"</xsl:text>
  </xsl:template>

  <xsl:template match="@Type">
    <xsl:choose>
      <xsl:when test="starts-with(.,'Collection(')">
        <xsl:text>"$Collection":true,"$Type":"</xsl:text>
        <xsl:call-template name="normalizedQualifiedName">
          <xsl:with-param name="qualifiedName" select="substring-before(substring-after(.,'('),')')" />
        </xsl:call-template>
        <xsl:text>"</xsl:text>
      </xsl:when>
      <xsl:when test=".!='Edm.String'">
        <xsl:text>"$Type":"</xsl:text>
        <xsl:call-template name="normalizedQualifiedName">
          <xsl:with-param name="qualifiedName" select="." />
        </xsl:call-template>
        <xsl:text>"</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="@AppliesTo">
    <xsl:text>"$AppliesTo":["</xsl:text>
    <xsl:call-template name="replace-all">
      <xsl:with-param name="string" select="normalize-space(.)" />
      <xsl:with-param name="old" select="' '" />
      <xsl:with-param name="new" select="'&quot;,&quot;'" />
    </xsl:call-template>
    <xsl:text>"]</xsl:text>
  </xsl:template>

  <!-- default value is suppressed -->
  <xsl:template
    match="@Nullable[.='true']|@Abstract[.='false']|@ContainsTarget[.='false']|@HasStream[.='false']|@IsBound[.='false']|@IsComposable[.='false']|@IsFlags[.='false']|@MaxLength[.='max']|@OpenType[.='false']|@Unicode[.='true']" />
  <xsl:template match="edm:EntitySet/@IncludeInServiceDocument[.='true']|edm:FunctionImport/@IncludeInServiceDocument[.='false']" />

  <!-- name : unquoted value -->
  <xsl:template
    match="@Abstract|@HasStream|@IsFlags|@Nullable|@OpenType|@ContainsTarget|@IsBound|@IsComposable|@IncludeInServiceDocument|@MaxLength|@Precision|@Scale[.!='variable' and .!='floating']|@Unicode"
  >
    <xsl:text>"$</xsl:text>
    <xsl:value-of select="name()" />
    <xsl:text>":</xsl:text>
    <xsl:value-of select="." />
  </xsl:template>

  <xsl:template match="@DefaultValue">
    <xsl:text>"$DefaultValue":</xsl:text>
    <xsl:choose>
      <xsl:when
        test="../@Type='Edm.Boolean' or ../@Type='Edm.Byte' or ../@Type='Edm.SByte' or ../@Type='Edm.Int16' or ../@Type='Edm.Int32'"
      >
        <xsl:value-of select="." />
      </xsl:when>
      <xsl:when test="(../@Type='Edm.Double' or ../@Type='Edm.Single') and number(.)">
        <xsl:value-of select="." />
      </xsl:when>
      <xsl:when test="../@Type='Edm.Int64' and number(.) &lt; 9007199254740992">
        <xsl:value-of select="." />
      </xsl:when>
      <!-- FAKE: couldn't determine underlying primitive type, so guess from value -->
      <xsl:when
        test="not(substring(../@Type,4)='Edm.') and (.='true' or .='false' or .='null' or (number(.) and string-length(.) &lt; 16))"
      >
        <xsl:value-of select="." />
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>"</xsl:text>
        <xsl:call-template name="escape">
          <xsl:with-param name="string" select="." />
        </xsl:call-template>
        <xsl:text>"</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="edm:ReferentialConstraint" mode="hashpair">
    <xsl:text>"</xsl:text>
    <xsl:value-of select="@Property" />
    <xsl:text>":"</xsl:text>
    <xsl:value-of select="@ReferencedProperty" />
    <xsl:text>"</xsl:text>
    <xsl:apply-templates select="edm:Annotation" mode="list2">
      <xsl:with-param name="target" select="@Property" />
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="edm:OnDelete">
    <xsl:text>"$OnDelete":"</xsl:text>
    <xsl:value-of select="@Action" />
    <xsl:text>"</xsl:text>
    <xsl:apply-templates select="edm:Annotation" mode="list2">
      <xsl:with-param name="target" select="'$OnDelete'" />
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="edm:EnumType">
    <xsl:text>,"</xsl:text>
    <xsl:value-of select="@Name" />
    <xsl:text>":{"$Kind":"EnumType"</xsl:text>
    <xsl:apply-templates select="@*[name()!='Name']" mode="list2" />
    <xsl:apply-templates select="edm:Member" mode="list2" />
    <xsl:apply-templates select="edm:Annotation" mode="list2" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="edm:Member">
    <xsl:param name="position" />
    <xsl:text>"</xsl:text>
    <xsl:value-of select="@Name" />
    <xsl:text>":</xsl:text>
    <xsl:choose>
      <xsl:when test="@Value">
        <xsl:value-of select="@Value" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$position - 1" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates select="edm:Annotation" mode="list2">
      <xsl:with-param name="target" select="@Name" />
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="edm:Action|edm:Function">
    <xsl:text>,"</xsl:text>
    <xsl:value-of select="@Name" />
    <xsl:text>":[</xsl:text>
    <xsl:for-each select="key('methods', concat(../@Namespace,'.',@Name))">
      <xsl:if test="position()>1">
        <xsl:text>,</xsl:text>
      </xsl:if>
      <xsl:text>{"$Kind":"</xsl:text>
      <xsl:value-of select="local-name()" />
      <xsl:text>"</xsl:text>
      <xsl:apply-templates select="@*[name()!='Name']|edm:Annotation" mode="list2" />
      <xsl:apply-templates select="edm:Parameter" mode="array" />
      <xsl:apply-templates select="edm:ReturnType" mode="list2" />
      <xsl:text>}</xsl:text>
    </xsl:for-each>
    <xsl:text>]</xsl:text>
  </xsl:template>

  <xsl:template match="edm:Parameter" mode="item">
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="@Name" />
    <xsl:apply-templates select="@*[name()!='Name']|edm:*" mode="list2" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="edm:ReturnType">
    <xsl:text>"$</xsl:text>
    <xsl:value-of select="local-name()" />
    <xsl:text>":{</xsl:text>
    <xsl:apply-templates
      select="@*[local-name()=name() and not(name()='Type' and .='Edm.String') and not(name()='Nullable' and .='true') and not(name()='MaxLength' and .='max') and not(name()='Unicode' and .='true')]|edm:*"
      mode="list" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="edm:Annotations">
    <xsl:if test="position()=1">
      <xsl:text>,"$Annotations":{</xsl:text>
    </xsl:if>
    <xsl:text>"</xsl:text>
    <xsl:value-of select="@Target" />
    <xsl:text>":{</xsl:text>
    <xsl:for-each select="key('targets', concat(../@Namespace,'/',@Target))">
      <xsl:if test="position()>1">
        <xsl:text>,</xsl:text>
      </xsl:if>
      <xsl:apply-templates select="edm:Annotation" mode="list">
        <xsl:with-param name="qualifier" select="@Qualifier" />
      </xsl:apply-templates>
    </xsl:for-each>
    <xsl:text>}</xsl:text>
    <xsl:if test="position()!=last()">
      <xsl:text>,</xsl:text>
    </xsl:if>
    <xsl:if test="position()=last()">
      <xsl:text>}</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="edm:Annotation">
    <xsl:param name="target" />
    <xsl:param name="qualifier" />
    <xsl:variable name="name">
      <xsl:value-of select="$target" />
      <xsl:text>@</xsl:text>
      <xsl:call-template name="normalizedQualifiedName">
        <xsl:with-param name="qualifiedName" select="@Term" />
      </xsl:call-template>
      <xsl:if test="@Qualifier or $qualifier">
        <xsl:text>#</xsl:text>
        <xsl:value-of select="@Qualifier" />
        <xsl:value-of select="$qualifier" />
      </xsl:if>
    </xsl:variable>
    <xsl:text>"</xsl:text>
    <xsl:value-of select="$name" />
    <xsl:text>":</xsl:text>
    <xsl:apply-templates select="@*[local-name()=name() and name()!='Term' and name()!='Qualifier']|edm:*[local-name()!='Annotation']"
      mode="list"
    >
      <xsl:with-param name="target" select="$name" />
    </xsl:apply-templates>
    <!-- tagging terms without explicit value are assumed to have DefaultValue="true" -->
    <xsl:if test="count(@*[name()!='Term' and name()!='Qualifier']|edm:*[local-name()!='Annotation'])=0">
      <xsl:text>true</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="edm:Annotation" mode="list2">
      <xsl:with-param name="target" select="$name" />
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="@Float|edm:Float">
    <xsl:choose>
      <xsl:when test=".='NaN' or .='-INF' or .='INF'">
        <xsl:text>{"$Float":"</xsl:text>
        <xsl:value-of select="." />
        <xsl:text>"}</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="." />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="@Bool|edm:Bool">
    <xsl:value-of select="." />
  </xsl:template>

  <xsl:template match="@Int|edm:Int">
    <xsl:text>{"$Int":"</xsl:text>
    <xsl:value-of select="." />
    <xsl:text>"}</xsl:text>
  </xsl:template>

  <xsl:template
    match="@Binary|edm:Binary|@Date|edm:Date|@DateTimeOffset|edm:DateTimeOffset|@Decimal|edm:Decimal|@Duration|edm:Duration|@Guid|edm:Guid|@TimeOfDay|edm:TimeOfDay"
  >
    <xsl:text>{"$</xsl:text>
    <xsl:value-of select="local-name()" />
    <xsl:text>":"</xsl:text>
    <xsl:value-of select="." />
    <xsl:text>"}</xsl:text>
  </xsl:template>

  <xsl:template
    match="@AnnotationPath|edm:AnnotationPath|@ModelElementPath|edm:ModelElementPath|@NavigationPropertyPath|edm:NavigationPropertyPath|@Path|edm:Path|@PropertyPath|edm:PropertyPath"
  >
    <xsl:text>{"$</xsl:text>
    <xsl:value-of select="local-name()" />
    <xsl:text>":"</xsl:text>
    <xsl:call-template name="normalizedPath">
      <xsl:with-param name="path" select="." />
    </xsl:call-template>
    <xsl:text>"}</xsl:text>
  </xsl:template>

  <xsl:template match="@UrlRef">
    <xsl:text>{"$</xsl:text>
    <xsl:value-of select="local-name()" />
    <xsl:text>":"</xsl:text>
    <xsl:call-template name="escape">
      <xsl:with-param name="string" select="." />
    </xsl:call-template>
    <xsl:text>"}</xsl:text>
  </xsl:template>

  <!-- escaped string value -->
  <xsl:template match="@String|edm:String">
    <xsl:text>"</xsl:text>
    <xsl:call-template name="escape">
      <xsl:with-param name="string" select="." />
    </xsl:call-template>
    <xsl:text>"</xsl:text>
  </xsl:template>

  <xsl:template name="escape">
    <xsl:param name="string" />
    <xsl:choose>
      <xsl:when test="contains($string,'&quot;')">
        <xsl:call-template name="replace">
          <xsl:with-param name="string" select="$string" />
          <xsl:with-param name="old" select="'&quot;'" />
          <xsl:with-param name="new" select="'\&quot;'" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains($string,'\')">
        <xsl:call-template name="replace">
          <xsl:with-param name="string" select="$string" />
          <xsl:with-param name="old" select="'\'" />
          <xsl:with-param name="new" select="'\\'" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains($string,'&#x0A;')">
        <xsl:call-template name="replace">
          <xsl:with-param name="string" select="$string" />
          <xsl:with-param name="old" select="'&#x0A;'" />
          <xsl:with-param name="new" select="'\n'" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains($string,'&#x0D;')">
        <xsl:call-template name="replace">
          <xsl:with-param name="string" select="$string" />
          <xsl:with-param name="old" select="'&#x0D;'" />
          <xsl:with-param name="new" select="'\r'" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains($string,'&#x09;')">
        <xsl:call-template name="replace">
          <xsl:with-param name="string" select="$string" />
          <xsl:with-param name="old" select="'&#x09;'" />
          <xsl:with-param name="new" select="'\t'" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$string" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="replace">
    <xsl:param name="string" />
    <xsl:param name="old" />
    <xsl:param name="new" />
    <xsl:call-template name="escape">
      <xsl:with-param name="string" select="substring-before($string,$old)" />
    </xsl:call-template>
    <xsl:value-of select="$new" />
    <xsl:call-template name="escape">
      <xsl:with-param name="string" select="substring-after($string,$old)" />
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="edm:Record">
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="@*[local-name()=name()]|edm:*" mode="list" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="edm:PropertyValue">
    <xsl:text>"</xsl:text>
    <xsl:value-of select="@Property" />
    <xsl:text>":</xsl:text>
    <xsl:apply-templates select="@*[local-name()=name() and name()!='Property']|edm:*[local-name()!='Annotation']" />
    <xsl:apply-templates select="edm:Annotation" mode="list2">
      <xsl:with-param name="target" select="@Property" />
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="edm:Collection">
    <xsl:text>[</xsl:text>
    <xsl:apply-templates select="edm:*" mode="list" />
    <xsl:text>]</xsl:text>
  </xsl:template>

  <xsl:template match="edm:If|edm:Eq|edm:Ne|edm:Ge|edm:Gt|edm:Le|edm:Lt|edm:And|edm:Or|edm:Has|edm:In|edm:Add|edm:Sub|edm:Mul|edm:Div|edm:DivBy|edm:Mod">
    <xsl:text>{"$</xsl:text>
    <xsl:value-of select="local-name()" />
    <xsl:text>":[</xsl:text>
    <xsl:apply-templates select="edm:*[local-name()!='Annotation']" mode="list" />
    <xsl:text>]</xsl:text>
    <xsl:apply-templates select="edm:Annotation" mode="list2" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="edm:Apply">
    <xsl:text>{"$Apply":[</xsl:text>
    <xsl:apply-templates select="edm:*[local-name()!='Annotation']" mode="list" />
    <xsl:text>]</xsl:text>
    <xsl:apply-templates select="@*" mode="list2" />
    <xsl:apply-templates select="edm:Annotation" mode="list2" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="edm:LabeledElement">
    <xsl:text>{"$LabeledElement":</xsl:text>
    <xsl:apply-templates select="@*[local-name()=name() and local-name()!='Name']|edm:*[local-name()!='Annotation']" />
    <xsl:apply-templates select="edm:Annotation" mode="list2" />
    <xsl:text>,"$Name":"</xsl:text>
    <xsl:value-of select="@Name" />
    <xsl:text>"}</xsl:text>
  </xsl:template>

  <xsl:template match="edm:LabeledElementReference">
    <xsl:text>{"$LabeledElementReference":"</xsl:text>
    <xsl:call-template name="normalizedQualifiedName">
      <xsl:with-param name="qualifiedName" select="." />
    </xsl:call-template>
    <xsl:text>"}</xsl:text>
  </xsl:template>

  <xsl:template match="edm:Cast|edm:IsOf">
    <xsl:text>{"$</xsl:text>
    <xsl:value-of select="local-name()" />
    <xsl:text>":</xsl:text>
    <xsl:apply-templates select="edm:*[local-name()!='Annotation']" />
    <xsl:apply-templates select="@*" mode="list2" />
    <xsl:apply-templates select="edm:Annotation" mode="list2" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="edm:Null">
    <xsl:choose>
      <xsl:when test="edm:*">
        <xsl:text>{"$Null":null</xsl:text>
        <xsl:apply-templates select="edm:*" mode="list2" />
        <xsl:text>}</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>null</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="edm:Not|edm:Neg|edm:UrlRef">
    <xsl:text>{"$</xsl:text>
    <xsl:value-of select="local-name()" />
    <xsl:text>":</xsl:text>
    <xsl:apply-templates select="@*[local-name()=name()]|edm:*[local-name()!='Annotation']" />
    <xsl:apply-templates select="edm:Annotation" mode="list2" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="@EnumMember|edm:EnumMember">
    <xsl:variable name="type" select="substring-before(.,'/')" />
    <xsl:text>{"$EnumMember":"</xsl:text>
    <xsl:call-template name="replace-all">
      <xsl:with-param name="string">
        <xsl:call-template name="replace-all">
          <xsl:with-param name="string" select="." />
          <xsl:with-param name="old" select="concat($type,'/')" />
          <xsl:with-param name="new" select="''" />
        </xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="old" select="' '" />
      <xsl:with-param name="new" select="','" />
    </xsl:call-template>
    <xsl:text>"}</xsl:text>
  </xsl:template>

  <!-- name : array -->
  <xsl:template match="*" mode="array">
    <xsl:param name="after" select="'something'" />
    <xsl:if test="position()=1">
      <xsl:if test="$after">
        <xsl:text>,</xsl:text>
      </xsl:if>
      <xsl:text>"$</xsl:text>
      <xsl:value-of select="local-name()" />
      <xsl:text>":[</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="." mode="item" />
    <xsl:if test="position()!=last()">
      <xsl:text>,</xsl:text>
    </xsl:if>
    <xsl:if test="position()=last()">
      <xsl:text>]</xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- object within array -->
  <xsl:template match="*" mode="item">
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="@*|node()" mode="list" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <!-- $name : hash -->
  <xsl:template match="*" mode="hash">
    <xsl:param name="name" />
    <xsl:param name="key" select="'Name'" />
    <xsl:param name="after" select="'something'" />
    <xsl:if test="position()=1">
      <xsl:if test="$after">
        <xsl:text>,</xsl:text>
      </xsl:if>
      <xsl:text>"</xsl:text>
      <xsl:choose>
        <xsl:when test="$name">
          <xsl:value-of select="$name" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>$</xsl:text>
          <xsl:value-of select="local-name()" />
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>":{</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="." mode="hashpair">
      <xsl:with-param name="name" select="$name" />
      <xsl:with-param name="key" select="$key" />
      <xsl:with-param name="position" select="position()" />
    </xsl:apply-templates>
    <xsl:if test="position()!=last()">
      <xsl:text>,</xsl:text>
    </xsl:if>
    <xsl:if test="position()=last()">
      <xsl:text>}</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="*" mode="hashpair">
    <xsl:param name="name" />
    <xsl:param name="key" select="'Name'" />
    <xsl:param name="position" />
    <xsl:text>"</xsl:text>
    <xsl:value-of select="@*[name()=$key]" />
    <xsl:text>":{</xsl:text>
    <xsl:apply-templates select="." mode="hashvalue">
      <xsl:with-param name="name" select="$name" />
      <xsl:with-param name="key" select="$key" />
      <xsl:with-param name="position" select="$position" />
    </xsl:apply-templates>
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="*" mode="hashvalue">
    <xsl:param name="key" select="'Name'" />
    <xsl:param name="position" />
    <xsl:apply-templates select="@*[name()!=$key]|node()" mode="list">
      <xsl:with-param name="position" select="$position" />
    </xsl:apply-templates>
  </xsl:template>

  <!-- comma-separated list -->
  <xsl:template match="@*|*" mode="list">
    <xsl:param name="target" />
    <xsl:param name="qualifier" />
    <xsl:param name="after" />
    <xsl:choose>
      <xsl:when test="position() > 1">
        <xsl:text>,</xsl:text>
      </xsl:when>
      <xsl:when test="$after">
        <xsl:text>,</xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:apply-templates select=".">
      <xsl:with-param name="target" select="$target" />
      <xsl:with-param name="qualifier" select="$qualifier" />
      <xsl:with-param name="position" select="position()" />
    </xsl:apply-templates>
  </xsl:template>

  <!-- continuation of comma-separated list -->
  <xsl:template match="@*|*" mode="list2">
    <xsl:param name="target" />
    <xsl:param name="qualifier" />
    <xsl:variable name="item">
      <xsl:apply-templates select=".">
        <xsl:with-param name="target" select="$target" />
        <xsl:with-param name="qualifier" select="$qualifier" />
        <xsl:with-param name="position" select="position()" />
      </xsl:apply-templates>
    </xsl:variable>
    <xsl:if test="not($item='')">
      <xsl:text>,</xsl:text>
      <xsl:value-of select="$item" />
    </xsl:if>
  </xsl:template>

  <!-- name : object -->
  <xsl:template match="edmx:*|edm:*">
    <xsl:text>"$</xsl:text>
    <xsl:value-of select="local-name()" />
    <xsl:text>":{</xsl:text>
    <xsl:apply-templates select="@*[local-name()=name()]|node()" mode="list" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <!-- name : quoted value -->
  <xsl:template match="@*">
    <xsl:if test="local-name()=name()">
      <xsl:text>"$</xsl:text>
      <xsl:value-of select="name()" />
      <xsl:text>":"</xsl:text>
      <xsl:value-of select="." />
      <xsl:text>"</xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- helper functions -->
  <xsl:template name="substring-before-last">
    <xsl:param name="input" />
    <xsl:param name="marker" />
    <xsl:if test="contains($input,$marker)">
      <xsl:value-of select="substring-before($input,$marker)" />
      <xsl:if test="contains(substring-after($input,$marker),$marker)">
        <xsl:value-of select="$marker" />
        <xsl:call-template name="substring-before-last">
          <xsl:with-param name="input" select="substring-after($input,$marker)" />
          <xsl:with-param name="marker" select="$marker" />
        </xsl:call-template>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <xsl:template name="substring-after-last">
    <xsl:param name="input" />
    <xsl:param name="marker" />
    <xsl:choose>
      <xsl:when test="contains($input,$marker)">
        <xsl:call-template name="substring-after-last">
          <xsl:with-param name="input" select="substring-after($input,$marker)" />
          <xsl:with-param name="marker" select="$marker" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$input" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="replace-all">
    <xsl:param name="string" />
    <xsl:param name="old" />
    <xsl:param name="new" />
    <xsl:choose>
      <xsl:when test="contains($string,$old)">
        <xsl:value-of select="substring-before($string,$old)" />
        <xsl:value-of select="$new" />
        <xsl:call-template name="replace-all">
          <xsl:with-param name="string" select="substring-after($string,$old)" />
          <xsl:with-param name="old" select="$old" />
          <xsl:with-param name="new" select="$new" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$string" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="json-url">
    <xsl:param name="url" />
    <xsl:choose>
      <xsl:when test="substring($url,1,33) = 'http://docs.oasis-open.org/odata/'">
        <xsl:text>http://docs.oasis-open.org/odata/odata-vocabularies/v4.0/vocabularies/</xsl:text>
        <xsl:variable name="filename">
          <xsl:call-template name="substring-after-last">
            <xsl:with-param name="input" select="$url" />
            <xsl:with-param name="marker" select="'/'" />
          </xsl:call-template>
        </xsl:variable>
        <xsl:value-of select="substring($filename,1,string-length($filename)-4)" />
        <xsl:value-of select="'.json'" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$url" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="normalizedQualifiedName">
    <xsl:param name="qualifiedName" />
    <xsl:variable name="qualifier">
      <xsl:call-template name="substring-before-last">
        <xsl:with-param name="input" select="$qualifiedName" />
        <xsl:with-param name="marker" select="'.'" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="//edm:Schema[@Namespace=$qualifier and @Alias]">
        <xsl:value-of select="//edm:Schema[@Namespace=$qualifier]/@Alias" />
      </xsl:when>
      <xsl:when test="//edmx:Include[@Namespace=$qualifier and @Alias]">
        <xsl:value-of select="//edmx:Include[@Namespace=$qualifier]/@Alias" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$qualifier" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>.</xsl:text>
    <xsl:call-template name="substring-after-last">
      <xsl:with-param name="input" select="$qualifiedName" />
      <xsl:with-param name="marker" select="'.'" />
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="normalizedPath">
    <xsl:param name="path" />
    <xsl:choose>
      <xsl:when test="contains($path,'/')">
        <!-- multiple path segments: normalize first segment and remaining path -->
        <xsl:call-template name="normalizedPath">
          <xsl:with-param name="path" select="substring-before($path,'/')" />
        </xsl:call-template>
        <xsl:text>/</xsl:text>
        <xsl:call-template name="normalizedPath">
          <xsl:with-param name="path" select="substring-after($path,'/')" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains($path,'@')">
        <!-- term-cast segment or annotated property: normalize term name -->
        <xsl:value-of select="substring-before($path,'@')" />
        <xsl:text>@</xsl:text>
        <xsl:call-template name="normalizedQualifiedName">
          <xsl:with-param name="qualifiedName" select="substring-after($path,'@')" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains($path,'.')">
        <!-- qualified segment: normalize -->
        <xsl:call-template name="normalizedQualifiedName">
          <xsl:with-param name="qualifiedName" select="$path" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <!-- unqualified segment, e.g. property: copy -->
        <xsl:value-of select="$path" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>