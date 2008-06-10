<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"/>

	<xsl:param name="location"><xsl:value-of select="document('../cfg/globales.xml')/cfg/location" /></xsl:param>
	<xsl:variable name="messages" select="document(concat('location/', $location, '/', $locfile ,'.xml'))/messages"/>
  
	<xsl:template name="getmsg">
		<xsl:param name="id"/>
		<xsl:message>
			<xsl:value-of select="$messages/message[@name=$name]"/>
		</xsl:message>
	</xsl:template>

	<xsl:template name="problem">
		<xsl:call-template name="getmsg">
			<xsl:with-param name="id"></xsl:with-param>
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>