<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title></title>
                <link rel="stylesheet" type="text/css" href="../style/style.css"/>
            </head>
            <body>
                <ul>
                <xsl:apply-templates select="//div[@type='headlines']"/>
                </ul>
                <hr/>
                <xsl:apply-templates select="//div[@type='articleBody']"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="div[@type='headlines']">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="orgName">
        <strong><xsl:apply-templates/></strong>
    </xsl:template>
    <xsl:template match="said[@who]">
        <xsl:choose> 
            <xsl:when test="@who='nellNelson'"><span class="nellNelson"><xsl:apply-templates/></span></xsl:when>
            <xsl:when test="@who='workingGirl'"><span class="workingGirl"><xsl:apply-templates/></span></xsl:when>
            <xsl:otherwise>
                <span class="general"><xsl:apply-templates/></span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--<xsl:template match="rs">
        
    </xsl:template>-->
    
</xsl:stylesheet>