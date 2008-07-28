<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
	
<html><head>
<link href="page.css" rel="stylesheet" type="text/css"/>
</head><body>
<p><b>
<xsl:for-each select="java/object/void[@property='version']">
	<xsl:value-of select="string"/>
</xsl:for-each> - 
<xsl:for-each select="java/object/void[@property='id']">
	<xsl:value-of select="@property"/> = 
	<xsl:value-of select="long"/>
</xsl:for-each>	</b></p>
<table border="1">
<tbody><tr>
<th>00</th><th>01</th><th>02</th><th>03</th><th>04</th><th>05</th><th>06</th><th>07</th>
<th>08</th><th>09</th><th>10</th><th>11</th><th>12</th><th>13</th><th>14</th><th>15</th>
<th>16</th><th>17</th><th>18</th><th>19</th><th>20</th><th>21</th><th>22</th><th>23</th>
<th>24</th><th>25</th><th>26</th><th>27</th><th>28</th><th>29</th><th>30</th><th>31</th></tr>
<tr>
<td class="pkthdr" colspan="32">MAC destino:
<xsl:for-each select="java/object/void[@property='macDestino']"> 
	<xsl:value-of select="string"/>
</xsl:for-each>	</td></tr>
<tr>
<td class="pkthdr" colspan="32">MAC origen: 
<xsl:for-each select="java/object/void[@property='macOrigen']"> 
	<xsl:value-of select="string"/>
</xsl:for-each></td></tr>
<tr>
<td class="pkthdr" colspan="16">Tipo: 
<xsl:for-each select="java/object/void[@property='tipoTrama']"> 
	<xsl:value-of select="short"/>
</xsl:for-each> - 
<xsl:for-each select="java/object/void[@property='txtTipoTrama']"> 
	<xsl:value-of select="string"/>
</xsl:for-each></td>
<td class="pktvarlen" colspan="16">Datos: <xsl:for-each select="java/object/void[@property='datos']"> 
	<xsl:value-of select="array"/>
</xsl:for-each></td></tr>
</tbody></table>
</body></html>

	</xsl:template>
</xsl:stylesheet>	