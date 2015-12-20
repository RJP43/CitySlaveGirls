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
                <xsl:choose>
                    <xsl:when test="//w"><link rel="stylesheet" type="text/css" href="../style/style.css"/></xsl:when>
                    <xsl:otherwise><link rel="stylesheet" type="text/css" href="../style/style2.css"/></xsl:otherwise>
                </xsl:choose>
                <script type="text/javascript" src="../style/saidToggle.js">***</script>
            </head>
            <body>
                <xsl:comment>#include virtual="../top.html"</xsl:comment>
                <div id="article">
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
                    <div id="articleLinks">
                        <p>To view the XSLT used in generating this page, click <a href="https://github.com/RJP43/CitySlaveGirls-ChicagoDailyTimes1888/blob/master/Website2015/webDevelopment/articleXMLtoHTML.xsl">here</a>.</p>
                        <p>To view the original TEI markup of this article, click <a href="../ChicagoTimes_XML_gender/{//teiHeader//title//@when}-ChTimes.xml">here</a>.</p>
                        <p>The <i>italicized</i> segments in the article represent dialogue (marked up using &lt;said&gt; elements). The <b>bold-faced</b> words are the names of companies Nelson exposed. The <u>underlined</u> text is the addresses of those exposed companies.</p>
                    </div>
                <div class="articleText">
                    <xsl:apply-templates select="//div[@type='articleBody'][1]"/>
                </div>
                <xsl:if test="//div[@type='headlines'][2]">
                    <hr />
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
                    <hr />
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
                        <h3><xsl:text>The following is an advertisement that was featured at the end of this article.</xsl:text></h3>
                        <h2><xsl:apply-templates select="//div[@type='advertisement']/head"/></h2>
                        <xsl:apply-templates select="//div[@type='advertisement']//p"/>
                    </div>
                </xsl:if>
                </div>
                <xsl:if test="//w">
                <div id="table">
                    <div id="tableTitle">
                        <h3><xsl:text>Nell Nelson's Distinct Vocabulary</xsl:text></h3>
                        <h4><xsl:text>Article: </xsl:text><xsl:apply-templates select="//title/@corresp"/><xsl:text> [</xsl:text><xsl:apply-templates select="//teiHeader//title//@when"/><xsl:text>]</xsl:text></h4>
                    </div>           
                    <p class="tableText">The following table is a visualization of the nouns used in this article with their associated adjectives and possessive pronouns. We tagged all nouns and pronouns with the element 'w', with @type specifying if the word was being used a noun or adjective. For nouns, @ana was used if the word was directly linked to one of our character archetypes (Nell Nelson, working girl, foreperson, employer, employee, benefactor, messenger, or unidentified). For adjectives, @ana was used to label the 'stem' of the word (example: lazy, lazier, and laziest all have the same @ana='lazy'). For possessive pronouns, @subtype='poss' was added. For this adjective form, the @ana represents the character archetype taking posession. The nouns, adjectives, and possessive pronouns were linked with the element 'seg'.</p>
                    <p class="tableText">Our purpose behind this tagging was to exemplify Nell Nelson's distinct vocabulary.
                        We asked, when exposing the plight of the working girl, what language do both Nelson
                        and the people she conversed with use? For the possesive pronouns, what nouns are
                        owned, who is taking ownership of what (or who) is being owned?</p>
                    <table>
                        <tr>
                            <th>Possessive Adjectives</th>
                            <th>Adjectives</th>
                            <th>Nouns</th>
                        </tr>
                        <xsl:apply-templates select="//seg" mode="table"/>
                    </table>
                </div>
                </xsl:if>
                
                <xsl:comment>#include virtual="../foot.html"</xsl:comment>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="item">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="orgName[@type='exposedCompany']">
        <strong><xsl:apply-templates/></strong>
    </xsl:template>
    <xsl:template match="placeName[@type='address']">
        <u><xsl:apply-templates/></u>
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
    <xsl:template match="seg[w[@type='noun']]" mode="table">
        <tr>
            <td>
                <xsl:for-each select="./w[@type = 'adj' and @subtype and @ana[contains(., '#')]]">
                    <xsl:apply-templates/><br />
                    <xsl:text>(in reference to </xsl:text><xsl:apply-templates select="./@ana"/><xsl:text>)</xsl:text>
                    
                </xsl:for-each>
            </td>
            <td>
                <xsl:for-each select="./w[@type = 'adj' and not(@subtype)]">
                    <xsl:apply-templates/>
                    <br />
                </xsl:for-each>
            </td>
            <td>
                <xsl:for-each select="./w[@type = 'noun']">
                    <xsl:apply-templates/>
                    <xsl:if test="./@ana[contains(., '#')]">
                        <br />
                        <xsl:text>(in reference to </xsl:text><xsl:apply-templates select="@ana"/><xsl:text>)</xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>