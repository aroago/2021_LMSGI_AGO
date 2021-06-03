<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 10.xsl
    Created on : 18 de mayo de 2021, 13:29
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text" ident="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/network">
        <xsl:value-of select="concat(name(),'')"/>:
        <xsl:for-each select="ethernets">
            <xsl:value-of select="concat(name(),':')"/>
            <xsl:value-of select="name"/>
            <xsl:value-of select="concat(name(addresses),':')"/>
            <xsl:value-of select="addresses"/>
            <xsl:value-of select="concat(name(gateway4),':',gateway4)"/>
            <xsl:value-of select="concat(name(nameservers),':',nameservers/addresses)"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
