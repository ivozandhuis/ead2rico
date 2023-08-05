<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:rico="https://www.ica.org/standards/RiC/ontology#"
    xmlns:html="http://www.w3.org/1999/xhtml/"    
    xmlns:ead="urn:isbn:1-931666-22-9" 
    exclude-result-prefixes="xsl ead html">

<!-- templates for non-did elements -->

<xsl:template match="(ead:archdesc | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:accessrestrict">
    <rico:conditionsOfAccess rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates/>
        </html:div>
    </rico:conditionsOfAccess>
</xsl:template>


<xsl:template match="ead:accruals"/>

<xsl:template match="(ead:archdesc | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        (ead:acqinfo | ead:custodhist | ead:processinfo)">
    <rico:history rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates/>
        </html:div>
    </rico:history>
</xsl:template>

<xsl:template match="ead:altformavail"/>
<xsl:template match="ead:appraisal"/>
<xsl:template match="ead:arrangement"/>
<xsl:template match="ead:bibliography"/>
<xsl:template match="ead:bioghist"/>
<xsl:template match="ead:controlaccess"/>

<!--ead:custodhist: see ead:acqinfo-->

<xsl:template match="ead:descgrp"/>
<xsl:template match="ead:fileplan"/>
<xsl:template match="ead:index"/>
<xsl:template match="ead:indexentry"/> <!-- part of index-->
<xsl:template match="ead:namegrp"/>
<xsl:template match="ead:note"/>

<xsl:template match="(ead:archdesc | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:odd">
    <rico:descriptiveNote rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates/>
        </html:div>
    </rico:descriptiveNote>
</xsl:template>

<xsl:template match="ead:odd/ead:odd">
    <html:div>
        <xsl:apply-templates/>
    </html:div>
</xsl:template>

<xsl:template match="ead:originalsloc"/>
<xsl:template match="ead:otherfindaid"/>
<xsl:template match="ead:phystech"/>
<xsl:template match="ead:prefercite"/>

<!--ead:processinfo: see ead:acqinfo-->

<xsl:template match="ead:relatedmaterial"/>

<xsl:template match="(ead:archdesc | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:scopecontent">
    <rico:scopeAndContent rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates/>
        </html:div>
    </rico:scopeAndContent>
</xsl:template>

<xsl:template match="ead:scopecontent/ead:scopecontent">
    <html:div>
        <xsl:apply-templates/>
    </html:div>
</xsl:template>

<xsl:template match="ead:separatedmaterial"/>

<xsl:template match="(ead:archdesc | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:userestrict">
    <rico:conditionsOfUse rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates/>
        </html:div>
    </rico:conditionsOfUse>
</xsl:template>

</xsl:stylesheet>