<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <html>
        <head>
            <title>Nell Nelson's Distinct Vocabulary</title>
            <link rel="stylesheet" type="text/css" href="./style/style.css"/>
        </head>
        
        <body>
            <xsl:comment>#include virtual="top.html"</xsl:comment>
            <h1>Nell Nelson's Distinct Vocabulary</h1>
            <h2><xsl:apply-templates select="//head//ref"/></h2>
            <h3><xsl:apply-templates select="//head//date"/></h3>
            <div id="table">
                <table>
                <tr>
                    <th>Possessive Adjectives</th>
                    <th>Adjectives</th>
                    <th>Nouns</th>
                </tr>
                <xsl:apply-templates select="//seg"/>
            </table>
            </div>
            <xsl:comment>#include virtual="foot.html"</xsl:comment>
        </body>
        
    </html>
    </xsl:template>

            <xsl:template match="seg">
                <tr>
                    <td>
                        <xsl:for-each select="./w[@type = 'adj' and @subtype]">
                            <xsl:apply-templates/>
                            <br/>
                        </xsl:for-each>
                    </td>
                    <td>
                        <xsl:for-each select="./w[@type = 'adj' and not(@subtype)]">
                            <xsl:apply-templates/>
                            <br/>
                        </xsl:for-each>
                    </td>
                    <td>
                        <xsl:for-each select="./w[@type = 'noun']">
                            <xsl:apply-templates/>
                            <br/>
                        </xsl:for-each>
                    </td>
                </tr>
            </xsl:template>
</xsl:stylesheet>