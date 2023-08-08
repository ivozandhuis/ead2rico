<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:rico="https://www.ica.org/standards/RiC/ontology#"
    xmlns:ead="urn:isbn:1-931666-22-9" 
    exclude-result-prefixes="xsl ead">

<!-- templates for names of agents, places, subjects -->

<xsl:template match="(ead:controlaccess | ead:p)/ead:corpname">
    <rico:hasOrHasSubject>
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
    </rico:hasOrHasSubject>
</xsl:template>

<xsl:template match="(ead:controlaccess | ead:p)/ead:famname">
    <rico:hasOrHasSubject>
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
    </rico:hasOrHasSubject>
</xsl:template>

<xsl:template match="ead:function">
    <xsl:value-of select="normalize-space(.)"/>
</xsl:template>

<xsl:template match="(ead:controlaccess | ead:p)/ead:genreform">
    <rico:hasOrHasSubject>
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
    </rico:hasOrHasSubject>
</xsl:template>

<xsl:template match="(ead:controlaccess | ead:p)/ead:geogname">
    <rico:hasOrHasSubject>
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
    </rico:hasOrHasSubject>
</xsl:template>

<xsl:template match="(ead:controlaccess | ead:p)/ead:name">
    <rico:hasOrHasSubject>
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
    </rico:hasOrHasSubject>
</xsl:template>

<xsl:template match="ead:occupation">
    <xsl:value-of select="normalize-space(.)"/>
</xsl:template>

<xsl:template match="(ead:controlaccess | ead:p)/ead:persname">
    <rico:hasOrHasSubject>
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
    </rico:hasOrHasSubject>
</xsl:template>


<xsl:template match="ead:subarea">
    <xsl:value-of select="normalize-space(.)"/>
</xsl:template>

<xsl:template match="(ead:controlaccess | ead:p)/ead:subject">
    <rico:hasOrHasSubject>
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
    </rico:hasOrHasSubject>
</xsl:template>

<xsl:template match="ead:title">
    <xsl:value-of select="normalize-space(.)"/>
</xsl:template>

</xsl:stylesheet>