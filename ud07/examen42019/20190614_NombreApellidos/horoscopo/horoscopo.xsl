<?xml version="1.0" encoding="UTF-8"?>

<!--
Document   : horoscopo.xsl
Created on : 14 de junio de 2019, 11:12
Author     : 
Description:
Mostrar horoscopo / los signos del zodiaco
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                
            </head>
            <body>
                <div class="imagenes">
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="concat('../images/bg-', //@id,'.jpg')"/>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="concat('../images/', //@id,'.svg')"/>
                        </xsl:attribute>
                    </xsl:element>
                </div>
                <h1>Horóscopo Del Dia</h1>
                <div class="prediccion">
                    <h2>Predicción para hoy <xsl:value-of select="//date"/></h2>
                    <p>
                        <xsl:value-of select="//message"/>
                    </p>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
