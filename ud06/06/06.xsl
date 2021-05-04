<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 06.xsl
    Created on : 3 de mayo de 2021, 17:09
    Author     : Juanjo
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
     
    <!--<xsl:template match="/">
        <root>
            <xsl:for-each select="root/row">
                <row>
                    <anyo>
                        <xsl:value-of select="@Anyo"/>
                    </anyo>
                    <concepto>
                        <xsl:value-of select="@Concepto"/>
                    </concepto>
                    <usuarios>
                        <xsl:value-of select="@Usuarios_registrados"/>
                    </usuarios>
                </row>
            </xsl:for-each>
        </root>
    </xsl:template> -->
     <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
     </xsl:template>
        <xsl:template match="@*">
            <xsl:element name="{name()}">                   
               <xsl:value-of select="."/>
            </xsl:element>
        </xsl:template>
</xsl:stylesheet>
