<?xml version="1.0" encoding="UTF-8"?>

<!--
Document   : signos.xsl
Created on : 14 de junio de 2019, 11:12
Author     : 
Description:
Mostrar horoscopo / los signos del zodiaco
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/> 
    <xsl:include href="./lib/web.xsl"/>
    <xsl:template match="/">
        <xsl:call-template name="docTipo"/>
        <html>
            <head>
                <xsl:call-template name="web">
                    <xsl:with-param name="titulo" select="concat('Examen 2018-2019-Aroa Granero Omañas')"/>
                    <xsl:with-param name="descripcion" select="'Horoscopo'"/>
                    <xsl:with-param name="keywords" select="'xml,xslt,horoscopo'"/>
                </xsl:call-template>
                
            </head>
            <body>
                <header>
                    <h1> HOROSCOPO/SIGNOS DEL ZODÍACO</h1>
                </header>
                <main>
                    <xsl:for-each select="horoscopo/signo">
                        <div class="contenido">
                            <article>
                                <a title="horoscopo" href="./horoscopo/horoscopo.xml">
                                    <xsl:attribute name="href">
                                       <xsl:value-of select="concat('.\horoscopo\',nombre,'\horoscopo.xml')"/>
                                    </xsl:attribute>
                                    <abbr>
                                        <xsl:attribute name="title">
                                            <xsl:value-of select="concat('Consultar Horoscopo de',nombre/text())"/>
                                        </xsl:attribute>
                                        <div class="imagenes">
                                            <div class="img1">
                                                <img>
                                                    <xsl:attribute name="src">
                                                        <xsl:value-of select="concat('./images/','bg-',@id,'.jpg')"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="alt">
                                                        <xsl:value-of select="nombre"/>
                                                    </xsl:attribute>
                                                </img>
                                            </div>
                                            <div class="img2">
                                                <img>
                                                    <xsl:attribute name="src">
                                                        <xsl:value-of select="concat('./images/',@id,'.svg')"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="alt">
                                                        <xsl:value-of select="nombre"/>
                                                    </xsl:attribute>
                                                </img>
                                            </div>
                                        </div>
                                    </abbr>
                                </a>
                                <h3>
                                    <xsl:value-of select="nombre/text()"/>
                                </h3>
                                <div class="fecha">
                                    <xsl:value-of select="fecha/text()"/>
                                </div>
                            </article>
                        </div>
                    </xsl:for-each>
                </main>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
