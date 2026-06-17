<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ftid="http://www.boeing.com/FTID-ML" version="1.0">
  <!--
	Jeppesen Proprietary and Confidential
	Copyright Jeppesen Sanderson, Inc., 2005
	All Rights Reserved.

	Modified by Boeing for FTID data
-->
    <xsl:output omit-xml-declaration="yes" method="text"/>
  
    <xsl:param name="screenWidth" select="88"/>
	<xsl:param name="SectionToPrint"/>
	
	<xsl:strip-space elements="*"/>

	<xsl:template match="/">
		<xsl:apply-templates mode="locateSectionToPrint"/>
	</xsl:template>


	<xsl:template match="/*" mode="locateSectionToPrint">
		<!--<xsl:choose>
			<xsl:when test="self::ftid:FrontMatter[child::ftid:TitlePage or child::ftid:Glossary or child::ftid:RevisionRecord or child::ftid:EffectCrossRefs] or self::ftid:DispatchItems or self::ftid:GenericDoc or self::ftid:EICASReferences">-->
		<!-- Ancestors of the element that has an attribute whose value matches $SectionToPrint -->
		<xsl:variable name="ancestors" select="//*[@id=$SectionToPrint]/ancestor::*"/>
		<xsl:call-template name="printhierarchy">
			<xsl:with-param name="ancestors" select="$ancestors"/>
			<xsl:with-param name="count" select="count($ancestors)"/>
			<xsl:with-param name="position" select="1"/>
		</xsl:call-template>
			<!--</xsl:when>
			<xsl:otherwise>
				<xsl:text>Flight deck printing is not currently available for this document</xsl:text>
			</xsl:otherwise>			
		</xsl:choose>-->		
	</xsl:template>
	
	
	<!-- Go through the ancestors and print heading information for each, then print the actual selected section's content -->
	<xsl:template name="printhierarchy">
		<xsl:param name="ancestors"/>
		<xsl:param name="count"/>
		<xsl:param name="position"/>
		<xsl:choose>
			<xsl:when test="not($position &gt; $count)">  <!-- When $position is greater than $count it means there are no (more) ancestors to deal with-->
				<xsl:choose>
					<xsl:when test="$position = 1">  <!-- Root elements like DispatchItems, EICASReferences, etc. -->
						<xsl:apply-templates select="$ancestors[$position]/ftid:PUMetaData"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="$ancestors[$position]/ftid:Title"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:call-template name="printhierarchy"> <!-- recursive call -->
					<xsl:with-param name="ancestors" select="$ancestors"/>
					<xsl:with-param name="count" select="$count"/>
					<xsl:with-param name="position" select="$position + 1"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>  <!-- For the matching section itself:  Need to print all content -->			
				<xsl:apply-templates select="//*[@id=$SectionToPrint]"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

<xsl:template match="bla">
	<xsl:choose>			
			<xsl:when test="self::Abnemer">
				<xsl:copy>
				  <table>
					<tgroup cols="1">
						<tbody>
							<row>
								<entry>
									<xsl:if test="Title/@checklistType = 'U'">
										<xsl:text>-U- </xsl:text>
									</xsl:if>
									<xsl:if test="Title/@checklistType = 'eIcon'">
										<xsl:text>[] </xsl:text>
									</xsl:if>
									<xsl:apply-templates select="Title"/>
								</entry>
							</row>
						</tbody>
					</tgroup>
				  </table>
				  <xsl:apply-templates select="node()[not(self::Title)]|@*" mode="body"/>
				</xsl:copy>				
			</xsl:when>

			<xsl:when test="self::Approvals">
				<!-- Suppress for now -->
			</xsl:when>
			
			<xsl:when test="self::GO-AROUND-THRUST">
				<table>
					<tgroup cols="1">
						<tbody>
							<row>
								<entry>GO AROUND THRUST</entry>
							</row>
						</tbody>
					</tgroup>
				</table>
			</xsl:when>
			

			<xsl:when test="self::Destin">
				<xsl:copy>
					==><xsl:apply-templates/>
				</xsl:copy>
			</xsl:when>
			
			
			<xsl:when test="self::BulletinList">
				<table>
					<tgroup cols="5">
						<thead>
							<row>
								<entry>
									<Para>Number</Para>
								</entry>
								<entry>
									<Para>Subject</Para>
								</entry>
								<entry>
									<Para>Ref. No.</Para>
								</entry>
								<entry>
									<Para>Date</Para>
								</entry>
								<entry>
									<Para>Status</Para>
								</entry>
							</row>
						</thead>
						<tbody>
							<xsl:apply-templates select="*"/>
						</tbody>
					</tgroup>
				</table>
			</xsl:when>
			
			<xsl:when test="self::SBList">
				<table>
					<tgroup cols="3">
						<thead>
							<row>
								<entry>
									<Para>Number</Para>
								</entry>
								<entry>
									<Para>Title</Para>
								</entry>
								<entry>
									<Para>Date</Para>
								</entry>
							</row>
						</thead>
						<tbody>
							<xsl:apply-templates select="*"/>
						</tbody>
					</tgroup>
				</table>
			</xsl:when>
			
		</xsl:choose>
	</xsl:template>

	
	<xsl:include href="modules/db_main_print.xsl"/>
	<xsl:include href="modules/db_admon_mix_print.xsl"/>
	<xsl:include href="modules/db_textobj_mix_print.xsl"/>
	<xsl:include href="modules/db_cals_print.xsl"/>
	<xsl:include href="modules/db_highlights_print.xsl"/>
	
</xsl:stylesheet>
