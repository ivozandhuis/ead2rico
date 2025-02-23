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
    <sdo:associatedMedia>
        <sdo:MediaObject>
            <xsl:apply-templates select="ead:daodesc | ../ead:daodesc"/>
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
        </sdo:MediaObject>
    </sdo:associatedMedia>
</xsl:template>

</xsl:stylesheet>