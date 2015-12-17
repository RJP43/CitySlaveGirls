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
                <h1>The Chicago Times</h1>
                <h2>"City Slave Girls"</h2>
                <h3><xsl:apply-templates select="//teiHeader//title/date"/></h3>
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
    <xsl:template match="said">
        <xsl:choose> 
            <xsl:when test="@who='#nellNelson'"><span class="nellNelson"><i><xsl:apply-templates/></i></span></xsl:when>
            <xsl:when test="@who='#workingGirl'"><span class="workingGirl"><i><xsl:apply-templates/></i></span></xsl:when>
            <xsl:when test="@ana='male'"><span class="male"><i><xsl:apply-templates/></i></span></xsl:when>
            <xsl:when test="@ana='female' and not(@who='#nellNelson')"><span class="female"><i><xsl:apply-templates/></i></span></xsl:when> 
            <xsl:otherwise>
                <i><xsl:apply-templates/></i>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="unclear">
        <xsl:if test="./supplied"><xsl:apply-templates/>
            <else><span title="Due to poor quality of the article's photocopy, the text is unclear"><xsl:text>[MISSING TEXT]</xsl:text></span></else>
        </xsl:if>
    </xsl:template>
    

    
</xsl:stylesheet>