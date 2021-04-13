<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 01.xsl
    Created on : 8 de abril de 2021, 9:50
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template match="/edificio">
        <html>
            <head>
                <title>01.xsl</title>
            </head>
            <body>
                <center>
                    <h1>Información de las viviendas</h1>
                </center>
                <xsl:apply-templates select="vivienda"/>
                <p></p>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="vivienda">
        <p>  
           Piso:  <xsl:value-of select="piso"/>
           Puerta: <xsl:value-of select="puerta"/>
        </p>
        <xsl:apply-templates select="vecinos"/>
    </xsl:template>
    <xsl:template match="vecinos">
        <ol>
            <xsl:apply-templates select="nombre"/>
        </ol>
    </xsl:template>
    <xsl:template match="nombre">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
    
 
</xsl:stylesheet>
