<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>

    <!-- ras: Chart Size Variables -->
    <xsl:variable name="Interval" select="60"/>
    <xsl:variable name="barWidth" select="45"/>
    <xsl:variable name="yAxisStart" select="0"/>
    <xsl:variable name="yAxisEnd" select="-300"/>
    <xsl:variable name="xAxisStart" select="30"/>
    <xsl:variable name="xAxisEnd" select="((8 + 1) * $Interval) - ($barWidth div 2)"/>
    <!-- ras: Legend Variables -->
    <xsl:variable name="xLegend" select="$xAxisEnd + 30"/>
    <xsl:variable name="yLegendStart" select="-250"/>
    <xsl:variable name="yLegendInterval" select="26"/>
    <xsl:variable name="legendFontSize" select="16"/>
    <xsl:variable name="legendBoxWidth" select="20"/>
    <xsl:variable name="xSpacing" select="30"/>
    <!-- ras: Variable for collection -->
    <xsl:variable name="nelsonColl" select="collection('ChicagoTimes_XML_gender')"/>

    <!-- ras: Template Match for Document Output -->
    <xsl:template match="/">
        <svg width="100%" height="125%">
            <g transform="translate(10,400)">


                <!-- ras: Y-Axis -->
                <line x1="{$xAxisStart + $xSpacing}" y1="{$yAxisStart + 2}"
                    x2="{$xAxisStart + $xSpacing}" y2="{$yAxisEnd}" stroke="black" stroke-width="1"/>
                <!-- ras: X-Axis -->
                <line x1="{$xAxisStart + $xSpacing}" y1="{$yAxisStart + 1}"
                    x2="{$xAxisEnd + $xSpacing}" y2="{$yAxisStart + 1}" stroke="black"
                    stroke-width="1"/>

                <!-- ras: Axis Labels -->
                <text x="{$xAxisStart + $xSpacing - 40}" y="{($yAxisEnd + $yAxisStart) div 2}"
                    transform="rotate(-90 {$xAxisStart + $xSpacing - 40},{($yAxisEnd + $yAxisStart) div 2})"
                    style="text-anchor: middle" font-size="14">% of Total Dialogue (String Length of
                    &lt;said&gt;)</text>
                <text x="{(($xAxisStart + $xAxisEnd) div 2) + $xSpacing}" y="{$yAxisStart + 20}"
                    style="text-anchor: middle" font-size="14">Speaker (&lt;said
                    @who="*"&gt;)</text>
                <text x="{$xAxisStart - 30 + $xSpacing}" y="{($yAxisEnd + $yAxisStart) div 2}"
                    font-size="14"> 25% </text>
                <text x="{$xAxisStart - 30 + $xSpacing}" y="{($yAxisEnd + $yAxisStart)}"
                    font-size="14"> 50% </text>

                <!-- ras: Title -->
                <text x="{(($xAxisStart + $xAxisEnd) div 2) + $xSpacing}" y="{$yAxisEnd - 40}"
                    style="text-anchor: middle" font-size="18">Percent of Total Dialogue Spoken per
                    Archetype of Speaker </text>
                <text x="{(($xAxisStart + $xAxisEnd) div 2) + $xSpacing}" y="{$yAxisEnd - 20}"
                    style="text-anchor: middle" font-size="18">Throughout Collection of Chicago
                    Times Articles</text>
                
                <!-- ebb: Legend starting line-->
                <text x="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}" y="{$yLegendStart}"
                    font-size="20">Legend</text>

                <!-- ras: Drawing Bar Graph -->
                <!--ebb: and the Legend, too!-->
                <xsl:variable name="maxYValue" select="sum($nelsonColl//said/string-length())"/>
                <xsl:variable name="percentFontSize" select="12"/>
                <xsl:variable name="nellYMax"
                    select="(sum($nelsonColl//said[@who = '#nellNelson']/string-length())) div $maxYValue"/>
                <xsl:variable name="wgYMax"
                    select="(sum($nelsonColl//said[@who = '#workingGirl']/string-length())) div $maxYValue"/>
                <xsl:variable name="forepersonYMax"
                    select="(sum($nelsonColl//said[@who = '#foreperson']/string-length())) div $maxYValue"/>
                <xsl:variable name="employerYMax"
                    select="(sum($nelsonColl//said[@who = '#employer']/string-length())) div $maxYValue"/>
                <xsl:variable name="employeeYMax"
                    select="(sum($nelsonColl//said[@who = '#employee']/string-length())) div $maxYValue"/>
                <xsl:variable name="benefactorYMax"
                    select="(sum($nelsonColl//said[@who = '#benefactor']/string-length())) div $maxYValue"/>
                <xsl:variable name="messengerYMax"
                    select="(sum($nelsonColl//said[@who = '#messenger']/string-length())) div $maxYValue"/>
                <xsl:variable name="unidentifiedYMax"
                    select="(sum($nelsonColl//said[@who = '#unidentified']/string-length())) div $maxYValue"/>
                <xsl:variable name="yAxis50" select="$yAxisEnd * 2"/>

                <xsl:for-each select="($nellYMax, $wgYMax, $forepersonYMax, $employerYMax, $benefactorYMax, $messengerYMax, $unidentifiedYMax)">      
                   <xsl:sort  select="current()" order="descending"/>
                    <xsl:variable name="strokeColor">
                        <xsl:choose>
                            <xsl:when test="current() = $nellYMax">
                                <xsl:value-of select="'#A3C9A8'"/>
                            </xsl:when>
                            <xsl:when test="current() = $wgYMax">
                                <xsl:value-of select="'#FAF3DD'"/>
                            </xsl:when>
                            <xsl:when test="current() = $forepersonYMax">
                                <xsl:value-of select="'#725752'"/>
                            </xsl:when>
                            <xsl:when test="current() = $employerYMax">
                                <xsl:value-of select="'#F2DA00'"/>
                            </xsl:when>
                            <xsl:when test="current() = $employeeYMax">
                                <xsl:value-of select="'#C695A6'"/>
                            </xsl:when>
                            <xsl:when test="current() = $benefactorYMax">
                                <xsl:value-of select="'#29335C'"/>
                            </xsl:when>
                            <xsl:when test="current() = $messengerYMax">
                                <xsl:value-of select="'#00A6ED'"/>
                            </xsl:when>
                            <xsl:when test="current() = $unidentifiedYMax">
                                <xsl:value-of select="'orange'"/>
                            </xsl:when>
                            
                        </xsl:choose>    
                    </xsl:variable>
                    

                    <!-- ras: Drawing Bar Graph -->
                    <line x1="{$Interval * position() + $xSpacing}"
                        x2="{$Interval * position() + $xSpacing}" y1="{$yAxisStart}"
                        y2="{. * $yAxis50}" stroke="{$strokeColor}" stroke-width="{$barWidth}"/>                
                  
                    <!-- ras: Percent labels on bars -->
                    <text x="{$Interval * position() + $xSpacing}" y="{. * $yAxis50 - 10}"
                        font-size="{$percentFontSize}" fill="black" text-anchor="middle"><xsl:value-of
                            select="format-number(. * 100, '##.###')"/>% </text>
                    
                    <!--ebb: and now the Legend Bars. We can output these in the for-each because we're looping over
                    each variable value anyway!-->
    
                    <xsl:variable name="legendNames">
                        <xsl:choose>
                            <xsl:when test="current() = $nellYMax">
                                <xsl:value-of select="'Nell Nelson'"/>
                            </xsl:when>
                            <xsl:when test="current() = $wgYMax">
                                <xsl:value-of select="'Working Girl'"/>
                            </xsl:when>
                            <xsl:when test="current() = $forepersonYMax">
                                <xsl:value-of select="'Foreperson'"/>
                            </xsl:when>
                            <xsl:when test="current() = $employerYMax">
                                <xsl:value-of select="'Employer'"/>
                            </xsl:when>
                            <xsl:when test="current() = $employeeYMax">
                                <xsl:value-of select="'Employee'"/>
                            </xsl:when>
                            <xsl:when test="current() = $benefactorYMax">
                                <xsl:value-of select="'Benefactor'"/>
                            </xsl:when>
                            <xsl:when test="current() = $messengerYMax">
                                <xsl:value-of select="'Messenger'"/>
                            </xsl:when>
                            <xsl:when test="current() = $unidentifiedYMax">
                                <xsl:value-of select="'Unidentified'"/>
                            </xsl:when>
                            
                        </xsl:choose>    
                    </xsl:variable>
                    
                    <line x1="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                        y1="{$yLegendStart + $yLegendInterval * position()}"
                        x2="{$xLegend + ($legendBoxWidth div 2) + $xSpacing}"
                        y2="{$yLegendStart + ($yLegendInterval * position()) - $legendFontSize}" stroke="{$strokeColor}"
                        stroke-width="{$legendBoxWidth}"/>
                    <text x="{$xLegend + $legendBoxWidth + 5 + $xSpacing}"
                        y="{$yLegendStart +$yLegendInterval * position()}" font-size="{$legendFontSize}">
                        <xsl:value-of select="$legendNames"/></text>
     
                </xsl:for-each>
  
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>
