<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : prediccion.xsl.xsl
    Created on : 13 de mayo de 2021, 9:06
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <!-- <xsl:import href="../libweb.xsl"/>-->
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <!-- <xsl:call-template name="metaweb"/>-->
                <title>Aroa GRanero Omañas</title>
            </head>
            <body>
                <h1>Predicción por municipios</h1>
                <table>
                    <caption>EL TIEMPO. <xsl:value-of select="//municipio/nombre"/> ( <xsl:value-of select="//municipio/provincia"/> )</caption>
                    <tr>
                        <th>Día</th>
                        <th>Prob. precip.</th>
                        <th>Estado del cielo</th>
                        <th>Temperatura (Cº)</th>
                        <th>Viento (km/h)</th>
                    </tr>
                    <xsl:for-each select="prediccion/dia">
                        <tr>
                             <xsl:variable name="fecha" select="@fecha"/>
                            <td><xsl:value-of select="substring($fecha, 9, 2)"/></td>
                            <td><xsl:value-of select="concat(prob_precipitacion,'%')"/></td>
                            <td>
                                <img>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="concat('./images/',estado_cielo,'.gif')"/>
                                    </xsl:attribute>
                                </img>
                            </td>
                            <td>
                                <span class="max">
                                    <xsl:value-of select="concat(temperatura/maxima)"/>
                                </span>
                                /
                                <span class="mix">
                                    <xsl:value-of select="concat(temperatura/minima)"/>
                                </span>
                            </td>
                            <td><img>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="concat('./images/',viento/direccion,'.gif')"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="viento/velocidad"/>
                                </img></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
