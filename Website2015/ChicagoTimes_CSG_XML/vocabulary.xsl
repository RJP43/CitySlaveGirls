<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    <xsl:variable name="nelsonColl" select="collection('.')"/>


    <xsl:template match="/">
        <html>
            <head>
                <title/>
            </head>

            <body>
                <h1>Nell Nelson's Distinct Vocabulary</h1>
                <table>
                    <tr>
                        <th>Possessive Adjectives</th>
                        <th>Adjectives</th>
                        <th>Nouns</th>
                    </tr>
                    <xsl:apply-templates select="//seg"/>
                </table>
                <br/>
                <h2>List of Adjectives</h2>
                <ul>
                    <xsl:apply-templates select="//w[@type = 'adj' and not(@subtype)]"/>
                </ul>
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


    <xsl:template match="w[@type = 'adj' and not(@subtype)]">
        <xsl:for-each select="."><!--$nelsonColl//div[@type='articleBody']//-->
            <!--/distinct-values(@ana)-->
            <li>
                <xsl:apply-templates/>
            </li>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
