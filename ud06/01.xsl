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
                <ol>
                    <xsl:apply-templates select="vecinos"/>
                </ol>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="vivienda">
        <p>  
           Piso:  <xsl:value-of select="piso"/>
           Puerta: <xsl:value-of select="puerta"/>
        </p>
    </xsl:template>
    <xsl:template match="vecinos">
        <p>  
          <li><xsl:value-of select="nombre"/></li>
        </p>
    </xsl:template>
</xsl:stylesheet>
