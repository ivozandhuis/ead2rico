<?xml version="1.0" encoding="UTF-8"?>

<!-- Endocoded Archival Description 2002 (EAD) into Records in Contexts Ontology (RiC-O) 0.2-->
<!-- Ivo Zandhuis (ivo@zandhuis.nl) -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:rico="https://www.ica.org/standards/RiC/ontology#"
    xmlns:html="http://www.w3.org/1999/xhtml/"    
    xmlns:ead="urn:isbn:1-931666-22-9" 
    exclude-result-prefixes="xsl ead">

<!-- text structure templates-->
<xsl:template match="ead:p">
    <html:p>
        <xsl:value-of select="normalize-space(.)"/>
    </html:p>
</xsl:template>

<xsl:template match="ead:head">
    <html:head>
        <xsl:value-of select="normalize-space(.)"/>
    </html:head>
</xsl:template>

<!-- empty templates-->
<xsl:template match="ead:address"/>
<xsl:template match="ead:runner"/>

</xsl:stylesheet>
