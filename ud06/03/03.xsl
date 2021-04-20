<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 03.xsl
    Created on : 20 de abril de 2021, 13:13
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/horario">
        <html>
            <head>
                <title>XSLT 03 Aroa Granero Omañas</title>
            </head>
            <body>
                <h1>HORARIO DEL CURSO <xsl:value-of select="@curso"/></h1>
                <table>
                    <tr>
                        <th>Codigo Modulo</th>
                        <th>Nombre del Modulo</th>
                    </tr>
                    <xsl:apply-templates select="modulos/modulo"/>
                </table>
                <table>
                    <tr>
                        <th>Codigo Profesor</th>
                        <th>Nombre Profesor</th>
                    </tr>
                    <xsl:apply-templates select="profesores/profesor"/>
                </table>
            </body>
        </html>
    </xsl:template>
    <!--Mostrar los modulos -->

    <xsl:template match="modulos/modulo">
        <tr>
            <td>
                <abbr>  
                    <xsl:attribute name="title">
                        <xsl:value-of select="current()/text()"/>
                    </xsl:attribute>
                     <xsl:value-of select="@codM"/>
                </abbr>
            </td>
            <td>
                <xsl:value-of select="current()/text()"/>
            </td>
        </tr>
    </xsl:template>
    <!--Mostrar profesores -->
    <xsl:template match="profesores/profesor">
        <tr>
            <td>
                <xsl:value-of select="@codP"/>
            </td>
            <td>
                <xsl:value-of select="current()/text()"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
