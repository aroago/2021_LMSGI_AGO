<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 03.xsl
    Created on : 15 de abril de 2020, 11:14
    Author     : amor
    Description:
       Manejar mútiples patrones o plantillas para obtener una pagina web
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <!-- Creación de la estructura de la página web -->
    <xsl:template match="/alumnos">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title>01-3 XSLT - Informacion de alumnos </title>
            </head>
            <body>
                <center>
                    <h1>LISTA ALUMNOS</h1>
                </center>
                <table border="2">
                    <tr>
                        <td>Nombre</td>
                        <td>Apellidos</td>
                    </tr>
                    <tr>
                        <td>
                            <xsl:apply-templates select="alumno"/>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <!-- Mostrar los datos de cada alumno -->
    <xsl:template match="alumno">
        <tr>
            <td>
                <xsl:value-of select="nombre"/>
            </td>
            <td> 
                <xsl:value-of select="apellido"/>
            </td>
        </tr>
        <hr/>
    </xsl:template>

</xsl:stylesheet>
