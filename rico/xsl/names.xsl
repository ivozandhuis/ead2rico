<?xml version="1.0" encoding="UTF-8"?>

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


<!-- templates for names of agents, places, subjects -->

<xsl:template match="ead:controlaccess/ead:corpname | ead:p/ead:corpname | ead:unittitle/ead:corpname">
    <rico:hasOrHadSubject>
        <rico:CorporateBody>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <rico:hasOrHadName>
                <rico:Name>
                    <rico:textualValue>
                        <xsl:value-of select="normalize-space(.)"/>
                    </rico:textualValue>
                </rico:Name>
            </rico:hasOrHadName>
        </rico:CorporateBody>
    </rico:hasOrHadSubject>
</xsl:template>

<xsl:template match="ead:origination/ead:corpname">
    <rico:hasOrganicProvenance>
        <rico:CorporateBody>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <rico:hasOrHadName>
                <rico:Name>
                    <rico:textualValue>
                        <xsl:value-of select="normalize-space(.)"/>
                    </rico:textualValue>
                </rico:Name>
            </rico:hasOrHadName>
        </rico:CorporateBody>
    </rico:hasOrganicProvenance>
</xsl:template>


<xsl:template match="ead:controlaccess/ead:famname | ead:p/ead:famname | ead:unittitle/ead:famname">
    <rico:hasOrHadSubject>
        <rico:Family>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <rico:hasOrHadName>
                <rico:Name>
                    <rico:textualValue>
                        <xsl:value-of select="normalize-space(.)"/>
                    </rico:textualValue>
                </rico:Name>
            </rico:hasOrHadName>
        </rico:Family>
    </rico:hasOrHadSubject>
</xsl:template>


<xsl:template match="ead:origination/ead:famname">
    <rico:hasOrganicProvenance>
        <rico:Family>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <rico:hasOrHadName>
                <rico:Name>
                    <rico:textualValue>
                        <xsl:value-of select="normalize-space(.)"/>
                    </rico:textualValue>
                </rico:Name>
            </rico:hasOrHadName>
        </rico:Family>
    </rico:hasOrganicProvenance>
</xsl:template>

<xsl:template match="ead:function">
    <xsl:value-of select="normalize-space(.)"/>
</xsl:template>

<xsl:template match="ead:controlaccess/ead:genreform | ead:p/ead:genreform | ead:unittitle/ead:genreform">
    <rico:hasOrHadSubject>
        <rico:Thing>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <rico:hasOrHadName>
                <rico:Name>
                    <rico:textualValue>
                        <xsl:value-of select="normalize-space(.)"/>
                    </rico:textualValue>
                </rico:Name>
            </rico:hasOrHadName>
        </rico:Thing>
    </rico:hasOrHadSubject>
</xsl:template>

<xsl:template match="ead:controlaccess/ead:geogname | ead:p/ead:geogname | ead:unittitle/ead:geogname">
    <rico:hasOrHadSubject>
        <rico:Place>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <rico:hasOrHadName>
                <rico:Name>
                    <rico:textualValue>
                        <xsl:value-of select="normalize-space(.)"/>
                    </rico:textualValue>
                </rico:Name>
            </rico:hasOrHadName>
        </rico:Place>
    </rico:hasOrHadSubject>
</xsl:template>

<xsl:template match="ead:controlaccess/ead:name | ead:p/ead:name | ead:unittitle/ead:name">
    <rico:hasOrHadSubject>
        <rico:Thing>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <rico:hasOrHadName>
                <rico:Name>
                    <rico:textualValue>
                        <xsl:value-of select="normalize-space(.)"/>
                    </rico:textualValue>
                </rico:Name>
            </rico:hasOrHadName>
        </rico:Thing>
    </rico:hasOrHadSubject>
</xsl:template>

<xsl:template match="ead:occupation">
    <xsl:value-of select="normalize-space(.)"/>
</xsl:template>

<xsl:template match="ead:controlaccess/ead:persname | ead:p/ead:persname | ead:unittitle/ead:persname">
    <rico:hasOrHadSubject>
        <rico:Person>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <rico:hasOrHadName>
                <rico:Name>
                    <rico:textualValue>
                        <xsl:value-of select="normalize-space(.)"/>
                    </rico:textualValue>
                </rico:Name>
            </rico:hasOrHadName>
        </rico:Person>
    </rico:hasOrHadSubject>
</xsl:template>

<xsl:template match="ead:origination/ead:persname">
    <rico:hasOrganicProvenance>
        <rico:Person>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <rico:hasOrHadName>
                <rico:Name>
                    <rico:textualValue>
                        <xsl:value-of select="normalize-space(.)"/>
                    </rico:textualValue>
                </rico:Name>
            </rico:hasOrHadName>
        </rico:Person>
    </rico:hasOrganicProvenance>
</xsl:template>

<xsl:template match="ead:subarea">
    <xsl:value-of select="normalize-space(.)"/>
</xsl:template>

<xsl:template match="ead:controlaccess/ead:subject | ead:p/ead:subject">
    <rico:hasOrHadSubject>
        <rico:Thing>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <rico:hasOrHadName>
                <rico:Name>
                    <rico:textualValue>
                        <xsl:value-of select="normalize-space(.)"/>
                    </rico:textualValue>
                </rico:Name>
            </rico:hasOrHadName>
        </rico:Thing>
    </rico:hasOrHadSubject>
</xsl:template>

<xsl:template match="ead:title">
    <xsl:value-of select="normalize-space(.)"/>
</xsl:template>

</xsl:stylesheet>