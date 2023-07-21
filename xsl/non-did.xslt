<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:rico="https://www.ica.org/standards/RiC/ontology#"
    xmlns:ead="urn:isbn:1-931666-22-9" 
    exclude-result-prefixes="xsl ead">

<!-- templates for non-did elements -->
<xsl:template match="ead:scopecontent">
    <rico:scopeAndContent>
        <xsl:apply-templates/>
    </rico:scopeAndContent>
</xsl:template>

<xsl:template match="ead:accessrestrict">
    <rico:conditionsOfAccess>
        <xsl:apply-templates/>
    </rico:conditionsOfAccess>
</xsl:template>

<xsl:template match="ead:controlaccess">
    <rico:hasOrHadSubject>
        <xsl:apply-templates/>
    </rico:hasOrHadSubject>
</xsl:template>

<xsl:template match="ead:odd">
    <rico:descriptiveNote>
        <xsl:apply-templates/>
    </rico:descriptiveNote>
</xsl:template>

</xsl:stylesheet>