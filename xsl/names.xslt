<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:rico="https://www.ica.org/standards/RiC/ontology#"
    xmlns:ead="urn:isbn:1-931666-22-9" 
    exclude-result-prefixes="xsl ead">

<!-- templates for names of agents, places, subjects -->

<xsl:template match="ead:corpname">
    <rico:CorporateBody>
        <xsl:if test="starts-with(@authfilenumber, 'http')">
            <xsl:attribute name="rdf:about">
                <xsl:value-of select="@authfilenumber"/>
            </xsl:attribute>
        </xsl:if>
        <rico:hasOrHadAgentName>
            <rico:AgentName>
                <rico:textualValue>
                    <xsl:value-of select="normalize-space(.)"/>
                </rico:textualValue>
            </rico:AgentName>
        </rico:hasOrHadAgentName>
    </rico:CorporateBody>
</xsl:template>

<xsl:template match="ead:famname">
    <rico:Family>
        <xsl:if test="starts-with(@authfilenumber, 'http')">
            <xsl:attribute name="rdf:about">
                <xsl:value-of select="@authfilenumber"/>
            </xsl:attribute>
        </xsl:if>
        <rico:hasOrHadAgentName>
            <rico:AgentName>
                <rico:textualValue>
                    <xsl:value-of select="normalize-space(.)"/>
                </rico:textualValue>
            </rico:AgentName>
        </rico:hasOrHadAgentName>
    </rico:Family>
</xsl:template>

<xsl:template match="ead:function">
    <xsl:value-of select="normalize-space(.)"/>
</xsl:template>

<xsl:template match="ead:genreform">
    <rico:Thing>
        <xsl:if test="starts-with(@authfilenumber, 'http')">
            <xsl:attribute name="rdf:about">
                <xsl:value-of select="@authfilenumber"/>
            </xsl:attribute>
        </xsl:if>
        <rico:hasOrHadName>
            <rico:Name>
                <rico:textualValue>
                    <xsl:value-of select="normalize-space(.)"/>
                </rico:textualValue>
            </rico:Name>
        </rico:hasOrHadName>
    </rico:Thing>
</xsl:template>

<xsl:template match="ead:geogname">
    <rico:Place>
        <xsl:if test="starts-with(@authfilenumber, 'http')">
            <xsl:attribute name="rdf:about">
                <xsl:value-of select="@authfilenumber"/>
            </xsl:attribute>
        </xsl:if>
        <rico:hasOrHadPlaceName>
            <rico:PlaceName>
                <rico:textualValue>
                    <xsl:value-of select="normalize-space(.)"/>
                </rico:textualValue>
            </rico:PlaceName>
        </rico:hasOrHadPlaceName>
    </rico:Place>
</xsl:template>

<xsl:template match="ead:name">
    <rico:Thing>
        <xsl:if test="starts-with(@authfilenumber, 'http')">
            <xsl:attribute name="rdf:about">
                <xsl:value-of select="@authfilenumber"/>
            </xsl:attribute>
        </xsl:if>
        <rico:hasOrHadName>
            <rico:Name>
                <rico:textualValue>
                    <xsl:value-of select="normalize-space(.)"/>
                </rico:textualValue>
            </rico:Name>
        </rico:hasOrHadName>
    </rico:Thing>
</xsl:template>

<xsl:template match="ead:occupation">
    <xsl:value-of select="normalize-space(.)"/>
</xsl:template>

<xsl:template match="ead:persname">
    <rico:Person>
        <xsl:if test="starts-with(@authfilenumber, 'http')">
            <xsl:attribute name="rdf:about">
                <xsl:value-of select="@authfilenumber"/>
            </xsl:attribute>
        </xsl:if>
        <rico:hasOrHadAgentName>
            <rico:AgentName>
                <rico:textualValue>
                    <xsl:value-of select="normalize-space(.)"/>
                </rico:textualValue>
            </rico:AgentName>
        </rico:hasOrHadAgentName>
    </rico:Person>
</xsl:template>

<xsl:template match="ead:subarea">
    <xsl:value-of select="normalize-space(.)"/>
</xsl:template>

<xsl:template match="ead:subject">
    <rico:Thing>
        <xsl:if test="starts-with(@authfilenumber, 'http')">
            <xsl:attribute name="rdf:about">
                <xsl:value-of select="@authfilenumber"/>
            </xsl:attribute>
        </xsl:if>
        <rico:hasOrHadName>
            <rico:Name>
                <rico:textualValue>
                    <xsl:value-of select="normalize-space(.)"/>
                </rico:textualValue>
            </rico:Name>
        </rico:hasOrHadName>
    </rico:Thing>
</xsl:template>

<xsl:template match="ead:title">
    <xsl:value-of select="normalize-space(.)"/>
</xsl:template>

</xsl:stylesheet>