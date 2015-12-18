<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>

    <!-- ras: Chart Size Variables -->
    <xsl:variable name="Interval" select="60"/>
    <xsl:variable name="barWidth" select="45"/>
    <xsl:variable name="yAxisStart" select="0"/>
    <xsl:variable name="yAxisEnd" select="-500"/>
    <xsl:variable name="xAxisStart" select="30"/>
    <xsl:variable name="xAxisEnd" select="((4 + 1) * $Interval) - ($barWidth div 2)"/>
    <!-- ras: Legend Variables -->
    <xsl:variable name="xLegend" select="$xAxisEnd + 30"/>
    <xsl:variable name="yLegendStart" select="-375"/>
    <xsl:variable name="yLegendInterval" select="26"/>
    <xsl:variable name="legendFontSize" select="18"/>
    <xsl:variable name="legendBoxWidth" select="20"/>

    <!-- ras: Variable for collection -->
    <xsl:variable name="nelsonColl" select="collection('ChicagoTimes_CSG_XML')"/>

    <!-- ras: Template Match for Document Output -->
    <xsl:template match="/">
        <svg width="100%" height="125%">
            <g transform="translate(60,600)">


                <!-- ras: Y-Axis -->
                <line x1="{$xAxisStart}" y1="{$yAxisStart}" x2="{$xAxisStart}" y2="{$yAxisEnd}"
                    stroke="black" stroke-width="1"/>
                <!-- ras: X-Axis -->
                <line x1="{$xAxisStart}" y1="{$yAxisStart}" x2="{$xAxisEnd}" y2="{$yAxisStart}"
                    stroke="black" stroke-width="1"/>
                <!-- ras: Title -->
                <text x="{($xAxisEnd + $xAxisStart) div 2}" y="{$yAxisEnd - 20}"
                    text-anchor="middle" font-size="28"> Gender Representation through Dialogue in
                    Collection of Chicago Times Articles </text>
                <!-- ras: Y-Axis Labels -->
                <text x="{$xAxisStart - 30}" y="{($yAxisEnd + $yAxisStart) div 4}" font-size="14">
                    25% </text>
                <text x="{$xAxisStart - 30}" y="{($yAxisEnd + $yAxisStart) div 2}" font-size="14">
                    50% </text>
                <text x="{$xAxisStart - 30}" y="{(($yAxisEnd + $yAxisStart) * 3) div 4}"
                    font-size="14"> 75% </text>
                <!-- ras: change percents later to word count -->


                <!-- ras: Dotted line at halfway -->
                <line x1="{$xAxisStart}" y1="{($yAxisEnd + $yAxisStart) div 2}" x2="{$xAxisEnd}"
                    y2="{($yAxisEnd + $yAxisStart) div 2}" stroke="blue" stroke-width="2"
                    stroke-dasharray="5, 5"/>


                <!-- ras: Drawing Bar Graph -->
                <xsl:variable name="maxYValue" select="max($nelsonColl//said[not(@ana='unknown')]/string-length())"/>
                <line x1="{$Interval}" x2="{$Interval}" y1="{$yAxisStart}" y2="{($nelsonColl//said[@ana='male']/string-length) div $maxYValue * $yAxisEnd}"/>


            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>
