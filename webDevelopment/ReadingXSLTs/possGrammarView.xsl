<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    
    
    <!-- rjp: STILL WORKING ON THIS! NEED TO FIGURE OUT A LOGICAL WAY TO HAVE READING VIEW THAT HIGHLIGHTS OUR GRAMMATICAL MARKUP?? -->
    
     <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:text>Relationships of Possession in Article </xsl:text><xsl:apply-templates select="//teiHeader//title//@when"/>
                </title>
                <link rel="stylesheet" type="text/css" href="../../Website/style/style.css"/>
                <link href="http://fonts.googleapis.com/css?family=Yellowtail" rel="stylesheet"
                    type="text/css"/>
            </head>
            <body>
                <xsl:comment>#include virtual="../top.html"</xsl:comment>
                <div id="svgContainer">
                    <!--rjp: Want to call on the network for each article based on if the networks filename matches the date of the article so that the specific network for each article appears before the reading view. -->
                </div>
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
                            <div class="headlinesTitle">
                                <ul><xsl:apply-templates select="//div[@type = 'headline'][1]//item"/></ul>
                                
                            </div>
                            <div class="headlinesText">
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
                            <div class="headlinesTitle">
                                <ul><xsl:apply-templates select="//div[@type = 'headline'][2]//item"/></ul>
                                
                            </div>
                            <div class="headlinesText">
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
                <xsl:comment>#include virtual="../foot.html"</xsl:comment>
            </body>
        </html>
    </xsl:template>    
    <xsl:template match="sic">
        <span title="Spelling retained from original article: {following-sibling::*}"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="reg"/>
    <xsl:template match="item">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="said">
        <q class="dialogue"><xsl:apply-templates/></q>
    </xsl:template><!-- rjp: This is the generic rule for dialogue when the dialogue is not the focus of the selected XSLT filter! -->
    <xsl:template match="rdg">
        <xsl:choose>
            <xsl:when test="@wit[contains(., '#CT')]">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
    </xsl:template><!-- rjp: For filters that are not focused on version comparison, this rule selects the reading of the original article as the only one that appears. -->
    <xsl:template match="hi">
        <xsl:choose>
            <xsl:when test="@rend='double'">
                <q class="double"><xsl:apply-templates/></q>
            </xsl:when>
            <xsl:otherwise>
                <q class="single"><xsl:apply-templates/></q>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="unclear">
        <xsl:choose>
            <xsl:when test="./supplied"><xsl:apply-templates/></xsl:when>
            <xsl:otherwise><span title="Due to the poor quality of this article's photocopy, the text is unclear and could not be transcribed."><xsl:text>[MISSING TEXT]</xsl:text></span></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="name[@ref='#CT']">
        <span class="chicTimes">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="orgName">
        <xsl:choose>
            <xsl:when test="@type='exposedCompany'"><span class="exposComp">
                <span class="{@ref/substring-after(.,'#')}"><xsl:apply-templates/></span>
            </span>
            </xsl:when>
            <xsl:otherwise><span class="org"><span class="{@ref/substring-after(.,'#')}"><xsl:apply-templates/></span></span></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="placeName">
        <xsl:choose>
            <xsl:when test="@type='address'"><span class="address">
                <span class="{@ref/substring-after(.,'#')}"><xsl:apply-templates/></span></span></xsl:when>
            <xsl:otherwise><span class="place"><xsl:apply-templates/></span></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>