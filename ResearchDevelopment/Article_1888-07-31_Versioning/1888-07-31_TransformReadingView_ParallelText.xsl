<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xhtml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <meta name="description" content="NellNelson_CitySlaveGirls"/>
                <meta name="author" content="RebeccaParker"/>
                <title>
                    <xsl:text>Variorum of “City Slave Girls” Newspaper Article Originally Published in the </xsl:text>
                    <em>Chicago Times</em>
                    <xsl:text> on July 30th, 1888</xsl:text>
                </title>
                <!--<link rel="stylesheet" type="text/css" href="css/custom.css"/>
                <link rel="stylesheet"
                    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
                <link href="http://fonts.googleapis.com/css?family=Yellowtail" rel="stylesheet"/>
                <script type="text/javascript" src="js/saidToggle.js">/**/</script>-->
                <!-- RJP: If later decide to incorporate this into the Nelson project site, uncomment for project stylesheets. -->
            </head>
            <body>
                <!--<xsl:comment>#include virtual="top.html"</xsl:comment>--><!-- RJP: If later decide to incorporate this into the Nelson project site, uncomment for top navigation. -->
            <xsl:apply-templates select="descendant::div[@type='article']"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="wit[(contains(@id,'WSFA_01'))]">
        <span class="WSFA1">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="wit[(contains(@id,'WSG_04'))]">
        <span class="WSG4">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="wit[(contains(@id,'WSG_05'))]">
        <span class="WSG5">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="wit[(contains(@id,'CT_02'))]">
        <span class="CT2">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="wit[(contains(@id,'CT_01'))]">
        <span class="CT1">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
</xsl:stylesheet>
