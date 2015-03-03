<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xhtml" encoding="utf-8" indent="yes"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <!--<xsl:strip-space elements="day month year"/>-->
    <xsl:template match="/">
        <html>
        <div class="htmlView">
            <head>
                <h1>
                    <xsl:apply-templates select="//newspaperTitle/date"/><!--article date-->
                </h1>
                <h2>
                    <xsl:apply-templates select="//seriesTitle"/><!--series title-->
                </h2>
                <h3>
                    <xsl:apply-templates select="//newspaperTitle/num"/><!--price-->
                </h3>
            </head>
            <div id="headLine">
                <xsl:apply-templates select="//head/headLine"/>
            </div>
            <body>
                <xsl:apply-templates select="//articleBody"/>
            </body>
        </div>
        </html>
        </xsl:template>
    
 
    <xsl:template match="mascVoice| nellVoice| femVoice">
        <p>
            <b><xsl:value-of select="./name()"/><xsl:text>: </xsl:text></b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    </xsl:stylesheet>