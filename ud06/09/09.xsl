<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 09.xsl
    Created on : 20 de mayo de 2021, 9:10
    Author     : daw1
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
                <title>09.xsl</title>
                <xsl:call-template name="web">
                    <xsl:with-param name="titulo" select="concat('09 XSLT ',universidad/nombre)"/>
                    <xsl:with-param name="descripcion" select="'Informacion Universidad'"/>
                    <xsl:with-param name="keywords" select="'xml,xslt,universidad'"/>
                </xsl:call-template>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="concat('09 XSLT ',/universidad/nombre)"/>
                </h1>
                <xsl:apply-templates select="//carreras/carrera">
                    <xsl:sort name="nombre"/>
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="carrera">
        <div class="carrera">
            <h2>
                <xsl:value-of select="concat(@id,'-',nombre,'(',plan,')')"/>
            </h2>
            <div>
                <xsl:value-of select="centro"/>
            </div>
            <xsl:if test="count(//asignaturas/asignatura[@titulacion=current()/@id])!=0">
                <ul>
                    <xsl:apply-templates select="//asignaturas/asignatura[@titulacion=current()/@id]">
                        <xsl:sort name="nombre"/>
                    </xsl:apply-templates>
                </ul>
            </xsl:if>
        </div>
    </xsl:template>
    <xsl:template match="asignatura">
        <li>
            <xsl:value-of select="concat('(',@id,')',nombre)"/>
            <xsl:if test="count(//alumno[estudios//asignatura/@codigo=current()/@id])!=0">
            <ol>
                <xsl:apply-templates select="//alumno[estudios//asignatura/@codigo=current()/@id]"/>
            </ol> 
            </xsl:if>
        </li>
    </xsl:template>
    <xsl:template match="alumno">
        <li>
             <abbr>
                <xsl:attribute name="title">
                    <xsl:value-of select="//carrera[@id=current()//carrera/@codigo]/nombre"/>
                </xsl:attribute>
                 <xsl:value-of select="concat(apellido1,' ',apellido1,', ',nombre)"/>
            </abbr>
        </li>
    </xsl:template>
</xsl:stylesheet>
