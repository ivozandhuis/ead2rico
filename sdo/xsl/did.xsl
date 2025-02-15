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
    <rico:scopeAndContent>
        <xsl:value-of select="normalize-space(.)"/>
    </rico:scopeAndContent>
</xsl:template>

<xsl:template match="ead:container"/>
<xsl:template match="ead:dimension"/> <!-- part of physdesc-->
<xsl:template match="ead:extent"/> <!-- part of physdesc-->

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

<xsl:template match="ead:materialspec"/>

<xsl:template match="ead:did/ead:note">
    <rico:generalDescription rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:generalDescription>
</xsl:template>

<xsl:template match="ead:origination[text()]">
    <rico:hasOrganicProvenance>
        <xsl:value-of select="normalize-space(.)"/>
    </rico:hasOrganicProvenance>
</xsl:template>

<xsl:template match="ead:physdesc">
    <rico:hasExtent>
        <rico:Extent>
            <rico:textualValue>
                <xsl:value-of select="normalize-space(.)"/>
            </rico:textualValue>
        </rico:Extent>    
    </rico:hasExtent>
</xsl:template>

<xsl:template match="ead:physfacet"/> <!-- part of physdesc-->

<xsl:template match="ead:physloc">
    <rico:hasOrHadLocation>
        <rico:Place>
            <rico:hasOrHadName>
                <rico:Name>
                    <rico:textualValue>
                        <xsl:value-of select="normalize-space(.)"/>
                    </rico:textualValue>   
                </rico:Name>
            </rico:hasOrHadName>
        </rico:Place>
    </rico:hasOrHadLocation>
</xsl:template>

<xsl:template match="ead:repository">
    <rico:hasOrHadHolder>
        <xsl:apply-templates/>
    </rico:hasOrHadHolder>
</xsl:template>

<xsl:template match="ead:unitdate">
    <xsl:choose>
        <xsl:when test="@type = 'bulk'">
            <rico:hasOrHadMostMembersWithAccumulationDate>
                <xsl:call-template name="build-date">
                    <xsl:with-param name="text">
                        <xsl:value-of select="text()"/>
                    </xsl:with-param>            
                    <xsl:with-param name="normal">
                        <xsl:value-of select="@normal"/>
                    </xsl:with-param>            
                </xsl:call-template>
            </rico:hasOrHadMostMembersWithAccumulationDate>
        </xsl:when>
        <xsl:when test="@type = 'inclusive'">
            <rico:hasOrHadAllMembersWithAccumulationDate>
                <xsl:call-template name="build-date">
                    <xsl:with-param name="text">
                        <xsl:value-of select="text()"/>
                    </xsl:with-param>            
                    <xsl:with-param name="normal">
                        <xsl:value-of select="@normal"/>
                    </xsl:with-param>            
                </xsl:call-template>
            </rico:hasOrHadAllMembersWithAccumulationDate>
        </xsl:when>
        <xsl:otherwise>
            <rico:hasAccumulationDate>
                <xsl:call-template name="build-date">
                    <xsl:with-param name="text">
                        <xsl:value-of select="text()"/>
                    </xsl:with-param>            
                    <xsl:with-param name="normal">
                        <xsl:value-of select="@normal"/>
                    </xsl:with-param>            
                </xsl:call-template>
            </rico:hasAccumulationDate>       
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="ead:unitid[string(.)]">
    <xsl:param name="type"/> <!-- type of the description (=did/@level)-->
    <rico:hasOrHadIdentifier>
        <rico:Identifier>
            <rico:textualValue>
                <xsl:value-of select="."/>
            </rico:textualValue>
            <xsl:call-template name="set-identifiertype">
                <xsl:with-param name="type">
                    <xsl:choose>
                        <xsl:when test="@type">
                            <xsl:value-of select="@type"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$type"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:with-param>            
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

</xsl:stylesheet>