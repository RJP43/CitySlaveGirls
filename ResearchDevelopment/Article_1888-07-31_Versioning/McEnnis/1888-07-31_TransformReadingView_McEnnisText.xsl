<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xhtml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <meta name="description" content="NellNelson_CitySlaveGirls"/>
                <meta name="author" content="RebeccaParker"/>
                <title>
                    <xsl:text>The White Slaves of Free America</xsl:text>
                </title>
                <!--<link rel="stylesheet" type="text/css" href="css/custom.css"/>
                <link rel="stylesheet"
                    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
                <link href="http://fonts.googleapis.com/css?family=Yellowtail" rel="stylesheet"/>
                <script type="text/javascript" src="js/saidToggle.js">/**/</script>-->
                <!-- RJP: If later decide to incorporate this into the Nelson project site, uncomment for project stylesheets. -->
            </head>
            <body>
                <!--<xsl:comment>#include virtual="top.html"</xsl:comment>-->
                <!-- RJP: If later decide to incorporate this into the Nelson project site, uncomment for top navigation. -->
                <h1>John T. McEnnis's <em>The White Slaves of Free America</em> Republication of
                    “City Slave Girls” Newspaper Article Originally Published in the <em>Chicago
                        Times</em> on July 30th, 1888</h1>
                <xsl:apply-templates select="normalize-space(descendant::div[@type='article'])"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="wit[contains(@id,'WSFA_01')]">
                <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="wit[not(contains(@id,'WSFA_01'))]">
        
    </xsl:template>
    <xsl:template match="hi[@rend='italics']">
        <em><xsl:apply-templates/></em>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    
    

</xsl:stylesheet>
