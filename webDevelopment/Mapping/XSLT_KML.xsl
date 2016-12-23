<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.opengis.net/kml/2.2"
    xmlns:gx="http://www.google.com/kml/ext/2.2"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="3.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <kml>
            <Document>
                <xsl:apply-templates
                    select="descendant::div[@type = 'companies']/descendant::listOrg"/>
            </Document>
        </kml>
    </xsl:template>
    <xsl:template match="org[not(descendant::geo)]"> </xsl:template>
    <xsl:template match="org[descendant::geo]">
        <Placemark>
            <name>
                <xsl:apply-templates select="orgName"/>
            </name>
            <description>
                <xsl:apply-templates select="descendant::desc"/>
                <xsl:if test="descendant::geo[2]">
                    <xsl:text> &#xd; Alternate coordinates: </xsl:text>
                    <xsl:apply-templates select="descendant::geo[2]"/>
                </xsl:if>
            </description>
            <Point>
                <coordinates>
                    <xsl:value-of select="descendant::geo[1]/tokenize(., ',')[2]"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="descendant::geo[1]/tokenize(., ',')[1]"/>
                </coordinates>
            </Point>
        </Placemark>
    </xsl:template>

</xsl:stylesheet>
