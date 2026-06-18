<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
								xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
								xmlns:ftid="http://www.boeing.com/FTID-ML"
								xmlns:rev="http://www.boeing.com/FTID-ML/Revision">


	<xsl:template match="ftid:RevisionRecord">
		<div class="RevisionRecord">
			<xsl:apply-templates mode="TmpRev-phase" select="*[not(self::ftid:HighlightList)]"/>
		</div>
		<ul class="HighlightList">
			<xsl:apply-templates select="ftid:HighlightList"/>
		</ul>
	</xsl:template>

	<xsl:template match="ftid:RevisionRecord/ftid:table/ftid:Title">
		<h3>
			<xsl:apply-templates mode="TmpRev-phase"/>
		</h3>
	</xsl:template>


	<xsl:template match="ftid:HighlightList">
	   <!-- IXP 4.2 - add horizontal rule between chapters -->
	    <xsl:if test="child::ftid:Title[contains(text(), 'Chapter')]">
			<hr/>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="*[not(self::ftid:HighlightItem)]">
				<li>
					<xsl:apply-templates mode="TmpRev-phase" select="ftid:Title"/>
					<xsl:apply-templates mode="TmpRev-phase" select="*[not(self::ftid:HighlightItem | self::ftid:Title)]"/>
					<xsl:if test="ftid:HighlightItem">
						<ul>
							<xsl:apply-templates select="ftid:HighlightItem"/>
						</ul>
					</xsl:if>
				</li>
			</xsl:when>
			<xsl:otherwise>
				<ul>
					<xsl:apply-templates select="ftid:HighlightItem"/>
				</ul>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="ftid:HighlightItem[child::*[not(self::ftid:HighlightList)]]">
		<li>
			<xsl:apply-templates mode="TmpRev-phase" select="ftid:Title"/>
			<xsl:apply-templates mode="TmpRev-phase" select ="*[not(self::ftid:Title)]"/>
		</li>
	</xsl:template>



</xsl:stylesheet>
