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


<!-- templates for archdesc-components, looping hierarchy -->

<xsl:template match="ead:archdesc | ead:archdescgrp">
    <rico:RecordSet>
        <xsl:attribute name="rdf:about">
            <xsl:value-of select="$baseUri"/>
            <xsl:value-of select="$archId"/>
        </xsl:attribute>
        <xsl:call-template name="set-recordsettype">
            <xsl:with-param name="type" select="@level"/>
        </xsl:call-template>
        <xsl:apply-templates select="ead:did">
            <xsl:with-param name="type" select="@level"/>
        </xsl:apply-templates>
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
    </rico:RecordSet>
    <xsl:apply-templates select="ead:dsc | ead:dscgrp"/>
</xsl:template>

<xsl:template match="ead:dsc">
    <xsl:apply-templates select="ead:c | ead:c01">
        <xsl:with-param name="archnr" select="$archId"/>
        <xsl:with-param name="level" select="'first'"/>
    </xsl:apply-templates>
</xsl:template>

<xsl:template match="ead:dscgrp">
    <xsl:apply-templates select="ead:ead"/>
</xsl:template>

<xsl:template match="ead:c | ead:c01 | ead:c02 | ead:c03 | ead:c04 | ead:c05 | ead:c06 | ead:c07 | ead:c08 | ead:c09 | ead:c10 | ead:c11 | ead:c12">
    <xsl:param name="parentId"/>
    <xsl:param name="level"/>
    <xsl:variable name="id">
        <xsl:value-of select="concat('.', translate(ead:did/ead:unitid, ' ', '_'))"/>
        <!--xsl:choose>
            <xsl:when test="$level = 'first'">
                <xsl:value-of select="concat(concat($archnr, '#'), position())"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat(concat($archnr, '-'), position())"/>
            </xsl:otherwise>
        </xsl:choose-->
    </xsl:variable>
    <rico:RecordSet>
        <xsl:attribute name="rdf:about">
            <xsl:value-of select="$baseUri"/>
            <xsl:value-of select="$archId"/>
            <xsl:value-of select="$id"/>
        </xsl:attribute>
        <rico:isOrWasIncludedIn>
            <xsl:attribute name="rdf:resource">
                <xsl:value-of select="$baseUri"/>
                <xsl:value-of select="$archId"/>
                <xsl:value-of select="$parentId"/>
            </xsl:attribute>
        </rico:isOrWasIncludedIn>
        <xsl:if test="not(position() = 1)">
            <rico:followsOrFollowed>
                <xsl:attribute name="rdf:resource">
                    <xsl:value-of select="$baseUri"/>
                    <!--xsl:choose>
                        <xsl:when test="$level = 'first'">
                            <xsl:value-of select="concat(concat($archnr, '#'), position()-1)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="concat(concat($archnr, '-'), position()-1)"/>
                        </xsl:otherwise>
                    </xsl:choose-->
                </xsl:attribute>
            </rico:followsOrFollowed>  
        </xsl:if>
        <xsl:call-template name="set-recordsettype">
            <xsl:with-param name="type" select="@level"/>
        </xsl:call-template>
        <xsl:apply-templates select="ead:did">
            <xsl:with-param name="type" select="@level"/>
        </xsl:apply-templates>
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
    </rico:RecordSet>
    <xsl:apply-templates select="ead:c | ead:c01 | ead:c02 | ead:c03 | ead:c04 | ead:c05 | ead:c06 | ead:c07 | ead:c08 | ead:c09 | ead:c10 | ead:c11 | ead:c12">
        <xsl:with-param name="parentId" select="$id"/>
    </xsl:apply-templates>
</xsl:template>

</xsl:stylesheet>