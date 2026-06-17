<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ftid="http://www.boeing.com/FTID-ML" version="1.0" xmlns:exslt="http://exslt.org/common" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
	<!--
	Jeppesen Proprietary and Confidential
	Copyright Jeppesen Sanderson, Inc., 2005
	All Rights Reserved.

	Modified by Boeing for FTID data
	-->
	
	<!--
	Match any element with a PUInfo or Title.  <Abnemer>s aren't
	matched because theirs are converted to a title box.
	<table>s, <HighlightList>s, <HighlightItem>s, <MELItem>s, <NonNormal>s,
	and	<MELSubItem>s aren't matched because they are handled separately.
	-->
	<xsl:template match="*[child::ftid:Title or child::ftid:PUInfo or self::ftid:Bulletin or self::ftid:PerfTopicHeading][not(self::ftid:table or self::ftid:NonNormal or self::ftid:MELItem or self::ftid:MELSubItem or self::ftid:DispatchCondition or self::ftid:CDLItem or self::ftid:HighlightList or self::ftid:HighlightItem)]">
		<xsl:if test="node()">
			<xsl:apply-templates select="." mode="contentTitle">
				<xsl:with-param name="level" select="0"/>
			</xsl:apply-templates>
			<xsl:apply-templates select="node()[not(self::ftid:Title)]">
				<xsl:with-param name="level" select="0"/>
			</xsl:apply-templates>
		</xsl:if>
		<xsl:if test="not(/ftid:Performances)"><xsl:text>&#xd;</xsl:text></xsl:if>
	</xsl:template>


	<!-- <xsl:template match="Effectivities[../Title][not(parent::Supplementary|parent::table)]"> -->
		<!-- Suppress Effectivities that are handled in the rule above or elsewhere -->
	<!-- </xsl:template> -->


	<!-- <xsl:template match="Title[not(parent::TitlePerfL2|parent::TitlePerfL3|parent::TitlePerfL4|parent::Supplementary)]"> -->
		<!-- 
		Suppress all Title elements that are handled in contentTitle mode or elsewhere, as
		well as TitlePerfL1 Titles
		-->
	<!-- </xsl:template> -->
	
	
    <xsl:template match="*[child::ftid:Title or self::ftid:PerfTopicHeading]" mode="contentTitle">
		<xsl:param name="level" select="0"/>
		<xsl:if test="not(ancestor::*[child::ftid:Title or child::ftid:PerfTopicHeading]) or self::ftid:PerfTopicHeading"><xsl:call-template name="insertRule"/><xsl:text>&#xd;</xsl:text></xsl:if>
		<xsl:for-each select="ftid:Title">
			<xsl:variable name="title">
				<xsl:value-of select="."/>
			</xsl:variable>
			<xsl:call-template name="chopper">
				<xsl:with-param name="level" select="$level"/>
				<xsl:with-param name="remainingString" select="normalize-space($title)"/>
				<xsl:with-param name="align" select="'center'"/>
			</xsl:call-template>
		</xsl:for-each>
		<xsl:if test="not(/ftid:Performances)"><xsl:text>&#xd;</xsl:text></xsl:if>
	</xsl:template>
	
	
	<xsl:template match="*[child::ftid:PUInfo]" mode="contentTitle">
		<xsl:param name="level" select="0"/>
		<xsl:apply-templates select="ftid:PUInfo/@model">
			<xsl:with-param name="level" select="$level"/>
		</xsl:apply-templates>
		<xsl:variable name="chapter-and-section-number">
			<xsl:value-of select="ftid:PUInfo/@chapterNumber"/><xsl:if test="string-length(ftid:PUInfo/@chapterNumber) &gt; 0 and string-length(ftid:PUInfo/@sectionNumber) &gt; 0">-</xsl:if><xsl:value-of select="ftid:PUInfo/@sectionNumber"/>
		</xsl:variable>
		<xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="remainingString" select="normalize-space($chapter-and-section-number)"/>
			<xsl:with-param name="align" select="'center'"/>
		</xsl:call-template>
		<xsl:variable name="chapter-and-section-name">
			<xsl:value-of select="ftid:PUInfo/@chapterName"/><xsl:if test="string-length(ftid:PUInfo/@chapterName) &gt; 0 and string-length(ftid:PUInfo/@sectionName) &gt; 0">: </xsl:if><xsl:value-of select="ftid:PUInfo/@sectionName"/>
		</xsl:variable>
		<xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="remainingString" select="normalize-space($chapter-and-section-name)"/>
			<xsl:with-param name="align" select="'center'"/>
		</xsl:call-template>
		<xsl:variable name="PUEffectivityString">
			<xsl:if test="string-length(ftid:PUEffectivity/@airframe) + string-length(ftid:PUEffectivity/@engine) &gt; 0"><xsl:text>Airframe/Engine: </xsl:text><xsl:value-of select="ftid:PUEffectivity/@airframe"/>/<xsl:value-of select="ftid:PUEffectivity/@engine"/><xsl:if test="string-length(ftid:PUEffectivity/@equipment) + string-length(ftid:RegulatoryInfo/ftid:RegulatoryInfoItem/@agencyName) &gt; 0"><xsl:text>, </xsl:text></xsl:if></xsl:if>
			<xsl:if test="string-length(ftid:RegulatoryInfo/ftid:RegulatoryInfoItem/@agencyName) &gt; 0"><xsl:value-of select="ftid:RegulatoryInfo/ftid:RegulatoryInfoItem/@agencyName"/><xsl:if test="string-length(ftid:PUEffectivity/@equipment) &gt; 0"><xsl:text>, </xsl:text></xsl:if></xsl:if>
			<xsl:value-of select="ftid:PUEffectivity/@equipment"/>
		</xsl:variable>
		<xsl:if test="string-length($PUEffectivityString) &gt; 0">
			<xsl:call-template name="chopper">
				<xsl:with-param name="level" select="$level"/>
				<xsl:with-param name="remainingString" select="normalize-space($PUEffectivityString)"/>
				<xsl:with-param name="align" select="'center'"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:text>&#xd;</xsl:text>
	</xsl:template>
	
	
	<xsl:template match="ftid:Approvals">
		<xsl:call-template name="insertDoubleDashedRule"/><xsl:text>&#xd;</xsl:text>
		<xsl:apply-templates select="ftid:ApprovalPersonnel"/>
		<xsl:call-template name="insertDoubleDashedRule"/><xsl:text>&#xd;</xsl:text>
		<xsl:text>&#xd;</xsl:text>
	</xsl:template>
	
	<xsl:template match="ftid:ApprovalPersonnel">
		<xsl:text>APPROVED BY:</xsl:text><xsl:text>&#xd;</xsl:text><xsl:text>&#xd;</xsl:text>
		<xsl:text>(Original Signed by)</xsl:text><xsl:text>&#xd;</xsl:text>
		<xsl:call-template name="insertRule"><xsl:with-param name="test-value" select="19"/></xsl:call-template><xsl:text>&#xd;</xsl:text>
		<xsl:apply-templates select="ftid:SignatureName"/>
		<xsl:apply-templates select="ftid:SignaturePosition"/>
		<xsl:if test="following-sibling::ftid:ApprovalPersonnel"><xsl:text>&#xd;</xsl:text><xsl:text>&#xd;</xsl:text></xsl:if>
	</xsl:template>
	
	
	<xsl:template match="ftid:ADVISORY">
		<xsl:variable name="PerfMarker-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all"><tgroup cols="1"><tbody><row><entry><Para>ADVISORY INFORMATION</Para></entry></row></tbody></tgroup></table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($PerfMarker-converted-to-table)/ftid:table-node-set/ftid:table"/>
	</xsl:template>
	
	<xsl:template match="ftid:PMC-OFF">
		<xsl:variable name="PerfMarker-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all"><tgroup cols="1"><tbody><row><entry><Para>PMC-OFF</Para></entry></row></tbody></tgroup></table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($PerfMarker-converted-to-table)/ftid:table-node-set/ftid:table"/>
	</xsl:template>
	
	<xsl:template match="ftid:ALL-ENGINES">
		<xsl:variable name="PerfMarker-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all"><tgroup cols="1"><tbody><row><entry><Para>ALL ENGINES</Para></entry></row></tbody></tgroup></table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($PerfMarker-converted-to-table)/ftid:table-node-set/ftid:table"/>
	</xsl:template>
	
	<xsl:template match="ftid:ALT-MODE-EEC">
			<xsl:variable name="PerfMarker-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all"><tgroup cols="1"><tbody><row><entry><Para>ALTERNATE MODE EEC</Para></entry></row></tbody></tgroup></table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($PerfMarker-converted-to-table)/ftid:table-node-set/ftid:table"/>
	</xsl:template>
	
	<xsl:template match="ftid:ALT-THRUST-SETTING">
			<xsl:variable name="PerfMarker-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all"><tgroup cols="1"><tbody><row><entry><Para>ALT THRUST SETTING</Para></entry></row></tbody></tgroup></table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($PerfMarker-converted-to-table)/ftid:table-node-set/ftid:table"/>
	</xsl:template>
	
	<xsl:template match="ftid:GEARDOWN">
		<xsl:variable name="PerfMarker-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all"><tgroup cols="1"><tbody><row><entry><Para>GEAR DOWN</Para></entry></row></tbody></tgroup></table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($PerfMarker-converted-to-table)/ftid:table-node-set/ftid:table"/>
	</xsl:template>
	
	<xsl:template match="ftid:ENGINE-INOP">
		<xsl:variable name="PerfMarker-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all"><tgroup cols="1"><tbody><row><entry><Para>ENGINE INOP</Para></entry></row></tbody></tgroup></table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($PerfMarker-converted-to-table)/ftid:table-node-set/ftid:table"/>
	</xsl:template>
	
	<xsl:template match="ftid:ENGINE-INOP1">
		<xsl:variable name="PerfMarker-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all"><tgroup cols="1"><tbody><row><entry><Para>1 ENGINE INOP</Para></entry></row></tbody></tgroup></table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($PerfMarker-converted-to-table)/ftid:table-node-set/ftid:table"/>
	</xsl:template>
	
	<xsl:template match="ftid:ENGINE-INOP2">
		<xsl:variable name="PerfMarker-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all"><tgroup cols="1"><tbody><row><entry><Para>2 ENGINES INOP</Para></entry></row></tbody></tgroup></table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($PerfMarker-converted-to-table)/ftid:table-node-set/ftid:table"/>
	</xsl:template>
	
	<xsl:template match="ftid:GO-AROUND-THRUST">
		<xsl:variable name="PerfMarker-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all"><tgroup cols="1"><tbody><row><entry><Para>GO AROUND THRUST</Para></entry></row></tbody></tgroup></table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($PerfMarker-converted-to-table)/ftid:table-node-set/ftid:table"/>
	</xsl:template>
	
	<xsl:template match="ftid:MAX-CONT-THRUST">
		<xsl:variable name="PerfMarker-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all"><tgroup cols="1"><tbody><row><entry><Para>MAX CONTINUOUS THRUST</Para></entry></row></tbody></tgroup></table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($PerfMarker-converted-to-table)/ftid:table-node-set/ftid:table"/>
	</xsl:template>
	
	<xsl:template match="ftid:SPARE-ENGINE-CARRIAGE">
		<xsl:variable name="PerfMarker-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all"><tgroup cols="1"><tbody><row><entry><Para>SPARE ENGINE CARRIAGE</Para></entry></row></tbody></tgroup></table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($PerfMarker-converted-to-table)/ftid:table-node-set/ftid:table"/>
	</xsl:template>


	<xsl:template match="ftid:Bulletin" mode="contentTitle">
		<xsl:param name="level" select="0"/>
		<xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="remainingString" select="'Flight Crew Operations Manual Bulletin'"/>
		</xsl:call-template>
		<xsl:text>&#xd;</xsl:text>
	</xsl:template>
	

	<xsl:template match="ftid:CDLItem/ftid:Title">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:variable name="title">
			<xsl:value-of select="../@itemNbr"/>: <xsl:value-of select="text()"/>
		</xsl:variable>
		<xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="remainingString" select="normalize-space($title)"/>
			<xsl:with-param name="align" select="'center'"/>
		</xsl:call-template>
		<xsl:text>&#xd;</xsl:text>
	</xsl:template>


	<xsl:template match="ftid:MELItem/ftid:Title">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:call-template name="insertRule"/><xsl:text>&#xd;</xsl:text>
		<xsl:variable name="title">
			<xsl:value-of select="../@itemNbr"/>: <xsl:value-of select="text()"/><xsl:if test="string-length(../@optionalConfigIndicator) &gt; 0"><xsl:value-of select="../@optionalConfigIndicator"/></xsl:if>
		</xsl:variable>
		<xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="remainingString" select="normalize-space($title)"/>
			<xsl:with-param name="align" select="'center'"/>
		</xsl:call-template>
		<xsl:text>&#xd;</xsl:text>
		<xsl:call-template name="handle-item-moves-and-deletes"/>
	</xsl:template>
	

	<xsl:template match="ftid:MELSubItem/ftid:Title">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<!-- If parent's parent is MEL item or subItem and parent is not first "content child" do the parent's parent title template first so that the item-subItem hierarchy is clear -->
		<xsl:if test="(parent::*/parent::ftid:MELItem or parent::*/parent::ftid:MELSubItem) and (parent::*/preceding-sibling::ftid:MELSubItem or parent::*/preceding-sibling::ftid:DispatchCondition)">
			<xsl:apply-templates mode="forDescendants" select="parent::*/parent::*/ftid:Title"/>
		</xsl:if>
		<xsl:variable name="title">
			<xsl:value-of select="../@itemNbr"/>: <xsl:value-of select="text()"/><xsl:if test="string-length(../@optionalConfigIndicator) &gt; 0"><xsl:value-of select="../@optionalConfigIndicator"/></xsl:if>
		</xsl:variable>
		<xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="remainingString" select="normalize-space($title)"/>
			<xsl:with-param name="align" select="'center'"/>
		</xsl:call-template>
		<xsl:text>&#xd;</xsl:text>
		<xsl:call-template name="handle-item-moves-and-deletes"/>
	</xsl:template>
	
	<!-- This is the same as the mode-less templates of the same name, except the xsl:if does not have the condition that the parent is not the first "content child", because this forDescendants mode will be used by descendants (of the parent MELItem or MELSubItem) that are not the first content child and it doesn't matter whether or not this parent MELItem or MELSubItem is the first content child -->
	<xsl:template match="ftid:MELSubItem/ftid:Title|ftid:MELItem/ftid:Title" mode="forDescendants">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>	
		<!-- If parent's parent is MEL item or subItem -->
		<xsl:if test="(parent::*/parent::ftid:MELItem or parent::*/parent::ftid:MELSubItem)">
			<xsl:apply-templates mode="forDescendants" select="parent::*/parent::*/ftid:Title"/>
		</xsl:if>
		<xsl:if test="parent::ftid:MELItem"><xsl:call-template name="insertRule"/><xsl:text>&#xd;</xsl:text></xsl:if>
		<xsl:variable name="title">
			<xsl:value-of select="../@itemNbr"/>: <xsl:value-of select="text()"/><xsl:if test="string-length(../@optionalConfigIndicator) &gt; 0"><xsl:value-of select="../@optionalConfigIndicator"/></xsl:if>
		</xsl:variable>
		<xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="remainingString" select="normalize-space($title)"/>
			<xsl:with-param name="align" select="'center'"/>
		</xsl:call-template>
		<xsl:text>&#xd;</xsl:text>
	</xsl:template>
	
	
	<xsl:template match="ftid:DocumentEffectivity">
		<xsl:param name="level" select="0"/>
		<xsl:variable name="DocumentEffectivityString">
			<xsl:text>Document Effectivity: </xsl:text><xsl:value-of select="text()"/>
		</xsl:variable>
		<xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="remainingString" select="$DocumentEffectivityString"/>
		</xsl:call-template>
	</xsl:template>
	
	
	<xsl:template match="ftid:BulletinMetaData/ftid:CustomerName">
		<xsl:param name="level" select="0"/>
		<xsl:apply-templates select="text()">
			<xsl:with-param name="level" select="$level"/>
		</xsl:apply-templates>
		<xsl:text>&#xd;</xsl:text>
	</xsl:template>


	<xsl:template match="ftid:Bulletin/ftid:BulletinSubject|ftid:Bulletin/ftid:BulletinReason|ftid:BulletinMetaData/ftid:BulletinNumber|ftid:BulletinMetaData/ftid:BulletinDate">
		<xsl:param name="level" select="0"/>
		<xsl:variable name="containerString">
			<xsl:value-of select="concat(substring-after(name(.), 'Bulletin'),': ')"/><xsl:value-of select="text()"/>
		</xsl:variable>
		<xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="remainingString" select="$containerString"/>
		</xsl:call-template>
		<xsl:if test="self::ftid:BulletinDate"><xsl:text>&#xd;</xsl:text></xsl:if>
	</xsl:template>
	

	<xsl:template match="ftid:Disclaimer">
		<xsl:text>&#xd;</xsl:text>		
		<xsl:call-template name="insertDashedRule"/>
		<xsl:text>&#xd;</xsl:text>
		<xsl:apply-templates/>
		<xsl:call-template name="insertDashedRule"/>
		<xsl:text>&#xd;</xsl:text>
		<xsl:text>&#xd;</xsl:text>
	</xsl:template>
	
	
	<xsl:template match="AirframeEngineInfo">
		<xsl:variable name="AirframeEngineInfoString">
			<xsl:text>Airframe/Engine: </xsl:text>
			<xsl:value-of select="@airframe"/>/<xsl:value-of select="@engine"/>
			<xsl:text>, </xsl:text>
			<xsl:value-of select="../RegulatoryInfo/ftid:RegulatoryInfoItem/@agencyName"/>
			<xsl:text>, </xsl:text>
			<xsl:value-of select="@brakes"/>
		</xsl:variable>
		<xsl:call-template name="chopper">
			<xsl:with-param name="remainingString" select="normalize-space($AirframeEngineInfoString)"/>
		</xsl:call-template>
	</xsl:template>


	<xsl:template match="@model">
		<xsl:param name="level" select="0"/>
		<xsl:text>&#xd;</xsl:text>
		<xsl:variable name="title">
			<xsl:call-template name="insertMark">
				<xsl:with-param name="mark" select="."/>
				<xsl:with-param name="defaultMark" select="''"/>
			</xsl:call-template>
			<xsl:value-of select="../@manualName"/>
		</xsl:variable>
		<xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="remainingString" select="normalize-space($title)"/>
			<xsl:with-param name="align" select="'center'"/>
		</xsl:call-template>
		<xsl:text>&#xd;</xsl:text>
	</xsl:template>


	<xsl:template match="ftid:TitlePage"><xsl:apply-templates select="node()[not(self::ftid:Approvals)]"/></xsl:template>


	<xsl:template match="ftid:ManualInfo">
		<xsl:variable name="TitlePage_box-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all">
				  <tgroup cols="1">
					<tbody>
					  <row>
						<entry colname="1">
						  <Para align="left"><xsl:value-of select="concat(@customer, ' ')"/><xsl:value-of select="concat(@model, ' ')"/><xsl:value-of select="@manualName"/></Para>
						</entry>
					  </row>
					</tbody>
				  </tgroup>
				</table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($TitlePage_box-converted-to-table)/ftid:table-node-set/ftid:table"/>
		<xsl:apply-templates select="../ftid:Approvals"/>
		<xsl:apply-templates select="../ftid:CopyrightInfo/@year|../ftid:CopyrightInfo/@ARR"/>
		<xsl:text>&#xd;</xsl:text>
		<xsl:apply-templates select="@docNumber|@issueDate"/>
		<xsl:text>&#xd;</xsl:text>
		<xsl:apply-templates select="@revNumber|@revDate"/>
		<xsl:text>&#xd;</xsl:text>
	</xsl:template>
	
	
	<xsl:template match="@year">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:variable name="normalString">
			<xsl:call-template name="normalize-character">
				<xsl:with-param name="string" select="concat ('Copyright ', .)"/>
			</xsl:call-template>
		</xsl:variable>
		<!-- spit out content and then retrieve the next position to use-->
		<xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="position" select="$position"/>
			<xsl:with-param name="remainingString" select="normalize-space($normalString)"/>
		</xsl:call-template>
	</xsl:template>
	
	
	<xsl:template match="@docNumber">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:if test="string-length(.) &gt; 0">
			<xsl:variable name="normalString">
				<xsl:call-template name="normalize-character">
					<xsl:with-param name="string" select="concat ('Document Number ', .)"/>
				</xsl:call-template>
			</xsl:variable>
			<!-- spit out content and then retrieve the next position to use-->
			<xsl:call-template name="chopper">
				<xsl:with-param name="level" select="$level"/>
				<xsl:with-param name="position" select="$position"/>
				<xsl:with-param name="remainingString" select="normalize-space($normalString)"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:template match="@revNumber">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:variable name="normalString">
			<xsl:call-template name="normalize-character">
				<xsl:with-param name="string" select="concat ('Revision Number: ', .)"/>
			</xsl:call-template>
		</xsl:variable>
		<!-- spit out content and then retrieve the next position to use-->
		<xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="position" select="$position"/>
			<xsl:with-param name="remainingString" select="normalize-space($normalString)"/>
		</xsl:call-template>
	</xsl:template>
	
	
	<xsl:template match="@revDate">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:variable name="normalString">
			<xsl:call-template name="normalize-character">
				<xsl:with-param name="string" select="concat ('Revision Date: ', .)"/>
			</xsl:call-template>
		</xsl:variable>
		<!-- spit out content and then retrieve the next position to use-->
		<xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="position" select="$position"/>
			<xsl:with-param name="remainingString" select="normalize-space($normalString)"/>
		</xsl:call-template>
	</xsl:template>


	<xsl:template match="text()|@*">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:variable name="normalString">
			<xsl:if test="../@recall='Y'">
				<xsl:text># </xsl:text> 
			</xsl:if>
			<xsl:call-template name="normalize-character">
				<xsl:with-param name="string" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<!-- spit out content and then retrieve the next position to use-->
		<xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="position" select="$position"/>
			<xsl:with-param name="remainingString" select="normalize-space($normalString)"/>
		</xsl:call-template>
	</xsl:template>


	<xsl:template match="ftid:table" priority="10">
		<xsl:param name="level" select="0"/>
		<!--<xsl:text>&#xd;</xsl:text>-->
		<xsl:if test="string-length(ftid:Title) &gt; 0">
			<xsl:call-template name="chopper">
				<xsl:with-param name="level" select="$level"/>
				<xsl:with-param name="remainingString" select="normalize-space(ftid:Title)"/>
				<xsl:with-param name="align" select="'center'"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:apply-templates select="ftid:Effectivities"/>
		<xsl:apply-templates select="ftid:tgroup">
			<xsl:with-param name="level" select="0"/>
		</xsl:apply-templates>
	</xsl:template>
	
	
	<xsl:template match="ftid:GraphicSet">
	  <xsl:apply-templates select="ftid:Effectivities"/>
	  <xsl:text>[ Inline Graphic</xsl:text><xsl:if test="count(.//ftid:Illustration) &gt; 1"><xsl:text>s</xsl:text></xsl:if><xsl:text> ]&#xd;&#xd;</xsl:text>
  </xsl:template>
  
  
  <xsl:template match="ftid:ModelGraphic">
	  <xsl:text>[ Model Graphic ]&#xd;&#xd;</xsl:text>
  </xsl:template>

  
	<xsl:template match="mark|ftid:PUInfo|ftid:RegulatoryInfo|ftid:Systems/ftid:AirframeEngineInfo">
		<!-- Suppress -->
	</xsl:template>
	
	
