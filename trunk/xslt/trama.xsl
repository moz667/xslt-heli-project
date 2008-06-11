<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="locfile">trama</xsl:param>
	<xsl:include href="inc/basic.xsl"/>
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Transformacion trama</title>
			</head>
		
			<body>
				<table>
				<tr>
					<th colspan="3">Cabecera de trama ethernet (?)</th>
				</tr>
				<tr>
					<td>
						<xsl:apply-templates select="//void[@property='macDestino']" />	
					</td>
					<td>
						<xsl:apply-templates select="//void[@property='macOrigen']" />
					</td>
					<td>
						<b>Tipo :</b> ??? 
					</td>
				</tr>
				<tr>
					<td><xsl:apply-templates select="//void[@property='id']" /></td>
					<td></td>
					<td></td>	
				</tr>
				</table>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
