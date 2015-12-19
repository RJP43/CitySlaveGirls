<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Article <xsl:apply-templates select="//teiHeader//title/@corresp"/></title>
                <link rel="stylesheet" type="text/css" href="../style/style.css"/>
                <script type="text/javascript" src="../style/saidToggle.js">***</script>
            </head>
            <body>
                <xsl:comment>#include virtual="../top.html"</xsl:comment>
                <div id="articleHead">
                    <h1>The Chicago Times</h1>
                    <h2>"City Slave Girls"</h2>
                    <h3><xsl:apply-templates select="//teiHeader//title/date"/></h3>
                </div>
                <div class="headlinesText">
                    <ul>
                        <xsl:apply-templates select="//div[@type='headlines'][1]//item"/>
                    </ul>
                </div>
                <hr/>
                <div id="checkboxes">
                    <h3>Click to Toggle Colored Dialogue</h3>
                    <h4>Based on Speaker Attributes</h4>
                    <ul><xsl:if test="//said[@who='#nellNelson']">
                        <li><input type="checkbox" value="nellNelson"/><span class="nellNelson">Nell Nelson</span></li></xsl:if>
                        <xsl:if test="//said[@who='#workingGirl']">
                            <li><input type="checkbox" value="workingGirl"/><span class="workingGirl">Working Girl</span></li></xsl:if>
                        <xsl:if test="//said[@ana='male']">
                            <li><input type="checkbox" value="male"/><span class="male">Male</span></li></xsl:if>
                        <xsl:if test="//said[@ana='female' and not(@who='#nellNelson')]">
                            <li><input type="checkbox" value="female"/><span class="female">Female</span></li></xsl:if>
                    </ul>
                </div>
                <div class="articleText">
                    <xsl:apply-templates select="//div[@type='articleBody'][1]"/>
                </div>
                <xsl:if test="//div[@type='headlines'][2]">
                    <div class="headlinesText">
                        <ul>
                            <xsl:apply-templates select="//div[@type='headlines'][2]//item"/>
                        </ul> 
                    </div>
                    <hr />
                        <div class="articleText">
                            <xsl:apply-templates select="//div[@type='articleBody'][2]"/>
                        </div> 
                </xsl:if>
                <xsl:if test="//div[@type='headlines'][3]">
                    <div class="headlinesText">
                        <ul>
                        <xsl:apply-templates select="//div[@type='headlines'][3]//item"/>
                        </ul>   
                    </div>
                        <hr />
                    <div class="articleText">
                        <xsl:apply-templates select="//div[@type='articleBody'][3]"/>
                    </div>
                   
                </xsl:if>
                <xsl:if test="//div[@type='advertisement']">
                    <div id="advertisement">
                        <xsl:apply-templates select="//div[@type='advertisement']"/>
                    </div>
                </xsl:if>
                <xsl:comment>#include virtual="../foot.html"</xsl:comment>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="item">
        <li><xsl:apply-templates/></li>
    </xsl:template>
   <!-- <xsl:template match="div[@type='headlines'][2]/list">
        <li><xsl:apply-templates select="./item"/></li>
    </xsl:template>
    <xsl:template match="div[@type='headlines'][3]/list">
        <li><xsl:apply-templates select="./item"/></li>
    </xsl:template>-->
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
        <xsl:choose>
            <xsl:when test="./supplied"><xsl:apply-templates/></xsl:when>
            <xsl:otherwise><span title="Due to poor quality of the article's photocopy, the text is unclear"><xsl:text>[MISSING TEXT]</xsl:text></span></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>