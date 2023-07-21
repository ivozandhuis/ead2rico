<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:rico="https://www.ica.org/standards/RiC/ontology#"
    xmlns:ead="urn:isbn:1-931666-22-9" 
    exclude-result-prefixes="xsl ead">

<!-- templates for archdesc-components, looping hierarchy -->

<!-- TODO: ead:archdescgrp and ead:dscgrp-->

<xsl:template match="ead:archdesc">
    <rico:RecordSet>
        <xsl:attribute name="rdf:about">
            <xsl:value-of select="$baseUri"/>
            <xsl:value-of select="ead:did/ead:unitid"/>
        </xsl:attribute>
        <xsl:apply-templates select="ead:did"/>
        <xsl:apply-templates select="ead:scopecontent | ead:accessrestrict | ead:controlaccess | ead:odd"/>
        <xsl:call-template name="set-recordsettype">
            <xsl:with-param name="type" select="@level"/>
        </xsl:call-template>
    </rico:RecordSet>
    <xsl:apply-templates select="ead:dsc">
        <xsl:with-param name="archnr" select="ead:did/ead:unitid"/>
    </xsl:apply-templates>
</xsl:template>

<xsl:template match="ead:dsc">
    <xsl:param name="archnr"/>
    <xsl:apply-templates select="ead:c | ead:c01">
        <xsl:with-param name="archnr" select="$archnr"/>
        <xsl:with-param name="level" select="'first'"/>
    </xsl:apply-templates>
</xsl:template>

<xsl:template match="ead:c | ead:c01 | ead:c02 | ead:c03 | ead:c04 | ead:c05 | ead:c06 | ead:c07 | ead:c08 | ead:c09 | ead:c10 | ead:c11 | ead:c12">
    <xsl:param name="archnr"/>
    <xsl:param name="level"/>
    <xsl:variable name="id">
        <xsl:choose>
            <xsl:when test="$level = 'first'">
                <xsl:value-of select="concat(concat($archnr, '#'), position())"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat(concat($archnr, '-'), position())"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <rico:RecordSet>
        <xsl:attribute name="rdf:about">
            <xsl:value-of select="$baseUri"/>
            <xsl:value-of select="$id"/>
        </xsl:attribute>
        <rico:isOrWasIncludedIn>
            <xsl:attribute name="rdf:resource">
                <xsl:value-of select="$baseUri"/>
                <xsl:value-of select="$archnr"/>
            </xsl:attribute>
        </rico:isOrWasIncludedIn>
        <xsl:call-template name="set-recordsettype">
            <xsl:with-param name="type" select="@level"/>
        </xsl:call-template>
        <xsl:apply-templates select="ead:did">
            <xsl:with-param name="type" select="@level"/>
        </xsl:apply-templates>
        <xsl:apply-templates select="ead:scopecontent | ead:accessrestrict | ead:controlaccess | ead:odd"/>
    </rico:RecordSet>
    <xsl:apply-templates select="ead:c | ead:c01 | ead:c02 | ead:c03 | ead:c04 | ead:c05 | ead:c06 | ead:c07 | ead:c08 | ead:c09 | ead:c10 | ead:c11 | ead:c12">
        <xsl:with-param name="archnr" select="$id"/>
    </xsl:apply-templates>
</xsl:template>

</xsl:stylesheet>