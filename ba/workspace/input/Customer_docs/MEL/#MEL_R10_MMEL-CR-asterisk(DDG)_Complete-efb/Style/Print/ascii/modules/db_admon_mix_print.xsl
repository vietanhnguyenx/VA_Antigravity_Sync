<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ftid="http://www.boeing.com/FTID-ML" version="1.0">
  <!--
	Jeppesen Proprietary and Confidential
	Copyright Jeppesen Sanderson, Inc., 2005
	All Rights Reserved.

	Modified by Boeing for FTID data
-->

<xsl:variable name="lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>
<xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
  
  
  	<xsl:template match="ftid:Note|ftid:Caution|ftid:Warning|ftid:Opnote|ftid:Light|ftid:WarnCondition">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:variable name="mark">
			<xsl:call-template name="insertMark">
				<xsl:with-param name="mark" select="mark"/>
				<xsl:with-param name="defaultMark">
					<xsl:choose>
						<xsl:when test="self::ftid:Opnote">
							<xsl:text>Note:</xsl:text>
						</xsl:when>
						<xsl:when test="self::ftid:Note">
							<xsl:choose>
								<xsl:when test="/ftid:DispatchItems">
									<xsl:choose>
										<xsl:when test="preceding-sibling::*[1][self::ftid:Note]"><xsl:text>NOTE </xsl:text><xsl:apply-templates mode="calc-position" select="preceding-sibling::*[1]"/>:</xsl:when>
										<xsl:when test="following-sibling::*[1][self::ftid:Note]"><xsl:text>NOTE 1:</xsl:text></xsl:when>
										<xsl:otherwise>NOTE:</xsl:otherwise>
									</xsl:choose>
								</xsl:when>   
								<xsl:otherwise><xsl:text>Note:</xsl:text></xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="self::ftid:WarnCondition">
							<xsl:text>Condition:</xsl:text>
						</xsl:when>
						<xsl:when test="self::ftid:Light">
							<xsl:text>Light:</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat(translate(name(.), $lower, $upper), ':')"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:for-each select="node()">
			<xsl:if test="not(not(preceding-sibling::*) and parent::*/parent::ftid:ListItem)">
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


	<xsl:template match="ftid:Note" mode="calc-position">
		<xsl:param name="counter">2</xsl:param>
		<xsl:choose>
			<xsl:when test="preceding-sibling::*[1][self::ftid:Note]">
				<xsl:apply-templates select="preceding-sibling::*[1]" mode="calc-position">
					<xsl:with-param name="counter"><xsl:value-of select="$counter + 1"/></xsl:with-param>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="$counter"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	

</xsl:stylesheet>
