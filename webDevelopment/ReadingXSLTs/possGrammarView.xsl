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
                            <h2><xsl:text>Article: </xsl:text><xsl:apply-templates select="//title/@corresp"/><xsl:text> [</xsl:text><xsl:apply-templates select="//teiHeader//title//@when"/><xsl:text>]</xsl:text></h2>
                        </div>           
                        <p class="tableText">The following table correlates with the above graph and highlights the possesive relationships seen in this article.</p>
                        <table id="network">
                            <tr>
                                <th>Possessive Pronouns/Nouns</th>
                                <th>Possessed Nouns</th>
                                <th>Context</th>
                            </tr>
                            <xsl:apply-templates select="//seg"/>
                        </table>
                    </div>
            </body>
        </html>
     </xsl:template>
    <xsl:template match="seg">
        <tr>
            <td>
                <xsl:for-each select="//w[@type='poss']">
                    <xsl:apply-templates/>
                    <br/>
                    <xsl:if test=".[@ana]">
                    <xsl:text>(in reference to </xsl:text><xsl:apply-templates select="./@ana"/><xsl:text>)</xsl:text>
                    </xsl:if>
                    
                </xsl:for-each>
            </td>
            <td>
                <xsl:for-each select="//w[@type='noun']">
                    <xsl:apply-templates/>
                    <br/>
                    <xsl:if test=".[@ana]">
                        <xsl:text>(in reference to </xsl:text><xsl:apply-templates select="./@ana"/><xsl:text>)</xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </td>
            <td>
                <xsl:for-each select=".">
                    <xsl:apply-templates/>
                </xsl:for-each>
            </td>
        </tr>
    </xsl:template>
    <!--<xsl:template match="rdg[@wit[contains(.,'#WSGC')]]"/>-->
</xsl:stylesheet>