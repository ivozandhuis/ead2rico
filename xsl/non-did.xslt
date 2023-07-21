<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:rico="https://www.ica.org/standards/RiC/ontology#"
    xmlns:ead="urn:isbn:1-931666-22-9" 
    exclude-result-prefixes="xsl ead">

<!-- templates for non-did elements -->



<xsl:template match="ead:accessrestrict">
    <rico:conditionsOfAccess>
        <xsl:apply-templates/>
    </rico:conditionsOfAccess>
</xsl:template>

<xsl:template match="ead:accruals"/>

<xsl:template match="ead:acqinfo">
    <rico:history>
        <xsl:apply-templates/>
    </rico:history>
</xsl:template>

<xsl:template match="ead:altformavail"/>
<xsl:template match="ead:appraisal"/>
<xsl:template match="ead:arrangement"/>
<xsl:template match="ead:bibliography"/>
<xsl:template match="ead:bioghist"/>

<xsl:template match="ead:controlaccess">
    <!--rico:hasOrHadSubject>
        <xsl:apply-templates/>
    </rico:hasOrHadSubject-->
</xsl:template>

<xsl:template match="ead:custodhist">
    <rico:history>
        <xsl:apply-templates/>
    </rico:history>
</xsl:template>

<xsl:template match="ead:descgrp"/>
<xsl:template match="ead:fileplan"/>
<xsl:template match="ead:index"/>
<xsl:template match="ead:indexentry"/> <!-- part of index-->
<xsl:template match="ead:namegrp"/>
<xsl:template match="ead:note"/>

<xsl:template match="ead:odd">
    <rico:descriptiveNote>
        <xsl:apply-templates/>
    </rico:descriptiveNote>
</xsl:template>

<xsl:template match="ead:originalsloc"/>
<xsl:template match="ead:otherfindaid"/>
<xsl:template match="ead:phystech"/>
<xsl:template match="ead:prefercite"/>

<xsl:template match="ead:processinfo">
    <rico:history>
        <xsl:apply-templates/>
    </rico:history>
</xsl:template>

<xsl:template match="ead:relatedmaterial"/>

<xsl:template match="ead:scopecontent">
    <rico:scopeAndContent>
        <xsl:apply-templates/>
    </rico:scopeAndContent>
</xsl:template>

<xsl:template match="ead:separatedmaterial"/>

<xsl:template match="ead:userestrict">
    <rico:conditionsOfUse>
        <xsl:apply-templates/>
    </rico:conditionsOfUse>
</xsl:template>

</xsl:stylesheet>