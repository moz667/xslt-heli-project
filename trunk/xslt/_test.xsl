<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="locfile">trama</xsl:param>
	<xsl:include href="inc/basic.xsl"/>
	
	<xsl:template match="/">
		<xsl:apply-templates select="*" />
	</xsl:template>
	
	<xsl:template match="object">
		<ul>
			<li><xsl:value-of select="@class" /></li>
			
			<!-- Los objetos de tipo date vienen con formato epoch -->
			<xsl:if test="@class = 'java.util.Date'">
				<xsl:call-template name="dategreg">
					<xsl:with-param name="datelong"><xsl:value-of select="long" /></xsl:with-param>
				</xsl:call-template>
			</xsl:if>
			
			<xsl:if test="not (@class = 'java.util.Date')">
				<xsl:apply-templates select="*" />
			</xsl:if>
		</ul>
	</xsl:template>
	
	<xsl:template match="void">
		<ul>
			<li>
				<xsl:call-template name="propdesc">
					<xsl:with-param name="id"><xsl:value-of select="@property" /></xsl:with-param>
				</xsl:call-template>
			</li>
		<xsl:apply-templates select="*" />
		</ul>
	</xsl:template>
</xsl:stylesheet>
