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
    <xsl:variable name="xAxisEnd" select="((8 + 1) * $Interval) - ($barWidth div 2)"/>
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
                <line x1="{$xAxisStart}" y1="{$yAxisStart + 1}" x2="{$xAxisStart}" y2="{$yAxisEnd}"
                    stroke="black" stroke-width="1"/>
                <!-- ras: X-Axis -->
                <line x1="{$xAxisStart}" y1="{$yAxisStart}" x2="{$xAxisEnd}" y2="{$yAxisStart}"
                    stroke="black" stroke-width="1"/>
                <!-- ras: Y-Axis Labels -->
                <text x="{$xAxisStart - 30}" y="{($yAxisEnd + $yAxisStart) div 4}" font-size="14">
                    25% </text>
                <text x="{$xAxisStart - 30}" y="{($yAxisEnd + $yAxisStart) div 2}" font-size="14">
                    50% </text>
                <text x="{$xAxisStart - 30}" y="{(($yAxisEnd + $yAxisStart) * 3) div 4}"
                    font-size="14"> 75% </text>
                
                
                <!-- ras: Legend -->
                <text x="{$xLegend}" y="{$yLegendStart}" font-size="24">Legend</text>
                <!-- ras:  Nelson  -->
                <line x1="{$xLegend + ($legendBoxWidth div 2)}"
                    y1="{$yLegendStart + $yLegendInterval}"
                    x2="{$xLegend + ($legendBoxWidth div 2)}"
                    y2="{$yLegendStart + $yLegendInterval - $legendFontSize}" stroke="green"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5}" y="{$yLegendStart +$yLegendInterval}"
                    font-size="{$legendFontSize}">Male Voice</text>
                <!-- ras: Working Girl  -->
                <line x1="{$xLegend + ($legendBoxWidth div 2)}"
                    y1="{$yLegendStart + ($yLegendInterval * 2)}"
                    x2="{$xLegend + ($legendBoxWidth div 2)}"
                    y2="{$yLegendStart + ($yLegendInterval * 2) - $legendFontSize}" stroke="red"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5}"
                    y="{$yLegendStart + ($yLegendInterval * 2)}" font-size="{$legendFontSize}"
                    >Female Voice</text>
                <!-- ras: Foreperson -->
                <line x1="{$xLegend + ($legendBoxWidth div 2)}"
                    y1="{$yLegendStart + ($yLegendInterval * 3)}"
                    x2="{$xLegend + ($legendBoxWidth div 2)}"
                    y2="{$yLegendStart + ($yLegendInterval * 3) - $legendFontSize}" stroke="orange"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5}"
                    y="{$yLegendStart + ($yLegendInterval * 3)}" font-size="{$legendFontSize}">Unknown Voice</text>
                <!-- ras: Employer -->
                <line x1="{$xLegend + ($legendBoxWidth div 2)}"
                    y1="{$yLegendStart + ($yLegendInterval * 3)}"
                    x2="{$xLegend + ($legendBoxWidth div 2)}"
                    y2="{$yLegendStart + ($yLegendInterval * 3) - $legendFontSize}" stroke="orange"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5}"
                    y="{$yLegendStart + ($yLegendInterval * 3)}" font-size="{$legendFontSize}">Unknown Voice</text>
                <!-- ras: Employee -->
                <line x1="{$xLegend + ($legendBoxWidth div 2)}"
                    y1="{$yLegendStart + ($yLegendInterval * 3)}"
                    x2="{$xLegend + ($legendBoxWidth div 2)}"
                    y2="{$yLegendStart + ($yLegendInterval * 3) - $legendFontSize}" stroke="orange"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5}"
                    y="{$yLegendStart + ($yLegendInterval * 3)}" font-size="{$legendFontSize}">Unknown Voice</text>
                <!-- ras: Benefactor -->
                <line x1="{$xLegend + ($legendBoxWidth div 2)}"
                    y1="{$yLegendStart + ($yLegendInterval * 3)}"
                    x2="{$xLegend + ($legendBoxWidth div 2)}"
                    y2="{$yLegendStart + ($yLegendInterval * 3) - $legendFontSize}" stroke="orange"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5}"
                    y="{$yLegendStart + ($yLegendInterval * 3)}" font-size="{$legendFontSize}">Unknown Voice</text>
                <!-- ras: Messenger -->
                <line x1="{$xLegend + ($legendBoxWidth div 2)}"
                    y1="{$yLegendStart + ($yLegendInterval * 3)}"
                    x2="{$xLegend + ($legendBoxWidth div 2)}"
                    y2="{$yLegendStart + ($yLegendInterval * 3) - $legendFontSize}" stroke="orange"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5}"
                    y="{$yLegendStart + ($yLegendInterval * 3)}" font-size="{$legendFontSize}">Unknown Voice</text>
                <!-- ras: Unidentified -->
                <line x1="{$xLegend + ($legendBoxWidth div 2)}"
                    y1="{$yLegendStart + ($yLegendInterval * 3)}"
                    x2="{$xLegend + ($legendBoxWidth div 2)}"
                    y2="{$yLegendStart + ($yLegendInterval * 3) - $legendFontSize}" stroke="orange"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5}"
                    y="{$yLegendStart + ($yLegendInterval * 3)}" font-size="{$legendFontSize}">Unknown Voice</text>
                
                <!-- ras: Drawing Bar Graph -->
                <xsl:variable name="maxYValue"
                    select="sum($nelsonColl//said/string-length())"/>
                <xsl:variable name="percentFontSize" select="12"/>
                <xsl:variable name="maleYMax" select="(sum($nelsonColl//said[@ana='male']/string-length())) div $maxYValue"/>
                <xsl:variable name="femaleYMax" select="(sum($nelsonColl//said[@ana='female']/string-length())) div $maxYValue"/>
                <xsl:variable name="unknownYMax" select="(sum($nelsonColl//said[@ana='#unknown']/string-length())) div $maxYValue"/>
                
                <line x1="{$Interval}" x2="{$Interval}" y1="{$yAxisStart}"
                    y2="{$maleYMax * $yAxisEnd}"
                    stroke="blue" stroke-width="{$barWidth}"/>
                
                <line x1="{$Interval * 2}" x2="{$Interval * 2}" y1="{$yAxisStart}"
                    y2="{$femaleYMax * $yAxisEnd}"
                    stroke="red" stroke-width="{$barWidth}"/>
                
                <line x1="{$Interval * 3}" x2="{$Interval * 3}" y1="{$yAxisStart}"
                    y2="{$unknownYMax * $yAxisEnd}"
                    stroke="orange" stroke-width="{$barWidth}"/>
                
                
                <!-- ras: Dotted line at halfway -->
                <line x1="{$xAxisStart}" y1="{($yAxisEnd + $yAxisStart) div 2}" x2="{$xAxisEnd}"
                    y2="{($yAxisEnd + $yAxisStart) div 2}" stroke="grey" stroke-width="2"
                    stroke-dasharray="5, 5"/>
                
                
                <text x="{$Interval}" y="{$maleYMax * $yAxisEnd div 2}" font-size="{$percentFontSize}" fill="white"
                    text-anchor="middle"><xsl:value-of select="format-number($maleYMax * 100, '##.#')"/>% </text>
                
                <text x="{$Interval * 2}" y="{$femaleYMax * $yAxisEnd div 2}" font-size="{$percentFontSize}" fill="white"
                    text-anchor="middle"><xsl:value-of select="format-number($femaleYMax * 100, '##.#')"/>% </text>
                
                <text x="{$Interval * 3}" y="{$unknownYMax * $yAxisEnd div 2}" font-size="{$percentFontSize}" fill="white"
                    text-anchor="middle"><xsl:value-of select="format-number($unknownYMax * 100, '##.#')"/>% </text>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>