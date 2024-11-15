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

<xsl:template match="ead:archdesc/ead:accessrestrict | 
                    ead:descgrp/ead:accessrestrict | 
                    ead:c/ead:accessrestrict | 
                    ead:c01/ead:accessrestrict | 
                    ead:c02/ead:accessrestrict | 
                    ead:c03/ead:accessrestrict | 
                    ead:c04/ead:accessrestrict | 
                    ead:c05/ead:accessrestrict | 
                    ead:c06/ead:accessrestrict | 
                    ead:c07/ead:accessrestrict | 
                    ead:c08/ead:accessrestrict | 
                    ead:c09/ead:accessrestrict | 
                    ead:c10/ead:accessrestrict | 
                    ead:c11/ead:accessrestrict | 
                    ead:c12/ead:accessrestrict">
    <rico:conditionsOfAccess rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:conditionsOfAccess>
    <xsl:apply-templates select=".//ead:p/ead:corpname"/>
    <xsl:apply-templates select=".//ead:p/ead:famname"/>
    <xsl:apply-templates select=".//ead:p/ead:genreform"/>
    <xsl:apply-templates select=".//ead:p/ead:geogname"/>
    <xsl:apply-templates select=".//ead:p/ead:name"/>
    <xsl:apply-templates select=".//ead:p/ead:persname"/>
    <xsl:apply-templates select=".//ead:p/ead:subject"/>
</xsl:template>

<xsl:template match="ead:accruals"/>

<xsl:template match="ead:archdesc/ead:acqinfo | 
                    ead:descgrp/ead:acqinfo | 
                    ead:c/ead:acqinfo | 
                    ead:c01/ead:acqinfo | 
                    ead:c02/ead:acqinfo | 
                    ead:c03/ead:acqinfo | 
                    ead:c04/ead:acqinfo | 
                    ead:c05/ead:acqinfo | 
                    ead:c06/ead:acqinfo | 
                    ead:c07/ead:acqinfo | 
                    ead:c08/ead:acqinfo | 
                    ead:c09/ead:acqinfo | 
                    ead:c10/ead:acqinfo | 
                    ead:c11/ead:acqinfo | 
                    ead:c12/ead:acqinfo">
    <rico:history rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:history>
    <xsl:apply-templates select=".//ead:p/ead:corpname"/>
    <xsl:apply-templates select=".//ead:p/ead:famname"/>
    <xsl:apply-templates select=".//ead:p/ead:genreform"/>
    <xsl:apply-templates select=".//ead:p/ead:geogname"/>
    <xsl:apply-templates select=".//ead:p/ead:name"/>
    <xsl:apply-templates select=".//ead:p/ead:persname"/>
    <xsl:apply-templates select=".//ead:p/ead:subject"/>
</xsl:template>

<xsl:template match="ead:archdesc/ead:altformavail | 
                    ead:descgrp/ead:altformavail | 
                    ead:c/ead:altformavail | 
                    ead:c01/ead:altformavail | 
                    ead:c02/ead:altformavail | 
                    ead:c03/ead:altformavail | 
                    ead:c04/ead:altformavail | 
                    ead:c05/ead:altformavail | 
                    ead:c06/ead:altformavail | 
                    ead:c07/ead:altformavail | 
                    ead:c08/ead:altformavail | 
                    ead:c09/ead:altformavail | 
                    ead:c10/ead:altformavail | 
                    ead:c11/ead:altformavail | 
                    ead:c12/ead:altformavail">
    <rico:generalDescription rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:generalDescription>
</xsl:template>

<xsl:template match="ead:appraisal"/>

<xsl:template match="ead:archdesc/ead:arrangement | 
                    ead:descgrp/ead:arrangement | 
                    ead:c/ead:arrangement | 
                    ead:c01/ead:arrangement | 
                    ead:c02/ead:arrangement | 
                    ead:c03/ead:arrangement | 
                    ead:c04/ead:arrangement | 
                    ead:c05/ead:arrangement | 
                    ead:c06/ead:arrangement | 
                    ead:c07/ead:arrangement | 
                    ead:c08/ead:arrangement | 
                    ead:c09/ead:arrangement | 
                    ead:c10/ead:arrangement | 
                    ead:c11/ead:arrangement | 
                    ead:c12/ead:arrangement">
    <rico:recordResourceStructure rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:recordResourceStructure>
