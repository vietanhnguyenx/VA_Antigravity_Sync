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
					Tags related to TITLE handling              
======================================================================
-->

	<!-- broken into two statements, as it randomly fails for unknown reasons when put in a single "match -->
	<xsl:template match="ftid:GeneralDesc/ftid:Title | ftid:LimitSubject/ftid:Title | 
											 ftid:FMtopic/ftid:Title | ftid:SDSubject/ftid:Title | 
											 ftid:Supplementary/ftid:Title | ftid:Normal/ftid:Title | 
											 ftid:RevisionRecord/ftid:Title | ftid:EffectCrossRefs/ftid:Title | 
											 ftid:Glossary/ftid:Title | ftid:BulletinRecord/ftid:Title | 
											 ftid:ServiceBulletinRecord/ftid:Title | ftid:GenericUnit/ftid:Title | 
											 ftid:PerfTopicHeading/ftid:Title">
		<xsl:call-template name="Heading2"/>
	</xsl:template>


	<!-- broken into two statements, as it randomly fails for unknown reasons when put in a single "match -->
	<xsl:template match="ftid:CheckList[@CLGroup = 'Normal']/ftid:Title">
		<xsl:call-template name="Heading2"/>
	</xsl:template>


	<xsl:template name="Heading2">
		<xsl:if test="node()">
			<h2>
				<xsl:call-template name="setIDAttribute"/>
				<xsl:if test="parent::ftid:PerfTopicHeading">
					<xsl:attribute name="style">margin-bottom:0em;</xsl:attribute>
				</xsl:if>
				<xsl:if test="parent::ftid:CheckList[@CLGroup = 'Normal']">
					<xsl:attribute name="style">text-align:center;</xsl:attribute>
				</xsl:if>
				<xsl:apply-templates mode="TmpRev-phase"/>
			</h2>
		</xsl:if>
	</xsl:template>


	<xsl:template match="ftid:SuppItem/ftid:Title">
		<h3>
			<xsl:apply-templates mode="TmpRev-phase"/>
		</h3>
	</xsl:template>


	<xsl:template match="ftid:MELItem[not(ftid:DispatchCondition | ftid:MELSubItem)] | ftid:MELSubItem[not(ftid:DispatchCondition | ftid:MELSubItem)]">
		<!-- this template is only used for empty MEL(Sub)Items (Moved or Deleted) -->
		<!-- for all others, see DispatchCondition template in dispatch.xsl -->
		<xsl:if test="@rev:revStatus = 'M' or @rev:revStatus = 'D'">
			<hr/>
			<table class="MELItemHeader">
				<xsl:call-template name="setIDAttribute"/>
				<xsl:call-template name="MELItemRows">
					<xsl:with-param name="dispCondOption" select="@dispCondOptions"/>
				</xsl:call-template>
				<tr>
					<td class="FirstTD">
						<xsl:value-of select="@itemNbr"/>
						<xsl:if test="not(string-length(@optionalConfigIndicator) = 0)">
							<p class="optionalConfigIndicator">
								<xsl:apply-templates select="@optionalConfigIndicator" mode="TmpRev-phase" />
							</p>
						</xsl:if>
					</td>
					<td>
						<xsl:apply-templates mode="TmpRev-phase" select="ftid:Title/text()"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:call-template name="MELItemTable"/>
		<p>
			<xsl:apply-templates select="@rev:revHighlight" mode="TmpRev-phase" />
		</p>
	</xsl:template>


	<!-- these are rendered in the DispatchCondition template (dixpatch.xsl) -->
	<xsl:template match="ftid:MELItem/ftid:Title | ftid:MELSubItem/ftid:Title | ftid:CDLItem[ftid:DispatchCondition/@nbrInstalled or ftid:CDLSubItem]/ftid:Title | ftid:CDLSubItem/ftid:Title"/>
	

	<xsl:template match="ftid:Title[not( 
								parent::ftid:CDLItem 
								| parent::ftid:ProcActionsGrp
								| parent::ftid:MELItem 
								| parent::ftid:InoperativeItems 
								| parent::ftid:ConsiderationItems
								| parent::ftid:AdditionalTitles[parent::ftid:NonNormal]
								| ancestor::ftid:DispatchItems//ftid:MELSubItem
								| ancestor::ftid:DispatchItems//ftid:CDLSubItem
								)]">
		<xsl:if test="node()">
			<h3>
				<xsl:call-template name="setIDAttribute"/>
				<xsl:choose>
					<xsl:when test="parent::ftid:CheckList">
						<xsl:attribute name="style">text-align:center</xsl:attribute>
					</xsl:when>
					<xsl:when test="parent::ftid:PerfTitleGrp">
						<xsl:attribute name="style">margin-bottom:0</xsl:attribute>
					</xsl:when>
					<xsl:when test="../ftid:InoperativeItems">
						<xsl:attribute name="style">padding-top:.5em; font-size:1em; border-top: 2px solid;</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="class">Title</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:apply-templates mode="TmpRev-phase"/>
				<xsl:if test="preceding-sibling::*[self::ftid:Effectivities]">
					<span style="font-size:smaller; font-weight:normal">
						<xsl:apply-templates select="preceding-sibling::*[self::ftid:Effectivities]">
							<xsl:with-param name="isOverridden" select="true()"/>
						</xsl:apply-templates>
					</span>
				</xsl:if>
			</h3>
		</xsl:if>
		<!-- IXP 4.3 - check for Effectivites preceeding an empty Title -->
		<xsl:if test="not(node()) and preceding-sibling::*[self::ftid:Effectivities]" >
		    <span style="font-size:smaller; font-weight:normal">
				<xsl:apply-templates select="preceding-sibling::*[self::ftid:Effectivities]">
					<xsl:with-param name="isOverridden" select="true()"/>
				</xsl:apply-templates>
			</span>
		</xsl:if>
	</xsl:template>


	<xsl:template match="ftid:Title[../ftid:CalloutIcon]">
		<xsl:if test="node()">
			<p class="CalloutTitle">
				<span class="CalloutNumber">
					<xsl:apply-templates select="../ftid:CalloutIcon/@calloutLabel" mode="TmpRev-phase" />
				</span>
				<xsl:apply-templates mode="TmpRev-phase"/>
			</p>
			<xsl:if test="preceding-sibling::*[self::ftid:Effectivities]">
				<span style="font-size:smaller; font-weight:normal">
					<xsl:apply-templates select="preceding-sibling::*[self::ftid:Effectivities]">
						<xsl:with-param name="isOverridden" select="true()"/>
					</xsl:apply-templates>
				</span>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	
	<!-- Add Intro template for creating Rev Bar span when needed-->
	<xsl:template match="ftid:Intro">
        <xsl:choose>
	        <xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
		        <span  class="RevMark" title="{@rev:revHighlight}">	
	
		            <xsl:choose>
			            <xsl:when test="$isFiltered">
				            <xsl:apply-templates mode="TmpRev-phase"/>
			            </xsl:when>
			            <xsl:otherwise>
				            <xsl:apply-templates />
			            </xsl:otherwise>
		            </xsl:choose>
		
				</span>
	        </xsl:when>
            <xsl:otherwise>
  
		        <xsl:choose>
			        <xsl:when test="$isFiltered">
				        <xsl:apply-templates mode="TmpRev-phase"/>
			        </xsl:when>
			        <xsl:otherwise>
				        <xsl:apply-templates />
			        </xsl:otherwise>
		        </xsl:choose>  
  
            </xsl:otherwise>
        </xsl:choose>
	</xsl:template>


</xsl:stylesheet>