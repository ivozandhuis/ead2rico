<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:rico="https://www.ica.org/standards/RiC/ontology#"
    xmlns:ead="urn:isbn:1-931666-22-9" 
    exclude-result-prefixes="xsl ead">

<!-- templates for did elements -->
<xsl:template match="ead:did">
    <xsl:param name="type"/>
    <xsl:apply-templates select="ead:unitid">
        <xsl:with-param name="type" select="$type"/>
    </xsl:apply-templates>
    <xsl:apply-templates select="ead:unittitle"/>
    <xsl:apply-templates select="ead:unitdate"/>
    <xsl:apply-templates select="ead:physdesc"/>
    <xsl:apply-templates select="ead:origination"/>
    <xsl:apply-templates select="ead:langmaterial"/>
    <xsl:apply-templates select="ead:repository"/>
</xsl:template>

<xsl:template match="ead:unitid">
    <xsl:param name="type"/>
    <rico:hasOrHadIdentifier>
        <rico:Identifier>
            <rico:textualValue>
                <xsl:value-of select="."/>
            </rico:textualValue>
            <xsl:call-template name="set-identifiertype">
                <xsl:with-param name="type" select="$type"/>
            </xsl:call-template>
        </rico:Identifier>
    </rico:hasOrHadIdentifier>
</xsl:template>

<xsl:template match="ead:unittitle">
    <rico:hasOrHadTitle>
        <rico:Title>
            <rico:textualValue>
                <xsl:value-of select="normalize-space(.)"/>
            </rico:textualValue>
        </rico:Title>
    </rico:hasOrHadTitle>
</xsl:template>

<xsl:template match="ead:unitdate">
    <rico:isAssociatedWithDate>
        <rico:DateRange>
            <rico:expressedDate>
                <xsl:value-of select="normalize-space(.)"/>
            </rico:expressedDate>
        </rico:DateRange>
    </rico:isAssociatedWithDate>
</xsl:template>

<xsl:template match="ead:physdesc">
    <rico:recordResourceExtent>
        <xsl:value-of select="normalize-space(.)"/>
    </rico:recordResourceExtent>
</xsl:template>

<xsl:template match="ead:origination">
    <rico:hasAccumulator>
        <xsl:apply-templates/>
    </rico:hasAccumulator>
</xsl:template>

<xsl:template match="ead:repository">
    <rico:hasOrHadHolder>
        <xsl:apply-templates/>
    </rico:hasOrHadHolder>
</xsl:template>

<xsl:template match="ead:langmaterial">
    <rico:hasOrHadSomeMembersWithLanguage>
        <rico:Language>
            <xsl:attribute name="rdf:about">
                <xsl:text>http://id.loc.gov/vocabulary/iso639-2/</xsl:text>
                <xsl:value-of select="ead:language/@langcode"/>
            </xsl:attribute>            
        </rico:Language>
    </rico:hasOrHadSomeMembersWithLanguage>
</xsl:template>

</xsl:stylesheet>