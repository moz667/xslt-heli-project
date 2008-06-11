<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"/>

	<xsl:variable name="location"><xsl:value-of select="document('../cfg/globales.xml')/cfg/location" /></xsl:variable>
	<xsl:variable name="messages" select="document(concat('location/', $location, '/', $locfile ,'.xml'))/messages"/>
  	<xsl:variable name="ppdescs" select="document('properties.xml')/properties"/>
  	
	<xsl:template name="getmsg">
		<xsl:param name="id"/>
		
		<xsl:value-of select="$messages/msg[@id=$id]"/>
	</xsl:template>

	<xsl:template name="problem">
		<xsl:call-template name="getmsg">
			<xsl:with-param name="id"></xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="propdesc">
		<xsl:param name="id"/>
		
		<xsl:call-template name="getmsg">
			<xsl:with-param name="id"><xsl:value-of select="$ppdescs/p[@id=$id]" /></xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="dategreg">
		<xsl:param name="datelong"/>
		
		<xsl:variable name="idAux"><xsl:value-of select="generate-id()" /></xsl:variable>
		
		<span>
			<xsl:attribute name="id"><xsl:value-of select="$idAux" /></xsl:attribute>
		</span>
		
		<script language="javascript1.2">
			var dDate = new Date();
			dDate.setTime(<xsl:value-of select="$datelong" />);
			document.getElementById("<xsl:value-of select="$idAux" />").innerHTML = dDate;
		</script>
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
		<b>
			<xsl:call-template name="propdesc">
				<xsl:with-param name="id"><xsl:value-of select="@property" /></xsl:with-param>
			</xsl:call-template>
		</b>
		
		<xsl:apply-templates />
	</xsl:template>
	
</xsl:stylesheet>