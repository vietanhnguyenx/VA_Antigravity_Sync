<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ftid="http://www.boeing.com/FTID-ML" version="1.0" xmlns:exslt="http://exslt.org/common">
	<!--
	Jeppesen Proprietary and Confidential
	Copyright Jeppesen Sanderson, Inc., 2005
	All Rights Reserved.

	Modified by Boeing for FTID data
    -->

	<xsl:variable name="numericNumbering">123456789</xsl:variable>
	<xsl:variable name="lowerAlphaNumbering">abcdefghi</xsl:variable>
	<xsl:variable name="upperAlphaNumbering">ABCDEFGHI</xsl:variable>

	<xsl:template match="ftid:Effectivities">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:if test="parent::ftid:Condition">
			<xsl:apply-templates>
				<xsl:with-param name="level" select="$level + 2"/>
				<xsl:with-param name="position" select="$position"/>
			</xsl:apply-templates>
		</xsl:if>
		<xsl:if test="not(parent::ftid:Condition)">
			<xsl:apply-templates>
				<xsl:with-param name="level" select="$level"/>
				<xsl:with-param name="position" select="$position"/>
			</xsl:apply-templates>
		</xsl:if>
		<xsl:if test="../ftid:Title or ../ftid:PerfTitleGrp">
			<xsl:text>&#xd;</xsl:text>
		</xsl:if>
	</xsl:template>


	<xsl:template match="ftid:Effectivities/*">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:apply-templates>
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="position" select="$position"/>
		</xsl:apply-templates>
	</xsl:template>
	
	
	<xsl:template match="ftid:Supplementary/ftid:Title">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:apply-templates>
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="position" select="$position"/>
		</xsl:apply-templates>
		<xsl:text>&#xd;</xsl:text>
	</xsl:template>


	<xsl:template match="ftid:List">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:apply-templates select="*">
			<xsl:with-param name="level" select="$level"/>
		</xsl:apply-templates>
		<xsl:if test="not(parent::ftid:ListItem)"><xsl:text>&#xd;</xsl:text></xsl:if>
	</xsl:template>
	
	
	<xsl:template match="ftid:ListItem">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:variable name="mark">
			<xsl:call-template name="insertMark">
				<xsl:with-param name="mark" select="mark"/>
				<xsl:with-param name="defaultMark">
					<xsl:choose>
						<xsl:when test="../@listType = 'none'"/>
						<xsl:when test="../@listType = 'dash' or ../@listType = 'bullet' or string-length(../@listType) = 0">-</xsl:when>
						<xsl:otherwise><xsl:number value="count(preceding-sibling::ftid:ListItem) + 1" format="{../@listType}"/></xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>

		<xsl:for-each select="*">
			<xsl:if test="not(not(parent::ftid:ListItem/preceding-sibling::ftid:ListItem or preceding-sibling::*) and (parent::ftid:ListItem/parent::ftid:List/parent::ftid:ListItem or parent::ftid:ListItem/parent::ftid:List/parent::ftid:Note or parent::ftid:ListItem/parent::ftid:List/parent::ftid:Warning or parent::ftid:ListItem/parent::ftid:List/parent::ftid:Caution or parent::ftid:ListItem/parent::ftid:List/parent::ftid:WarnCondition or parent::ftid:ListItem/parent::ftid:List/parent::ftid:Opnote))">
				<xsl:call-template name="insertIndent">
					<xsl:with-param name="level" select="$level"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="preceding-sibling::*">
					<xsl:call-template name="insertSpaces">
						<xsl:with-param name="test-value"><xsl:value-of select="string-length($mark)"/></xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$mark"/>
				</xsl:otherwise>
			</xsl:choose>
			<!-- Increase the indent level and the position -->
			<xsl:apply-templates select=".">
				<xsl:with-param name="level" select="$level + string-length($mark)"/>
				<xsl:with-param name="position" select="$level + string-length($mark) + string-length($mark)"/>
			</xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	
	
	<xsl:template match="ftid:Para|ftid:CopyrightText|ftid:CopyrightHeading">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:if test="self::ftid:CopyrightHeading">
			<xsl:text>&#xd;</xsl:text>
			<xsl:text>&#xd;</xsl:text>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="parent::HighlightItem or parent::HighlightSection">
				<xsl:variable name="mark">
					<xsl:call-template name="insertMark"/>
				</xsl:variable>
				<xsl:value-of select="$mark"/>
				<xsl:apply-templates select="node()[1]">
					<xsl:with-param name="level" select="$level + string-length($mark)"/>
					<xsl:with-param name="position" select="$level + string-length($mark) + string-length($mark)"/>
				</xsl:apply-templates>
				<xsl:apply-templates select="node()[position() > 1]">
					<xsl:with-param name="level" select="$level + string-length($mark)"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="ftid:Effectivities">
					<xsl:with-param name="level" select="$level"/>
					<xsl:with-param name="position" select="$position"/>
				</xsl:apply-templates>
				<!-- Being done this way so that child elements like Emphasis and iLink don't cause line breaks; they should be treated like they're not there at all -->
				<xsl:variable name="ParaText">
					<xsl:if test="@recall = 'Y'"># </xsl:if>
					<xsl:for-each select="node()[not(self::ftid:Effectivities)]">
						<xsl:choose>
							<xsl:when test="self::ftid:Emphasis or self::ftid:iLink"><xsl:value-of select=".//text()"/></xsl:when><!-- Can't do anything with these elements other than printing their text -->
							<xsl:when test="self::text()"><xsl:value-of select="."/></xsl:when>
							<xsl:otherwise><xsl:value-of select=".//text()"/></xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:variable>
				<xsl:variable name="normalizedParaText">
					<xsl:call-template name="normalize-character"><xsl:with-param name="string" select="$ParaText"/></xsl:call-template>
				</xsl:variable>
				<xsl:call-template name="chopper">
					<xsl:with-param name="level" select="$level"/>
					<xsl:with-param name="position" select="$position"/>
					<xsl:with-param name="remainingString" select="normalize-space($normalizedParaText)"/>
				</xsl:call-template>
				<!--<xsl:apply-templates select="node()[1]">
					<xsl:with-param name="level" select="$level"/>
					<xsl:with-param name="position" select="$position"/>
				</xsl:apply-templates>
				<xsl:apply-templates select="node()[position() > 1]">
					<xsl:with-param name="level" select="$level"/>
				</xsl:apply-templates>-->
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="not(parent::ftid:Address or parent::ftid:HighlightSection or parent::ftid:Basis)">
			<xsl:text>&#xd;</xsl:text>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:template match="ftid:iLink|ftid:MaintProcLink|ftid:OpsProcLink"><xsl:apply-templates select=".//text()"/></xsl:template>
	
	
	<xsl:template match="ftid:DispatchConditionRemarks">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:apply-templates>
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="position" select="$position"/>
		</xsl:apply-templates>
		<xsl:call-template name="insertDashedDottedRule"/>
		<xsl:text>&#xd;&#xd;</xsl:text>
	</xsl:template>
	
	
	<xsl:template match="ftid:Placards">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:text>&#xd;</xsl:text>
		<xsl:text>PLACARD&#xd;-------</xsl:text>
		<xsl:text>&#xd;</xsl:text>
		<xsl:apply-templates>
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="position" select="$position"/>
		</xsl:apply-templates>
	</xsl:template>
	
	
	<xsl:template match="ftid:MaintenanceProcedure">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:text>&#xd;</xsl:text>
		<xsl:text>MAINTENANCE (M)&#xd;---------------</xsl:text>
		<xsl:text>&#xd;</xsl:text>
		<xsl:apply-templates>
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="position" select="$position"/>
		</xsl:apply-templates>
	</xsl:template>
	
	
	<xsl:template match="ftid:OperationProcedure">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:text>&#xd;</xsl:text>
		<xsl:text>OPERATIONS (O)&#xd;--------------</xsl:text>
		<xsl:text>&#xd;</xsl:text>
		<xsl:apply-templates>
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="position" select="$position"/>
		</xsl:apply-templates>
	</xsl:template>


	<xsl:template match="ftid:MaintenanceNote">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:text>&#xd;</xsl:text>
		<xsl:text>MAINTENANCE NOTE&#xd;----------------</xsl:text>
		<xsl:text>&#xd;</xsl:text>
		<xsl:apply-templates>
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="position" select="$position"/>
		</xsl:apply-templates>
	</xsl:template>
	
	
	<xsl:template match="ftid:OperationNote">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:text>&#xd;</xsl:text>
		<xsl:text>OPERATION NOTE&#xd;----------------</xsl:text>
		<xsl:text>&#xd;</xsl:text>
		<xsl:apply-templates>
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="position" select="$position"/>
		</xsl:apply-templates>
	</xsl:template>
	
	


	<!--====================================================== QRH ===========================================================-->

	<xsl:template match="ftid:NonNormal/ftid:Title">
		<xsl:variable name="NonNormalTitle-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all">
				  <tgroup cols="1">
					<tbody>
						<row><entry><Para><xsl:if test="@checklistIndex = 'U'">-U- </xsl:if><xsl:if test="@checklistIndex = 'e'">[] </xsl:if><xsl:value-of select="."/></Para></entry></row>
					</tbody>
				  </tgroup>
				</table>
			</table-node-set>
		</xsl:variable>
		<xsl:call-template name="insertRule"/><xsl:text>&#xd;</xsl:text>
		<xsl:apply-templates select="exslt:node-set($NonNormalTitle-converted-to-table)/ftid:table-node-set/ftid:table"/>
	</xsl:template>

	<xsl:template match="ftid:CheckListPreamble"><xsl:apply-templates/></xsl:template>

	<xsl:template match="ftid:Step|ftid:ExtendedStep|ftid:Comment">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:apply-templates>
			<xsl:with-param name="level" select="$level + 2"/>
			<xsl:with-param name="position" select="$position"/>
		</xsl:apply-templates>
	</xsl:template>
	
	
	<xsl:template match="ftid:Command">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:apply-templates>
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="position" select="$position"/>
		</xsl:apply-templates>
		<xsl:text>&#xd;</xsl:text>
	</xsl:template>


	<xsl:template match="ftid:Command/ftid:Step">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:if test="../@crm">
			<!-- have to handle CRM text, similar to Challenge-Response sets -->
			<xsl:apply-templates select="ftid:Effectivities">
				<xsl:with-param name="level" select="$level"/>
				<xsl:with-param name="position" select="$position"/>
			</xsl:apply-templates>
			<!-- Get all the text of the Step -->
			<xsl:variable name="stepText">
				<xsl:for-each select="ftid:Para">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<!-- Calculate number of spaces to print -->
			<xsl:variable name="numSpaces" select="$screenWidth - $level - string-length(normalize-space($stepText))- string-length(normalize-space(../@crm))"/>
			<xsl:variable name="line">
				<!-- Add Step text to the line -->
				<xsl:value-of select="normalize-space($stepText)"/>
				<!-- Add the spaces to the line -->
				<xsl:call-template name="insertSpaces">
					<xsl:with-param name="test-value" select="$numSpaces"/>
				</xsl:call-template>
				<!-- Add CRM text to the line -->
				<xsl:value-of select="normalize-space(../@crm)"/>
			</xsl:variable>
			<!-- Use chopper without space normalization because we want to preserve spaces -->
			<xsl:call-template name="chopper-no-normalize">
				<xsl:with-param name="level" select="$level"/>
				<xsl:with-param name="remainingString" select="$line"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="not(../@crm)">
			<xsl:apply-templates>
				<xsl:with-param name="level" select="$level"/>
				<xsl:with-param name="position" select="$position"/>
			</xsl:apply-templates>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:template match="ftid:Defer|ftid:DeferItems">
		<xsl:text> </xsl:text>
		<xsl:call-template name="insertDashedRule">
			<xsl:with-param name="test-value" select="(($screenWidth - 14) div 2)-2"/>
			<!-- 14 is the length of the string "Deferred Items", 1 more for the space before the first word and 1 more for the space before the dashes -->
		</xsl:call-template>
		<xsl:text> Deferred Items </xsl:text>
		<xsl:call-template name="insertDashedRule">
			<xsl:with-param name="test-value" select="(($screenWidth - 14) div 2)-1"/>
			<!-- 14 is the length of the string "Deferred Items", 1 more for the space after the second word -->
		</xsl:call-template>
		<xsl:text>&#xd;</xsl:text>
		<xsl:apply-templates/>
	</xsl:template>
	
	
	<xsl:template match="ftid:Destin">==> <xsl:apply-templates/><xsl:text>&#xd;</xsl:text></xsl:template>


	<xsl:template match="*" mode="dots">
		<xsl:param name="count"/>
		<xsl:variable name="spaceString" select="'.......................................................................................................'"/>
		<xsl:value-of select="substring($spaceString, 1, $count)"/>
	</xsl:template>
	
	
	<xsl:template match="ftid:Action">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<!-- Change line before these elements -->
		<xsl:text>&#xd;</xsl:text>
		<xsl:apply-templates select="ftid:Effectivities">
			<xsl:with-param name="level" select="$level"/>
		</xsl:apply-templates>
		<!-- Number of dots to print ... subtract 1 at the end for space separating possible CRM -->
		<xsl:variable name="dotNum" select="$screenWidth - $level - string-length(normalize-space(mark))- string-length(normalize-space(ftid:Challenge))- string-length(normalize-space(ftid:Response))- string-length(normalize-space(@crm))- 1"/>
		<xsl:if test="mark/node()">
			<xsl:call-template name="insertMark">
				<xsl:with-param name="mark" select="mark"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="$dotNum &lt; 1">
			<xsl:call-template name="chopper">
				<xsl:with-param name="level" select="$level"/>
				<xsl:with-param name="remainingString" select="normalize-space(ftid:Challenge)"/>
				<xsl:with-param name="screenSize">
					<xsl:value-of select="floor($screenWidth div 1.5)"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:variable name="line">
			<xsl:choose>
				<xsl:when test="not($dotNum &lt; 1)">
					<xsl:value-of select="normalize-space(ftid:Challenge)"/>
					<!-- Add the dots -->
					<xsl:apply-templates select="." mode="dots">
						<xsl:with-param name="count" select="$dotNum"/>
					</xsl:apply-templates>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="." mode="dots">
						<xsl:with-param name="count" select="$screenWidth - $level - string-length(normalize-space(ftid:Response))- string-length(normalize-space(@crm))- 1"/>
					</xsl:apply-templates>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:value-of select="normalize-space(ftid:Response)"/>
			<!-- Precede with space to separate CRM from Response -->
			<xsl:text> </xsl:text>
			<xsl:value-of select="normalize-space(@crm)"/>
		</xsl:variable>
		<xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="remainingString" select="normalize-space($line)"/>
		</xsl:call-template>
		<xsl:text>&#xd;</xsl:text>
		<!-- Apply the rest of the templates -->
		<xsl:apply-templates select="*[not(self::ftid:Effectivities or self::ftid:Challenge or self::ftid:Response)]">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="position" select="$position"/>
		</xsl:apply-templates>
		<xsl:text>&#xd;</xsl:text>
	</xsl:template>


	<xsl:template match="ftid:OpnoteList">
		<xsl:param name="level" select="0"/>
		<xsl:text>&#xd;</xsl:text>
		<xsl:apply-templates>
			<xsl:with-param name="level" select="$level"/>
		</xsl:apply-templates>
		<xsl:text>&#xd;</xsl:text>
		<xsl:text>&#xd;</xsl:text>
	</xsl:template>


	<xsl:template match="ftid:OpnoteListHeadingLeft">
		<xsl:param name="level" select="0"/>
		<!-- 
	- Calculate number of spaces to print between left and right header entries
	- following-sibling::*[1] is the right header entry, Opnlsthr
	-->
		<xsl:variable name="num" select="$screenWidth - $level - string-length(normalize-space(.))- string-length(normalize-space(following-sibling::*[1]))"/>
		<xsl:variable name="line">
			<!-- Add the left entry to the line -->
			<xsl:value-of select="normalize-space(.)"/>
			<!-- Add the spaces -->
			<xsl:call-template name="insertSpaces">
				<xsl:with-param name="test-value" select="$num"/>
			</xsl:call-template>
			<!-- Add the right entry to the line -->
			<xsl:value-of select="normalize-space(following-sibling::*[1])"/>
		</xsl:variable>
		<!-- Use chopper without space normalization because we want to preserve spaces -->
		<xsl:call-template name="chopper-no-normalize">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="remainingString" select="$line"/>
		</xsl:call-template>
	</xsl:template>


	<xsl:template match="ftid:OpnoteListBodyLeft">
		<xsl:param name="level" select="0"/>
		<!-- 
	- Calculate number of dots to print between left and right entries
	- following-sibling::*[1] is the right entry, Opnlstr
	-->
		<xsl:variable name="num" select="$screenWidth - $level - string-length(normalize-space(.))- string-length(normalize-space(following-sibling::*[1]))"/>
		<xsl:variable name="line">
			<!-- Add the left entry to the line -->
			<xsl:value-of select="normalize-space(.)"/>
			<!-- Add the dots -->
			<xsl:apply-templates select="." mode="dots">
				<xsl:with-param name="count" select="$num"/>
			</xsl:apply-templates>
			<!-- Add the right entry to the line -->
			<xsl:value-of select="normalize-space(following-sibling::*[1])"/>
		</xsl:variable>
		<xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="remainingString" select="normalize-space($line)"/>
		</xsl:call-template>
	</xsl:template>


	<xsl:template match="ftid:OpnoteListHeadingRight|ftid:OpnoteListBodyRight">
		<!--Suppress right-hand Opnlst entries, they are handled with the left-hand entries (above)-->
	</xsl:template>


	<xsl:template match="ftid:ConditionStatement">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:apply-templates>
			<xsl:with-param name="level" select="$level + 2"/>
			<xsl:with-param name="position" select="$position"/>
		</xsl:apply-templates>
	</xsl:template>


	<xsl:template match="ftid:ProcActionsGrp">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:apply-templates>
			<xsl:with-param name="level" select="$level + 5"/>
			<xsl:with-param name="position" select="$position"/>
		</xsl:apply-templates>
	</xsl:template>
	
	
</xsl:stylesheet>
