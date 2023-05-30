<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="xml" indent="yes"/>
	
	<xsl:template match="/">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4" page-height="29.7cm" page-width="21cm" margin-top="0.5cm" margin-bottom="0.5cm" margin-left="1cm" margin-right="1cm">
					<fo:region-body margin-top="1cm"/>
					<fo:region-before extent="3cm"/>
					<fo:region-after extent="1.5cm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<xsl:apply-templates select="facturas/factura"/>
		
		<xsl:for-each select="facturas/factura">

		<fo:page-sequence master-reference="A4">
			<fo:flow flow-name="xsl-region-body">
				<!--LOGO-->
				<fo:block>
					<fo:external-graphic src="logoPcComponentes.png" content-width="19cm"/>
				</fo:block>
				<!--TITULO-->
				<fo:block text-align="center" width="19cm" font-size="24pt" margin-bottom="0.5cm" margin-top="0.5cm">
					<xsl:text>FACTURA</xsl:text>
				</fo:block>
                <!--TABLA EMPRESA/CLIENTE-->
				<fo:table font-size="10pt" text-align="left" width="19cm"  margin-bottom="0.5cm" margin-top="0.5cm">
					<fo:table-body>
							<fo:table-row>
									<fo:table-cell width="8cm"  border-style="solid" border-width="0.5mm" padding="2mm">
										<fo:block>
											<xsl:value-of select="datosVendedor/nombre"/>
										</fo:block>
										<fo:block>
											<xsl:text>CIF: </xsl:text>
											<xsl:value-of select="datosVendedor/CIF"/>
										</fo:block>
										<fo:block>
											<xsl:value-of select="datosVendedor/direccion/calle"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="datosVendedor/direccion/numero"/>
											<xsl:text>, </xsl:text>
											<xsl:value-of select="datosVendedor/direccion/extra"/>
											<xsl:text>. </xsl:text>
										</fo:block>
										<fo:block>
											<xsl:value-of select="datosVendedor/direccion/poblacion"/>
											<xsl:text>.</xsl:text>
										</fo:block>
										<fo:block>
											<xsl:value-of select="datosVendedor/direccion/codigoPostal"/>
											<xsl:text>. </xsl:text>
											<xsl:value-of select="datosVendedor/direccion/provincia"/>
											<xsl:text>.</xsl:text>
										</fo:block>
								</fo:table-cell>
				<!--celda entre medias VACIA-->
								<fo:table-cell>
									<fo:block>
									</fo:block>
								</fo:table-cell>

								<fo:table-cell width="10.5cm"  border-style="solid" border-width="0.5mm" padding="2mm">
									<fo:block>
										<xsl:text>Comprador: </xsl:text>
										<xsl:value-of select="datosComprador/nombre"/>
									</fo:block>
									<fo:block>
											<xsl:text>Dirección: </xsl:text>
											<xsl:value-of select="datosComprador/direccion/calle"/>
											<xsl:text> , </xsl:text>
											<xsl:value-of select="datosComprador/direccion/numero"/>
											<xsl:text> , </xsl:text>
											<xsl:value-of select="datosComprador/direccion/extra"/>
											<xsl:text>.</xsl:text>
									</fo:block>
									<fo:block>		
											<xsl:text>Población: </xsl:text>
											<xsl:value-of select="datosComprador/direccion/poblacion"/>
											<xsl:text>. </xsl:text>
											<xsl:value-of select="datosComprador/direccion/codigoPostal"/>
											<xsl:text>, </xsl:text>
											<xsl:value-of select="datosComprador/direccion/provincia"/>
											<xsl:text>.</xsl:text>
									</fo:block>
									<fo:block>
										<xsl:text>Nº </xsl:text><xsl:value-of select="datosComprador/identificacion/@tipo"/> <xsl:text>: </xsl:text>
										<xsl:value-of select="datosComprador/identificacion"/>
									</fo:block>
									<fo:block>
										<xsl:text>Teléfono: </xsl:text>
										<xsl:value-of select="datosComprador/telefono"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
					</fo:table-body>
				</fo:table>
		
				<!--TABLA FECHA/NUMFACTURA/FORMAPAGO-->
				<fo:table font-size="9pt" text-align="left" width="19cm"  margin-bottom="0.5cm">
					<fo:table-body>
							<fo:table-row>
								<fo:table-cell width="6cm"  border-style="solid" border-width="0.5mm" padding="1mm">
									<fo:block>
										<xsl:text>Num. Factura: </xsl:text>
										<xsl:value-of select="@numFactura"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell width="6cm"  border-style="solid" border-width="0.5mm" padding="1mm">
									<fo:block>
										<xsl:text>Fecha: </xsl:text>
										<xsl:value-of select="fecha/dia"/>
										<xsl:text>/</xsl:text>
										<xsl:value-of select="fecha/mes"/>
										<xsl:text>/</xsl:text>
										<xsl:value-of select="fecha/anyo"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell width="7cm"  border-style="solid" border-width="0.5mm" padding="1mm">
									<fo:block>
										<xsl:text>Forma de Pago: </xsl:text>
										<xsl:value-of select="formaPago"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
					</fo:table-body>
				</fo:table>

				<!--TABLA PRINCIPAL PRODUCTOS-->
				<fo:table width="19cm" border-style="solid" border-width="0.5mm">
					<!--header-->
					<fo:table-header background-color="#CCCCCC" font-size="11pt">
						<fo:table-row>
							<fo:table-cell border-style="solid" border-width="0.5mm" padding="2mm" width="1.5cm" text-align="center">
								<fo:block>Cod</fo:block>
							</fo:table-cell>
							<fo:table-cell border-style="solid" border-width="0.5mm" padding="2mm" width="12cm" text-align="left">
								<fo:block>Artículo</fo:block>
							</fo:table-cell>
							<fo:table-cell border-style="solid" border-width="0.5mm" padding="2mm" width="2cm" text-align="right">
								<fo:block>Precio</fo:block>
							</fo:table-cell>
							<fo:table-cell border-style="solid" border-width="0.5mm" padding="2mm" width="1.5cm" text-align="right">
								<fo:block>Uds</fo:block>
							</fo:table-cell>
							<fo:table-cell border-style="solid" border-width="0.5mm" padding="2mm" width="2cm" text-align="right">
								<fo:block>Total</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<!--Fila albaran-->
						<fo:table-row>
							<fo:table-cell number-columns-spanned="5" font-size="9.5pt" border-style="solid" border-width="0.5mm" padding="1mm" text-align="left" background-color="#E7E7E7">
								<fo:block>
									<xsl:text>Albarán del pedido: </xsl:text>
									<xsl:value-of select="albaran/numAlbaran"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					<!--body-->
					<fo:table-body  font-size="10pt">
						<xsl:for-each select="productos/producto">
							<fo:table-row border-style="solid" border-width="0.5mm">
								<fo:table-cell border-style="solid" border-width="0.5mm" padding="1mm" width="1.5cm" text-align="center">
									<fo:block>
										<xsl:value-of select="@id"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell  border-style="solid" border-width="0.5mm" padding="1mm" width="12cm" text-align="left">
									<fo:block>
										<xsl:value-of select="nombre"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-style="solid" border-width="0.5mm" padding="1mm" width="2cm" text-align="right">
									<fo:block>
										<xsl:value-of select="precio"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-style="solid" border-width="0.5mm" padding="1mm" width="1.5cm" text-align="right">
									<fo:block>
										<xsl:value-of select="numUnidades"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-style="solid" border-width="0.5mm" padding="1mm" width="2cm" text-align="right">
									<fo:block>
										<xsl:value-of select="total"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>

					
					</fo:table-body>
				</fo:table>

			<!--TABLA PRECIO FINAL-->
                 <fo:table font-size="12pt" text-align="right" width="19cm" border-style="solid" border-width="0.5mm" margin-top="1cm" font-family="Helvetica">
					<!--header-->
					<fo:table-header background-color="#CCCCCC">
					<fo:table-row>                         
						<fo:table-cell width="7cm" border-style="solid" border-width="0.5mm" padding="2mm">
							<fo:block>SUBTOTAL</fo:block> 
						</fo:table-cell>
						<fo:table-cell width="4cm"  border-style="solid" border-width="0.5mm" padding="2mm">
							<fo:block>IVA</fo:block> 
						</fo:table-cell>
						<fo:table-cell width="4cm" border-style="solid" border-width="0.5mm" padding="2mm">
							<fo:block>REQ.EQUIV</fo:block> 
						</fo:table-cell>
						<fo:table-cell width="4cm" border-style="solid" border-width="0.5mm" padding="2mm">
							<fo:block>TOTAL</fo:block> 
						</fo:table-cell>
					</fo:table-row>
					</fo:table-header>
					<!--body-->
					<fo:table-body>
						<fo:table-row border-style="solid" border-width="0.5mm">
							<fo:table-cell width="7cm" border-style="solid" border-width="0.5mm" padding="1mm">
								<fo:block><xsl:value-of select="subtotal"/></fo:block>
							</fo:table-cell>
							<fo:table-cell width="4cm" border-style="solid" border-width="0.5mm" padding="1mm">
								<fo:block><xsl:value-of select="@tipo"/><xsl:value-of select="iva"/></fo:block>
							</fo:table-cell>
							<fo:table-cell width="4cm" border-style="solid" border-width="0.5mm" padding="1mm">
								<fo:block>--</fo:block>
							</fo:table-cell>
							<fo:table-cell width="4cm" border-style="solid" border-width="0.5mm" padding="1mm">
								<fo:block><xsl:value-of select="total"/></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
            </fo:flow>
		</fo:page-sequence>
		</xsl:for-each>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
