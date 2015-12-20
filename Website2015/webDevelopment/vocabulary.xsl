<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    <xsl:variable name="nelsonColl" select="collection('../ChicagoTimes_XML_grammar')"/>


    <xsl:template match="/">
        <html>
            <head>
                <title>List of Adjectives over Collection of Articles</title>
            </head>
<body>
                <h1>List of Adjectives</h1> 
    <h2>Articles <a href="/articles/1888-07-30">7/30/1888</a>, <a  href="/articles/1888-08-02">8/2/1888</a>, <a  href="/articles/1888-08-04">8/4/1888</a> and <a  href="/articles/1888-08-09">8/9/1888</a></h2>
                    <ul>
                    <xsl:for-each-group select="$nelsonColl//div[@type='articleBody']//w[@type = 'adj' and not(@subtype)]/@ana" group-by="$nelsonColl//div[@type='articleBody']//w[@type = 'adj' and not(@subtype)]/string(@ana)">
                        <xsl:sort select="count($nelsonColl//div[@type='articleBody']//w[string(@ana) eq current-grouping-key()])" order="descending"/>
                        <xsl:for-each select="current-grouping-key()">
                            <xsl:if test="count($nelsonColl//div[@type='articleBody']//w[string(@ana) eq current-grouping-key()]) &gt; 2">
                            <li>
                                <xsl:value-of select="current-grouping-key()"/>
                                <xsl:text>[Count: </xsl:text>
                                <xsl:value-of select="count($nelsonColl//div[@type='articleBody']//w[string(@ana) eq current-grouping-key()])"/>
                                <xsl:text>]</xsl:text>
                            </li>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each-group>
                </ul>
</body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