</xsl:template>

<xsl:template match="ead:bibliography"/>

<xsl:template match="ead:archdesc/ead:bioghist | 
                    ead:descgrp/ead:bioghist | 
                    ead:c/ead:bioghist | 
                    ead:c01/ead:bioghist | 
                    ead:c02/ead:bioghist | 
                    ead:c03/ead:bioghist | 
                    ead:c04/ead:bioghist | 
                    ead:c05/ead:bioghist | 
                    ead:c06/ead:bioghist | 
                    ead:c07/ead:bioghist | 
                    ead:c08/ead:bioghist | 
                    ead:c09/ead:bioghist | 
                    ead:c10/ead:bioghist | 
                    ead:c11/ead:bioghist | 
                    ead:c12/ead:bioghist">
    <rico:generalDescription rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:generalDescription>  
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

<xsl:template match="ead:archdesc/ead:custodhist | 
                    ead:descgrp/ead:custodhist | 
                    ead:c/ead:custodhist | 
                    ead:c01/ead:custodhist | 
                    ead:c02/ead:custodhist | 
                    ead:c03/ead:custodhist | 
                    ead:c04/ead:custodhist | 
                    ead:c05/ead:custodhist | 
                    ead:c06/ead:custodhist | 
                    ead:c07/ead:custodhist | 
                    ead:c08/ead:custodhist | 
                    ead:c09/ead:custodhist | 
                    ead:c10/ead:custodhist | 
                    ead:c11/ead:custodhist | 
                    ead:c12/ead:custodhist">
    <rico:history rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:history>
    <xsl:apply-templates select=".//ead:p/ead:corpname"/>
    <xsl:apply-templates select=".//ead:p/ead:famname"/>
    <xsl:apply-templates select=".//ead:p/ead:genreform"/>
    <xsl:apply-templates select=".//ead:p/ead:geogname"/>
    <xsl:apply-templates select=".//ead:p/ead:name"/>
    <xsl:apply-templates select=".//ead:p/ead:persname"/>
    <xsl:apply-templates select=".//ead:p/ead:subject"/>
</xsl:template>

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

<xsl:template match="ead:archdesc/ead:odd | 
                    ead:descgrp/ead:odd | 
                    ead:c/ead:odd | 
                    ead:c01/ead:odd | 
                    ead:c02/ead:odd | 
                    ead:c03/ead:odd | 
                    ead:c04/ead:odd | 
                    ead:c05/ead:odd | 
                    ead:c06/ead:odd | 
                    ead:c07/ead:odd | 
                    ead:c08/ead:odd | 
                    ead:c09/ead:odd | 
                    ead:c10/ead:odd | 
                    ead:c11/ead:odd | 
                    ead:c12/ead:odd">
    <rico:generalDescription rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:generalDescription>
    <xsl:apply-templates select=".//ead:p/ead:corpname"/>
    <xsl:apply-templates select=".//ead:p/ead:famname"/>
    <xsl:apply-templates select=".//ead:p/ead:genreform"/>
    <xsl:apply-templates select=".//ead:p/ead:geogname"/>
    <xsl:apply-templates select=".//ead:p/ead:name"/>
    <xsl:apply-templates select=".//ead:p/ead:persname"/>
    <xsl:apply-templates select=".//ead:p/ead:subject"/>
</xsl:template>

<xsl:template match="ead:archdesc/ead:originalsloc | 
                    ead:descgrp/ead:originalsloc | 
                    ead:c/ead:originalsloc | 
                    ead:c01/ead:originalsloc | 
                    ead:c02/ead:originalsloc | 
                    ead:c03/ead:originalsloc | 
                    ead:c04/ead:originalsloc | 
                    ead:c05/ead:originalsloc | 
                    ead:c06/ead:originalsloc | 
                    ead:c07/ead:originalsloc | 
                    ead:c08/ead:originalsloc | 
                    ead:c09/ead:originalsloc | 
                    ead:c10/ead:originalsloc | 
                    ead:c11/ead:originalsloc | 
                    ead:c12/ead:originalsloc">
    <rico:history rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:history>
