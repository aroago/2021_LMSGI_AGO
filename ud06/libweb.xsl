<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : libweb.xsl
    Created on : 13 de mayo de 2021, 8:48
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
                <title>libweb.xsl</title>
            </head>
            <body>
            </body>
        </html>
    </xsl:template>
    <xsl:template name="metaweb">
        <meta charset="UTF-8"/>
        <meta name="viewport" content="with=device-with, initial-scale=1.0"/>
        <meta name="author" content="Aroa Granero Omañas"/>  
        <meta name="application-name" content="AppWeb de LMSGI"/>
        <meta name="description" content="Informacion de tickets"/>
        <meta name="keywords" content="tikets , total, xslt,xml"/>  
        <meta name="robots" content="index, follow"/>
        <link  rel="icon"  href="../../img/favicon.ico" type="image/png" />
        <link rel="stylesheet" href="css" type="text/css" />
    </xsl:template>
    <xsl:template name="DocTipo">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE htm&gt;</xsl:text>
    </xsl:template>
    <xsl:template match="comment()">
        <xsl:comment>
            <xsl:text xml:space="preserve">
            <xsl:value-of select="."/>
            </xsl:text>
        </xsl:comment>
    </xsl:template>
    
</xsl:stylesheet>
