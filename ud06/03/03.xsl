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
                <style>
                    table,tr,td,th{border: 1px solid grey;
                    text-align:center;
                    }
                   
                </style>
            </head>
            <body>
                <h1>HORARIO DEL CURSO <xsl:value-of select="@curso"/></h1>
                <h2>TABLA MODULOS</h2>
                <table>
                    <tr>
                        <th>Codigo Modulo</th>
                        <th>Nombre del Modulo</th>
                    </tr>
                    <xsl:apply-templates select="modulos/modulo">
                        <xsl:sort select="@codM"/>
                    </xsl:apply-templates>
                </table>
                <h2> TABLA PROFESORES</h2>
                <table>
                    <tr>
                        <th>Codigo Profesor</th>
                        <th>Nombre Profesor</th>
                    </tr>
                    <xsl:apply-templates select="profesores/profesor">
                        <xsl:sort select="@codP"/>
                    </xsl:apply-templates>
                </table>
                <h2>TABLA HORARIO</h2>
                <xsl:for-each select="grupo">
                    <div>
                        <table>
                            <caption>Horario del curso <xsl:value-of select="@idgrupo"/>
                                <br/>Tutor: <xsl:value-of select="..//profesor[@codP=(current()/@codT)]/."/>
                            </caption>
                            <tr>
                                <th>Hora</th>
                                <th>Lunes</th>
                                <th>
                                    <xsl:value-of select="//hora[1]/dia_sem[2]/@dia"/>
                                </th>
                                <th>
                                    <xsl:value-of select="//hora[1]/dia_sem[3]/@dia"/>
                                </th>
                                <th>
                                    <xsl:value-of select="//hora[1]/dia_sem[4]/@dia"/>
                                </th>
                                <th>
                                    <xsl:value-of select="//hora[1]/dia_sem[5]/@dia"/>
                                </th>
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
                    <xsl:value-of select="//modulos/modulo[@codM=current()]/text()"/>
                </xsl:attribute>
                <xsl:value-of select="current()"/>
            </abbr>
            <br/>
             <xsl:variable name="listaProfesores" select="//asignatura[@codM=current()]/@codProfesor"/>
            <abbr>
                <xsl:attribute name="title">
                    <xsl:apply-templates select="//profesores/profesor[contains($listaProfesores,@codP)]" mode="xxx"/>
                </xsl:attribute>
                <xsl:value-of select="$listaProfesores"/>
            </abbr>
        </td>
    </xsl:template>
    <xsl:template match="profesor" mode="xxx">
        <xsl:if test="position()!=1">
            <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:value-of select="text()"/>
       
    </xsl:template>
</xsl:stylesheet>
