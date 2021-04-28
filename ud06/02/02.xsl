<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 02.xsl
    Created on : 28 de abril de 2021, 21:09
    Author     : Juanjo
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/listatickets">
        <xsl:apply-templates select="listatickets/comment()"/>
        <html>
            <head>
                <title>02 XSLT Aroa Granero Omanas</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="with=device-with, initial-scale=1.0"/>
                <meta name="author" content="Amor Rodriguez"/>  
                <meta name="application-name" content="AppWeb de LMSGI"/>
                <meta name="description" content="Informacion de tickets"/>
                <meta name="keywords" content="tikets , total, xslt,xml"/>  
                <meta name="robots" content="index, follow"/>
                <meta name="css/estilo.css" rel="strylesheet" type="text/css"/>
                <meta rel="icon" href="favicon.ico" type="image/x-icon"/>
            </head>
            <body>
                <header>
                    <h1>Informacion de Tikets</h1>
                </header>
                <div>
                    <h2>Listado de Tikets</h2>
                </div>
                    <xsl:apply-templates select="ticket"/>
                
                <div>
                    Numero de Tickets: <xsl:value-of select="count(ticket)"/>
                    Total de Tickets: <xsl:value-of select="sum(//total)"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="listatickets/comment()">
        <xsl:comment>
            <xsl:value-of select="."/>
        </xsl:comment>
    </xsl:template>
    <xsl:template match="tiket">
        <div>  
            Tikets: <xsl:value-of select="numero"/>
        </div>
        <table>
            <tr>
                <th>Producto</th>
                <th>Precio</th>
            </tr>
            <xsl:for-each select="producto">
                <tr>
                    <td>
                        <xsl:value-of select="nombre"/>
                    </td>
                    <td>
                        <xsl:value-of select="precio"/>
                    </td>
                </tr>
            </xsl:for-each>
            <tr>
                <th>total</th>
                <th>
                    <xsl:value-of select="//precio"/>
                </th>
            </tr>
        </table>
        <tfoot>
            <tr>
                <td colspan="4">FECHA DEL TICKET <xsl:value-of select="fecha/text()"/> </td>
            </tr>
        </tfoot>
    </xsl:template>
</xsl:stylesheet>
