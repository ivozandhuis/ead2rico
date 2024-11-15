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


<!-- text structure templates-->
<xsl:template match="ead:p" mode="text">
    <html:p>
        <xsl:apply-templates mode="text"/>
    </html:p>
</xsl:template>

<xsl:template match="ead:head" mode="text">
    <html:head>
        <xsl:apply-templates mode="text"/>
    </html:head>
</xsl:template>

<xsl:template match="ead:corpname | ead:famname | ead:genreform | ead:geogname | 
                        ead:name | ead:persname | ead:subject" mode="text">
    <xsl:value-of select="."/>
</xsl:template>



<xsl:template match="ead:accessrestrict | ead:accruals | ead:acqinfo | ead:altformavail |
                    ead:appraisal | ead:arrangement | ead:bibliography | ead:bioghist |
                    ead:controlaccess | ead:custodhist | ead:dao | ead:daogrp | ead:descgrp |
                    ead:fileplan | ead:index | ead:note | ead:odd | ead:originalsloc | ead:otherfindaid |
                    ead:phystech | ead:prefercite | ead:processinfo | ead:relatedmaterial | ead:scopecontent |
                    ead:separatedmaterial | ead:userestrict" mode="text">
    <html:div>
        <xsl:apply-templates mode="text"/>
    </html:div>
</xsl:template>

<!-- empty templates-->
<xsl:template match="ead:address"/>
<xsl:template match="ead:runner"/>

</xsl:stylesheet>
