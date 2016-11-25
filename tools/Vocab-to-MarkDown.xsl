<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:edmx="http://docs.oasis-open.org/odata/ns/edmx"
  xmlns:edm="http://docs.oasis-open.org/odata/ns/edm" exclude-result-prefixes="edmx edm"
>
  <!--
    This style sheet transforms OData 4.0 XML Vocabulary documents into GitHub-Flavored MarkDown (GFM)

    TODO:
    - special annotations: IsMediaType?
  -->

  <xsl:output method="html" indent="no" encoding="UTF-8" omit-xml-declaration="yes" />

  <xsl:variable name="coreNamespace" select="'Org.OData.Core.V1'" />
  <xsl:variable name="coreAlias"
    select="//edmx:Include[@Namespace=$coreNamespace]/@Alias|//edm:Schema[@Namespace=$coreNamespace]/@Alias" />

  <xsl:variable name="validationNamespace" select="'Org.OData.Validation.V1'" />
  <xsl:variable name="validationAlias"
    select="//edmx:Include[@Namespace=$validationNamespace]/@Alias|//edm:Schema[@Namespace=$validationNamespace]/@Alias" />

  <xsl:template name="Core.Description">
    <xsl:param name="node" />
    <xsl:variable name="description"
      select="$node/edm:Annotation[(@Term=concat($coreNamespace,'.Description') or @Term=concat($coreAlias,'.Description')) and not(@Qualifier)]" />
    <xsl:call-template name="escape">
      <xsl:with-param name="string" select="normalize-space($description/@String)" />
    </xsl:call-template>
    <xsl:call-template name="escape">
      <xsl:with-param name="string" select="normalize-space($description/edm:String)" />
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="Core.LongDescription">
    <xsl:param name="node" />
    <xsl:variable name="description"
      select="$node/edm:Annotation[(@Term=concat($coreNamespace,'.LongDescription') or @Term=concat($coreAlias,'.LongDescription')) and not(@Qualifier)]" />
    <xsl:call-template name="escape">
      <xsl:with-param name="string" select="normalize-space($description/@String)" />
    </xsl:call-template>
    <xsl:call-template name="escape">
      <xsl:with-param name="string" select="normalize-space($description/edm:String)" />
    </xsl:call-template>
  </xsl:template>


  <xsl:template match="edmx:Edmx">
    <xsl:text># </xsl:text>
    <xsl:call-template name="substring-after-last">
      <xsl:with-param name="input">
        <xsl:call-template name="substring-before-last">
          <xsl:with-param name="input" select="//edm:Schema/@Namespace" />
          <xsl:with-param name="marker" select="'.'" />
        </xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="marker" select="'.'" />
    </xsl:call-template>
    <xsl:text> Vocabulary</xsl:text>
    <xsl:text>&#xA;</xsl:text>

    <xsl:text>**Namespace: [</xsl:text>
    <xsl:value-of select="//edm:Schema/@Namespace" />
    <xsl:text>](</xsl:text>
    <xsl:value-of select="//edm:Schema/@Namespace" />
    <xsl:text>.xml)**&#xA;&#xA;</xsl:text>

    <xsl:call-template name="Core.Description">
      <xsl:with-param name="node" select="//edm:Schema" />
    </xsl:call-template>
    <xsl:text>&#xA;</xsl:text>

    <!--
      <p>
      <xsl:call-template name="Core.LongDescription">
      <xsl:with-param name="node" select="//edm:Schema" />
      </xsl:call-template>
      </p>
    -->

    <xsl:apply-templates select="//edm:Term" />

    <xsl:apply-templates select="//edm:ComplexType|//edm:EnumType|//edm:TypeDefinition" />
  </xsl:template>

  <xsl:template match="edm:Term">
    <xsl:if test="position()=1">
      <xsl:text>&#xA;Term|Type|Description</xsl:text>
      <xsl:text>&#xA;----|----|-----------&#xA;</xsl:text>
    </xsl:if>
    <xsl:value-of select="@Name" />
    <xsl:text>|</xsl:text>
    <xsl:call-template name="type-link">
      <xsl:with-param name="type" select="@Type" />
    </xsl:call-template>

    <xsl:text>|</xsl:text>
    <xsl:call-template name="Core.Description">
      <xsl:with-param name="node" select="." />
    </xsl:call-template>
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>

  <xsl:template match="edm:ComplexType">
    <xsl:text>&#xA;## </xsl:text>
    <a>
      <xsl:attribute name="name">
        <xsl:value-of select="@Name" />
      </xsl:attribute>
    </a>
    <xsl:if test="@Abstract='true'">
      <xsl:text>*</xsl:text>
    </xsl:if>
    <xsl:value-of select="@Name" />
    <xsl:if test="@Abstract='true'">
      <xsl:text>*</xsl:text>
    </xsl:if>
    <xsl:if test="@BaseType">
      <xsl:text>: </xsl:text>
      <xsl:call-template name="type-link">
        <xsl:with-param name="type" select="@BaseType" />
      </xsl:call-template>
    </xsl:if>
    <xsl:text>&#xA;</xsl:text>

    <xsl:call-template name="Core.Description">
      <xsl:with-param name="node" select="." />
    </xsl:call-template>
    <xsl:text>&#xA;</xsl:text>

    <xsl:variable name="namespaceQualifiedName" select="concat(../@Namespace,'.',@Name)" />
    <xsl:variable name="aliasQualifiedName" select="concat(../@Alias,'.',@Name)" />
    <xsl:if test="//edm:ComplexType[@BaseType=$namespaceQualifiedName or @BaseType=$aliasQualifiedName]">
      <xsl:text>&#xA;**Derived Types:**&#xA;</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="//edm:ComplexType[@BaseType=$namespaceQualifiedName or @BaseType=$aliasQualifiedName]"
      mode="inheritance" />

    <!-- TODO
      <xsl:apply-templates select="edm:Property" />
    -->
    <xsl:variable name="properties">
      <xsl:call-template name="properties">
        <xsl:with-param name="complexType" select="." />
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$properties">
      <xsl:text>&#xA;Property|Type|Description</xsl:text>
      <xsl:text>&#xA;--------|----|-----------&#xA;</xsl:text>
      <xsl:value-of select="$properties" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="edm:ComplexType" mode="inheritance">
    <xsl:param name="indent" select="''" />
    <xsl:value-of select="$indent" />
    <xsl:text>- </xsl:text>
    <xsl:if test="@Abstract='true'">
      <xsl:text>*</xsl:text>
    </xsl:if>
    <xsl:call-template name="type-link">
      <xsl:with-param name="type" select="concat(../@Namespace,'.',@Name)" />
    </xsl:call-template>
    <xsl:if test="@Abstract='true'">
      <xsl:text>*</xsl:text>
    </xsl:if>
    <xsl:text>&#xA;</xsl:text>

    <xsl:variable name="namespaceQualifiedName" select="concat(../@Namespace,'.',@Name)" />
    <xsl:variable name="aliasQualifiedName" select="concat(../@Alias,'.',@Name)" />
    <xsl:apply-templates select="//edm:ComplexType[@BaseType=$namespaceQualifiedName or @BaseType=$aliasQualifiedName]"
      mode="inheritance"
    >
      <xsl:with-param name="indent" select="concat($indent,'  ')" />
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template name="properties">
    <xsl:param name="complexType" />
    <xsl:param name="parent" select="false()" />
    <xsl:if test="$complexType/@BaseType">
      <xsl:variable name="qualifier">
        <xsl:call-template name="substring-before-last">
          <xsl:with-param name="input" select="$complexType/@BaseType" />
          <xsl:with-param name="marker" select="'.'" />
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="name">
        <xsl:call-template name="substring-after-last">
          <xsl:with-param name="input" select="$complexType/@BaseType" />
          <xsl:with-param name="marker" select="'.'" />
        </xsl:call-template>
      </xsl:variable>
      <!-- recurse to base type -->
      <xsl:call-template name="properties">
        <xsl:with-param name="complexType"
          select="//edm:Schema[@Namespace=$qualifier or @Alias=$qualifier]/edm:ComplexType[@Name=$name]" />
        <xsl:with-param name="parent" select="true()" />
      </xsl:call-template>
    </xsl:if>
    <xsl:apply-templates select="$complexType/edm:Property">
      <xsl:with-param name="parent" select="$parent" />
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="edm:Property">
    <xsl:param name="parent" />
    <xsl:if test="$parent">
      <xsl:text>*</xsl:text>
    </xsl:if>
    <xsl:value-of select="@Name" />
    <xsl:if test="$parent">
      <xsl:text>*</xsl:text>
    </xsl:if>
    <xsl:text>|</xsl:text>
    <xsl:call-template name="type-link">
      <xsl:with-param name="type" select="@Type" />
    </xsl:call-template>
    <xsl:text>|</xsl:text>
    <xsl:call-template name="Core.Description">
      <xsl:with-param name="node" select="." />
    </xsl:call-template>
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>

  <xsl:template match="edm:EnumType">
    <xsl:text>&#xA;## </xsl:text>
    <a>
      <xsl:attribute name="name">
        <xsl:value-of select="@Name" />
      </xsl:attribute>
    </a>
    <xsl:value-of select="@Name" />
    <xsl:text>&#xA;</xsl:text>

    <xsl:call-template name="Core.Description">
      <xsl:with-param name="node" select="." />
    </xsl:call-template>
    <xsl:text>&#xA;</xsl:text>

    <!-- TODO: @IsFlags, @UnderlyingType? -->

    <xsl:apply-templates select="edm:Member" />
  </xsl:template>

  <xsl:template match="edm:Member">
    <xsl:if test="position()=1">
      <xsl:text>&#xA;Member|Value|Description</xsl:text>
      <xsl:text>&#xA;------|----:|-----------&#xA;</xsl:text>
    </xsl:if>
    <xsl:value-of select="@Name" />
    <xsl:text>|</xsl:text>
    <xsl:choose>
      <xsl:when test="@Value">
        <xsl:value-of select="@Value" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="position()-1" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>|</xsl:text>
    <xsl:call-template name="Core.Description">
      <xsl:with-param name="node" select="." />
    </xsl:call-template>
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>

  <xsl:template match="edm:TypeDefinition">
    <xsl:text>&#xA;## </xsl:text>
    <a>
      <xsl:attribute name="name">
        <xsl:value-of select="@Name" />
      </xsl:attribute>
    </a>
    <xsl:value-of select="@Name" />
    <xsl:text>&#xA;**Type:** </xsl:text>
    <xsl:call-template name="type-link">
      <xsl:with-param name="type" select="@UnderlyingType" />
    </xsl:call-template>
    <xsl:text>&#xA;&#xA;</xsl:text>

    <xsl:call-template name="Core.Description">
      <xsl:with-param name="node" select="." />
    </xsl:call-template>
    <xsl:text>&#xA;</xsl:text>

    <!-- TODO: annotations -->
    <xsl:call-template name="allowedValues" />
  </xsl:template>

  <xsl:template name="allowedValues">
    <xsl:variable name="allowedValues"
      select="edm:Annotation[(@Term=concat($validationNamespace,'.AllowedValues') or @Term=concat($validationAlias,'.AllowedValues')) and not(@Qualifier)]" />
    <xsl:if test="$allowedValues">
      <xsl:text>Allowed Value|Description&#xA;</xsl:text>
      <xsl:text>-------------|-----------&#xA;</xsl:text>
      <xsl:apply-templates select="$allowedValues/edm:Collection/edm:Record" mode="allowedValues" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="edm:Record" mode="allowedValues">
    <xsl:value-of select="edm:PropertyValue[@Property='Value']/@*[local-name()!='Property']" />
    <xsl:text>|</xsl:text>
    <xsl:call-template name="Core.Description">
      <xsl:with-param name="node" select="." />
    </xsl:call-template>
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>

  <xsl:template name="type-link">
    <xsl:param name="type" />
    <xsl:variable name="collection" select="starts-with($type,'Collection(')" />
    <xsl:variable name="singleType">
      <xsl:choose>
        <xsl:when test="$collection">
          <xsl:value-of select="substring-before(substring-after($type,'('),')')" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$type" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="qualifier">
      <xsl:call-template name="substring-before-last">
        <xsl:with-param name="input" select="$singleType" />
        <xsl:with-param name="marker" select="'.'" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="name">
      <xsl:call-template name="substring-after-last">
        <xsl:with-param name="input" select="$singleType" />
        <xsl:with-param name="marker" select="'.'" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="isUrl"
      select="edm:Annotation[(@Term=concat($coreNamespace,'.IsURL') or @Term=concat($coreAlias,'.IsURL')) and not(@Qualifier)]" />
    <xsl:if test="$collection">
      <xsl:text>\[</xsl:text>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="$type='Edm.String'">
        <xsl:choose>
          <xsl:when test="$isUrl">
            <xsl:text>URL</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$name" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$qualifier='Edm'">
        <xsl:value-of select="$name" />
      </xsl:when>
      <xsl:when test="$qualifier=ancestor::edm:Schema/@Alias or $qualifier=ancestor::edm:Schema/@Namespace">
        <xsl:text>[</xsl:text>
        <xsl:value-of select="$name" />
        <xsl:text>](#</xsl:text>
        <xsl:value-of select="$name" />
        <xsl:text>)</xsl:text>
      </xsl:when>
      <xsl:when test="$qualifier=//edmx:Include/@Alias or $qualifier=//edmx:Include/@Namespace">
        <xsl:variable name="namespace">
          <xsl:choose>
            <xsl:when test="$qualifier=//edmx:Include/@Alias">
              <xsl:value-of select="//edmx:Include[@Alias=$qualifier]/@Namespace" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$qualifier" />
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:text>[</xsl:text>
        <xsl:value-of select="$name" />
        <xsl:text>](</xsl:text>
        <xsl:value-of select="$namespace" />
        <xsl:text>.md#</xsl:text>
        <xsl:value-of select="$name" />
        <xsl:text>)</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>??</xsl:text>
        <xsl:value-of select="$type" />
        <xsl:text>??</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="$collection">
      <xsl:text>\]</xsl:text>
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

  <xsl:template name="escape">
    <xsl:param name="string" />
    <xsl:choose>
      <xsl:when test="contains($string,'|')">
        <xsl:call-template name="escape-one">
          <xsl:with-param name="string" select="$string" />
          <xsl:with-param name="old" select="'|'" />
          <xsl:with-param name="new" select="'\|'" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$string" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="escape-one">
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


</xsl:stylesheet>