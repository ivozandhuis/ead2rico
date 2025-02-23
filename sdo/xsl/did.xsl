<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:sdo="https://schema.org/"
    xmlns:rico="https://www.ica.org/standards/RiC/ontology#"
    xmlns:premis="http://www.loc.gov/premis/rdf/v3/"
    xmlns:ead="urn:isbn:1-931666-22-9"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:html="http://www.w3.org/1999/xhtml/"
    exclude-result-prefixes="xsl ead">


<!-- templates for did elements -->
<xsl:template match="ead:did">
    <xsl:param name="type"/>
    <xsl:apply-templates select="ead:unitid">
        <xsl:with-param name="type" select="$type"/>
    </xsl:apply-templates>
    <xsl:apply-templates select="ead:abstract"/>
    <xsl:apply-templates select="ead:container"/>
    <xsl:apply-templates select="ead:dao"/>
    <xsl:apply-templates select="ead:daogrp"/>
    <!--xsl:apply-templates select="ead:head"-->
    <xsl:apply-templates select="ead:langmaterial"/>
    <xsl:apply-templates select="ead:materialspec"/>
    <xsl:apply-templates select="ead:note"/>
    <xsl:apply-templates select="ead:origination"/>
    <xsl:apply-templates select="ead:physdesc"/>
    <xsl:apply-templates select="ead:physloc"/>
    <xsl:apply-templates select="ead:repository"/>
    <xsl:apply-templates select="ead:unitdate"/>
    <xsl:apply-templates select="ead:unittitle"/>
</xsl:template>

<xsl:template match="ead:abstract">
    <sdo:abstract>
        <xsl:value-of select="normalize-space(.)"/>
    </sdo:abstract>
</xsl:template>

<xsl:template match="ead:container"/>
<xsl:template match="ead:dimension"/> <!-- part of physdesc-->
<xsl:template match="ead:extent"/> <!-- part of physdesc-->

<xsl:template match="ead:langmaterial">
    <sdo:inLanguage>
        <sdo:Language>
            <xsl:attribute name="rdf:about">
                <xsl:text>http://id.loc.gov/vocabulary/iso639-2/</xsl:text>
                <xsl:value-of select="ead:language/@langcode"/>
            </xsl:attribute>            
        </sdo:Language>
    </sdo:inLanguage>
</xsl:template>

<xsl:template match="ead:materialspec"/>

<xsl:template match="ead:did/ead:note">
    <sdo:description rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </sdo:description>
</xsl:template>

<xsl:template match="ead:origination[text()]">
    <sdo:creator>
        <xsl:value-of select="normalize-space(.)"/>
    </sdo:creator>
</xsl:template>

<xsl:template match="ead:physdesc">
    <sdo:materialExtent>
        <xsl:value-of select="normalize-space(.)"/>
    </sdo:materialExtent>
</xsl:template>

<xsl:template match="ead:physfacet"/> <!-- part of physdesc-->

<xsl:template match="ead:physloc">
    <sdo:itemLocation>
        <xsl:value-of select="normalize-space(.)"/>
    </sdo:itemLocation>
</xsl:template>

<xsl:template match="ead:repository">
    <sdo:holdingArchive>
        <xsl:apply-templates/>
    </sdo:holdingArchive>
</xsl:template>

<xsl:template match="ead:unitdate">
    <!-- What to do with @normal?-->
    <sdo:temporalCoverage>
        <xsl:value-of select="text()"/>
    </sdo:temporalCoverage>
</xsl:template>

<xsl:template match="ead:unitid[string(.)]">
    <sdo:identifier>
        <xsl:value-of select="."/>
    </sdo:identifier>
</xsl:template>

<xsl:template match="ead:unittitle">
    <sdo:name>
        <xsl:value-of select="normalize-space(.)"/>
    </sdo:name>
</xsl:template>

</xsl:stylesheet>