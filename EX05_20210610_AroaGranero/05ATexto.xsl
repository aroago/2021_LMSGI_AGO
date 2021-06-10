<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : xsl_text.xsl
    Created on : 9 de junio de 2021, 18:14
    Author     : Juanjo
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text" ident="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
   <xsl:template match="/mysqldump">
        <xsl:value-of select=" concat('CREATE DATABASE IF NOT EXIST ',database/@name,';')"/>
        <xsl:apply-templates select="database/table_structure"/>
    </xsl:template>
    <xsl:template match="database/table_structure">
         <xsl:value-of select=" concat('CREATE TABLE ',@name)"/>
         <xsl:apply-templates select="field"/>
    </xsl:template>
    <xsl:template match="field">
        <xsl:value-of select="concat('( ',@Field,' ',@Type,')',';')"/>
    </xsl:template>
</xsl:stylesheet>
