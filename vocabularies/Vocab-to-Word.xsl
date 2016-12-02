<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:edmx="http://docs.oasis-open.org/odata/ns/edmx"
  xmlns:edm="http://docs.oasis-open.org/odata/ns/edm" xmlns:w="http://schemas.microsoft.com/office/word/2003/wordml"
>
  <!--
    This style sheet transforms OData 4.0 XML vocabulary documents into Word documents
  -->
  <xsl:output method="xml" indent="yes" />
  <xsl:strip-space elements="*" />

  <xsl:template match="edmx:Edmx">
    <xsl:processing-instruction name="mso-application">
      <xsl:text>progid="Word.Document"</xsl:text>
    </xsl:processing-instruction>
    <w:wordDocument w:macrosPresent="no" w:embeddedObjPresent="no" w:ocxPresent="no" xml:space="preserve">
      <w:body>
        <xsl:apply-templates select="edmx:DataServices/edm:Schema" />
      </w:body>
    </w:wordDocument>
  </xsl:template>

  <xsl:template match="edm:Schema">
    <w:p>
      <w:r>
        <w:rPr>
          <w:rFonts w:ascii="Arial" w:h-ansi="Arial" />
          <w:sz w:val="20" />
        </w:rPr>
        <w:t>
          <xsl:text>Vocabulary Namespace: </xsl:text>
        </w:t>
      </w:r>
      <w:hlink>
        <xsl:attribute name="w:dest">
          <xsl:text>https://github.com/oasis-tcs/odata-vocabularies/blob/master/vocabularies/</xsl:text>
          <xsl:value-of select="@Namespace" />
          <xsl:text>.md</xsl:text>
        </xsl:attribute>
        <w:r>
          <w:rPr>
            <w:rFonts w:ascii="Courier New" w:h-ansi="Courier New" />
            <w:rStyle w:val="Hyperlink" />
            <w:color w:val="0000FF" />
            <w:b />
          </w:rPr>
          <w:t>
            <xsl:value-of select="@Namespace" />
          </w:t>
        </w:r>
      </w:hlink>
    </w:p>
    <!--
      <xsl:apply-templates select="edm:Annotation" />
    -->
    <w:tbl>
      <w:tblPr>
        <w:tblW w:w="5000" w:type="pct" />
        <w:tblLayout w:type="fixed" />
        <w:tblBorders>
          <w:top w:val="single" />
          <w:bottom w:val="single" />
          <w:left w:val="single" />
          <w:right w:val="single" />
          <w:insideH w:val="single" />
          <w:insideV w:val="single" />
        </w:tblBorders>
      </w:tblPr>
      <w:tr>
        <w:trPr>
          <w:tblHeader w:val="on" />
        </w:trPr>
        <w:tc>
          <w:p>
            <w:pPr>
              <w:spacing w:before="60" w:after="60" />
              <w:ind w:left="40" w:right="40" />
            </w:pPr>
            <w:r>
              <w:rPr>
                <w:rFonts w:ascii="Arial" w:h-ansi="Arial" />
                <w:sz w:val="20" />
                <w:b />
              </w:rPr>
              <w:t>Term Name</w:t>
            </w:r>
          </w:p>
        </w:tc>
        <w:tc>
          <w:p>
            <w:pPr>
              <w:spacing w:before="60" w:after="60" />
              <w:ind w:left="40" w:right="40" />
            </w:pPr>
            <w:r>
              <w:rPr>
                <w:rFonts w:ascii="Arial" w:h-ansi="Arial" />
                <w:sz w:val="20" />
                <w:b />
              </w:rPr>
              <w:t>Term Description</w:t>
            </w:r>
          </w:p>
        </w:tc>
      </w:tr>
      <xsl:apply-templates select="edm:Term">
        <xsl:sort select="@Name" order="ascending" />
      </xsl:apply-templates>
    </w:tbl>
  </xsl:template>

  <xsl:template match="edm:Term">
    <w:tr>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="1900" w:type="pct" />
        </w:tcPr>
        <w:p>
          <w:pPr>
            <w:spacing w:before="40" w:after="40" />
            <w:ind w:left="40" w:right="40" />
          </w:pPr>
          <w:hlink>
            <xsl:attribute name="w:dest">
              <xsl:value-of
              select="concat('https://github.com/oasis-tcs/odata-vocabularies/blob/master/vocabularies/',../@Namespace,'.md#',@Name)" />
            </xsl:attribute>
            <w:r>
              <w:rPr>
                <w:rFonts w:ascii="Courier New" w:h-ansi="Courier New" />
                <w:rStyle w:val="Hyperlink" />
                <w:color w:val="0000FF" />
              </w:rPr>
              <w:t>
                <xsl:value-of select="@Name" />
              </w:t>
            </w:r>
          </w:hlink>
        </w:p>
      </w:tc>
      <xsl:if test="edm:Annotation[@Term='Core.Description' or @Term='Core.LongDescription']">
        <w:tc>
          <xsl:apply-templates select="edm:Annotation[@Term='Core.Description' or @Term='Core.LongDescription']" />
        </w:tc>
      </xsl:if>
    </w:tr>
  </xsl:template>

  <xsl:template match="edm:Annotation">
    <w:p>
      <w:pPr>
        <w:spacing w:before="40" w:after="40" />
        <w:ind w:left="40" w:right="40" />
      </w:pPr>
      <w:r>
        <w:rPr>
          <w:rFonts w:ascii="Arial" w:h-ansi="Arial" />
          <w:sz w:val="20" />
        </w:rPr>
        <w:t>
          <xsl:value-of select="@String|edm:String" />
        </w:t>
      </w:r>
    </w:p>
  </xsl:template>

</xsl:stylesheet>