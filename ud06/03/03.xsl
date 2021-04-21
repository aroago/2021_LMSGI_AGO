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
                <xsl:for-each select="grupo">
                    <div>
                        <table>
                            <caption>Horario del curso <xsl:value-of select="@idgrupo"/>
                                <br/>Tutor: <xsl:value-of select="../profesores/profesor[@codP=(current()/@codT)]/."/>
                            </caption>
                            <tr>
                                <th>Hora</th>
                                <th>Lunes</th>
                                <th>Martes</th>
                                <th>Miércoles</th>
                                <th>Jueves</th>
                                <th>Viernes</th>
                            </tr>
                            <xsl:apply-templates select="hora"/>
                        </table>
                    </div>
                </xsl:for-each>
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
    <xsl:template match="hora">
        <tr>
            <td>
                <xsl:value-of select="concat(@entrada, '-', @salida)"/>
            </td>
            <xsl:apply-templates select="dia_sem"/>
        </tr>
    </xsl:template>
    
    <xsl:template match="dia_sem">
        <td>
            <xsl:attribute name="rowspan">
                <xsl:value-of select="@num"/>
            </xsl:attribute>
            <abbr>
                <xsl:attribute name="title">
                    <xsl:value-of select="../../../modulos/modulo[@codM=current()]/."/>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </abbr>
            <br/>
            <xsl:value-of select="../../../imparte/asignatura[@codM=current()]/@codProfesor"/>
        </td>
    </xsl:template>
</xsl:stylesheet>
