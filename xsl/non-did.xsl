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


<!-- templates for non-did elements -->

<xsl:template match="(ead:archdesc | ead:descgrp | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:accessrestrict">
    <rico:conditionsOfAccess rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:conditionsOfAccess>
    <xsl:apply-templates select=".//ead:p/(ead:corpname | ead:famname | ead:genreform | ead:geogname | 
                        ead:name | ead:persname | ead:subject)"/>
</xsl:template>

<xsl:template match="ead:accruals"/>

<xsl:template match="(ead:archdesc | ead:descgrp | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        (ead:acqinfo | ead:custodhist | ead:processinfo)">
    <rico:history rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:history>
    <xsl:apply-templates select=".//ead:p/(ead:corpname | ead:famname | ead:genreform | ead:geogname | 
                        ead:name | ead:persname | ead:subject)"/>
</xsl:template>

<xsl:template match="(ead:archdesc | ead:descgrp | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:altformavail">
    <rico:descriptiveNote rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:descriptiveNote>
</xsl:template>

<xsl:template match="ead:appraisal"/>

<xsl:template match="(ead:archdesc | ead:descgrp | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:arrangement">
    <rico:recordResourceStructure rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:recordResourceStructure>
</xsl:template>

<xsl:template match="ead:bibliography"/>

<xsl:template match="(ead:archdesc | ead:descgrp | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:bioghist">
    <rico:descriptiveNote rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:descriptiveNote>  
</xsl:template>

<xsl:template match="ead:controlaccess">
    <xsl:apply-templates select="ead:corpname"/>
    <xsl:apply-templates select="ead:famname"/>
    <xsl:apply-templates select="ead:genreform"/>
    <xsl:apply-templates select="ead:geogname"/>
    <xsl:apply-templates select="ead:name"/>
    <xsl:apply-templates select="ead:persname"/>
    <xsl:apply-templates select="ead:subject"/>
</xsl:template>

<!--ead:custodhist: see ead:acqinfo-->

<xsl:template match="ead:descgrp">
    <xsl:apply-templates select="ead:accessrestrict"/>
    <xsl:apply-templates select="ead:accruals"/>
    <xsl:apply-templates select="ead:acqinfo"/>
    <xsl:apply-templates select="ead:altformavail"/>
    <xsl:apply-templates select="ead:appraisal"/>
    <xsl:apply-templates select="ead:arrangement"/>
    <xsl:apply-templates select="ead:bibliography"/>
    <xsl:apply-templates select="ead:bioghist"/>
    <xsl:apply-templates select="ead:controlaccess"/>
    <xsl:apply-templates select="ead:custodhist"/>
    <xsl:apply-templates select="ead:dao"/>
    <xsl:apply-templates select="ead:daogrp"/>
    <xsl:apply-templates select="ead:descgrp"/>
    <xsl:apply-templates select="ead:fileplan"/>
    <xsl:apply-templates select="ead:index"/>
    <xsl:apply-templates select="ead:note"/>
    <xsl:apply-templates select="ead:odd"/>
    <xsl:apply-templates select="ead:originalsloc"/>
    <xsl:apply-templates select="ead:otherfindaid"/>
    <xsl:apply-templates select="ead:phystech"/>
    <xsl:apply-templates select="ead:prefercite"/>
    <xsl:apply-templates select="ead:processinfo"/>
    <xsl:apply-templates select="ead:relatedmaterial"/>
    <xsl:apply-templates select="ead:scopecontent"/>
    <xsl:apply-templates select="ead:separatedmaterial"/>
    <xsl:apply-templates select="ead:userestrict"/>
</xsl:template>

<xsl:template match="ead:fileplan"/>
<xsl:template match="ead:index"/>
<xsl:template match="ead:indexentry"/> <!-- part of index-->
<xsl:template match="ead:namegrp"/>
<xsl:template match="ead:note"/>

<xsl:template match="(ead:archdesc | ead:descgrp | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:odd">
    <rico:descriptiveNote rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:descriptiveNote>
    <xsl:apply-templates select=".//ead:p/(ead:corpname | ead:famname | ead:genreform | ead:geogname | 
                        ead:name | ead:persname | ead:subject)"/>
</xsl:template>

<xsl:template match="(ead:archdesc | ead:descgrp | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:originalsloc">
    <rico:history rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:history>
</xsl:template>

<xsl:template match="(ead:archdesc | ead:descgrp | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:otherfindaid">
    <rico:descriptiveNote rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:descriptiveNote>
</xsl:template>

<xsl:template match="(ead:archdesc | ead:descgrp | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:phystech">
    <rico:descriptiveNote rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:descriptiveNote>
</xsl:template>

<xsl:template match="(ead:archdesc | ead:descgrp | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:prefercite">
    <rico:descriptiveNote rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:descriptiveNote>
</xsl:template>

<!--ead:processinfo: see ead:acqinfo-->

<xsl:template match="(ead:archdesc | ead:descgrp | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:relatedmaterial">
    <rico:descriptiveNote rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:descriptiveNote>
</xsl:template>

<xsl:template match="(ead:archdesc | ead:descgrp | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:scopecontent">
    <rico:scopeAndContent rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:scopeAndContent>
    <xsl:apply-templates select=".//ead:p/(ead:corpname | ead:famname | ead:genreform | ead:geogname | 
                        ead:name | ead:persname | ead:subject)"/>
</xsl:template>

<xsl:template match="(ead:archdesc | ead:descgrp | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:separatedmaterial">
    <rico:descriptiveNote rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:descriptiveNote>
</xsl:template>

<xsl:template match="(ead:archdesc | ead:descgrp | ead:c | 
                        ead:c01 | ead:c02 | ead:c03 | ead:c04 | 
                        ead:c05 | ead:c06 | ead:c07 | ead:c08 | 
                        ead:c09 | ead:c10 | ead:c11 | ead:c12)/
                        ead:userestrict">
    <rico:conditionsOfUse rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:conditionsOfUse>
</xsl:template>

</xsl:stylesheet>