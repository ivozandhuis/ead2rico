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


<!-- We do not need to transform the data about the finding aid into schema.org -->

<xsl:template match="ead:eadheader">
    <!--rico:Record>
        <xsl:attribute name="rdf:about">
            <xsl:value-of select="$baseUri"/>
            <xsl:value-of select="$archId"/>
            <xsl:value-of select="'#findingaid'"/>
        </xsl:attribute>
        <rico:describesOrDescribed>
            <xsl:attribute name="rdf:resource">
                <xsl:value-of select="$baseUri"/>
                <xsl:value-of select="$archId"/>
            </xsl:attribute>    
        </rico:describesOrDescribed>
        <rico:hasOrHadType>
            <xsl:attribute name="rdf:resource">
                <xsl:text>https://www.ica.org/standards/RiC/vocabularies/documentaryFormTypes#FindingAid</xsl:text>
            </xsl:attribute>    
        </rico:hasOrHadType>
        <xsl:apply-templates/>
    </rico:Record-->
</xsl:template>


<xsl:template match="ead:author">
    <!--rico:hasCreator>
        <rico:Agent>
            <rico:hasOrHadName>
                <rico:Name>
                    <rico:textualValue>
                        <xsl:value-of select="normalize-space(.)"/>
                    </rico:textualValue>
                </rico:Name>
            </rico:hasOrHadName>
        </rico:Agent>
    </rico:hasCreator-->
</xsl:template>


<xsl:template match="ead:change"/>
<xsl:template match="ead:creation"/>
<xsl:template match="ead:descrules"/>
<xsl:template match="ead:eadid"/>
<xsl:template match="ead:edition"/>
<xsl:template match="ead:editionstmt"/>

<xsl:template match="ead:filedesc">
    <xsl:apply-templates/>
</xsl:template>

<xsl:template match="ead:langusage">
    <!--rico:hasOrHadLanguage>
        <rico:Language>
            <xsl:attribute name="rdf:about">
                <xsl:text>http://id.loc.gov/vocabulary/iso639-2/</xsl:text>
                <xsl:value-of select="ead:language/@langcode"/>
            </xsl:attribute>            
        </rico:Language>
    </rico:hasOrHadLanguage-->
</xsl:template>

<xsl:template match="ead:notestmt"/>

<xsl:template match="ead:profiledesc">
    <xsl:apply-templates/>
</xsl:template>

<xsl:template match="ead:publicationstmt">
    <xsl:apply-templates/>
</xsl:template>

<xsl:template match="ead:publicationstmt/ead:publisher">
    <!--rico:hasPublisher>
        <rico:Agent>
            <rico:hasOrHadName>
                <rico:Name>
                    <rico:textualValue>
                        <xsl:value-of select="normalize-space(.)"/>
                    </rico:textualValue>
                </rico:Name>
            </rico:hasOrHadName>
        </rico:Agent>
    </rico:hasPublisher-->
</xsl:template>

<xsl:template match="ead:publicationstmt/ead:date">
    <!--rico:hasPublicationDate>
        <xsl:call-template name="build-date">
            <xsl:with-param name="text">
                <xsl:value-of select="text()"/>
            </xsl:with-param>            
            <xsl:with-param name="normal">
                <xsl:value-of select="@normal"/>
            </xsl:with-param>            
        </xsl:call-template>
    </rico:hasPublicationDate-->
</xsl:template>

<xsl:template match="ead:revisiondesc"/>
<xsl:template match="ead:seriesstmt"/>
<xsl:template match="ead:sponsor"/>
<xsl:template match="ead:subtitle"/>

<xsl:template match="ead:titleproper">
    <!--rico:hasOrHadTitle>
        <rico:Title>
            <rico:textualValue>
                <xsl:value-of select="normalize-space(.)"/>
            </rico:textualValue>
        </rico:Title>
    </rico:hasOrHadTitle-->
</xsl:template>

<xsl:template match="ead:titlestmt">
    <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>