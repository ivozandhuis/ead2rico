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


<!-- named templates -->
<xsl:template name="set-recordsettype">
    <xsl:param name="type"/>
    <xsl:choose>
        <xsl:when test="$type = 'fonds'">
            <rico:hasRecordSetType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://www.ica.org/standards/RiC/vocabularies/recordSetTypes#Fonds</xsl:text>
                </xsl:attribute>
            </rico:hasRecordSetType>
        </xsl:when>
        <xsl:when test="$type = 'collection'">
            <rico:hasRecordSetType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://www.ica.org/standards/RiC/vocabularies/recordSetTypes#Collection</xsl:text>
                </xsl:attribute>
            </rico:hasRecordSetType>
        </xsl:when>
        <xsl:when test="$type = 'series'">
            <rico:hasRecordSetType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://www.ica.org/standards/RiC/vocabularies/recordSetTypes#Series</xsl:text>
                </xsl:attribute>
            </rico:hasRecordSetType>
        </xsl:when>
        <xsl:when test="$type = 'subseries'">
            <rico:hasRecordSetType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://www.ica.org/standards/RiC/vocabularies/recordSetTypes#Subseries</xsl:text>
                </xsl:attribute>
            </rico:hasRecordSetType>
        </xsl:when>
        <xsl:when test="$type = 'file'">
            <rico:hasRecordSetType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://www.ica.org/standards/RiC/vocabularies/recordSetTypes#File</xsl:text>
                </xsl:attribute>
            </rico:hasRecordSetType>
        </xsl:when>
    </xsl:choose>
</xsl:template>

<xsl:template name="set-identifiertype">
    <xsl:param name="type"/>
    <xsl:choose>
        <xsl:when test="$type = 'fonds'">
            <rico:hasIdentifierType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://example.com/standards/RiC/vocabularies/identifierTypes#01</xsl:text>
                </xsl:attribute>
            </rico:hasIdentifierType>
        </xsl:when>
        <xsl:when test="$type = 'collection'">
            <rico:hasIdentifierType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://example.com/standards/RiC/vocabularies/identifierTypes#02</xsl:text>
                </xsl:attribute>
            </rico:hasIdentifierType>
        </xsl:when>
        <xsl:when test="$type = 'series'">
            <rico:hasIdentifierType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://example.com/standards/RiC/vocabularies/identifierTypes#03</xsl:text>
                </xsl:attribute>
            </rico:hasIdentifierType>
        </xsl:when>
        <xsl:when test="$type = 'series_code'">
            <rico:hasIdentifierType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://example.com/standards/RiC/vocabularies/identifierTypes#03</xsl:text>
                </xsl:attribute>
            </rico:hasIdentifierType>
        </xsl:when>
        <xsl:when test="$type = 'subseries'">
            <rico:hasIdentifierType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://example.com/standards/RiC/vocabularies/identifierTypes#03</xsl:text>
                </xsl:attribute>
            </rico:hasIdentifierType>
        </xsl:when>
        <xsl:when test="$type = 'otherlevel'">
            <rico:hasIdentifierType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://example.com/standards/RiC/vocabularies/identifierTypes#04</xsl:text>
                </xsl:attribute>
            </rico:hasIdentifierType>
        </xsl:when>
        <xsl:when test="$type = 'file'">
            <rico:hasIdentifierType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://example.com/standards/RiC/vocabularies/identifierTypes#05</xsl:text>
                </xsl:attribute>
            </rico:hasIdentifierType>
        </xsl:when>
        <xsl:when test="$type = 'handle'">
            <rico:hasIdentifierType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://example.com/standards/RiC/vocabularies/identifierTypes#06</xsl:text>
                </xsl:attribute>
            </rico:hasIdentifierType>
        </xsl:when>
        <xsl:when test="$type = 'guid'">
            <rico:hasIdentifierType>
                <xsl:attribute name="rdf:resource">
                    <xsl:text>https://example.com/standards/RiC/vocabularies/identifierTypes#07</xsl:text>
                </xsl:attribute>
            </rico:hasIdentifierType>
        </xsl:when>
    </xsl:choose>
</xsl:template>

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
