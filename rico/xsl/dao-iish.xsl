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


<xsl:template match="ead:daodesc">
    <rico:generalDescription rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:generalDescription>
</xsl:template>

<xsl:template match="ead:daogrp">
    <xsl:apply-templates select="ead:daoloc"/>
</xsl:template>

<xsl:template match="ead:dao | ead:daoloc">
    <xsl:choose>
        <xsl:when test="@xlink:label = 'catalog'">
            <rico:isOrWasDescribedBy>
                <rico:Record>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="@xlink:href"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="ead:daodesc | ../ead:daodesc"/>
                    <rico:hasOrHadType>
                        <rico:Type rdf:about="http://vocab.getty.edu/aat/300264578"/>
                    </rico:hasOrHadType>                  
                </rico:Record>
            </rico:isOrWasDescribedBy>
        </xsl:when>
        <xsl:when test="@xlink:label = 'manifest'">
            <rico:hasOrHadInstantiation>
                <rico:Instantiation>
                    <rico:isOrWasDescribedBy>
                        <rico:Record>
                            <xsl:attribute name="rdf:about">
                                <xsl:value-of select="@xlink:href"/>
                            </xsl:attribute>
                            <rico:hasOrHadType rdf:resource="https://www.ica.org/standards/RiC/vocabularies/documentaryFormTypes#iiif-manifest"/>
                            <xsl:apply-templates select="ead:daodesc | ../ead:daodesc"/>
                        </rico:Record>
                    </rico:isOrWasDescribedBy>      
                </rico:Instantiation>
            </rico:hasOrHadInstantiation>
        </xsl:when>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>