<!-- ======================= Common "subroutines" ======================= -->

	<xsl:template name="normalize-character">
		<xsl:param name="string"/>
		<xsl:value-of select="translate($string, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ -*&#x2022;&#x201C;&#x201D;©', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ -**&quot;&quot;c')"/>
	</xsl:template>


	<xsl:template name="chopper">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:param name="remainingString"/>
		<xsl:param name="screenSize" select="$screenWidth"/>
		<xsl:variable name="string" select="normalize-space($remainingString)"/>
		<xsl:variable name="availableWidth" select="$screenSize - $level"/>
		<xsl:variable name="index">
			<xsl:choose>
				<xsl:when test="string-length($string) &lt;= $availableWidth">
					<xsl:value-of select="string-length($string)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="substring" select="substring(normalize-space($string), 0, $availableWidth)"/>
					<xsl:variable name="breakPoint">
						<xsl:call-template name="lastIndexOfSpace">
								<xsl:with-param name="original"><xsl:value-of select="$substring"/></xsl:with-param>
								<xsl:with-param name="input"><xsl:value-of select="$substring"/></xsl:with-param>
							</xsl:call-template>
					</xsl:variable>
					<xsl:value-of select="$breakPoint"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$index = -1">
				<!-- need to cut the word and add an hyphen -->
				<xsl:variable name="aLine" select="substring($string, 1, ($availableWidth -1))"/>
				<xsl:if test="$position = 1">
					<xsl:call-template name="insertIndent">
						<xsl:with-param name="level" select="$level"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:value-of select="$aLine"/>-<xsl:text>&#xd;</xsl:text>
				<xsl:if test="substring($string, ($screenSize - $level))">
					<xsl:call-template name="chopper">
						<xsl:with-param name="level" select="$level"/>
						<xsl:with-param name="remainingString" select="substring($string, $availableWidth)"/>
						<xsl:with-param name="screenSize" select="$screenSize"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$index = string-length($string)">
				<xsl:if test="$position = 1">
					<xsl:call-template name="insertIndent">
						<xsl:with-param name="level" select="$level"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:value-of select="$string"/><xsl:text>&#xd;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="aLine" select="substring($string, 1, $index + 1)"/>
				<xsl:if test="$position = 1">
					<xsl:call-template name="insertIndent">
						<xsl:with-param name="level" select="$level"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:value-of select="$aLine"/><xsl:text>&#xd;</xsl:text>
				<xsl:if test="substring($string, $index +2)">
					<xsl:call-template name="chopper">
						<xsl:with-param name="level" select="$level"/>
						<xsl:with-param name="remainingString" select="substring($string, $index + 2)"/>
						<xsl:with-param name="screenSize" select="$screenSize"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- combine this with above function by using boolean parameter for normalization option? -->
	<xsl:template name="chopper-no-normalize">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:param name="remainingString"/>
		<xsl:param name="screenWidth" select="$screenWidth"/>
		<xsl:variable name="string" select="$remainingString"/>
		<xsl:variable name="availableWidth" select="$screenWidth - $level"/>
		<xsl:variable name="index">
			<xsl:choose>
				<xsl:when test="string-length($string) &lt;= $availableWidth">
					<xsl:value-of select="string-length($string)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="substring" select="substring(normalize-space($string), 0, $availableWidth)"/>
					<xsl:variable name="breakPoint">
						<xsl:call-template name="lastIndexOfSpace">
								<xsl:with-param name="original"><xsl:value-of select="$substring"/></xsl:with-param>
								<xsl:with-param name="input"><xsl:value-of select="$substring"/></xsl:with-param>
							</xsl:call-template>
					</xsl:variable>
					<xsl:value-of select="$breakPoint"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$index = -1">
				<!-- need to cut the word and add an hyphen -->
				<xsl:variable name="aLine" select="substring($string, 1, ($availableWidth -1))"/>
				<xsl:if test="$position = 1">
					<xsl:call-template name="insertIndent">
						<xsl:with-param name="level" select="$level"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:value-of select="$aLine"/>-
				<xsl:if test="substring($string, ($screenWidth - $level))">
					<xsl:call-template name="chopper-no-normalize">
						<xsl:with-param name="level" select="$level"/>
						<xsl:with-param name="remainingString" select="substring($string, $availableWidth)"/>
						<xsl:with-param name="screenWidth" select="$screenWidth"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$index = string-length($string)">
				<xsl:if test="$position = 1">
					<xsl:call-template name="insertIndent">
						<xsl:with-param name="level" select="$level"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:value-of select="$string"/><xsl:text>&#xd;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="aLine" select="substring($string, 1, $index + 1)"/>
				<xsl:if test="$position = 1">
					<xsl:call-template name="insertIndent">
						<xsl:with-param name="level" select="$level"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:value-of select="$aLine"/><xsl:text>&#xd;</xsl:text>
				<xsl:if test="substring($string, $index +2)">
					<xsl:call-template name="chopper-no-normalize">
						<xsl:with-param name="level" select="$level"/>
						<xsl:with-param name="remainingString" select="substring($string, $index + 2)"/>
						<xsl:with-param name="screenWidth" select="$screenWidth"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	
	<xsl:template name="insertMark">
		<xsl:param name="mark"/>
		<xsl:param name="defaultMark" select="''"/>
		<!-- creates a place holder for the mark whether or not there is one. -->
		<xsl:choose>
		  <xsl:when test="self::ftid:Para[parent::HighlightSection|parent::HighlightItem]"><xsl:text>  </xsl:text></xsl:when>
		  <xsl:otherwise>
		    <xsl:variable name="normalString">
			  <xsl:choose>
				<xsl:when test="$mark/text() != ''">
					<xsl:call-template name="normalize-character">
						<xsl:with-param name="string" select="normalize-space($mark/text())"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$mark != ''">
					<xsl:call-template name="normalize-character">
						<xsl:with-param name="string" select="normalize-space($mark)"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="normalize-character">
						<xsl:with-param name="string" select="$defaultMark"/>
					</xsl:call-template>
				</xsl:otherwise>
			  </xsl:choose>
		    </xsl:variable>
		    <xsl:value-of select="$normalString"/>
		  </xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
	</xsl:template>
	
	
	<xsl:template name="insertIndent">
		<xsl:param name="level"/>
		<xsl:variable name="spaceString" select="'                                                                     '"/>
		<xsl:value-of select="substring($spaceString, 1, $level)"/>
	</xsl:template>


	<xsl:template name="insertRule">
		<xsl:param name="i" select="1"/>
		<xsl:param name="test-value" select="$screenWidth"/>
		<xsl:if test="$i &lt;= $test-value">
			<xsl:text>_</xsl:text>
			<xsl:call-template name="insertRule">
				<xsl:with-param name="i" select="$i + 1"/>
				<xsl:with-param name="test-value" select="$test-value"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:template name="insertDashedRule">
		<xsl:param name="i" select="1"/>
		<xsl:param name="test-value" select="$screenWidth"/>
		<xsl:if test="$i &lt;= $test-value">
			<xsl:text>-</xsl:text>
			<xsl:call-template name="insertDashedRule">
				<xsl:with-param name="i" select="$i + 1"/>
				<xsl:with-param name="test-value" select="$test-value"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:template name="insertDoubleDashedRule">
		<xsl:param name="i" select="1"/>
		<xsl:param name="test-value" select="$screenWidth"/>
		<xsl:if test="$i &lt;= $test-value">
			<xsl:text>=</xsl:text>
			<xsl:call-template name="insertDoubleDashedRule">
				<xsl:with-param name="i" select="$i + 1"/>
				<xsl:with-param name="test-value" select="$test-value"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:template name="insertHeaderRowBorder">
		<xsl:param name="i" select="1"/>
		<xsl:param name="test-value" select="$screenWidth"/>
		<xsl:if test="$i &lt;= $test-value">
			<xsl:text>=</xsl:text>
			<xsl:call-template name="insertHeaderRowBorder">
				<xsl:with-param name="i" select="$i + 1"/>
				<xsl:with-param name="test-value" select="$test-value"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>


	<xsl:template name="insertDashedDottedRule">
		<xsl:param name="i" select="1"/>
		<xsl:param name="test-value" select="$screenWidth"/>
		<xsl:if test="$i &lt;= $test-value">
			<xsl:text>_</xsl:text>
			<xsl:if test="$i &lt;= $test-value - 1">
				<xsl:text> </xsl:text>
				<xsl:if test="$i &lt;= $test-value - 2">
					<xsl:text>.</xsl:text>
					<xsl:if test="$i &lt;= $test-value - 3">
						<xsl:text> </xsl:text>
						<xsl:call-template name="insertDashedDottedRule">
							<xsl:with-param name="i" select="$i + 4"/>
							<xsl:with-param name="test-value" select="$test-value"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:template>


	<xsl:template name="insertSpaces">
		<xsl:param name="i" select="1"/>
		<xsl:param name="test-value" select="$screenWidth"/>
		<xsl:if test="$i &lt;= $test-value">
			<xsl:text> </xsl:text>
			<xsl:call-template name="insertSpaces">
				<xsl:with-param name="i" select="$i + 1"/>
				<xsl:with-param name="test-value" select="$test-value"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:template name="lastIndexOfSpace">
		<xsl:param name="original"/>
		<xsl:param name="input"/>
		<xsl:choose>
			<xsl:when test="contains($input, ' ')">
				<xsl:call-template name="lastIndexOfSpace">
					<xsl:with-param name="original" select="$original"/>
					<xsl:with-param name="input" select="substring-after($input, ' ')"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="string-length($original) - string-length($input) - 1"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="handle-item-moves-and-deletes">
		<xsl:param name="level" select="0"/>
		<xsl:if test="../@rev:revStatus = 'M' or ../@rev:revStatus = 'D'">
			<xsl:variable name="empty-DispatchCondition-converted-to-table">
				<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
					<table frame="all">
					  <tgroup cols="4">
						<thead>
						  <row>
							<entry colname="1">
							  <Para align="center">Interval</Para>
							</entry>
							<entry colname="2">
							  <Para align="center">Installed</Para>
							</entry>
							<entry colname="3">
							  <Para align="center">Required</Para>
							</entry>
							<entry colname="4">
							  <Para align="center">Procedure</Para>
							</entry>
						  </row>
						</thead>
						<tbody>
						  <row>
							<entry colname="1">
							  <Para align="left"/>
							</entry>
							<entry colname="2">
							  <Para align="left"/>
							</entry>
							<entry colname="3">
							  <Para align="left"/>
							</entry>
							<entry colname="4">
							  <Para align="left"/>
							</entry>
						  </row>
						</tbody>
					  </tgroup>
					</table>
				</table-node-set>
			</xsl:variable>
			<xsl:apply-templates select="exslt:node-set($empty-DispatchCondition-converted-to-table)/ftid:table-node-set/ftid:table"/>
			<xsl:text>&#xd;</xsl:text>
			<xsl:call-template name="chopper">
				<xsl:with-param name="level" select="$level"/>
				<xsl:with-param name="remainingString" select="normalize-space(../@rev:revHighlight)"/>
			</xsl:call-template>
			<xsl:text>&#xd;</xsl:text>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>