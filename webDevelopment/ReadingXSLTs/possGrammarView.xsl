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
                    <xsl:text>Relationships of Possession in Article </xsl:text><xsl:apply-templates select="//teiHeader//title//@when"/>
                </title>
                <link rel="stylesheet" type="text/css" href="../style/style.css"/>
                <link href="http://fonts.googleapis.com/css?family=Yellowtail" rel="stylesheet"
                    type="text/css"/>
            </head>
            <body>
                <xsl:comment>#include virtual="../top.html"</xsl:comment>
                <div id="networkSVG">
                    
                </div>
                <div id="table">
                    <div id="tableTitle">
                        <h3><xsl:text>Nell Nelson's Distinct Vocabulary</xsl:text></h3>
                        <h4><xsl:text>Article: </xsl:text><xsl:apply-templates select="//title/@corresp"/><xsl:text> [</xsl:text><xsl:apply-templates select="//teiHeader//title//@when"/><xsl:text>]</xsl:text></h4>
                    </div>           
                    <p class="tableText">The following table is a visualization of the nouns used in this article with their associated adjectives and possessive pronouns. We tagged all nouns, possesive pronouns, and adjectives with the element 'w', with @type specifying if the word was being used as a noun or adjective. For nouns, @ana was used if the word was directly linked to one of our character archetypes (Nell Nelson, working girl, foreperson, employer, employee, benefactor, messenger, or unidentified). For adjectives, @ana was used to label the 'stem' of the word (example: lazy, lazier, and laziest all have the same @ana='lazy'). For possessive pronouns, @subtype='poss' was added. For this adjective form, the @ana represents the character archetype taking posession. The nouns, adjectives, and possessive pronouns were linked with the element 'seg'.</p>
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
            </body>
        </html>
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
    <xsl:template match="rdg[@wit[contains(.,'#WSGC')]]"/>
</xsl:stylesheet>