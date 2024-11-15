<?xml version="1.0" encoding="UTF-8"?>

<!-- Endocoded Archival Description 2002 (EAD) into Records in Contexts Ontology (RiC-O) -->
<!-- Ivo Zandhuis (ivo@zandhuis.nl) -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:rico="https://www.ica.org/standards/RiC/ontology#"
    xmlns:premis="http://www.loc.gov/premis/rdf/v3/"
    xmlns:ead="urn:isbn:1-931666-22-9"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:html="http://www.w3.org/1999/xhtml/"
    exclude-result-prefixes="xsl ead">

<xsl:import href="eadheader.xsl"/>
<xsl:import href="frontmatter.xsl"/>
<xsl:import href="archdesc.xsl"/>
<!--xsl:import href="archdesc_withproxy.xsl"/-->
<xsl:import href="did.xsl"/>
<xsl:import href="non-did.xsl"/>
<xsl:import href="dao.xsl"/>
<xsl:import href="names.xsl"/>
<xsl:import href="textstruct.xsl"/>
<xsl:import href="named-templates.xsl"/>

<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:param name="baseUri">
    <xsl:choose>
        <xsl:when test="//ead:eadheader/ead:eadid[@mainagencycode = 'NL-GdSAMH']">
            <xsl:text>https://samh.nl/bronnen/archives/details/</xsl:text>
        </xsl:when>
        <xsl:when test="//ead:archdesc/ead:did/ead:unitid[@repositorycode = 'NL-HlmNHA']">
            <xsl:text/>
        </xsl:when>
        <xsl:when test="//ead:archdesc/ead:did/ead:unitid[@repositorycode = 'NL-AmISG']">
            <xsl:text>https://hdl.handle.net/10622/</xsl:text>
        </xsl:when>
        <xsl:when test="//ead:archdesc/ead:did/ead:unitid[@repositorycode = 'NL-AsdNIOD']">
            <xsl:text>https://www.archieven.nl/mi/298/?mivast=298&amp;micode=</xsl:text>
        </xsl:when>
        <xsl:when test="//ead:archdesc/ead:did/ead:unitid[@repositorycode = 'FR_ANF']">
            <xsl:text>http://data.archives-nationales.culture.gouv.fr/</xsl:text>
        </xsl:when>
        <xsl:when test="//ead:archdesc/ead:did/ead:unitid[@repositorycode = 'NL-HaNA']">
            <xsl:text>https://www.nationaalarchief.nl/onderzoeken/archief/</xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:text>http://example.com/</xsl:text>
        </xsl:otherwise>
    </xsl:choose>
</xsl:param>

<xsl:param name="archId">
    <xsl:choose>
        <xsl:when test="//ead:eadheader/ead:eadid[@mainagencycode = 'NL-GdSAMH']">
            <xsl:value-of select="//ead:archdesc/ead:did/ead:unitid"/>
        </xsl:when>
        <xsl:when test="//ead:archdesc/ead:did/ead:unitid[@repositorycode = 'NL-HlmNHA']">
            <xsl:value-of select="//ead:archdesc/ead:did/ead:unitid[@type = 'handle']"/>
        </xsl:when>
        <xsl:when test="//ead:archdesc/ead:did/ead:unitid[@repositorycode = 'NL-AmISG']">
            <xsl:value-of select="//ead:archdesc/ead:did/ead:unitid"/>
        </xsl:when>
        <xsl:when test="//ead:archdesc/ead:did/ead:unitid[@repositorycode = 'NL-AsdNIOD']">
            <xsl:value-of select="//ead:archdesc/ead:did/ead:unitid"/>
        </xsl:when>
        <xsl:when test="//ead:archdesc/ead:did/ead:unitid[@repositorycode = 'FR_ANF']">
            <xsl:value-of select="//ead:archdesc/ead:did/ead:unitid"/>
        </xsl:when>
        <xsl:when test="//ead:archdesc/ead:did/ead:unitid[@repositorycode = 'NL-HaNA']">
            <xsl:value-of select="//ead:archdesc/ead:did/ead:unitid"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="'fondsnummer'"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:param>


<!-- RDF wrap -->
<xsl:template match="ead:ead">
    <rdf:RDF>
        <xsl:apply-templates select="ead:eadheader"/>
        <xsl:apply-templates select="ead:frontmatter"/>
        <xsl:apply-templates select="ead:archdesc"/>
    </rdf:RDF>
</xsl:template>

<xsl:template match="ead:eadgrp">
    <rdf:RDF>
        <xsl:apply-templates select="ead:eadheader"/>
        <xsl:apply-templates select="ead:frontmatter"/>
        <xsl:apply-templates select="ead:archdescgrp"/>
    </rdf:RDF>
</xsl:template>

</xsl:stylesheet>
