<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
								xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
								xmlns:ftid="http://www.boeing.com/FTID-ML"
								xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
	<!--
======================================================================
Boeing Proprietary and Confidential - All Rights Reserved.

This XSL is covered under the Boeing Copyright for Flight Operations 
digital data.  Permission to use this XSL is subject to the entitlement
of the information or documents in which this XSL is applied.
======================================================================
-->
	
	<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

	
	<xsl:template match="ftid:TitlePage">
		<div style="width:80%; margin-left:10%">
		<xsl:apply-templates mode="TmpRev-phase" select="*[not(self::ftid:Approvals)]"/>
		</div>
	</xsl:template>


	<xsl:template match="ftid:ModelGraphic/ftid:Illustration">
		<xsl:apply-templates select="ftid:Title" mode="TmpRev-phase"/>
			<img alt="Title Page Illustration">
				<xsl:attribute name="class">TitlePage_Illustration<xsl:if test="$boolShowRevisionMarkings and (@rev:revStatus = 'R' or @rev:revStatus = 'N')"> RevMark</xsl:if></xsl:attribute>
				<xsl:attribute name="title"><xsl:value-of select="@rev:revHighlight"/></xsl:attribute>
				<xsl:attribute name="src">
					<xsl:choose>
						<xsl:when test="$isEFBOutput">
							<xsl:value-of select="concat($BasePath, '/images/', substring(@fileRef, 2), '.jpg')" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat('../images/', substring(@fileRef, 2), '.jpg')" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</img>
	</xsl:template>


	<xsl:template match="ftid:ManualInfo">
		<div class="TitlePage_ManualInfo">
			<xsl:apply-templates select="@model | @manualName | @customer" mode="TmpRev-phase"/>
		</div>
		<xsl:if test="ftid:Warning">
				<xsl:for-each select="ftid:Warning">
					<p class="WarningMessage">
						<xsl:value-of select="."/>
					</p>
				</xsl:for-each>
		</xsl:if>
		<xsl:apply-templates mode="TmpRev-phase" select="../ftid:Approvals"/>
		<p style="text-align: center;">			
			<xsl:if test="not(string-length(../ftid:CopyrightInfo/@year) = 0) and not(//ftid:ExportControlInfo)">
				<xsl:text>Copyright &#169; </xsl:text>
				<xsl:apply-templates select="../ftid:CopyrightInfo/@year" mode="TmpRev-phase"/>
				<br/>
			</xsl:if>
			<xsl:if test="not(string-length(../ftid:CopyrightInfo/@ARR) = 0)">
				<xsl:apply-templates select="../ftid:CopyrightInfo/@ARR" mode="TmpRev-phase" />
			</xsl:if>
		</p>
		<xsl:if test="not(string-length(@docNumber) = 0)">
			<p style="text-align: center; margin-bottom: 0em">
				<xsl:if test="string-length(@bulletinPackageRevNumber) &gt; 0 and string-length(@bulletinPackageRevDate) &gt; 0">
					<xsl:value-of select="$bulletin_package_revision-label"/><xsl:text>: </xsl:text>
					<xsl:apply-templates select="@bulletinPackageRevNumber" mode="TmpRev-phase"/>
					<br/>
					<xsl:value-of select="$bulletin_package_date-label"/><xsl:text>: </xsl:text>
					<xsl:apply-templates select="@bulletinPackageRevDate" mode="TmpRev-phase"/>
					<br/><xsl:text> </xsl:text><br/>
					<xsl:value-of select="$bulletin_addendum_message-label"/><xsl:text>:</xsl:text>
					<br/>
				</xsl:if>
				<xsl:value-of select="$doc_number-label"/><xsl:text> </xsl:text>
				<xsl:apply-templates select="@docNumber" mode="TmpRev-phase"/>
				<xsl:if test="string-length(@issueDate) &gt; 0">
					<br/>
					<xsl:apply-templates select="@issueDate" mode="TmpRev-phase"/>
				</xsl:if>
			</p>
		</xsl:if>
		<xsl:if test="not(string-length(concat(@revNumber, @revDate)) = 0)">
			<p style="text-align:center;">
				<xsl:if test="not(string-length(@revNumber) = 0)">
					<xsl:apply-templates select="@revNumber" mode="TmpRev-phase" />
				</xsl:if>
				<xsl:if test="not(string-length(@revDate) = 0)">
					<xsl:apply-templates select="@revDate" mode="TmpRev-phase" />
				</xsl:if>
			</p>
		</xsl:if>
	</xsl:template>

	<xsl:template match="@model">
			<xsl:value-of select="."/>
			<br/>
			<br/>
			<xsl:text> </xsl:text>
	</xsl:template>


	<xsl:template match="@manualName">
			<xsl:value-of select="." />
			<br/>
            <!-- IXP 4.1 - Add manual volume number to title page display -->
            <xsl:value-of select="//ftid:FrontMatter/ftid:TitlePage/ftid:ManualInfo/ftid:Para" />
            <br/>
	</xsl:template>


	<xsl:template match="@customer">
			<xsl:value-of select="." />
	</xsl:template>
	
	
	
	<xsl:template match="ftid:ExportControlInfo">
		<div style="border:solid 1px;padding:1em;">
			<xsl:apply-templates mode="TmpRev-phase" />
		</div>
	</xsl:template>


	<xsl:template match="ftid:ManualInfo/@revNumber">
		<xsl:value-of select="$rev_number-label"/><xsl:text>: </xsl:text>
		<xsl:value-of select="."/>
		<br/>
	</xsl:template>
	
	<xsl:template match="ftid:ManualInfo/@revDate">
		<xsl:value-of select="$rev_date-label"/><xsl:text>: </xsl:text>
		<xsl:value-of select="."/>
		<br/>
	</xsl:template>


	<xsl:template match="ftid:CopyrightInfo">
		<div style="margin-top:2em">
			<xsl:apply-templates mode="TmpRev-phase"/>
		</div>
		<hr/>
	</xsl:template>


	<xsl:template match="ftid:CopyrightInfo/*">
		<div class="CopyrightInfo">
			<xsl:if test="self::ftid:CopyrightHeading">
				<xsl:attribute name="style">text-align:center; margin-bottom:1em</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="TmpRev-phase"/>
		</div>
	</xsl:template>


</xsl:stylesheet>