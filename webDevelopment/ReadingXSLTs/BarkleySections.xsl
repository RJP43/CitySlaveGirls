<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:apply-templates select="//teiHeader//title[@level='a']"/>
                </title>
                <link rel="stylesheet" type="text/css" href="style/style.css"/>
                <link href="http://fonts.googleapis.com/css?family=Yellowtail" rel="stylesheet"
                    type="text/css"/>
            </head>
            <body>
                <xsl:comment>#include virtual="top.html"</xsl:comment>
                <div id="articleSection">
                    <div id="sectionHead">
                        <h1>The White Slave Girls of Chicago</h1>
                        <h2><xsl:apply-templates select="//teiHeader//title[@level='a']"/></h2>
                    </div>
                    <div class="headlinesText">
                        <ul>
                            <xsl:apply-templates select="//div[@type = 'headlines']//item"/>
                        </ul>
                    </div>
                    <div class="articleText">
                        <xsl:apply-templates select="//div[@type = 'sectionBody']"/>
                    </div>
                </div>
                <xsl:comment>#include virtual="foot.html"</xsl:comment>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="item">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
<xsl:template match="lb">
    <br/>
</xsl:template>
</xsl:stylesheet>