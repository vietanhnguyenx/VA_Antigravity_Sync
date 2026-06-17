<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ftid="http://www.boeing.com/FTID-ML" version="1.0">
<!--
======================================================================
Boeing Proprietary and Confidential - All Rights Reserved.

This XSL is covered under the Boeing Copyright for Flight Operations 
digital data.  Permission to use this XSL is subject to the entitlement
of the information or documents in which this XSL is applied.
======================================================================
-->


<xsl:template match="ftid:HighlightList">
	<xsl:param name="level" select="0"/>
	<xsl:param name="position" select="1"/>
	<xsl:if test="not(preceding-sibling::ftid:HighlightList) and parent::ftid:RevisionRecord"><xsl:call-template name="insertRule"/><xsl:text>&#xd;&#xd;&#xd;</xsl:text></xsl:if>
	<xsl:apply-templates select="*">
		<xsl:with-param name="level" select="$level"/>
	</xsl:apply-templates>
	<xsl:if test="not(parent::ftid:HighlightItem)"><xsl:text>&#xd;</xsl:text></xsl:if>
</xsl:template>
	
	
<xsl:template match="ftid:HighlightItem">
	<xsl:param name="level" select="0"/>
	<xsl:param name="position" select="1"/>
	<xsl:variable name="mark">
		<xsl:call-template name="insertMark">
			<xsl:with-param name="mark" select="mark"/>
			<xsl:with-param name="defaultMark">-</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:for-each select="*">
		<xsl:if test="parent::ftid:HighlightItem/preceding-sibling::ftid:HighlightItem or preceding-sibling::*">
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


<xsl:template match="ftid:HighlightList/ftid:Title|ftid:HighlightItem/ftid:Title">
	<xsl:param name="level" select="0"/>
	<xsl:param name="position" select="1"/>
	<xsl:apply-templates>
		<xsl:with-param name="level" select="$level"/>
		<xsl:with-param name="position" select="$position"/>
	</xsl:apply-templates>
	<xsl:text>&#xd;</xsl:text>
</xsl:template>



<!-- 
======================================================================
Not in use currently
======================================================================
 -->
<xsl:template match="HighlightList">
     <xsl:call-template name="insertRule"/>
     <xsl:text>&#xd;</xsl:text>
     <xsl:apply-templates/>
</xsl:template>


<!-- NOTE that these next four templates only get used when the derived XMLHighlights (not the Frame Highlights) -->


<xsl:template match="AnchorHL">
<!-- Similar template to ListItem -->
    <xsl:param name="level" select="0"/>
    <xsl:param name="position" select="1"/>
    <!-- Insert indent if needed -->
    <xsl:call-template name="insertIndent">
      <xsl:with-param name="level" select="$level"/>
    </xsl:call-template>
    <xsl:variable name="mark">
      <xsl:call-template name="insertMark">
        <xsl:with-param name="mark" select="'-'"/>
        <xsl:with-param name="defaultMark" select="'    '"/>
      </xsl:call-template>
    </xsl:variable>
    <!-- Insert mark, four spaces if none -->
    <xsl:value-of select="$mark"/>
    <!-- Increase the indent level and the position -->
    <xsl:apply-templates select="@HLText">
      <xsl:with-param name="level" select="$level + string-length($mark)"/>
      <xsl:with-param name="position" select="$level + string-length($mark) + string-length($mark)"/>
    </xsl:apply-templates>
</xsl:template>


<xsl:template match="ChapterHL">
	 <xsl:param name="level" select="0"/>
	 <xsl:param name="position" select="1"/>
     <xsl:if test=".//AnchorHL">
		  <xsl:call-template name="insertRule"/>
		  <xsl:text>&#xd;</xsl:text>
		  <xsl:variable name="rawString">
			  Chapter <xsl:value-of select="./SectionHL[1]/@chapNbr"/> - <xsl:value-of select="./SectionHL[1]/@chapName"/>
		  </xsl:variable>
          <xsl:variable name="normalString">
			<xsl:call-template name="normalize-character">
				<xsl:with-param name="string" select="$rawString"/>
			</xsl:call-template>
		  </xsl:variable>
		  <xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="position" select="$position"/>
			<xsl:with-param name="remainingString" select="normalize-space($normalString)"/>
		  </xsl:call-template>
		  <xsl:text>&#xd;</xsl:text>
          <xsl:apply-templates/>
     </xsl:if> 
</xsl:template>


<xsl:template match="SectionHL">
	 <xsl:param name="level" select="0"/>
     <xsl:param name="position" select="1"/>
     <xsl:if test="./AnchorHL">
		 <xsl:variable name="rawString">
			  Section <xsl:value-of select="@sectNbr"/> - <xsl:value-of select="@sectName"/>
		 </xsl:variable>
		 <xsl:variable name="normalString">
			<xsl:call-template name="normalize-character">
				<xsl:with-param name="string" select="$rawString"/>
			</xsl:call-template>
		 </xsl:variable>
		 <xsl:call-template name="chopper">
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="position" select="$position"/>
			<xsl:with-param name="remainingString" select="normalize-space($normalString)"/>
		 </xsl:call-template>
		 <xsl:apply-templates select="*">
		  <xsl:with-param name="level" select="$level"/>
		 </xsl:apply-templates>
     </xsl:if>
</xsl:template>


<xsl:template match="fcomHL">
     <xsl:call-template name="insertRule"/>
     <xsl:text>&#xd;</xsl:text>
     <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>