</xsl:template>

<xsl:template match="ead:archdesc/ead:otherfindaid | 
                    ead:descgrp/ead:otherfindaid | 
                    ead:c/ead:otherfindaid | 
                    ead:c01/ead:otherfindaid | 
                    ead:c02/ead:otherfindaid | 
                    ead:c03/ead:otherfindaid | 
                    ead:c04/ead:otherfindaid | 
                    ead:c05/ead:otherfindaid | 
                    ead:c06/ead:otherfindaid | 
                    ead:c07/ead:otherfindaid | 
                    ead:c08/ead:otherfindaid | 
                    ead:c09/ead:otherfindaid | 
                    ead:c10/ead:otherfindaid | 
                    ead:c11/ead:otherfindaid | 
                    ead:c12/ead:otherfindaid">
    <rico:generalDescription rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:generalDescription>
</xsl:template>

<xsl:template match="ead:archdesc/ead:phystech | 
                    ead:descgrp/ead:phystech | 
                    ead:c/ead:phystech | 
                    ead:c01/ead:phystech | 
                    ead:c02/ead:phystech | 
                    ead:c03/ead:phystech | 
                    ead:c04/ead:phystech | 
                    ead:c05/ead:phystech | 
                    ead:c06/ead:phystech | 
                    ead:c07/ead:phystech | 
                    ead:c08/ead:phystech | 
                    ead:c09/ead:phystech | 
                    ead:c10/ead:phystech | 
                    ead:c11/ead:phystech | 
                    ead:c12/ead:phystech">
    <rico:generalDescription rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:generalDescription>
</xsl:template>

<xsl:template match="ead:archdesc/ead:prefercite | 
                    ead:descgrp/ead:prefercite | 
                    ead:c/ead:prefercite | 
                    ead:c01/ead:prefercite | 
                    ead:c02/ead:prefercite | 
                    ead:c03/ead:prefercite | 
                    ead:c04/ead:prefercite | 
                    ead:c05/ead:prefercite | 
                    ead:c06/ead:prefercite | 
                    ead:c07/ead:prefercite | 
                    ead:c08/ead:prefercite | 
                    ead:c09/ead:prefercite | 
                    ead:c10/ead:prefercite | 
                    ead:c11/ead:prefercite | 
                    ead:c12/ead:prefercite">
    <rico:generalDescription rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:generalDescription>
</xsl:template>

<xsl:template match="ead:archdesc/ead:processinfo | 
                    ead:descgrp/ead:processinfo | 
                    ead:c/ead:processinfo | 
                    ead:c01/ead:processinfo | 
                    ead:c02/ead:processinfo | 
                    ead:c03/ead:processinfo | 
                    ead:c04/ead:processinfo | 
                    ead:c05/ead:processinfo | 
                    ead:c06/ead:processinfo | 
                    ead:c07/ead:processinfo | 
                    ead:c08/ead:processinfo | 
                    ead:c09/ead:processinfo | 
                    ead:c10/ead:processinfo | 
                    ead:c11/ead:processinfo | 
                    ead:c12/ead:processinfo">
    <rico:history rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:history>
    <xsl:apply-templates select=".//ead:p/ead:corpname"/>
    <xsl:apply-templates select=".//ead:p/ead:famname"/>
    <xsl:apply-templates select=".//ead:p/ead:genreform"/>
    <xsl:apply-templates select=".//ead:p/ead:geogname"/>
    <xsl:apply-templates select=".//ead:p/ead:name"/>
    <xsl:apply-templates select=".//ead:p/ead:persname"/>
    <xsl:apply-templates select=".//ead:p/ead:subject"/>
</xsl:template>

