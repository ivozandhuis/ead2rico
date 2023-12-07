<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:oai="http://www.openarchives.org/OAI/2.0/">

  <xsl:import href="ead2rico.xsl"/>

  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="/">
    <xsl:apply-templates select="//oai:metadata"/>
  </xsl:template>

  <xsl:template match="oai:metadata">
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>