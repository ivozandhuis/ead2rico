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

<xsl:import href="header.xslt"/>
<xsl:import href="archdesc.xslt"/>
<xsl:import href="did.xslt"/>
<xsl:import href="non-did.xslt"/>
<xsl:import href="dao.xslt"/>
<xsl:import href="names.xslt"/>
<xsl:import href="textstruct.xslt"/>
<xsl:import href="named-templates.xslt"/>

<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:param name="baseUri">https://hdl.handle.net/10622/</xsl:param>

<!-- TODO: how to handle ead:eadgrp-->

<!-- RDF wrap -->
<xsl:template match="ead:ead">
    <rdf:RDF>
        <xsl:apply-templates select="ead:eadheader"/>
        <xsl:apply-templates select="ead:archdesc"/>
    </rdf:RDF>
</xsl:template>

</xsl:stylesheet>