<xsl:template match="ead:archdesc/ead:relatedmaterial | 
                    ead:descgrp/ead:relatedmaterial | 
                    ead:c/ead:relatedmaterial | 
                    ead:c01/ead:relatedmaterial | 
                    ead:c02/ead:relatedmaterial | 
                    ead:c03/ead:relatedmaterial | 
                    ead:c04/ead:relatedmaterial | 
                    ead:c05/ead:relatedmaterial | 
                    ead:c06/ead:relatedmaterial | 
                    ead:c07/ead:relatedmaterial | 
                    ead:c08/ead:relatedmaterial | 
                    ead:c09/ead:relatedmaterial | 
                    ead:c10/ead:relatedmaterial | 
                    ead:c11/ead:relatedmaterial | 
                    ead:c12/ead:relatedmaterial">
    <rico:generalDescription rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:generalDescription>
</xsl:template>

<xsl:template match="ead:archdesc/ead:scopecontent | 
                    ead:descgrp/ead:scopecontent | 
                    ead:c/ead:scopecontent | 
                    ead:c01/ead:scopecontent | 
                    ead:c02/ead:scopecontent | 
                    ead:c03/ead:scopecontent | 
                    ead:c04/ead:scopecontent | 
                    ead:c05/ead:scopecontent | 
                    ead:c06/ead:scopecontent | 
                    ead:c07/ead:scopecontent | 
                    ead:c08/ead:scopecontent | 
                    ead:c09/ead:scopecontent | 
                    ead:c10/ead:scopecontent | 
                    ead:c11/ead:scopecontent | 
                    ead:c12/ead:scopecontent">
    <rico:scopeAndContent rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:scopeAndContent>
    <xsl:apply-templates select=".//ead:p/ead:corpname"/>
    <xsl:apply-templates select=".//ead:p/ead:famname"/>
    <xsl:apply-templates select=".//ead:p/ead:genreform"/>
    <xsl:apply-templates select=".//ead:p/ead:geogname"/>
    <xsl:apply-templates select=".//ead:p/ead:name"/>
    <xsl:apply-templates select=".//ead:p/ead:persname"/>
    <xsl:apply-templates select=".//ead:p/ead:subject"/>
</xsl:template>

<xsl:template match="ead:archdesc/ead:separatedmaterial | 
                    ead:descgrp/ead:separatedmaterial | 
                    ead:c/ead:separatedmaterial | 
                    ead:c01/ead:separatedmaterial | 
                    ead:c02/ead:separatedmaterial | 
                    ead:c03/ead:separatedmaterial | 
                    ead:c04/ead:separatedmaterial | 
                    ead:c05/ead:separatedmaterial | 
                    ead:c06/ead:separatedmaterial | 
                    ead:c07/ead:separatedmaterial | 
                    ead:c08/ead:separatedmaterial | 
                    ead:c09/ead:separatedmaterial | 
                    ead:c10/ead:separatedmaterial | 
                    ead:c11/ead:separatedmaterial | 
                    ead:c12/ead:separatedmaterial">
    <rico:generalDescription rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:generalDescription>
</xsl:template>

<xsl:template match="ead:archdesc/ead:userestrict | 
                    ead:descgrp/ead:userestrict | 
                    ead:c/ead:userestrict | 
                    ead:c01/ead:userestrict | 
                    ead:c02/ead:userestrict | 
                    ead:c03/ead:userestrict | 
                    ead:c04/ead:userestrict | 
                    ead:c05/ead:userestrict | 
                    ead:c06/ead:userestrict | 
                    ead:c07/ead:userestrict | 
                    ead:c08/ead:userestrict | 
                    ead:c09/ead:userestrict | 
                    ead:c10/ead:userestrict | 
                    ead:c11/ead:userestrict | 
                    ead:c12/ead:userestrict">
    <rico:conditionsOfUse rdf:parseType="XMLLiteral">
        <html:div>
            <xsl:apply-templates mode="text"/>
        </html:div>
    </rico:conditionsOfUse>
</xsl:template>

</xsl:stylesheet>