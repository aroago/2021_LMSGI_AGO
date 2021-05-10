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
    <xsl:template match="/factura">
        <html>
            <head>
                <title>Aroa Granero Omanas 05.xsl</title>
                <link rel="stylesheet" href="05.css" type="text/css"/>
            </head>
            <body>
                <table>
                    <tr>
                        <td colspan="3">
                            <h2>FANCTURA NUMERO <xsl:value-of select="n_factura"/></h2>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="3">DATOS EMISOR</th>
                    </tr>
                    <tr>
                        <td>RAZON SOCIAL:<xsl:value-of select="datos_emisor/nombre"/></td>
                        <td colspan="2">NIF/CIF:<xsl:value-of select="datos_emisor/cif"/></td>
                    </tr>
                    <tr>
                        <td>DIRECCION:</td>
                        <td colspan="2"> 
                            <xsl:value-of select="datos_emisor/dir"/>
                            <br/>
                            <xsl:value-of select="datos_emisor/cod_postal"/>
                            <xsl:value-of select="datos_emisor/poblacion"/>
                            <br/>
                            <xsl:value-of select="datos_emisor/provincia"/>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="3">DATOS DE CONTACTO</th>
                    </tr>
                    <tr>
                        <td>TELEFONO: <xsl:value-of select="datos_emisor/num_tel"/></td>
                        <td colspan="2">FAX: <xsl:value-of select="datos_emisor/num_fax"/></td>
                    </tr>
                    <tr>
                        <th colspan="3">DATOS RECEPTOR</th>
                    </tr>
                    <tr>
                        <td colspan="3">Num Cliente: <xsl:value-of select="datos_receptor/n_cli"/></td>
                    </tr>
                    <tr>
                        <td>DIRECCION: </td>
                        <td colspan="2">
                            <xsl:value-of select="datos_receptor/dir"/>
                            <br/>
                            <xsl:value-of select="datos_receptor/cod_postal"/>
                            <xsl:value-of select="datos_receptor/poblacion"/>
                            <br/>
                            <xsl:value-of select="datos_receptor/provincia"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <th colspan="3">RESUMEN FACTURA</th>
                    </tr>
                    <tr>
                        <td>Número pedido: <xsl:value-of select="datos_factura/n_ped"/></td>
                        <td>IVA: <xsl:value-of select="datos_factura/iva"/></td>
                        <td>Forma de Pago: <xsl:value-of select="datos_factura/f_pago"/></td>
                    </tr>
                    <tr>
                        <td>Moneda: <xsl:value-of select="datos_factura/moneda"/></td>
                        <td colspan="2">Fecha: <xsl:value-of select="datos_factura/fecha"/></td>
                    </tr>
                    <tr>
                        <th colspan="3">DETALLE FACTURA</th>
                    </tr>
                    <tr>
                        <td colspan="3">
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
                        </td>
                    </tr>
                    <tr>
                        <th colspan="3">IMPORTES FACTURA</th>
                    </tr>
                    <tr>
                        <th class="fin">Base:<xsl:value-of select="datos_factura/base"/></th>
                        <th class="fin">Cuota IVA:<xsl:value-of select="datos_factura/cuota_iva"/></th>
                        <th class="fin">Total Factura:<xsl:value-of select="datos_factura/total"/></th>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//linea">
     
        <tr>
            <td>
                <xsl:value-of select="ref"/>
            </td>
            <td>
                <xsl:value-of select="desc"/>
            </td>
            <td>
                <xsl:value-of select="cant"/>
            </td>
            <td>
                <xsl:value-of select="precio"/>
            </td>
            <td>
                <xsl:value-of select="importe"/>
            </td>
        </tr>
        
    </xsl:template>

</xsl:stylesheet>
