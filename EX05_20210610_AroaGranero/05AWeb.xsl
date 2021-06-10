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
    <xsl:include href="./lib/web.xsl"/>
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/mysqldump">
        <xsl:call-template name="docTipo"/>
        <html>
            <head>
                <xsl:call-template name="web">
                    <xsl:with-param name="titulo" select="'Ex AroaGraneroOmañas'"/>
                    <xsl:with-param name="descripcion" select="'Base de datos BDDepartamentos'"/>
                    <xsl:with-param name="keywords" select="'xml,xslt,html,baseDeDatos'"/>
                </xsl:call-template>
            </head>
            <body>
                <div>
                    <h1>Base de datos: <xsl:value-of select="//@name"/></h1>
                </div>
                <div class="tabla1">
                    <h2> Tabla:   <xsl:value-of select="//table_structure[@name='DEPART']/@name"/></h2>
                    <table>
                        <tr>
                            <th>
                                <xsl:value-of select="//@Field[1]"/>
                            </th>
                            <th>
                                <xsl:value-of select="//field[@Field='DNOMBRE']/@Field"/>
                            </th>
                            <th>
                                <xsl:value-of select="//field[@Field='LOC']/@Field"/>
                            </th>
                        </tr>
                        
                        <xsl:for-each select="//table_data[@name='DEPART']/row">
                            <tr>
                                <td> 
                                    <xsl:value-of select="field[@name='TDEPT_NO']/text()"/>
                                </td>
                                <td> 
                                    <xsl:value-of select="field[@name='DNOMBRE']/text()"/>
                                </td>
                                <td> 
                                    <xsl:value-of select="field[@name='LOC']/text()"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
                <div class="tabla2">
                    <h2> Tabla:   <xsl:value-of select="//table_structure[@name='EMPLE']/@name"/></h2>
                    <table>
                        <tr>
                            <xsl:for-each select="//table_structure[@name='EMPLE']/field">
                                <th>
                                    <xsl:value-of select="@Field"/>
                                </th>
                            </xsl:for-each>
                        </tr>
                        <xsl:for-each select="//table_data[@name='EMPLE']/row">
                            <tr>
                                 <td> 
                                    <xsl:value-of select="field[@name='EMP_NO']/text()"/>
                                </td>
                                <td> 
                                    <xsl:value-of select="field[@name='APELLIDO']/text()"/>
                                </td>
                                <td> 
                                    <xsl:value-of select="field[@name='OFICIO']/text()"/>
                                </td>
                                <td> 
                                    <xsl:value-of select="field[@name='DIR']/text()"/>
                                </td>
                                <td> 
                                    <xsl:value-of select="field[@name='FECHA_ALT']/text()"/>
                                </td>
                                <td> 
                                    <xsl:value-of select="field[@name='SALARIO']/text()"/>
                                </td>
                                <td> 
                                    <xsl:value-of select="field[@name='COMISION']/text()"/>
                                </td>
                                <td> 
                                    <xsl:value-of select="field[@name='DEPT_NO']/text()"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
                <div class="Pie_tabla">
                    <footer>Realizado por Aroa Graneo Omañas</footer>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
