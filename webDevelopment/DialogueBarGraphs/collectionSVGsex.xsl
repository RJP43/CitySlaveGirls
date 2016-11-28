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
    <xsl:variable name="yAxisDrawEnd" select="-350"/>
    <xsl:variable name="xAxisStart" select="30"/>
    <xsl:variable name="xAxisEnd" select="((3 + 1) * $Interval) - ($barWidth div 2)"/>
    <!-- ras: Legend Variables -->
    <xsl:variable name="xLegend" select="$xAxisEnd + 30"/>
    <xsl:variable name="yLegendStart" select="-300"/>
    <xsl:variable name="yLegendInterval" select="26"/>
    <xsl:variable name="legendFontSize" select="14"/>
    <xsl:variable name="legendBoxWidth" select="20"/>
    <xsl:variable name="xSpacing" select="40"/>

    <!-- ras: Variable for collection -->
    <xsl:variable name="nelsonColl" select="collection('../../Nelson_CSG/CSG_XML/XML_OnSite')"/>

    <!-- ras: Template Match for Document Output -->
    <xsl:template match="/">
        <svg width="430" height="555">
            <g transform="translate(20,475)">


                <!-- ras: Y-Axis -->
                <line x1="{$xAxisStart + $xSpacing}" y1="{$yAxisStart + 1}"
                    x2="{$xAxisStart + $xSpacing}" y2="{$yAxisDrawEnd}" stroke="black" stroke-width="1"/>
                <!-- ras: X-Axis -->
                <line x1="{$xAxisStart + $xSpacing}" y1="{$yAxisStart + .5}" x2="{$xAxisEnd + $xSpacing}"
                    y2="{$yAxisStart + .5}" stroke="black" stroke-width="1"/>
                
                <!-- ras: Title -->
                <text x="{(($xAxisStart + $xAxisEnd) div 2) + $xSpacing + 50}" y="{$yAxisDrawEnd - 60}"
                    style="text-anchor: middle" font-size="18">Percent of Total Dialogue Spoken per Sex of Speaker</text>
                <text x="{(($xAxisStart + $xAxisEnd) div 2) + $xSpacing + 50}" y="{$yAxisDrawEnd - 40}"
                    style="text-anchor: middle" font-size="18">Throughout Collection of Chicago Times Articles</text>
                <text x="{(($xAxisStart + $xAxisEnd) div 2) + $xSpacing + 50}" y="{$yAxisDrawEnd - 20}"
                    style="text-anchor: middle" font-size="18">(Excluding Nell Nelson's Voice)</text>
                
                
                <!-- ras: Axis Labels -->
                <text x="{$xAxisStart + $xSpacing - 45}" y="{($yAxisDrawEnd + $yAxisStart) div 2}"
                    transform="rotate(-90 {$xAxisStart + $xSpacing - 45},{($yAxisDrawEnd + $yAxisStart) div 2})"
                    style="text-anchor: middle" font-size="14">% of Total Dialogue (String Length of
                    &lt;said&gt;)</text>
                <text x="{(($xAxisStart + $xAxisEnd) div 2) + $xSpacing}" y="{$yAxisStart + 20}"
                    style="text-anchor: middle" font-size="14">Sex of Speaker (Excluding Nell Nelson)</text>
                <text x="{(($xAxisStart + $xAxisEnd) div 2) + $xSpacing}" y="{$yAxisStart + 36}"
                    style="text-anchor: middle" font-size="14">(&lt;said @ana="*" and not(@who='#nellNelson')&gt;)</text>
                
                
                <text x="{$xAxisStart - 30 + $xSpacing}" y="{($yAxisEnd + $yAxisStart) div 4}" font-size="14">
                    25% </text>
                <text x="{$xAxisStart - 30+ $xSpacing}" y="{($yAxisEnd + $yAxisStart) div 2}" font-size="14">
                    50% </text>


                <!-- ras: Legend -->
                <text x="{$xLegend + ($legendBoxWidth div 2) + $xSpacing + 15}" y="{$yLegendStart}" font-size="20">Legend</text>
                <!-- ras: Male Voice  -->
                <line x1="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y1="{$yLegendStart + ($yLegendInterval * 2)}"
                    x2="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y2="{$yLegendStart + ($yLegendInterval * 2) - $legendFontSize}" stroke="blue"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5 + $xSpacing}" y="{$yLegendStart +($yLegendInterval * 2)}"
                    font-size="{$legendFontSize}">Male Voice</text>
                <!-- ras: Female Voice  -->
                <line x1="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y1="{$yLegendStart + $yLegendInterval}"
                    x2="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y2="{$yLegendStart + $yLegendInterval - $legendFontSize}" stroke="red"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5 + $xSpacing}"
                    y="{$yLegendStart + $yLegendInterval}" font-size="{$legendFontSize}"
                    >Female Voice</text>
                <!-- ras: Unknown -->
                <line x1="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y1="{$yLegendStart + ($yLegendInterval * 3)}"
                    x2="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                    y2="{$yLegendStart + ($yLegendInterval * 3) - $legendFontSize}" stroke="orange"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5 + $xSpacing}"
                    y="{$yLegendStart + ($yLegendInterval * 3)}" font-size="{$legendFontSize}"
                    >Unknown Voice</text>

                <!-- ras: Drawing Bar Graph -->
                <xsl:variable name="maxYValue" select="sum($nelsonColl//said/string-length())"/>
                <xsl:variable name="percentFontSize" select="12"/>
                <xsl:variable name="maleYMax"
                    select="(sum($nelsonColl//said[@ana = 'male']/string-length())) div $maxYValue"/>
                <xsl:variable name="femaleYMax"
                    select="(sum($nelsonColl//said[@ana = 'female' and not(@who='#nellNelson')]/string-length())) div $maxYValue"/>
                <xsl:variable name="unknownYMax"
                    select="(sum($nelsonColl//said[@ana = 'unknown']/string-length())) div $maxYValue"/>


                <line x1="{$Interval * 2 + $xSpacing}" x2="{$Interval * 2 + $xSpacing}" y1="{$yAxisStart}"
                    y2="{$maleYMax * $yAxisEnd}" stroke="blue" stroke-width="{$barWidth}"/>


                <line x1="{($Interval) + $xSpacing}" x2="{($Interval) + $xSpacing}" y1="{$yAxisStart}"
                    y2="{$femaleYMax * $yAxisEnd}" stroke="red" stroke-width="{$barWidth}"/>


                <line x1="{($Interval * 3) + $xSpacing}" x2="{($Interval * 3) + $xSpacing}" y1="{$yAxisStart}"
                    y2="{$unknownYMax * $yAxisEnd}" stroke="orange" stroke-width="{$barWidth}"/>



                <!-- ras: Dotted line at halfway -->
                <line x1="{$xAxisStart + $xSpacing}" y1="{($yAxisEnd + $yAxisStart) div 2}" x2="{$xAxisEnd + $xSpacing}"
                    y2="{($yAxisEnd + $yAxisStart) div 2}" stroke="grey" stroke-width="2"
                    stroke-dasharray="5, 5"/>


                <text x="{($Interval * 2) + $xSpacing}" y="{$maleYMax * $yAxisEnd - 10}"
                    font-size="{$percentFontSize}" fill="black" text-anchor="middle"><xsl:value-of
                        select="format-number($maleYMax * 100, '##.#')"/>% </text>

                <text x="{$Interval + $xSpacing}" y="{$femaleYMax * $yAxisEnd - 10}"
                    font-size="{$percentFontSize}" fill="black" text-anchor="middle"><xsl:value-of
                        select="format-number($femaleYMax * 100, '##.#')"/>% </text>

                <text x="{($Interval * 3) + $xSpacing}" y="{$unknownYMax * $yAxisEnd - 10}"
                    font-size="{$percentFontSize}" fill="black" text-anchor="middle"><xsl:value-of
                        select="format-number($unknownYMax * 100, '##.#')"/>% </text>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>
