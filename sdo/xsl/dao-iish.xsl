<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:sdo="https://schema.org/"
    xmlns:iisgv="https://iisg.amsterdam/vocab/"
    xmlns:ead="urn:isbn:1-931666-22-9"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:html="http://www.w3.org/1999/xhtml/"
    exclude-result-prefixes="xsl ead">


<xsl:template match="ead:daodesc">
    <sdo:description rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </sdo:description>
</xsl:template>

<xsl:template match="ead:daogrp">
    <xsl:apply-templates select="ead:daoloc"/>
</xsl:template>

<xsl:template match="ead:dao | ead:daoloc">
    <xsl:choose>
        <xsl:when test="@xlink:label = 'catalog'">
            <iisgv:nativeViewer>
                <xsl:attribute name="rdf:resource">
                    <xsl:value-of select="@xlink:href"/>
                </xsl:attribute>
            </iisgv:nativeViewer>
        </xsl:when>
        <xsl:when test="@xlink:label = 'manifest'">
            <sdo:contentUrl>
                <xsl:attribute name="rdf:resource">
                    <xsl:choose>
                        <xsl:when test="@xlink:href">
                            <xsl:value-of select="@xlink:href"/>
                        </xsl:when>
                        <xsl:when test="@href">
                            <xsl:value-of select="@href"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:attribute>
            </sdo:contentUrl>
        </xsl:when>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>