<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : xsl_html.xsl
    Created on : 9 de junio de 2021, 17:17
    Author     : aroaGO
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:include href="../lib/web.xsl"/>
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <xsl:call-template name="docTipo"/>
        <html>
            <head>
               <xsl:call-template name="web">
                    <xsl:with-param name="titulo" select="xxx"/>
                    <xsl:with-param name="descripcion" select="'xxx'"/>
                    <xsl:with-param name="keywords" select="'xml,xslt,html'"/>
                </xsl:call-template>
            </head>
            <body>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
