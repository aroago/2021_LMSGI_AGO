<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 02.xsl
    Created on : 28 de abril de 2021, 21:09
    Author     : Juanjo
    Description:
        Purpose of transformation follows.
-->
  
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:output method="html" encoding="utf-8" indent="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
   
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!Doctype html></xsl:text>
        <xsl:apply-templates select="comment()"/>
       
        <html>
            <head>
                <title>02 XSLT Aroa Granero Omañas</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="with=device-with, initial-scale=1.0"/>
                <meta name="author" content="Amor Rodriguez"/>  
                <meta name="application-name" content="AppWeb de LMSGI"/>
                <meta name="description" content="Informacion de tickets"/>
                <meta name="keywords" content="tikets , total, xslt,xml"/>  
                <meta name="robots" content="index, follow"/>
                <link  rel="icon"  href="../../img/favicon.ico" type="image/png" />
                <link rel="stylesheet" href="02.css" type="text/css" />
            </head>
            <body>
                <header>
                    <h1>Informacion de Tikets</h1>
                </header>
                <div>
                    <h2>Listado de Tikets</h2>
                </div>
                <xsl:apply-templates select="listatickets/ticket"/>
                
                <div id="pie">
                    Numero de Tickets: <xsl:value-of select="count(listatickets/ticket)"/>
                    <br/>
                    Total de Tickets: <xsl:value-of select="sum(//total)"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="comment()">
        <xsl:comment>
            <xsl:text xml:space="preserve">
            <xsl:value-of select="."/>
            </xsl:text>
        </xsl:comment>
    </xsl:template>
    <xsl:decimal-format name="euro" decimal-separator="," grouping-separator="."/>
    
    <xsl:template match="listatickets/ticket">
        <div id="cabeza">  
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
                        <xsl:value-of select="format-number(precio,'#.##0,00','euro')"/>
                    </td>
                    
                </tr>
            </xsl:for-each>
            <tr>
                <th>total</th>
                <th>
                    <xsl:value-of select="format-number(//precio,'#.##0,00','euro')"/>
                </th>
                
            </tr>
            <xsl:variable name="fecha" select="fecha"/>
            <tfoot>
                <tr>
                    <td id="foot" colspan="4">FECHA DEL TICKET  <xsl:value-of select="concat(
                                                              substring($fecha, 9, 2), 
                                                                 '/', 
                                                              substring($fecha, 6, 2), 
                                                                '/', 
                                                                substring($fecha, 1, 4) )"/> 
                    </td>
                </tr>
            </tfoot>
        </table>
    </xsl:template>
   
</xsl:stylesheet>
