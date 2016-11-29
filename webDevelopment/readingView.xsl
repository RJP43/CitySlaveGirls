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
                    <xsl:text>Article </xsl:text>
                    <xsl:apply-templates select="//teiHeader//title//@when"/>
                </title>
                <link rel="stylesheet" type="text/css" href="css/custom.css"/>
                <link rel="stylesheet"
                    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
                <link href="http://fonts.googleapis.com/css?family=Yellowtail" rel="stylesheet"/>
                <script type="text/javascript" src="js/saidToggle.js">/**/</script>
            </head>
            <body>
                <xsl:comment>#include virtual="top.html"</xsl:comment>
                <div id="checkboxes" class="col-xs-3">
                    <h3 class="text-center">Toggle Dialogue by Archetype</h3>

                    <ul>
                        <xsl:if test="//said[@who = '#nellNelson']">
                            <li>
                                <input type="checkbox" value="nellNelson"/>
                                <span class="nellNelson">Nell Nelson</span>
                            </li>
                        </xsl:if>
                        <xsl:if test="//said[@who = '#workingGirl']">
                            <li>
                                <input type="checkbox" value="workingGirl"/>
                                <span class="workingGirl">Working Girl</span>
                            </li>
                        </xsl:if>
                        <xsl:if test="//said[@who = '#employee']">
                            <li>
                                <input type="checkbox" value="employee"/>
                                <span class="employee">Employee</span>
                            </li>
                        </xsl:if>
                        <xsl:if test="//said[@who = '#employer']">
                            <li>
                                <input type="checkbox" value="employer"/>
                                <span class="employer">Employer</span>
                            </li>
                        </xsl:if>
                        <xsl:if test="//said[@who = '#foreperson']">
                            <li>
                                <input type="checkbox" value="foreperson"/>
                                <span class="foreperson">Foreperson</span>
                            </li>
                        </xsl:if>
                        <xsl:if test="//said[@who = '#benefactor']">
                            <li>
                                <input type="checkbox" value="benefactor"/>
                                <span class="benefactor">Benefactor</span>
                            </li>
                        </xsl:if>
                        <xsl:if test="//said[@who = '#messenger']">
                            <li>
                                <input type="checkbox" value="messenger"/>
                                <span class="messenger">Messenger</span>
                            </li>
                        </xsl:if>
                        <xsl:if test="//said[@who = '#promMen']">
                            <li>
                                <input type="checkbox" value="promMan"/>
                                <span class="promMan">Prominant Man</span>
                            </li>
                        </xsl:if>
                        <xsl:if test="//said[@who = '#promWomen']">
                            <li>
                                <input type="checkbox" value="promWoman"/>
                                <span class="promWoman">Prominant Woman</span>
                            </li>
                        </xsl:if>
                        <xsl:if test="//said[@who = '#reporter']">
                            <li>
                                <input type="checkbox" value="reporter"/>
                                <span class="reporter">Reporter</span>
                            </li>
                        </xsl:if>
                        <xsl:if test="//said[@who = '#inspector']">
                            <li>
                                <input type="checkbox" value="inspector"/>
                                <span class="inspector">Inspector</span>
                            </li>
                        </xsl:if>
                        <xsl:if test="//said[@who = '#unidentified']">
                            <li>
                                <input type="checkbox" value="unidentified"/>
                                <span class="unidentified">Unidentified</span>
                            </li>
                        </xsl:if>
                    </ul>
                    <a class="text-center" href="#top">Back to Beginning of Article</a>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 article" id="top">
                            <div class="articleHead">
                                <h1 class="paperTitle">The Chicago Times</h1>
                                <h2 class="seriesTitle">"City Slave Girls"</h2>
                                <h3 class="dateline" title="{//teiHeader//title/date/@when}">
                                    <xsl:apply-templates select="//teiHeader//title/date"/>
                                </h3>
                            </div>
                            <div class="headlinesText">
                                <ul>
                                    <xsl:apply-templates
                                        select="//div[@type = 'headlines'][1]//item"/>
                                </ul>
                            </div>
                            <hr/>
                            <div class="articleText">
                                <xsl:apply-templates select="//div[@type = 'articleBody'][1]"/>
                            </div>
                            <xsl:if test="//div[@type = 'headlines'][2]">
                                <hr/>
                                <div class="headlinesTitle">
                                    <ul>
                                        <xsl:apply-templates
                                            select="//div[@type = 'headline'][1]//item"/>
                                    </ul>
                                </div>
                                <div class="headlinesText">
                                    <ul>
                                        <xsl:apply-templates
                                            select="//div[@type = 'headlines'][2]//item"/>
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
                                    <ul>
                                        <xsl:apply-templates
                                            select="//div[@type = 'headline'][2]//item"/>
                                    </ul>
                                </div>
                                <div class="headlinesText">
                                    <ul>
                                        <xsl:apply-templates
                                            select="//div[@type = 'headlines'][3]//item"/>
                                    </ul>
                                </div>
                                <hr/>
                                <div class="articleText">
                                    <xsl:apply-templates select="//div[@type = 'articleBody'][3]"/>
                                </div>
                            </xsl:if>
                            <xsl:if test="//div[@type = 'advertisement']">
                                <div class="advertisement">
                                    <h4 class="text-center">
                                        <xsl:text>Series' Advertisement Printed on </xsl:text>
                                        <xsl:apply-templates select="//teiHeader//title/date"/>
                                    </h4>
                                    <h2 class="text-center">
                                        <xsl:apply-templates
                                            select="//div[@type = 'advertisement']/head"/>
                                    </h2>
                                    <xsl:apply-templates select="//div[@type = 'advertisement']//p"
                                    />
                                </div>
                            </xsl:if>
                        </div>
                    </div>

                    <hr/>
                    <xsl:comment>#include virtual="foot.html"</xsl:comment>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="rdg">
        <xsl:choose>
            <xsl:when test="following-sibling::rdg[@wit[contains(., '#WSGC')]]">
                <xsl:if test="following-sibling::rdg[@wit[contains(., '#WSGC')]] != ''">
                    <span class="var"
                        title="Altered in Barkley Publication: {following-sibling::rdg[@wit[contains(., '#WSGC')]]}">
                        <xsl:apply-templates/>
                    </span>
                </xsl:if>
                <xsl:if test="following-sibling::rdg[@wit[contains(., '#WSGC')]] = ''">
                    <span class="var" title="Excluded in Barkley Publication">
                        <xsl:apply-templates/>
                    </span>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="said">
        <xsl:choose>
            <xsl:when test="@who = '#nellNelson'">
                <span class="nellNelson">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#workingGirl'">
                <span class="workingGirl">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#employer'">
                <span class="employer">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#foreperson'">
                <span class="foreperson">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#employee'">
                <span class="employee">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#benefactor'">
                <span class="benefactor">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#messenger'">
                <span class="messenger">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#promMen'">
                <span class="promMan">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#promWomen'">
                <span class="promWoman">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#reporter'">
                <span class="reporter">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:when test="@who = '#inspector'">
                <span class="inspector">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="unknown">
                    <q class="dialogue">
                        <xsl:apply-templates/>
                    </q>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="hi">
        <xsl:choose>
            <xsl:when test="@rend = 'double'">
                <q class="double">
                    <xsl:apply-templates/>
                </q>
            </xsl:when>
            <xsl:otherwise>
                <q class="single">
                    <xsl:apply-templates/>
                </q>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="unclear">
        <xsl:choose>
            <xsl:when test="./supplied">
                <span class="unclear"
                    title="The text provided here was interpreted by a project editor because the transcription source was unclear.">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="unclear" title="The text is unclear and could not be transcribed.">
                    <xsl:text> [MISSING TEXT] </xsl:text>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="sic">
        <span title="Spelling retained from original article: {following-sibling::*}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="reg"/>
    <xsl:template match="name[@ref = '#CT']">
        <span class="chicTimes">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="orgName">
        <xsl:choose>
            <xsl:when test="@type = 'exposedCompany'">
                <span class="exposComp {@ref/substring-after(.,'#')}">
                    <xsl:apply-templates/>
                </span>

            </xsl:when>
            <xsl:otherwise>
                <span class="org">
                    <span class="{@ref/substring-after(.,'#')}">
                        <xsl:apply-templates/>
                    </span>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="placeName">
        <xsl:choose>
            <xsl:when test="@type = 'address'">
                <span class="address {@ref/substring-after(.,'#')}">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="place">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
