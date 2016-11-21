<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:edmx="http://docs.oasis-open.org/odata/ns/edmx"
  xmlns:edm="http://docs.oasis-open.org/odata/ns/edm" exclude-result-prefixes="edmx edm"
>
  <!--
    This style sheet transforms OData 4.0 XML Vocabulary documents into HTML / MarkDown

    TODO:
    - everything
  -->

  <xsl:output method="html" indent="no" encoding="UTF-8" omit-xml-declaration="yes" />

  <xsl:variable name="coreNamespace" select="'Org.OData.Core.V1'" />
  <xsl:variable name="coreAlias"
    select="//edmx:Include[@Namespace=$coreNamespace]/@Alias|//edm:Schema[@Namespace=$coreNamespace]/@Alias" />
  <xsl:variable name="coreDescription" select="concat($coreNamespace,'.Description')" />
  <xsl:variable name="coreDescriptionAliased" select="concat($coreAlias,'.Description')" />
  <xsl:variable name="coreLongDescription" select="concat($coreNamespace,'.LongDescription')" />
  <xsl:variable name="coreLongDescriptionAliased" select="concat($coreAlias,'.LongDescription')" />

  <xsl:variable name="commonNamespace" select="'com.sap.vocabularies.Common.v1'" />
  <xsl:variable name="commonAlias"
    select="//edmx:Include[@Namespace=$commonNamespace]/@Alias|//edm:Schema[@Namespace=$commonNamespace]/@Alias" />
  <xsl:variable name="commonLabel" select="concat($commonNamespace,'.Label')" />
  <xsl:variable name="commonLabelAliased" select="concat($commonAlias,'.Label')" />

  <xsl:template name="Core.Description">
    <xsl:param name="node" />
    <xsl:variable name="description"
      select="$node/edm:Annotation[(@Term=$coreDescription or @Term=$coreDescriptionAliased) and not(@Qualifier)]/@String|$node/edm:Annotation[(@Term=$coreDescription or @Term=$coreDescriptionAliased) and not(@Qualifier)]/edm:String" />
    <xsl:value-of select="normalize-space($description)" />
  </xsl:template>

  <xsl:template name="Core.LongDescription">
    <xsl:param name="node" />
    <xsl:variable name="description"
      select="$node/edm:Annotation[(@Term=$coreLongDescription or @Term=$coreLongDescriptionAliased) and not(@Qualifier)]/@String|$node/edm:Annotation[(@Term=$coreLongDescription or @Term=$coreLongDescriptionAliased) and not(@Qualifier)]/edm:String" />
    <xsl:value-of select="normalize-space($description)" />
  </xsl:template>

  <xsl:template name="Core-Annotation">
    <xsl:param name="node" />
    <xsl:param name="term" />
    <xsl:value-of
      select="$node/edm:Annotation[(@Term=concat('Org.OData.Core.V1.',$term) or @Term=concat($coreAlias,'.',$term)) and not(@Qualifier)]/@String|$node/edm:Annotation[(@Term=concat('Org.OData.Core.V1.',$term) or @Term=concat($coreAlias,'.',$term)) and not(@Qualifier)]/edm:String" />
  </xsl:template>

  <xsl:template name="Common.Label">
    <xsl:param name="node" />
    <xsl:variable name="label"
      select="$node/edm:Annotation[(@Term=$commonLabel or @Term=$commonLabelAliased) and not(@Qualifier)]/@String|$node/edm:Annotation[(@Term=$commonLabel or @Term=$commonLabelAliased) and not(@Qualifier)]/edm:String" />
    <xsl:value-of select="normalize-space($label)" />
  </xsl:template>


  <xsl:template match="edmx:Edmx">
    <!--
      <xsl:message><xsl:value-of select="$commonAlias"/></xsl:message>
      <xsl:message><xsl:value-of select="$commonNamespace"/></xsl:message>
    -->

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
    <xsl:text>&#xA;&#xA;</xsl:text>

    <xsl:call-template name="Core.Description">
      <xsl:with-param name="node" select="//edm:Schema" />
    </xsl:call-template>
    <xsl:text>&#xA;&#xA;</xsl:text>

    <!--
      <p>
      <xsl:call-template name="Core.LongDescription">
      <xsl:with-param name="node" select="//edm:Schema" />
      </xsl:call-template>
      </p>
    -->

    <xsl:text>**Namespace: </xsl:text>
    <xsl:value-of select="//edm:Schema/@Namespace" />
    <xsl:text>**&#xA;&#xA;</xsl:text>

    <table border="1" style="border: 1px solid #000000;" width="100%">
      <xsl:text>&#xA;</xsl:text>
      <tbody>
        <tr>
          <th>
            <strong>Term</strong>
          </th>
          <th>
            <strong>Description</strong>
          </th>
        </tr>
        <xsl:text>&#xA;</xsl:text>
        <xsl:apply-templates select="//edm:Term" />
      </tbody>
    </table>
    <xsl:text>&#xA;&#xA;</xsl:text>

    <xsl:text>[XML Source](</xsl:text>
    <xsl:value-of select="//edm:Schema/@Namespace" />
    <xsl:text>.xml)</xsl:text>

  </xsl:template>

  <xsl:template match="edm:Term">
    <tr>
      <td>
        <xsl:value-of select="@Name" />
      </td>
      <xsl:text>&#xA;</xsl:text>
      <td>
        <xsl:call-template name="Core.Description">
          <xsl:with-param name="node" select="." />
        </xsl:call-template>
      </td>
    </tr>
    <xsl:text>&#xA;</xsl:text>
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

</xsl:stylesheet>