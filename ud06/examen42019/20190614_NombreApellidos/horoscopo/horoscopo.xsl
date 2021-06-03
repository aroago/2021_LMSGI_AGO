<?xml version="1.0" encoding="UTF-8"?>

<!--
Document   : horoscopo.xsl
Created on : 14 de junio de 2019, 11:12
Author     : Aroa GRanero Omañas
Description:
Mostrar horoscopo / los signos del zodiaco
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:include href="../lib/web.xsl"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="web">
                    <xsl:with-param name="titulo" select="concat('Examen 2018-2019-Aroa Granero Omañas')"/>
                    <xsl:with-param name="descripcion" select="'Horoscopo'"/>
                    <xsl:with-param name="keywords" select="'xml,xslt,horoscopo'"/>
                </xsl:call-template>
                 <style>
                    .imagenes{
                        text-align: center;
                        
                    }
                     img{
                     border: 3px solid #edede1;
                     }
                    .prediccion{
                        margin: 2% 10%;
                    }
                    p{
                        font-weight: normal;
                        font-style: italic;
                        text-align: justify;
                        margin: 0;
                        padding: 0.5%;
                        border: 3px solid #edede1;
                    }
                    h2{
                        margin-bottom: 1%;
                    }
                    h1{
                     text-align: center;
                     } 
                     
                    
                </style>
            </head>
            <body>
                <div class="imagenes">
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="concat('../images/', //@id,'.svg')"/>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="'horoscopo'"/>
                        </xsl:attribute>
                       <xsl:attribute name="style">
                           background-image:url('<xsl:value-of select="concat('../images/bg-', //@id,'.jpg')"/>')
                        </xsl:attribute>
                    </xsl:element>
                   <!-- <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="concat('../images/', //@id,'.svg')"/>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="'Horoscopo Fondo'"/>
                        </xsl:attribute>
                    </xsl:element>-->
                </div>
                <h1>HORÓSCOPO <xsl:value-of select="document('../signos.xml')//signo[@id=current()//sign/@id]/nombre"/></h1>
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
