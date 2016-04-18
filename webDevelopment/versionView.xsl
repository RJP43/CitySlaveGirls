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
                    <xsl:apply-templates select="//teiHeader//title/@corresp"/>
                </title>
                <link rel="stylesheet" type="text/css" href="style/style.css"/>
                <link href="http://fonts.googleapis.com/css?family=Yellowtail" rel="stylesheet"
                    type="text/css"/>
                <script type="text/javascript" src="style/saidToggle.js">/**/</script>
            </head>
            <body>
                <xsl:comment>#include virtual="top.html"</xsl:comment>
                <div id="article">
                    <div id="articleHead">
                        <h1>The Chicago Times</h1>
                        <h2>"City Slave Girls"</h2>
                        <h3>
                            <xsl:apply-templates select="//teiHeader//title/date"/>
                        </h3>
                    </div>
                    <div class="headlinesText">
                        <ul>
                            <xsl:apply-templates select="//div[@type = 'headlines'][1]//item"/>
                        </ul>
                    </div>
                    <hr/>
                    <div class="articleText">
                        <xsl:apply-templates select="//div[@type = 'articleBody'][1]"/>
                    </div>
                    <xsl:if test="//div[@type = 'headlines'][2]">
                        <hr/>
                        <div class="headlinesText">
                            <ul>
                                <xsl:apply-templates select="//div[@type = 'headline'][1]//item"/>
                            </ul>
                            <hr/>
                            <ul>
                                <xsl:apply-templates select="//div[@type = 'headlines'][2]//item"/>
                            </ul>
                        </div>
                        <hr/>
                        <div class="articleText">
                            <xsl:apply-templates select="//div[@type = 'articleBody'][2]"/>
                        </div>
                    </xsl:if>
                    <xsl:if test="//div[@type = 'headlines'][3]">
                        <hr/>
                        <div class="headlinesText">
                            <ul>
                                <xsl:apply-templates select="//div[@type = 'headline'][2]//item"/>
                            </ul>
                            <hr/>
                            <ul>
                                <xsl:apply-templates select="//div[@type = 'headlines'][3]//item"/>
                            </ul>
                        </div>
                        <hr/>
                        <div class="articleText">
                            <xsl:apply-templates select="//div[@type = 'articleBody'][3]"/>
                        </div>
                    </xsl:if>
                    <xsl:if test="//div[@type = 'advertisement']">
                        <div id="advertisement">
                            <h3>
                                <xsl:text>The following is an advertisement pertaining to the series that was featured at the end of this article.</xsl:text>
                            </h3>
                            <h2>
                                <xsl:apply-templates select="//div[@type = 'advertisement']/head"/>
                            </h2>
                            <xsl:apply-templates select="//div[@type = 'advertisement']//p"/>
                        </div>
                    </xsl:if>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="item">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="said">
<xsl:text>"</xsl:text><i><xsl:apply-templates/></i><xsl:text>"</xsl:text>
    </xsl:template>
    <xsl:template match="rdg">
        <xsl:if test="@wit[contains(.,'#CT')]">
            <span class="CT"><xsl:apply-templates/></span>
        </xsl:if>
        <xsl:if test="@wit[contains(.,'#WSGC')]"><span class="WSGC"><xsl:apply-templates/></span></xsl:if>
    </xsl:template>
    <!--<xsl:template match="said">
        <xsl:choose> 
            <xsl:when test="@who='#nellNelson'"><span class="nellNelson"><xsl:text>"</xsl:text><i><xsl:apply-templates/></i><xsl:text>"</xsl:text></span></xsl:when>
            <xsl:when test="@who='#workingGirl'"><span class="workingGirl"><xsl:text>"</xsl:text><i><xsl:apply-templates/></i><xsl:text>"</xsl:text></span></xsl:when>
            <xsl:when test="@ana='male'"><span class="male"><xsl:text>"</xsl:text><i><xsl:apply-templates/></i><xsl:text>"</xsl:text></span></xsl:when>
            <xsl:when test="@ana='female' and not(@who='#nellNelson')"><span class="female"><xsl:text>"</xsl:text><i><xsl:apply-templates/></i><xsl:text>"</xsl:text></span></xsl:when> 
            <xsl:otherwise>
                <xsl:text>"</xsl:text><i><xsl:apply-templates/></i><xsl:text>"</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
    <xsl:template match="hi">
        <xsl:choose>
            <xsl:when test="@rend='double'">
                <xsl:text>"</xsl:text><xsl:apply-templates/><xsl:text>"</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>'</xsl:text><xsl:apply-templates/><xsl:text>'</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
