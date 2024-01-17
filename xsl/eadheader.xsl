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


<xsl:template match="ead:eadheader">
    <rico:Record>
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
        <rico:hasDocumentaryFormType>
            <xsl:attribute name="rdf:resource">
                <xsl:text>https://www.ica.org/standards/RiC/vocabularies/documentaryFormTypes#FindingAid</xsl:text>
            </xsl:attribute>    
        </rico:hasDocumentaryFormType>
        <xsl:apply-templates/>
    </rico:Record>
</xsl:template>


<xsl:template match="ead:author">
    <rico:hasAuthor>
        <rico:Agent>
            <rico:hasOrHadAgentName>
                <rico:AgentName>
                    <rico:textualValue>
                        <xsl:value-of select="normalize-space(.)"/>
                    </rico:textualValue>
                </rico:AgentName>
            </rico:hasOrHadAgentName>
        </rico:Agent>
    </rico:hasAuthor>
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

<xsl:template match="ead:langusage"/>
<xsl:template match="ead:notestmt"/>
<xsl:template match="ead:profiledesc"/>

<xsl:template match="ead:publicationstmt">
    <xsl:apply-templates/>
</xsl:template>

<xsl:template match="ead:publicationstmt/ead:publisher">
    <rico:hasPublisher>
        <rico:Agent>
            <rico:hasOrHadAgentName>
                <rico:AgentName>
                    <rico:textualValue>
                        <xsl:value-of select="normalize-space(.)"/>
                    </rico:textualValue>
                </rico:AgentName>
            </rico:hasOrHadAgentName>
        </rico:Agent>
    </rico:hasPublisher>
</xsl:template>

<xsl:template match="ead:publicationstmt/ead:date">
    <rico:hasPublicationDate>
        <rico:Date>
            <xsl:if test="text()">
                <rico:expressedDate>
                    <xsl:value-of select="normalize-space(.)"/>
                </rico:expressedDate>
            </xsl:if>
            <xsl:if test="@normal">
                <rico:normalizedDateValue>
                    <xsl:value-of select="@normal"/>
                </rico:normalizedDateValue>
            </xsl:if>
            <xsl:if test="@type">
                <xsl:call-template name="set-datetype">
                    <xsl:with-param name="type">
                        <xsl:value-of select="@type"/>
                    </xsl:with-param>            
                </xsl:call-template>
            </xsl:if>
        </rico:Date>
    </rico:hasPublicationDate>
</xsl:template>

<xsl:template match="ead:revisiondesc"/>
<xsl:template match="ead:seriesstmt"/>
<xsl:template match="ead:sponsor"/>
<xsl:template match="ead:subtitle"/>

<xsl:template match="ead:titleproper">
    <rico:hasOrHadTitle>
        <rico:Title>
            <rico:textualValue>
                <xsl:value-of select="normalize-space(.)"/>
            </rico:textualValue>
        </rico:Title>
    </rico:hasOrHadTitle>
</xsl:template>

<xsl:template match="ead:titlestmt">
    <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>