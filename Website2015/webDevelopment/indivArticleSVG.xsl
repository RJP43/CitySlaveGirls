<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>

    <!-- ras: Chart Size Variables -->
    <xsl:variable name="Interval" select="200"/>
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
                <!-- ras: Male Voice  -->
                <line x1="{$xLegend + ($legendBoxWidth div 2)}"
                    y1="{$yLegendStart + $yLegendInterval}"
                    x2="{$xLegend + ($legendBoxWidth div 2)}"
                    y2="{$yLegendStart + $yLegendInterval - $legendFontSize}" stroke="blue"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5}" y="{$yLegendStart +$yLegendInterval}"
                    font-size="{$legendFontSize}">Male Voice</text>
                <!-- ras: Female Voice  -->
                <line x1="{$xLegend + ($legendBoxWidth div 2)}"
                    y1="{$yLegendStart + ($yLegendInterval * 2)}"
                    x2="{$xLegend + ($legendBoxWidth div 2)}"
                    y2="{$yLegendStart + ($yLegendInterval * 2) - $legendFontSize}" stroke="red"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5}"
                    y="{$yLegendStart + ($yLegendInterval * 2)}" font-size="{$legendFontSize}"
                    >Female Voice</text>
                <!-- ras: Working Girl -->
                <line x1="{$xLegend + ($legendBoxWidth div 2)}"
                    y1="{$yLegendStart + ($yLegendInterval * 3)}"
                    x2="{$xLegend + ($legendBoxWidth div 2)}"
                    y2="{$yLegendStart + ($yLegendInterval * 3) - $legendFontSize}" stroke="pink"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5}"
                    y="{$yLegendStart + ($yLegendInterval * 3)}" font-size="{$legendFontSize}"
                    >Working Girl Voice</text>
                <!-- ras: Nelson Voice -->
                <line x1="{$xLegend + ($legendBoxWidth div 2)}"
                    y1="{$yLegendStart + ($yLegendInterval * 4)}"
                    x2="{$xLegend + ($legendBoxWidth div 2)}"
                    y2="{$yLegendStart + ($yLegendInterval * 4) - $legendFontSize}" stroke="green"
                    stroke-width="{$legendBoxWidth}"/>
                <text x="{$xLegend + $legendBoxWidth + 5}"
                    y="{$yLegendStart + ($yLegendInterval * 4)}" font-size="{$legendFontSize}">Nell
                    Nelson Voice</text>

             <!--   <xsl:apply-templates select="$nelsonColl//div[@type = 'articleBody']"/>-->
                <xsl:for-each select="$nelsonColl">
                    <xsl:variable name="maxYValue" select="sum(.//said[not(@ana = 'unknown')]/string-length())"/>
                    <xsl:variable name="percentFontSize" select="12"/>
                    <xsl:variable name="maleYMax"
                        select="(sum(.//said[@ana = 'male']/string-length())) div $maxYValue"/>
                    <xsl:variable name="femaleYMax"
                        select="(sum(.//said[@ana = 'female']/string-length())) div $maxYValue"/>
                    <xsl:variable name="workingGirlYMax"
                        select="(sum(.//said[@who = '#workingGirl']/string-length())) div $maxYValue"/>
                    <xsl:variable name="nelsonYMax"
                        select="(sum(.//said[@who = '#nellNelson']/string-length())) div $maxYValue"/>
                    <xsl:variable name="articleSpace" select="($Interval * 4) + ($barWidth * 2)"/>
                    
                    
                    <!-- ras: actually drawing -->
                    <!--2015-12-19 ebb: I think the problem you were having is with the position() variable, which seems
                        to behave unpredictably when run over a collection. So, I recommend using your own numbering
                        system that you've built in the @corresp on your <title> element in each file to deliver
                    your x position variables. So I'm defining a new variable below for $xPos, which grabs the last
                    two digits of the string in @corresp and converts it to a number (which should be numbering 
                    consecutively with your articles).-->
                    
                    <xsl:variable name="xPos" select="number(substring-after(.//title/@corresp, '#CT0'))-.5"/>
                    <!--ebb: I subtracted .5 from the position here because:
                        1) I first simply output the number, which ranged from 1 to 11. I observed that the first 
                        set of bars was set by a giant margin from the Y axis, and I just wanted to back it up a bit.
                        When I subtracted each position by 1, that brought the first set of bars to a '0" position, and set
                        them a little off to the left of the Y axis. Too far. Subtracting by .5 seemed to position 
                        it just about right to my eye. Feel free to adjust everything, and/or flip axes, etc. -->
      
                    
                   <!-- <xsl:choose>
                        <xsl:when test="position() = 1">-->
                            <line x1="{$Interval * $xPos}" x2="{$Interval * $xPos}" y1="{$yAxisStart}"
                                y2="{$maleYMax * $yAxisEnd}" stroke="blue" stroke-width="{$barWidth}"/>
                    <xsl:comment>Value of $Interval: <xsl:value-of select="$Interval"/>. 
                    Value of $xPos: <xsl:value-of select="$xPos"/>
                    </xsl:comment>
                            
                    <line x1="{$Interval * $xPos + $barWidth}" x2="{$Interval * $xPos + $barWidth}" y1="{$yAxisStart}"
                                y2="{$femaleYMax * $yAxisEnd}" stroke="red" stroke-width="{$barWidth}"/>
                     
                     <!--ebb: I altered the way you were spacing your four-bar clusters. You really
                     want to be grouping these by a value you *add* rather than by a value you *multiply*.
                     Otherwise you're spreading the bars too far apart. I just added a barWidth 
                     (and then a barWidth*2, *3, and *4) to each of these.
                     
                     I see the issue with your graph is that it appears to plot four values that do not add up to 100%.
                     But that's because you're comparing two different KINDS of values side by side. I would suggest this:
                     1) STACK the bars that are related to each other that add up to 100%. Stack your male and female bars. Put
                     the value that's likely to be largest most of the time on the bottom, so the smaller values can be more easily
                     compared on top.
                     
                     2) Consider where you want to put nellVoice and workingGirl voice. Do these make up a portion of ALL the female
                     voices? If so, perhaps you could add them to your stacked bars.
                     
                     Remember how to stack bars? The bottom-most bar goes from the x-axis up (er...down!) to its y value. 
                     Then the next bar starts **at the y-value of the previous bar + its own value**. And so on up the bar!
                     
                     -->
                    <line x1="{$Interval * $xPos + ($barWidth * 2)}" x2="{$Interval * $xPos + ($barWidth * 2)}" y1="{$yAxisStart}"
                                y2="{$workingGirlYMax * $yAxisEnd}" stroke="pink" stroke-width="{$barWidth}"/>
                            
                    <line x1="{$Interval * $xPos + ($barWidth * 3)}" x2="{$Interval * $xPos + ($barWidth * 3)}" y1="{$yAxisStart}"
                                y2="{$nelsonYMax * $yAxisEnd}" stroke="green" stroke-width="{$barWidth}"/>
                            
                            
                    <text x="{$Interval * $xPos}" y="{$maleYMax * $yAxisEnd div 2}"
                                font-size="{$percentFontSize}" fill="white" text-anchor="middle"><xsl:value-of
                                    select="format-number($maleYMax * 100, '##.#')"/>% </text>
                            
                    <text x="{$Interval * $xPos + $barWidth}" y="{$femaleYMax * $yAxisEnd div 2}"
                                font-size="{$percentFontSize}" fill="white" text-anchor="middle"><xsl:value-of
                                    select="format-number($femaleYMax * 100, '##.#')"/>% </text>
                            
                    <text x="{$Interval * $xPos + ($barWidth * 2)}" y="{$workingGirlYMax * $yAxisEnd div 2}"
                                font-size="{$percentFontSize}" fill="white" text-anchor="middle"><xsl:value-of
                                    select="format-number($workingGirlYMax * 100, '##.#')"/>% </text>
                            
                    <text x="{$Interval * $xPos + ($barWidth * 3)}" y="{$nelsonYMax * $yAxisEnd div 2}"
                                font-size="{$percentFontSize}" fill="white" text-anchor="middle"><xsl:value-of
                                    select="format-number($nelsonYMax * 100, '##.#')"/>% </text>
                     <!--   </xsl:when>-->
                      <!--  <xsl:otherwise>
                            <xsl:variable name="xPosNot1" select="((position() - 1) * $articleSpace) + $Interval"/>
                            <line x1="{$xPosNot1}" x2="{$xPosNot1}" y1="{$yAxisStart}"
                                y2="{$maleYMax * $yAxisEnd}" stroke="blue" stroke-width="{$barWidth}"/>
                            
                            <line x1="{$xPosNot1 * 2}" x2="{$xPosNot1 * 2}" y1="{$yAxisStart}"
                                y2="{$femaleYMax * $yAxisEnd}" stroke="red" stroke-width="{$barWidth}"/>
                            
                            <line x1="{$xPosNot1 * 3}" x2="{$xPosNot1 * 3}" y1="{$yAxisStart}"
                                y2="{$workingGirlYMax * $yAxisEnd}" stroke="pink" stroke-width="{$barWidth}"/>
                            
                            <line x1="{$xPosNot1 * 4}" x2="{$xPosNot1 * 4}" y1="{$yAxisStart}"
                                y2="{$nelsonYMax * $yAxisEnd}" stroke="green" stroke-width="{$barWidth}"/>
                            
                            
                            <text x="{$xPosNot1}" y="{$maleYMax * $yAxisEnd div 2}"
                                font-size="{$percentFontSize}" fill="white" text-anchor="middle"><xsl:value-of
                                    select="format-number($maleYMax * 100, '##.#')"/>% </text>
                            
                            <text x="{$xPosNot1 * 2}" y="{$femaleYMax * $yAxisEnd div 2}"
                                font-size="{$percentFontSize}" fill="white" text-anchor="middle"><xsl:value-of
                                    select="format-number($femaleYMax * 100, '##.#')"/>% </text>
                            
                            <text x="{$xPosNot1 * 3}" y="{$workingGirlYMax * $yAxisEnd div 2}"
                                font-size="{$percentFontSize}" fill="white" text-anchor="middle"><xsl:value-of
                                    select="format-number($workingGirlYMax * 100, '##.#')"/>% </text>
                            
                            <text x="{$xPosNot1 * 4}" y="{$nelsonYMax * $yAxisEnd div 2}"
                                font-size="{$percentFontSize}" fill="white" text-anchor="middle"><xsl:value-of
                                    select="format-number($nelsonYMax * 100, '##.#')"/>% </text>
                        </xsl:otherwise>
                    </xsl:choose> -->
                    
                    
                </xsl:for-each>
        
                <!-- ras: Dotted line at halfway -->
                <line x1="{$xAxisStart}" y1="{($yAxisEnd + $yAxisStart) div 2}" x2="{$xAxisEnd}"
                    y2="{($yAxisEnd + $yAxisStart) div 2}" stroke="grey" stroke-width="2"
                    stroke-dasharray="5, 5"/>
            </g>
        </svg>
    </xsl:template>

    <!-- ras: Drawing Bar Graph -->
  <!--  <xsl:template match="div[@type = 'articleBody']">

        <!-\- ras: bar variables -\->
        <xsl:variable name="maxYValue" select="sum(.//said[not(@ana = 'unknown')]/string-length())"/>
        <xsl:variable name="percentFontSize" select="12"/>
        <xsl:variable name="maleYMax"
            select="(sum(.//said[@ana = 'male']/string-length())) div $maxYValue"/>
        <xsl:variable name="femaleYMax"
            select="(sum(.//said[@ana = 'female']/string-length())) div $maxYValue"/>
        <xsl:variable name="workingGirlYMax"
            select="(sum(.//said[@who = '#workingGirl']/string-length())) div $maxYValue"/>
        <xsl:variable name="nelsonYMax"
            select="(sum(.//said[@who = '#nellNelson']/string-length())) div $maxYValue"/>
        <xsl:variable name="articleSpace" select="($Interval * 4) + ($barWidth * 2)"/>


        <!-\- ras: actually drawing -\->
        <xsl:choose>
            <xsl:when test="position() = 1">
                <line x1="{$Interval}" x2="{$Interval}" y1="{$yAxisStart}"
                    y2="{$maleYMax * $yAxisEnd}" stroke="blue" stroke-width="{$barWidth}"/>

                <line x1="{$Interval * 2}" x2="{$Interval * 2}" y1="{$yAxisStart}"
                    y2="{$femaleYMax * $yAxisEnd}" stroke="red" stroke-width="{$barWidth}"/>

                <line x1="{$Interval * 3}" x2="{$Interval * 3}" y1="{$yAxisStart}"
                    y2="{$workingGirlYMax * $yAxisEnd}" stroke="pink" stroke-width="{$barWidth}"/>

                <line x1="{$Interval * 4}" x2="{$Interval * 4}" y1="{$yAxisStart}"
                    y2="{$nelsonYMax * $yAxisEnd}" stroke="green" stroke-width="{$barWidth}"/>


                <text x="{$Interval}" y="{$maleYMax * $yAxisEnd div 2}"
                    font-size="{$percentFontSize}" fill="white" text-anchor="middle"><xsl:value-of
                        select="format-number($maleYMax * 100, '##.#')"/>% </text>

                <text x="{$Interval * 2}" y="{$femaleYMax * $yAxisEnd div 2}"
                    font-size="{$percentFontSize}" fill="white" text-anchor="middle"><xsl:value-of
                        select="format-number($femaleYMax * 100, '##.#')"/>% </text>

                <text x="{$Interval * 3}" y="{$workingGirlYMax * $yAxisEnd div 2}"
                    font-size="{$percentFontSize}" fill="white" text-anchor="middle"><xsl:value-of
                        select="format-number($workingGirlYMax * 100, '##.#')"/>% </text>

                <text x="{$Interval * 4}" y="{$nelsonYMax * $yAxisEnd div 2}"
                    font-size="{$percentFontSize}" fill="white" text-anchor="middle"><xsl:value-of
                        select="format-number($nelsonYMax * 100, '##.#')"/>% </text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="xPosNot1" select="((position() - 1) * $articleSpace) + $Interval"/>
                <line x1="{$xPosNot1}" x2="{$xPosNot1}" y1="{$yAxisStart}"
                    y2="{$maleYMax * $yAxisEnd}" stroke="blue" stroke-width="{$barWidth}"/>

                <line x1="{$xPosNot1 * 2}" x2="{$xPosNot1 * 2}" y1="{$yAxisStart}"
                    y2="{$femaleYMax * $yAxisEnd}" stroke="red" stroke-width="{$barWidth}"/>

                <line x1="{$xPosNot1 * 3}" x2="{$xPosNot1 * 3}" y1="{$yAxisStart}"
                    y2="{$workingGirlYMax * $yAxisEnd}" stroke="pink" stroke-width="{$barWidth}"/>

                <line x1="{$xPosNot1 * 4}" x2="{$xPosNot1 * 4}" y1="{$yAxisStart}"
                    y2="{$nelsonYMax * $yAxisEnd}" stroke="green" stroke-width="{$barWidth}"/>


                <text x="{$xPosNot1}" y="{$maleYMax * $yAxisEnd div 2}"
                    font-size="{$percentFontSize}" fill="white" text-anchor="middle"><xsl:value-of
                        select="format-number($maleYMax * 100, '##.#')"/>% </text>

                <text x="{$xPosNot1 * 2}" y="{$femaleYMax * $yAxisEnd div 2}"
                    font-size="{$percentFontSize}" fill="white" text-anchor="middle"><xsl:value-of
                        select="format-number($femaleYMax * 100, '##.#')"/>% </text>

                <text x="{$xPosNot1 * 3}" y="{$workingGirlYMax * $yAxisEnd div 2}"
                    font-size="{$percentFontSize}" fill="white" text-anchor="middle"><xsl:value-of
                        select="format-number($workingGirlYMax * 100, '##.#')"/>% </text>

                <text x="{$xPosNot1 * 4}" y="{$nelsonYMax * $yAxisEnd div 2}"
                    font-size="{$percentFontSize}" fill="white" text-anchor="middle"><xsl:value-of
                        select="format-number($nelsonYMax * 100, '##.#')"/>% </text>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>-->

</xsl:stylesheet>
