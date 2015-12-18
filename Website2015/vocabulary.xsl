<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    <xsl:variable name="nelsonColl" select="collection('ChicagoTimes_CSG_XML')"/>


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
                    <!--<xsl:apply-templates select="$nelsonColl//text//title" mode="adj"/>-->
                    <xsl:for-each-group select="$nelsonColl//div[@type='articleBody']//w[@type = 'adj' and not(@subtype)]/@ana" group-by="$nelsonColl//div[@type='articleBody']//w[@type = 'adj' and not(@subtype)]/string(@ana)">
                        <xsl:sort select="count($nelsonColl//div[@type='articleBody']//w[string(@ana) eq current-grouping-key()])" order="descending"/>
                        <xsl:for-each select="current-grouping-key()">
                            <li>
                                <xsl:value-of select="current-grouping-key()"/>
                                <xsl:text>[Count: </xsl:text>
                                <xsl:value-of select="count($nelsonColl//div[@type='articleBody']//w[string(@ana) eq current-grouping-key()])"/>
                                <xsl:text>]</xsl:text>
                            </li>
                        </xsl:for-each>
                    </xsl:for-each-group>
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


   <!-- <xsl:template match="text//title" mode="adj">
        <xsl:for-each-group select="$nelsonColl//div[@type='articleBody']//w[@type = 'adj' and not(@subtype)]/@ana" group-by="$nelsonColl//div[@type='articleBody']//w[@type = 'adj' and not(@subtype)]/string(@ana)">
            <xsl:sort select="count($nelsonColl//div[@type='articleBody']//w[string(@ana) eq current-grouping-key()])" order="descending"/>
            <xsl:for-each select="current-grouping-key()">
            <li>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>[Count: </xsl:text>
                <xsl:value-of select="count($nelsonColl//div[@type='articleBody']//w[string(@ana) eq current-grouping-key()])"/>
                <xsl:text>]</xsl:text>
            </li>
            </xsl:for-each>
        </xsl:for-each-group>
        <!-\-<ul>
            <xsl:for-each-group select="$nelsonColl//articleBody//*" group-by="$nelsonColl//articleBody//*/name()">
                <xsl:sort select="count($nelsonColl//articleBody//*[name() eq current-grouping-key()])" order="descending"/>
                <xsl:for-each select="current-grouping-key()">
                    <li>
                        <xsl:value-of select="current-grouping-key()"/>
                        <xsl:text>[Count: </xsl:text>
                        <xsl:value-of select="count($nelsonColl//articleBody//*[name() eq current-grouping-key()])"/>
                        <xsl:text>]</xsl:text>
                    </li>
                </xsl:for-each>
            </xsl:for-each-group>
            <!-\\- ras: Aha! It taks forever to run, but it works!, thanks, #ebb! -\\->
        </ul>-\->
    </xsl:template>-->

</xsl:stylesheet>
