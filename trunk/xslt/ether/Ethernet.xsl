<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	
<xsl:template match="/">
	<html>
	<head>
		<link href="page.css" rel="stylesheet" type="text/css"/>
	</head>
		
	<body>
		<!--  
			Esto es como seleccionar los datos a partir de java/object y aplicar 
			la plantilla de la misma (match=java/object) 
		-->
		<xsl:apply-templates select="java/object" />
	</body>
	</html>
</xsl:template>

<!-- 
	Podriamos hacer un match un poco mas selectivo para cada uno de los objetos
	por ejemplo :
	match="java/object[@class='fabricaDAO.TramaEthernet'"
	asi podriamos hacer distintas plantillas para cada uno de los objetos.
 -->
<xsl:template match="java/object">
	<p><b>
		<xsl:value-of select="void[@property='version']/string"/>
		- id = 
		<xsl:value-of select="void[@property='id']/long"/>
	</b></p>

	<table border="1">
	<tbody>
	<tr>
		<th>00</th><th>01</th><th>02</th><th>03</th><th>04</th><th>05</th><th>06</th><th>07</th>
		<th>08</th><th>09</th><th>10</th><th>11</th><th>12</th><th>13</th><th>14</th><th>15</th>
		<th>16</th><th>17</th><th>18</th><th>19</th><th>20</th><th>21</th><th>22</th><th>23</th>
		<th>24</th><th>25</th><th>26</th><th>27</th><th>28</th><th>29</th><th>30</th><th>31</th>
	</tr>
	<tr>
		<td class="pkthdr" colspan="32">
			MAC destino:
			<xsl:value-of select="void[@property='macDestino']/string"/>
		</td>
	</tr>
	<tr>
		<td class="pkthdr" colspan="32">
			MAC origen: 
			<xsl:value-of select="void[@property='macOrigen']/string"/>
		</td>
	</tr>
	<tr>
		<td class="pkthdr" colspan="16">
			Tipo: 
			<xsl:value-of select="void[@property='tipoTrama']/short"/>
			- 
			<xsl:value-of select="void[@property='txtTipoTrama']/string"/>
		</td>
		<td class="pktvarlen" colspan="16">
			Datos: 
			<xsl:value-of select="void[@property='datos']/array"/>
		</td>
	</tr>
	</tbody>
	</table>
</xsl:template>

</xsl:stylesheet>	