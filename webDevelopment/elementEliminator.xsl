<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:template match="persName">
        <persName>
            <xsl:apply-templates/>
        </persName>
    </xsl:template>
    <xsl:template match="placeName">
        <placeName>
            <xsl:apply-templates/>
        </placeName>
    </xsl:template>
    <xsl:template match="location">
        <desc type="location">
            <xsl:apply-templates/>
        </desc>
    </xsl:template>
    <xsl:template match="p">
        <p>
        <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="num[@type='wage']">
        <num type="wage" value="{@amount}">
            <xsl:apply-templates/>
        </num>
    </xsl:template>
    <xsl:template match="date">
        <date when="{@year}{@month}{@when}{@day}">
            <xsl:apply-templates/>
        </date>
    </xsl:template>
    <xsl:template match="desc[@of]">
        <desc type="{@of}">
 <xsl:apply-templates/>
        </desc>
    </xsl:template>
    <xsl:template match="quote">
        <quote>
            <xsl:apply-templates/>
        </quote>
    </xsl:template>
    <xsl:template match="livingConditions">
        <desc type="livingConditions">
            <xsl:apply-templates/>
        </desc>
    </xsl:template>
    <xsl:template match="workingConditions[@category='wageDesc']">
        <desc type="{@category}">
            <xsl:apply-templates/>
        </desc>
    </xsl:template>
    <xsl:template match="workingConditions[@category='workDesc']">
        <desc type="{@category}">
            <xsl:apply-templates/>
        </desc>
    </xsl:template>
    <xsl:template match="pb">
        <pb n="{@n}"/>
    </xsl:template>
    <xsl:template match="company[@name='identified']">
        <orgName type="exposedCompany">
            <xsl:apply-templates/>
        </orgName>
    </xsl:template>
    <xsl:template match="company[@name='unidentified']">
        <ref type="company">
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <xsl:template match="orgName">
        <orgName>
            <xsl:apply-templates/>
        </orgName>
    </xsl:template>
    <xsl:template match="ref">
        <ref type="{@to}">
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <xsl:template match="industry">
        <ref type="industry">
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <xsl:template match="nationality">
        <ref type="nationality">
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <xsl:template match="occupation">
        <ref type="occupation">
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <xsl:template match="factoryItem">
        <ref type="factoryItem">
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <xsl:template match="unclear">
        <unclear/>
    </xsl:template>
    
</xsl:stylesheet>
    
