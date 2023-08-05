<?xml version="1.0" encoding="UTF-8"?>

<!-- Endocoded Archival Description 2002 (EAD) into Records in Contexts Ontology (RiC-O) 0.2-->
<!-- Ivo Zandhuis (ivo@zandhuis.nl) -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:rico="https://www.ica.org/standards/RiC/ontology#"
    xmlns:ead="urn:isbn:1-931666-22-9" 
    exclude-result-prefixes="xsl ead">

<xsl:import href="eadheader.xslt"/>
<xsl:import href="frontmatter.xslt"/>
<xsl:import href="archdesc.xslt"/>
<xsl:import href="did.xslt"/>
<xsl:import href="non-did.xslt"/>
<xsl:import href="dao.xslt"/>
<xsl:import href="names.xslt"/>
<xsl:import href="textstruct.xslt"/>
<xsl:import href="named-templates.xslt"/>

<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
<xsl:strip-space elements="*"/>

<!-- NL-HlmNHA:-->
<xsl:param name="baseUri"></xsl:param>
<xsl:param name="archId" select="/ead:ead/ead:archdesc/ead:did/ead:unitid[@type = 'handle']"/>

<!-- NL-AmISG:
<xsl:param name="baseUri">https://hdl.handle.net/10622/</xsl:param>
<xsl:param name="archId" select="/ead:ead/ead:archdesc/ead:did/ead:unitid"/>
-->

<!-- ANF:
<xsl:param name="baseUri">http://data.archives-nationales.culture.gouv.fr/</xsl:param>
<xsl:param name="archId" select="substring-after(/ead:ead/ead:eadheader/ead:eadid, 'FRAN_IR_')" />
-->

<!-- RDF wrap -->
<xsl:template match="ead:ead">
    <rdf:RDF>
        <xsl:apply-templates select="ead:eadheader"/>
        <xsl:apply-templates select="ead:frontmatter"/>
        <xsl:apply-templates select="ead:archdesc"/>
    </rdf:RDF>
</xsl:template>

<xsl:template match="ead:eadgrp">
    <rdf:RDF>
        <xsl:apply-templates select="ead:eadheader"/>
        <xsl:apply-templates select="ead:frontmatter"/>
        <xsl:apply-templates select="ead:archdescgrp"/>
    </rdf:RDF>
</xsl:template>

</xsl:stylesheet>
