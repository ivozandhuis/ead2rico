<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:rico="https://www.ica.org/standards/RiC/ontology#"
    xmlns:ead="urn:isbn:1-931666-22-9" 
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
                <rico:IdentifierType>
                    <rico:name>Archiefnummer</rico:name>
                </rico:IdentifierType>
            </rico:hasIdentifierType>
        </xsl:when>
        <xsl:when test="$type = 'collection'">
            <rico:hasIdentifierType>
                <rico:IdentifierType>
                    <rico:name>Archiefnummer</rico:name>
                </rico:IdentifierType>
            </rico:hasIdentifierType>
        </xsl:when>
        <xsl:when test="$type = 'series'">
            <rico:hasIdentifierType>
                <rico:IdentifierType>
                    <rico:name>Rubriekscode</rico:name>
                </rico:IdentifierType>
            </rico:hasIdentifierType>
        </xsl:when>
        <xsl:when test="$type = 'subseries'">
            <rico:hasIdentifierType>
                <rico:IdentifierType>
                    <rico:name>Rubriekscode</rico:name>
                </rico:IdentifierType>
            </rico:hasIdentifierType>
        </xsl:when>
        <xsl:when test="$type = 'otherlevel'">
            <rico:hasIdentifierType>
                <rico:IdentifierType>
                    <rico:name>Inventarisnummers</rico:name>
                </rico:IdentifierType>
            </rico:hasIdentifierType>
        </xsl:when>
        <xsl:when test="$type = 'file'">
            <rico:hasIdentifierType>
                <rico:IdentifierType>
                    <rico:name>Inventarisnummer</rico:name>
                </rico:IdentifierType>
            </rico:hasIdentifierType>
        </xsl:when>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>