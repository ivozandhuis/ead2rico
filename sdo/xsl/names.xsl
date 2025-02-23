<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:sdo="https://schema.org/"
    xmlns:ead="urn:isbn:1-931666-22-9"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:html="http://www.w3.org/1999/xhtml/"
    exclude-result-prefixes="xsl ead">


<!-- templates for names of agents, places, subjects -->

<xsl:template match="ead:controlaccess/ead:corpname | ead:p/ead:corpname | ead:unittitle/ead:corpname">
    <sdo:about>
        <sdo:Organization>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <sdo:name>
                <xsl:value-of select="normalize-space(.)"/>
            </sdo:name>
        </sdo:Organization>
    </sdo:about>
</xsl:template>

<xsl:template match="ead:origination/ead:corpname">
    <sdo:creator>
        <sdo:Organization>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <sdo:name>
                <xsl:value-of select="normalize-space(.)"/>
            </sdo:name>
        </sdo:Organization>
    </sdo:creator>
</xsl:template>


<xsl:template match="ead:controlaccess/ead:famname | ead:p/ead:famname | ead:unittitle/ead:famname">
    <sdo:about>
        <sdo:Organization>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <sdo:name>
                <xsl:value-of select="normalize-space(.)"/>
            </sdo:name>
        </sdo:Organization>
    </sdo:about>
</xsl:template>


<xsl:template match="ead:origination/ead:famname">
    <sdo:creator>
        <sdo:Organization>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <sdo:name>
                <xsl:value-of select="normalize-space(.)"/>
            </sdo:name>
        </sdo:Organization>
    </sdo:creator>
</xsl:template>

<xsl:template match="ead:function">
    <xsl:value-of select="normalize-space(.)"/>
</xsl:template>

<xsl:template match="ead:controlaccess/ead:genreform | ead:p/ead:genreform | ead:unittitle/ead:genreform">
    <sdo:about>
        <sdo:Thing>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <sdo:name>
                <xsl:value-of select="normalize-space(.)"/>
            </sdo:name>
        </sdo:Thing>
    </sdo:about>
</xsl:template>

<xsl:template match="ead:controlaccess/ead:geogname | ead:p/ead:geogname | ead:unittitle/ead:geogname">
    <sdo:about>
        <sdo:Place>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <sdo:name>
                <xsl:value-of select="normalize-space(.)"/>
            </sdo:name>
        </sdo:Place>
    </sdo:about>
</xsl:template>

<xsl:template match="ead:controlaccess/ead:name | ead:p/ead:name | ead:unittitle/ead:name">
    <sdo:about>
        <sdo:Thing>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <sdo:name>
                <xsl:value-of select="normalize-space(.)"/>
            </sdo:name>
        </sdo:Thing>
    </sdo:about>
</xsl:template>

<xsl:template match="ead:occupation">
    <xsl:value-of select="normalize-space(.)"/>
</xsl:template>

<xsl:template match="ead:controlaccess/ead:persname | ead:p/ead:persname | ead:unittitle/ead:persname">
    <sdo:about>
        <sdo:Person>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <sdo:name>
                <xsl:value-of select="normalize-space(.)"/>
            </sdo:name>
        </sdo:Person>
    </sdo:about>
</xsl:template>

<xsl:template match="ead:origination/ead:persname">
    <sdo:creator>
        <sdo:Person>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <sdo:name>
                <xsl:value-of select="normalize-space(.)"/>
            </sdo:name>
        </sdo:Person>
    </sdo:creator>
</xsl:template>

<xsl:template match="ead:subarea">
    <xsl:value-of select="normalize-space(.)"/>
</xsl:template>

<xsl:template match="ead:controlaccess/ead:subject | ead:p/ead:subject">
    <sdo:about>
        <sdo:Thing>
            <xsl:if test="@source and @authfilenumber">
                <xsl:call-template name="set-authorityURI">
                    <xsl:with-param name="source" select="@source"/>
                    <xsl:with-param name="authfilenumber" select="@authfilenumber"/>
                </xsl:call-template>
            </xsl:if>
            <sdo:name>
                <xsl:value-of select="normalize-space(.)"/>
            </sdo:name>
        </sdo:Thing>
    </sdo:about>
</xsl:template>

<xsl:template match="ead:title">
    <xsl:value-of select="normalize-space(.)"/>
</xsl:template>

</xsl:stylesheet>