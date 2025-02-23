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


<!-- named templates -->
<xsl:template name="set-recordsettype">
    <xsl:param name="type"/>
    <xsl:choose>
        <xsl:when test="$type = 'fonds'">
            <sdo:additionalType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://www.ica.org/standards/RiC/vocabularies/recordSetTypes#Fonds</xsl:text>
                </xsl:attribute>
            </sdo:additionalType>
        </xsl:when>
        <xsl:when test="$type = 'collection'">
            <sdo:additionalType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://www.ica.org/standards/RiC/vocabularies/recordSetTypes#Collection</xsl:text>
                </xsl:attribute>
            </sdo:additionalType>
        </xsl:when>
        <xsl:when test="$type = 'series'">
            <sdo:additionalType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://www.ica.org/standards/RiC/vocabularies/recordSetTypes#Series</xsl:text>
                </xsl:attribute>
            </sdo:additionalType>
        </xsl:when>
        <xsl:when test="$type = 'subseries'">
            <sdo:additionalType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://www.ica.org/standards/RiC/vocabularies/recordSetTypes#Subseries</xsl:text>
                </xsl:attribute>
            </sdo:additionalType>
        </xsl:when>
        <xsl:when test="$type = 'file'">
            <sdo:additionalType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://www.ica.org/standards/RiC/vocabularies/recordSetTypes#File</xsl:text>
                </xsl:attribute>
            </sdo:additionalType>
        </xsl:when>
    </xsl:choose>
</xsl:template>

<!--xsl:template name="set-identifiertype">
    <xsl:param name="type"/>
    <xsl:choose>
        <xsl:when test="$type = 'fonds'">
            <rico:hasOrHadType>
                <rico:Type>
                    <rico:hasOrHadName>
                        <rico:Name>
                            <rico:textualValue>Archiefnummer</rico:textualValue>
                        </rico:Name>
                    </rico:hasOrHadName>
                </rico:Type>
            </rico:hasOrHadType>
        </xsl:when>
        <xsl:when test="$type = 'collection'">
            <rico:hasOrHadType>
                <rico:Type>
                    <rico:hasOrHadName>
                        <rico:Name>
                            <rico:textualValue>Collectienummer</rico:textualValue>
                        </rico:Name>
                    </rico:hasOrHadName>
                </rico:Type>
            </rico:hasOrHadType>
        </xsl:when>
        <xsl:when test="$type = 'series'">
            <rico:hasOrHadType>
                <rico:Type>
                    <rico:hasOrHadName>
                        <rico:Name>
                            <rico:textualValue>Serienummer</rico:textualValue>
                        </rico:Name>
                    </rico:hasOrHadName>
                </rico:Type>
            </rico:hasOrHadType>
        </xsl:when>
        <xsl:when test="$type = 'series_code'">
            <rico:hasOrHadType>
                <rico:Type>
                    <rico:hasOrHadName>
                        <rico:Name>
                            <rico:textualValue>Serienummer</rico:textualValue>
                        </rico:Name>
                    </rico:hasOrHadName>
                </rico:Type>
            </rico:hasOrHadType>
        </xsl:when>
        <xsl:when test="$type = 'subseries'">
            <rico:hasOrHadType>
                <rico:Type>
                    <rico:hasOrHadName>
                        <rico:Name>
                            <rico:textualValue>Serienummer</rico:textualValue>
                        </rico:Name>
                    </rico:hasOrHadName>
                </rico:Type>
            </rico:hasOrHadType>
        </xsl:when>
        <xsl:when test="$type = 'otherlevel'">
            <rico:hasOrHadType>
                <rico:Type>
                    <rico:hasOrHadName>
                        <rico:Name>
                            <rico:textualValue>Inventarisnummers (van een verzamelbeschrijving)</rico:textualValue>
                        </rico:Name>
                    </rico:hasOrHadName>
                </rico:Type>
            </rico:hasOrHadType>
        </xsl:when>
        <xsl:when test="$type = 'file'">
            <rico:hasOrHadType>
                <rico:Type>
                    <rico:hasOrHadName>
                        <rico:Name>
                            <rico:textualValue>Inventarisnummer</rico:textualValue>
                        </rico:Name>
                    </rico:hasOrHadName>
                </rico:Type>
            </rico:hasOrHadType>
        </xsl:when>
        <xsl:when test="$type = 'handle'">
            <rico:hasOrHadType>
                <rico:Type rdf:about="http://vocab.getty.edu/aat/300417435"/>
            </rico:hasOrHadType>
        </xsl:when>
        <xsl:when test="$type = 'guid'">
            <rico:hasOrHadType>
                <rico:Type>
                    <rico:hasOrHadName>
                        <rico:Name>
                            <rico:textualValue>GUID</rico:textualValue>
                        </rico:Name>
                    </rico:hasOrHadName>
                </rico:Type>
            </rico:hasOrHadType>
        </xsl:when>
    </xsl:choose>
</xsl:template-->

<!--xsl:template name="build-date">
    <xsl:param name="text"/>
    <xsl:param name="normal"/>
    <rico:Date>
        <xsl:if test="$text != ''">
            <rico:textualValue>
                <xsl:value-of select="$text"/>
            </rico:textualValue>
        </xsl:if>
        <xsl:if test="$normal != ''">
            <rico:normalizedValue>
                <xsl:value-of select="$normal"/>
            </rico:normalizedValue>
        </xsl:if>
    </rico:Date>
</xsl:template-->

<xsl:template name="set-authorityURI">
    <xsl:param name="source"/>
    <xsl:param name="authfilenumber"/>
    <xsl:choose>
        <xsl:when test="$source = 'VIAF'">
            <xsl:attribute name="rdf:about">
                <xsl:text>http://viaf.org/viaf/</xsl:text>
                <xsl:value-of select="$authfilenumber"/>
            </xsl:attribute>
        </xsl:when>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>
