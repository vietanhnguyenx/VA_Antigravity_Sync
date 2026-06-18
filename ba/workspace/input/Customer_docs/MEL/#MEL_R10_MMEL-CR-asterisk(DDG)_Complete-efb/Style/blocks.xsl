<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ftid="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
	<!-- CHECK COMPLETE -->
	<!--
======================================================================
Boeing Proprietary and Confidential - All Rights Reserved.

This XSL is covered under the Boeing Copyright for Flight Operations 
digital data.  Permission to use this XSL is subject to the entitlement
of the information or documents in which this XSL is applied.
======================================================================
-->
	<!-- ==================================================== -->
	<!--   Deals with tags that are related to different levels
			 of text blocks like SDLevel and various lists      -->
	<!-- ==================================================== -->
	<!-- LimitSubject and GeneralDesc matches removed-->
	<xsl:template match="ftid:FMtopic|ftid:SDSubject|ftid:Normal|ftid:CheckList[@CLGroup = 'Normal']|
								ftid:Supplementary|ftid:EffectCrossRefs|ftid:Glossary|
								ftid:BulletinRecord|ftid:ServiceBulletinRecord|ftid:GenericUnit|
								ftid:PerfTopic">
		<div class="ProcActionsGrp">
			<xsl:call-template name="setIDAttribute"/>
			<hr/>
			<xsl:apply-templates mode="TmpRev-phase" select="ftid:Title|ftid:PerfTopicHeading"/>
			<xsl:choose>
				<!-- IXP 4.2 - updates for new Rev Bar template  -->
				<xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
					<span class="RevMark" title="{@rev:revHighlight}">
						<xsl:apply-templates mode="TmpRev-phase" select="ftid:Effectivities"/>
						<xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Title|self::ftid:Effectivities|self::ftid:PerfTopicHeading)]"/>
					</span>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates mode="TmpRev-phase" select="ftid:Effectivities"/>
					<xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Title|self::ftid:Effectivities|self::ftid:PerfTopicHeading)]"/>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
  
	<!-- consolidates four other templates from original-->
	<!-- added missing ftid:FMsubTopic to match during quality review-->
	<xsl:template match="ftid:FMsubTopic | ftid:SDSubSubject| ftid:PerfSubTopicItem | ftid:PerfSubTopicSubItem">
		<div>
			<xsl:call-template name="setIDAttribute"/>
			<xsl:choose>
				<!-- IXP 4.2 - updates for new Rev Bar template  -->
				<xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
					<span class="RevMark" title="{@rev:revHighlight}">
						<xsl:apply-templates mode="TmpRev-phase"/>
					</span>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates mode="TmpRev-phase"/>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
  
	<xsl:template match="ftid:PerfSubTopic">
		<div>
			<xsl:call-template name="setIDAttribute"/>
			<xsl:choose>
				<xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
					<span class="RevMark" title="{@rev:revHighlight}">
						<xsl:apply-templates select="ftid:Effectivities | ftid:PerfTitleGrp" mode="TmpRev-phase"/>
						<xsl:if test="ftid:Caution | ftid:Warning | ftid:GraphicSet | ftid:List | ftid:Para | ftid:table | ftid:Note">
							<div>
								<xsl:call-template name="setIDAttribute">
									<xsl:with-param name="hasBody" select="true()"/>
								</xsl:call-template>
								<xsl:apply-templates select="ftid:Caution | ftid:Warning | ftid:GraphicSet | ftid:List | ftid:Para | ftid:table | ftid:Note" mode="TmpRev-phase"/>
							</div>
						</xsl:if>
						<xsl:apply-templates select="ftid:PerfSubTopicItem | ftid:PerfNote" mode="TmpRev-phase"/>
					</span>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="ftid:Effectivities | ftid:PerfTitleGrp" mode="TmpRev-phase"/>
					<xsl:if test="ftid:Caution | ftid:Warning | ftid:GraphicSet | ftid:List | ftid:Para | ftid:table | ftid:Note">
						<div>
							<xsl:call-template name="setIDAttribute">
								<xsl:with-param name="hasBody" select="true()"/>
							</xsl:call-template>
							<xsl:apply-templates select="ftid:Caution | ftid:Warning | ftid:GraphicSet | ftid:List | ftid:Para | ftid:table | ftid:Note" mode="TmpRev-phase"/>
						</div>
					</xsl:if>
					<xsl:apply-templates select="ftid:PerfSubTopicItem | ftid:PerfNote" mode="TmpRev-phase"/>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
  
	<xsl:template match="ftid:Basis/ftid:Para">
		<p class="BasisPara">
			<xsl:apply-templates mode="TmpRev-phase"/>
		</p>
	</xsl:template>
  
	<xsl:template match="ftid:Comment">
		<div>
			<xsl:attribute name="class">
        <xsl:text>comment</xsl:text>
        <xsl:if test="not(following-sibling::*[1][self::ftid:Comment])"> Last</xsl:if>
        <xsl:if test="ftid:Effectivities"> WithEffectivities</xsl:if>
      </xsl:attribute>
			<xsl:choose>
				<xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
					<span class="RevMark" title="{@rev:revHighlight}">
						<xsl:apply-templates mode="TmpRev-phase"/>
					</span>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates mode="TmpRev-phase"/>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
  
	<xsl:template match="ftid:List">
		<xsl:variable name="listTest">
			<xsl:value-of select="@listType"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
				<span class="RevMark" title="{@rev:revHighlight}">
					<xsl:choose>
						<xsl:when test="contains($listTest, '1') or contains($listTest, 'a') or contains($listTest, 'A')">
							<ol>
								<xsl:attribute name="style">
                  <xsl:choose>
                    <xsl:when test="contains($listTest, 'a')">list-style-type:lower-alpha;</xsl:when>
                    <xsl:when test="contains($listTest, 'A')">list-style-type:upper-alpha;</xsl:when>
                    <xsl:when test="$listTest = '1)'">list-style-type:none;</xsl:when>
                    <xsl:when test="$listTest = '(1)'">list-style-type:none;</xsl:when>
                    <!-- set list item marking to none because it will be generated separately to add parenthesis -->
                    <xsl:otherwise>list-style-type:decimal;</xsl:otherwise>
                  </xsl:choose>
                  <xsl:if test="ancestor::ftid:NonNormal">font-weight:bold;</xsl:if>
                </xsl:attribute>
								<xsl:apply-templates mode="TmpRev-phase"/>
							</ol>
						</xsl:when>
						<xsl:otherwise>
							<ul>
								<xsl:attribute name="style"><xsl:choose><!-- IXP 4.1 - do not indent FM Unlist element when inside a bulleted or numbered list --><xsl:when test="$listTest = 'none' and ancestor::ftid:List[@listType = 'none']">list-style-type:none;</xsl:when><xsl:when test="$listTest = 'none' and ancestor::ftid:List">list-style-type:none; padding: 0px; margin: 0px;</xsl:when><xsl:when test="$listTest = 'none'">list-style-type:none;</xsl:when><xsl:otherwise>list-style-type:disc;</xsl:otherwise></xsl:choose><xsl:if test="ancestor::ftid:NonNormal and not(ancestor::ftid:Comment) and not($isQRH2)">font-weight:bold;</xsl:if></xsl:attribute>
								<xsl:apply-templates mode="TmpRev-phase"/>
							</ul>
						</xsl:otherwise>
					</xsl:choose>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="contains($listTest, '1') or contains($listTest, 'a') or contains($listTest, 'A')">
						<ol>
							<xsl:attribute name="style"><xsl:choose><xsl:when test="contains($listTest, 'a')">list-style-type:lower-alpha;</xsl:when><xsl:when test="contains($listTest, 'A')">list-style-type:upper-alpha;</xsl:when><xsl:when test="$listTest = '1)'">list-style-type:none;</xsl:when><xsl:when test="$listTest = '(1)'">list-style-type:none;</xsl:when><!-- set list item marking to none because it will be generated separately to add parenthesis --><xsl:otherwise>list-style-type:decimal;</xsl:otherwise></xsl:choose><xsl:if test="ancestor::ftid:NonNormal">font-weight:bold;</xsl:if></xsl:attribute>
							<xsl:apply-templates mode="TmpRev-phase"/>
						</ol>
					</xsl:when>
					<xsl:otherwise>
						<ul>
							<xsl:attribute name="style"><xsl:choose><!-- IXP 4.1 - do not indent FM Unlist element when inside a bulleted or numbered list --><xsl:when test="$listTest = 'none' and ancestor::ftid:List[@listType = 'none']">list-style-type:none;</xsl:when><xsl:when test="$listTest = 'none' and ancestor::ftid:List">list-style-type:none; padding: 0px; margin: 0px;</xsl:when><xsl:when test="$listTest = 'none'">list-style-type:none;</xsl:when><xsl:otherwise>list-style-type:disc;</xsl:otherwise></xsl:choose><xsl:if test="ancestor::ftid:NonNormal and not(ancestor::ftid:Comment) and not($isQRH2)">font-weight:bold;</xsl:if></xsl:attribute>
							<xsl:apply-templates mode="TmpRev-phase"/>
						</ul>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
  
	<xsl:template match="ftid:ListItem[*]">
		<!-- skips ListItems with no child elements-->
		<xsl:choose>
			<xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
				<span class="RevMark" title="{@rev:revHighlight}">
					<xsl:choose>
						<xsl:when test="../@listType = '1)'">
							<dl class="ListItem">
								<!-- the dt element is the number for our list. -->
								<dt>
									<xsl:value-of select="count(preceding-sibling::ftid:ListItem[*]) + 1"/>)
                </dt>
								<dd>
									<xsl:apply-templates mode="TmpRev-phase"/>
								</dd>
							</dl>
						</xsl:when>
						<xsl:when test="../@listType = '(1)'">
							<dl class="ListItem">
								<!-- the dt element is the number for our list. -->
								<dt>
                  (<xsl:value-of select="count(preceding-sibling::ftid:ListItem[*]) + 1"/>)
                </dt>
								<dd>
									<xsl:apply-templates mode="TmpRev-phase"/>
								</dd>
							</dl>
						</xsl:when>
						<xsl:when test="../@listType = 'dash'">
							<dl class="ListItem">
								<!-- the dt element is the number for our list. -->
								<dt>
									<xsl:text>-  </xsl:text>
								</dt>
								<dd>
									<xsl:apply-templates mode="TmpRev-phase"/>
								</dd>
							</dl>
						</xsl:when>
						<xsl:otherwise>
							<li>
								<xsl:apply-templates mode="TmpRev-phase"/>
							</li>
						</xsl:otherwise>
					</xsl:choose>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="../@listType = '1)'">
						<dl class="ListItem">
							<!-- the dt element is the number for our list. -->
							<dt>
								<xsl:value-of select="count(preceding-sibling::ftid:ListItem[*]) + 1"/>)
              </dt>
							<dd>
								<xsl:apply-templates mode="TmpRev-phase"/>
							</dd>
						</dl>
					</xsl:when>
					<xsl:when test="../@listType = '(1)'">
						<dl class="ListItem">
							<!-- the dt element is the number for our list. -->
							<dt>
                (<xsl:value-of select="count(preceding-sibling::ftid:ListItem[*]) + 1"/>)
              </dt>
							<dd>
								<xsl:apply-templates mode="TmpRev-phase"/>
							</dd>
						</dl>
					</xsl:when>
					<xsl:when test="../@listType = 'dash'">
						<dl class="ListItem">
							<!-- the dt element is the number for our list. -->
							<dt>
								<xsl:text>-  </xsl:text>
							</dt>
							<dd>
								<xsl:apply-templates mode="TmpRev-phase"/>
							</dd>
						</dl>
					</xsl:when>
					<xsl:otherwise>
						<li>
							<xsl:apply-templates mode="TmpRev-phase"/>
						</li>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
  
	<xsl:template match="ftid:Effectivities">
		<xsl:param name="isOverridden" select="false()"/>
				<xsl:if test="not(following-sibling::*[self::ftid:Title]) or $isOverridden">
					<p class="Effectivity">
						<xsl:call-template name="EffectivityText"/>
					</p>
					<!-- Included EffectAirplaneList data to the O/P HTML to provide filter functionality-->
					<div class="EffectivityAirplanes" style="display:none">
						<xsl:call-template name="EffectivityAirplaneList"/>
					</div>
				</xsl:if>
	</xsl:template>

  <xsl:template name="EffectivityText">
		<xsl:if test="parent::ftid:NonNormal">
			<xsl:attribute name="style">text-align:center;</xsl:attribute>
		</xsl:if>
		<xsl:choose>
			<!-- IXP 4.3 - display each Effectivity element on a separate line -->
			<xsl:when test="count(child::ftid:Effectivity) > 1">
				<xsl:for-each select="child::ftid:Effectivity">
					<xsl:if test="position() > 1">
						<br/>
					</xsl:if>
					<xsl:apply-templates select="." mode="TmpRev-phase"/>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates mode="TmpRev-phase"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
  
	<!-- Included EffectAirplaneList data to the O/P HTML to provide filter functionality-->
	<xsl:template name="EffectivityAirplaneList">
		<xsl:if test="not(ftid:Effectivity)">
			<xsl:value-of select="ftid:EffectivitywSB/@effectAirplaneList"/>
		</xsl:if>
		<xsl:value-of select="ftid:Effectivity/@effectAirplaneList"/>
	</xsl:template>
  
	<xsl:template match="ftid:Para">
		<xsl:if test="descendant::text()">
			<!-- no output for empty Para elements-->
			<!-- separated effectivities "above" to avoid paragraph centering problems. -->
			<xsl:apply-templates mode="TmpRev-phase" select="ftid:Effectivities"/>
			<xsl:choose>
				<!-- IXP 4.2 - updates for new Rev Bar template  -->
				<xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
					<p>
						<xsl:if test="not(string-length(@align) = 0) or preceding-sibling::ftid:Effectivities">
							<xsl:attribute name="style"><xsl:if test="not(string-length(@align) = 0)"><xsl:value-of select="concat('text-align:', @align, ';')"/></xsl:if><!-- TODO: is this top margin still needed? --><xsl:if test="preceding-sibling::ftid:Effectivities">margin-top:.25em;</xsl:if></xsl:attribute>
						</xsl:if>
						<xsl:if test="@recall='Y'">
              #<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Effectivities)]"/>
					</p>
				</xsl:when>
				<!-- IXP 4.4 - entry parent of Para has the revHighlight-->
				<xsl:when test="$boolShowRevisionMarkings and parent::ftid:entry/@rev:revHighlight and preceding-sibling::processing-instruction('FTID-rev')[starts-with(.,'start')]">
					<span class="RevMark" title="{parent::ftid:entry/@rev:revHighlight}">
						<p>
							<xsl:if test="not(string-length(@align) = 0) or preceding-sibling::ftid:Effectivities">
								<xsl:attribute name="style"><xsl:if test="not(string-length(@align) = 0)"><xsl:value-of select="concat('text-align:', @align, ';')"/></xsl:if><!-- TODO: is this top margin still needed? --><xsl:if test="preceding-sibling::ftid:Effectivities">margin-top:.25em;</xsl:if></xsl:attribute>
							</xsl:if>
							<xsl:if test="@recall='Y'">
                #<xsl:text> </xsl:text>
							</xsl:if>
							<xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Effectivities)]"/>
						</p>
					</span>
				</xsl:when>
				<xsl:otherwise>
					<p>
						<xsl:if test="not(string-length(@align) = 0) or preceding-sibling::ftid:Effectivities">
							<xsl:attribute name="style"><xsl:if test="not(string-length(@align) = 0)"><xsl:value-of select="concat('text-align:', @align, ';')"/></xsl:if><!-- TODO: is this top margin still needed? --><xsl:if test="preceding-sibling::ftid:Effectivities">margin-top:.25em;</xsl:if></xsl:attribute>
						</xsl:if>
						<xsl:if test="@recall='Y'">
              #<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Effectivities)]"/>
					</p>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
  
	<!-- Add SuppItem template for creating Rev Bar span when needed-->
	<xsl:template match="ftid:SuppItem">
		<xsl:choose>
			<xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
				<span class="RevMark" title="{@rev:revHighlight}">
					<xsl:choose>
						<xsl:when test="$isFiltered">
							<xsl:apply-templates mode="TmpRev-phase"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates/>
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
						<xsl:apply-templates/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
