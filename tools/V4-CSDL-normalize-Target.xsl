<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:edmx="http://docs.oasis-open.org/odata/ns/edmx"
  xmlns:edm="http://docs.oasis-open.org/odata/ns/edm" xmlns:json="http://json.org/" xmlns:nodeinfo="xalan://org.apache.xalan.lib.NodeInfo"
>
  <!--
    This style sheet normalizes Target attribute values to alias-qualified names

    Latest version: https://github.com/oasis-tcs/odata-vocabularies/blob/master/tools/V4-normalize-Target.xsl

  -->

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="edm:Annotations/@Target">
    <xsl:attribute name="Target">
      <xsl:call-template name="normalizedPath">
        <xsl:with-param name="path" select="." />
      </xsl:call-template>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="edm:Schema|edmx:Include">
    <xsl:copy>
      <!-- invent alias for schemas defined or included without alias -->
      <xsl:if test="not(@Alias)">
        <xsl:attribute name="Alias">
          <xsl:apply-templates select="." mode="alias" />
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="edm:Schema" mode="alias">
    <xsl:text>self</xsl:text>
    <xsl:variable name="position" select="count(preceding-sibling::edm:Schema)" />
    <xsl:if test="$position>0">
      <xsl:value-of select="$position" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="edmx:Include" mode="alias">
    <xsl:choose>
      <xsl:when test="starts-with(@Namespace,'Org.OData.')">
        <xsl:call-template name="substring-before-last">
          <xsl:with-param name="input" select="substring(@Namespace,11)" />
          <xsl:with-param name="marker" select="'.'" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>R</xsl:text>
        <xsl:value-of select="count(../preceding-sibling::edmx:Reference)" />
        <xsl:text>I</xsl:text>
        <xsl:value-of select="count(preceding-sibling::edmx:Include)" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- helper functions -->
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

  <xsl:template name="normalizedQualifiedName">
    <xsl:param name="qualifiedName" />
    <xsl:variable name="qualifier">
      <xsl:call-template name="substring-before-last">
        <xsl:with-param name="input" select="$qualifiedName" />
        <xsl:with-param name="marker" select="'.'" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$qualifier='Edm' or $qualifier='odata'">
        <xsl:value-of select="$qualifier" />
      </xsl:when>
      <xsl:when test="//edm:Schema[@Alias=$qualifier]">
        <xsl:value-of select="$qualifier" />
      </xsl:when>
      <xsl:when test="//edmx:Include[@Alias=$qualifier]">
        <xsl:value-of select="$qualifier" />
      </xsl:when>
      <xsl:when test="//edm:Schema[@Namespace=$qualifier and @Alias]">
        <xsl:value-of select="//edm:Schema[@Namespace=$qualifier]/@Alias" />
      </xsl:when>
      <xsl:when test="//edmx:Include[@Namespace=$qualifier and @Alias]">
        <xsl:value-of select="//edmx:Include[@Namespace=$qualifier]/@Alias" />
      </xsl:when>
      <xsl:when test="//edm:Schema[@Namespace=$qualifier]">
        <xsl:apply-templates select="//edm:Schema[@Namespace=$qualifier]" mode="alias" />
      </xsl:when>
      <xsl:when test="//edmx:Include[@Namespace=$qualifier]">
        <xsl:value-of select="$qualifier" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:message>
          <xsl:text>Unknown name qualifier </xsl:text>
          <xsl:value-of select="$qualifier" />
          <xsl:text> in line </xsl:text>
          <xsl:value-of select="nodeinfo:lineNumber()" />
        </xsl:message>
        <xsl:value-of select="$qualifier" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>.</xsl:text>
    <xsl:call-template name="substring-after-last">
      <xsl:with-param name="input" select="$qualifiedName" />
      <xsl:with-param name="marker" select="'.'" />
    </xsl:call-template>
  </xsl:template>

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

</xsl:stylesheet>