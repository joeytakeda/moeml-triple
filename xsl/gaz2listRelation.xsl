<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="#all"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:jt="http://joeytakeda.github.io/ns"
    version="2.0">
    <xd:doc scope="stylesheet">
        
        <xd:desc>
            <xd:p>Author: Joey Takeda</xd:p>
            <xd:p>Date: 2017-10-11</xd:p>
            <xd:p>This transformation takes the MoEML spelling variants file (which fuels the gazetteer) and turns into a TEI listRelation database.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output encoding="UTF-8" indent="yes" method="xml"/>
    
    <xsl:template match="TEI">
        <TEI xml:id="spelling_variants_rdf.xml" version="5.0">
            <xsl:copy-of select="teiHeader"/>
            <text>
                <body>
                    <head>Variant Spellings - RDF Test</head>
                    <xsl:apply-templates select="descendant::body/div" mode="alternateNames"/>
                    <xsl:apply-templates select="descendant::body/div" mode="namesToDocs"/>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
 
    
    <xsl:template match="div" mode="altnerateNames">
        <div>
            <head>Relationships of Alternate Names</head>
            <xsl:apply-templates mode="#current"/>
        </div>
    </xsl:template>
    
    <xsl:template match="div" mode="namesToDocs">
        <div>
            <head>Relationships of Alternate Spellings to Documents</head>
            <xsl:apply-templates mode="#current"/>
        </div>
    </xsl:template>
    <xd:doc>
        <xd:desc>Match each div/list (one for each authority record)</xd:desc>
    </xd:doc>
    <xsl:template match="body/div/list" mode="alternateNames">
        <listRelation>
            <xsl:apply-templates mode="#current">
                <xsl:with-param name="parentUri" select="jt:resolveMol(tokenize(@xml:id,'_')[last()])" tunnel="yes"/>
            </xsl:apply-templates>
        </listRelation>
    </xsl:template>
    
    <xsl:template match="div/list/head" mode="alternateNames">
        <xsl:copy>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="item/list" mode="namesToDocs">
        <listRelation>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </listRelation>
    </xsl:template>
    
    <xsl:template match="item/ref" mode="namesToDocs"/>
    
    <xsl:template match="item/list/item" mode="namesToDocs">
        <relation ref="http://www.cidoc-crm.org/html/5.0.4/cidoc-crm.html#P67" active="{concat('http://mapoflondon.uvic.ca/spelling_variants.htm#',parent::list/@xml:id)}" passive="{jt:resolveMol(ref/@target)}"/>
    </xsl:template>
    
    <xsl:template match="div/list/head" mode="namesToDocs"/>
    
    
    <xsl:template match="div/list/item/ref" mode="alternateNames">
        <xsl:param name="parentUri" tunnel="yes"/>
        <relation ref="http://www.geonames.org/ontology/documentation.html#alternateName" mutual="{concat($parentUri,' ','http://mapoflondon.uvic.ca/spelling_variants',@target)}"/>
    </xsl:template>
    
    <xsl:template match="div/list/item/*[not(self::ref)]" mode="alternateNames"/>
   
    <!--<xd:doc>
        <xd:desc>Identity transform</xd:desc>
    </xd:doc>
    <xsl:template match="@*|node()" priority="-1">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>-->
    
    <xsl:function name="jt:resolveMol">
        <xsl:param name="in"/>
        <!--Note that the molUri won't work until the beta site is released-->
        <xsl:variable name="molUri" select="'http://mapoflondon.uvic.ca/'"/>
        <xsl:variable name="suffix" select="'.htm'"/>
        <xsl:choose>
            <xsl:when test="starts-with($in,'mol:')">
                <xsl:value-of select="concat($molUri,substring-after($in,'mol:'),$suffix)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat($molUri,$in,$suffix)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
</xsl:stylesheet>