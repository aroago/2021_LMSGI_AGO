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
                <!--<xsl:apply-templates select="vivienda"/>-->
                <xsl:for-each select="vivienda">
                    <div>  
                        Piso:  <xsl:value-of select="piso"/>
                        Puerta: <xsl:value-of select="puerta"/>
                    
                        <ol>
                            <!-- <xsl:apply-templates select="vecinos/nombre"/>-->
                            <xsl:for-each select="vecinos/nombre">
                                <li>
                                    <xsl:apply-templates select="./text()"/>
                                    <!--current() = "." -->
                                </li>
                            </xsl:for-each>
                        </ol>
                    </div>
                </xsl:for-each>
                <div>
                    Numero de viviendas: <xsl:value-of select="count(vivienda)"/>
                </div>
                <div>
                    Numero total de vecinos: <xsl:value-of select="count(//nombre)"/>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
