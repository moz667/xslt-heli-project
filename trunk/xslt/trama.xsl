<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="locfile">trama</xsl:param>
	<xsl:include href="inc/basic.xsl"/>
	
	<xsl:template match="/">
		<xsl:apply-templates select="*" />
	</xsl:template>
	
	<xsl:template match="object">
		<b><xsl:value-of select="@class" /></b><br />
		<xsl:apply-templates select="*" /><br />
	</xsl:template>
	
	<xsl:template match="void">
		<b>
			<xsl:call-template name="propdesc">
				<xsl:with-param name="id"><xsl:value-of select="@property" /></xsl:with-param>
			</xsl:call-template>
		</b>
		<br />
		<xsl:apply-templates select="*" /><br />
	</xsl:template>
</xsl:stylesheet>
