<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05.xsl
    Created on : 4 de mayo de 2021, 13:44
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>05.xsl</title>
            </head>
            <body>
                <table>
                     <tr>
                    <th>Ref</th>
                    <th>Descripción</th>
                    <th>Cantidad</th>
                    <th>Precio</th>
                    <th>Importe</th>
                </tr>
                <xsl:apply-templates select="//linea "/>
               
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//linea">
     
        <tr>
            <td><xsl:value-of select="ref"/></td>
            <td><xsl:value-of select="desc"/></td>
            <td><xsl:value-of select="cant"/></td>
            <td><xsl:value-of select="precio"/></td>
            <td><xsl:value-of select="importe"/></td>
        </tr>
        
    </xsl:template>

</xsl:stylesheet>
