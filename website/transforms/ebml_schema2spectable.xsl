<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
   xmlns:ebml="https://ietf.org/cellar/ebml" exclude-result-prefixes="ebml">
  <xsl:output encoding="UTF-8" method="xml" version="1.0" indent="yes"/>
  <xsl:template match="ebml:EBMLSchema">
    <xsl:call-template name="GenerateTable">
      <xsl:with-param name="GitRevision" select="$GitRevision" />
    </xsl:call-template>
  </xsl:template>

  <xsl:include href="../../specification/transforms/ebml_schema2spec_common.xsl"/>

</xsl:stylesheet>
