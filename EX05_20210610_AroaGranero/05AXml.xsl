<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : xsl_xml.xsl
    Created on : 9 de junio de 2021, 17:21
    Author     : Juanjo
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/mysqldump">
        <BDDepartamentos>
            
            <xsl:apply-templates select="//table_data/row/field"/>
            
        </BDDepartamentos>
    </xsl:template>
    <xsl:template match="//table_data/row/field">
        <row>
            <xsl:element name="{@name}">
                <xsl:value-of select="current()"/>
            </xsl:element>
        </row>
    </xsl:template>

</xsl:stylesheet>
