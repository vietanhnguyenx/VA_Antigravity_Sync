<?xml version="1.0" encoding="utf-8"?>


<xsl:stylesheet version="1.0"
								xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
								xmlns:ftid="http://www.boeing.com/FTID-ML"
								xmlns:rev="http://www.boeing.com/FTID-ML/Revision">



	<xsl:variable name="crmIsCentered" select="/ftid:Procedures/processing-instruction('FTID-attr_crm_position') = 'center'"/>

	<xsl:template match="ftid:Action">
		<div>
			<xsl:apply-templates select="ftid:Effectivities" mode="TmpRev-phase" />
			<div>
				<xsl:attribute name="class">
					<xsl:text>action </xsl:text>
					<xsl:if test="@recall = 'Y' and not($isQRH2)">recall </xsl:if>
					<xsl:if test="$crmIsCentered or (ancestor::ftid:CheckList[@CLGroup = 'Normal'] or (ancestor::ftid:NonNormal and not($isQRH2)))">bold </xsl:if>
				</xsl:attribute>
				
				<xsl:choose> 
	                <xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
		                <span  class="RevMark" title="{@rev:revHighlight}">
				            <xsl:apply-templates select="ftid:Challenge" mode="TmpRev-phase" />
				            <div class="responseGroup">
					            <xsl:apply-templates select="ftid:Response" mode="TmpRev-phase" />
				            </div>
						</span>
	                </xsl:when>
	                
	                <xsl:otherwise>
				        <xsl:apply-templates select="ftid:Challenge" mode="TmpRev-phase" />
				        <div class="responseGroup">
					        <xsl:apply-templates select="ftid:Response" mode="TmpRev-phase" />
				        </div>
					</xsl:otherwise>
		        </xsl:choose>
		        
			</div>
			<xsl:apply-templates mode="TmpRev-phase" select="*[not(self::ftid:Effectivities|self::ftid:Challenge|self::ftid:Response)]" />
			<!-- ^^^^ basically: Comment, Caution, Warning, Opnote or ProcActionsGrp -->
			<xsl:apply-templates select="@recall" mode="TmpRev-phase"/>
		</div>
	</xsl:template>

	<xsl:template match="ftid:Challenge">
		<div class="challenge">
			<p>
				<xsl:if test="parent::ftid:Action/parent::ftid:Precaution">
					<span class="exclamation">!</span>
				</xsl:if>
				<span class="opaque">
					<xsl:apply-templates mode="TmpRev-phase" />
				</span>
			</p>
		</div>
	</xsl:template>


	<xsl:template name="leader">
		<div class="leader">........................................................................................................................................................................................................................................................</div>
	</xsl:template>


	<xsl:template match="ftid:Response">
		<div>
			<!-- confirmText (betweeen challenge & response) is:
			     a. the @crm value from this Response or the parent Action 
				    (as determined by the chooseCrm template) if the $crmIsCentered value is true 
			     b. "Confirm" if the @confirm =='Y' is true
				 c. blank 
				 -->
			<xsl:attribute name="class">
				<xsl:text>response </xsl:text>
				<xsl:if test="not($crmIsCentered) and (@crm or ../@crm)">withCrm </xsl:if><!-- This class adds right padding, so it should only be added when a crm exists and isn't displayed in the middle -->
				<xsl:if test="preceding-sibling::*[1][self::ftid:Response]">addtl </xsl:if>
				<xsl:if test="not(../ftid:Challenge)">noChallenge </xsl:if>
			</xsl:attribute>
			<xsl:variable name="confirmText">
				<xsl:choose>
					<xsl:when test="$crmIsCentered">
						<xsl:call-template name="chooseCrmText"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="../@confirm = 'Y'"><xsl:value-of select="$confirm-label"/></xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:call-template name="leader"/>
			<xsl:call-template name="chooseCrm"/>
			<xsl:call-template name="confirm">
				<xsl:with-param name="text" select="$confirmText"/>
			</xsl:call-template>
			<p>
				<span class="opaque">
				    <!-- Here's a workaround for a Ground Viewer issue with the display of a empty response -->
				    <xsl:choose>
				        <xsl:when test="child::ftid:Emphasis">
							<xsl:apply-templates mode="TmpRev-phase" />
						</xsl:when>
				        <xsl:when test="not(text()) or normalize-space(text()) = 0">
				            <xsl:text>.</xsl:text>
				        </xsl:when>
				        <xsl:otherwise>
				            <xsl:apply-templates mode="TmpRev-phase" />
				        </xsl:otherwise>
				    </xsl:choose>
				</span>
			</p>
		</div>
	</xsl:template>


	<xsl:template name="chooseCrm">
		<xsl:if test="not($crmIsCentered or concat(@crm, ../@crm)='')">
			<!-- the @crm is valid on the Response AND the parent Action.
			 When Response/@crm has a value it overrides the Action/@crm,
			 otherwise, use the Action/@crm -->
			<div class="crm">
				<span class="opaque">
					<xsl:call-template name="chooseCrmText"/>
				</span>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template name="chooseCrmText">
		<xsl:choose>
			<xsl:when test="boolean(@crm)">
				<xsl:apply-templates select="@crm" mode="TmpRev-phase"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="../@crm" mode="TmpRev-phase" />
			</xsl:otherwise>
		</xsl:choose>	
	</xsl:template>

	<xsl:template name="confirm">
		<xsl:param name="text" select="$confirm-label"/>
		<!-- "Confirm" is only displayed when @confirm = Y and there is no ftid:Response before this one. 
				 i.e. "Confirm" is only displayed on the FIRST Response.  This isn't really a "confirm" when 
				 $crmIsCentered... then it's a CRM, and should always be displayed regardless of position -->
		<xsl:if test="not(normalize-space($text) = '') and ($crmIsCentered or (../@confirm = 'Y' and not(preceding-sibling::ftid:Response)))">
			<div class="confirm">
				<span class="opaque">
					<xsl:value-of select="$text"/>
				</span>
			</div>
		</xsl:if>
	</xsl:template>


	<xsl:template match="ftid:Precaution">
		<span class="precaution">
			<xsl:apply-templates mode="TmpRev-phase" select="ftid:Para/text()|ftid:Para/*"/>
		</span>
		<xsl:apply-templates mode="TmpRev-phase" select="*[not(self::ftid:Para)]"/>
	</xsl:template>


	<xsl:template match="ftid:Light">
		<xsl:variable name="bgcolor">
			<xsl:choose>
				<!-- use the descendant bgColor if one exists, -->
				<xsl:when test=".//@bgColor">
					<xsl:value-of select=".//@bgColor[1]"/>
				</xsl:when>
				<!-- otherwise,  use black as the default-->
				<xsl:otherwise>
					<xsl:text>Black</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div class="Light">
			<xsl:if test="text()">
				<div class="header">
					<xsl:apply-templates mode="TmpRev-phase" select="text()"/>
				</div>
			</xsl:if>
			<div class="message" style="background-color:{$bgcolor}">
				<xsl:apply-templates mode="TmpRev-phase" select="*[not(self::ftid:Emphasis/text() = 'or')]"/>
			</div>
		</div>
		<xsl:apply-templates select="ftid:Emphasis[text() = 'or']" mode="TmpRev-phase" />
	</xsl:template>


	<xsl:template match="ftid:Precaution/ftid:Command/ftid:Step/ftid:Para">
		<xsl:if test="parent::ftid:Step/parent::ftid:Command[not(preceding-sibling::ftid:Command or preceding-sibling::ftid:Action)]">
			<span class="exclamation" style="float:left">!</span>
		</xsl:if>
		<p>
			<xsl:apply-templates mode="TmpRev-phase"/>
		</p>

	</xsl:template>


	<xsl:template match="ftid:ConsiderationItems">
	    <!-- IXP 4.2 - check if ConsiderationItems has a child Title before applying ccs class -->
	    <xsl:if test="ftid:Title" >
		    <p class="ConsiderationItems">
			    <xsl:apply-templates select="ftid:Title" mode="TmpRev-phase"/>
		    </p>
		</xsl:if>
		<xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Title)]"/>
	</xsl:template>


	<xsl:template match="ftid:ProcActionsGrp/ftid:Command">
		<xsl:choose> 
		    <!-- IXP 4.2 - updates for new Rev Bar template  -->
	        <xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
		        <span  class="RevMark" title="{@rev:revHighlight}">
		            <div class="Command">
		                <xsl:apply-templates select="ftid:Effectivities" mode="TmpRev-phase"/>
			            <xsl:if test="not(string-length(@crm) = 0)">
				            <div class="cmdcrm">
					            <span>
						            <xsl:apply-templates select="@crm" mode="TmpRev-phase"/>&#160;
					            </span>
				            </div>
			            </xsl:if>
			            <!-- <xsl:apply-templates mode="TmpRev-phase"/> -->
			            <xsl:apply-templates select="*[not(self::ftid:Effectivities)]" mode="TmpRev-phase"/>
		            </div>
		            <xsl:apply-templates select="@recall" />
		        </span>
	        </xsl:when>
	        <xsl:otherwise>
	        	<div class="Command">
	        	    <xsl:apply-templates select="ftid:Effectivities" mode="TmpRev-phase"/>
			        <xsl:if test="not(string-length(@crm) = 0)">
				        <div class="cmdcrm">
				            <span>
						        <xsl:apply-templates select="@crm" mode="TmpRev-phase"/>&#160;
					        </span>
				        </div>
			        </xsl:if>
			        <!-- <xsl:apply-templates mode="TmpRev-phase"/> -->
			        <xsl:apply-templates select="*[not(self::ftid:Effectivities)]" mode="TmpRev-phase"/>
		        </div>
		        <xsl:apply-templates select="@recall" />
	        </xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="ftid:ChoiceItems">
		<xsl:apply-templates mode="TmpRev-phase" select="ftid:Effectivities"/>
		<p class="ChoiceItems">
			<xsl:value-of select="$choose_one-label"/>:
		</p>
		<ol class="ChoiceItems">
			<xsl:apply-templates mode="TmpRev-phase" select="*[not(self::ftid:Effectivities)]"/>
		</ol>
	</xsl:template>

	<xsl:template match="ftid:ChoiceItems/ftid:Condition">
		<li class="ChoiceItem">
			<xsl:if test="following-sibling::ftid:Condition">
				<!-- the 'line' in a diamond line -->
				<xsl:attribute name="style">border-left:solid 2px;</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="TmpRev-phase"/>
			<xsl:apply-templates select="@end"/>
		</li>
		<xsl:apply-templates select="@recall"/>
	</xsl:template>

	<xsl:template match="ftid:Condition">
		<div class="Condition">
			<xsl:attribute name="style">
				<xsl:if test="parent::ftid:ChoiceItems and following-sibling::ftid:Condition">border-left:solid 2px;</xsl:if>
			</xsl:attribute>
			<xsl:apply-templates mode="TmpRev-phase"/>
			<xsl:apply-templates select="@end" mode="TmpRev-phase"/>
		</div>
		<xsl:apply-templates select="@recall" mode="TmpRev-phase"/>
	</xsl:template>


	<xsl:template match="ftid:ChoiceItems//ftid:ConditionStatement/ftid:Para">
		<div class="Choice">
			<xsl:choose>
				<xsl:when test="not(parent::ftid:ConditionStatement/parent::ftid:Condition/parent::ftid:ChoiceItems)">
					<xsl:attribute name="style">margin-top:.5em;padding-left:2.5em;</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<!-- using h2 vs span because EFB isn't responding to changes in font size
							 with the span.  Reason: unknown -->
					<h2 class="diamond">♦</h2>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates mode="TmpRev-phase"/>
		</div>
	</xsl:template>


	<xsl:template match="ftid:Destin">
		<div class="Destin">
			<xsl:if test="not($isQRH2)">==> </xsl:if>
			<xsl:apply-templates mode="TmpRev-phase"/>
		</div>
	</xsl:template>


	<xsl:template match="ftid:NavigationStep">
		<xsl:apply-templates select="ftid:Effectivities" mode="TmpRev-phase"/>
		<p class="NavigationStep">
			&#9658;&#160;&#9658;&#160;<xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Effectivities)]"/>
		</p>
	</xsl:template>


	<xsl:template match="ftid:NonNormal">
		<div id="{@id}">
			<xsl:if test="not($isQRH2)">
				<xsl:attribute name="style">
					<xsl:text>font-weight:bold;</xsl:text>
					<xsl:if test="@recall='Y'">
						<xsl:text>border:solid 1px</xsl:text>
					</xsl:if>
				</xsl:attribute>
			</xsl:if>
			<!-- IXP 4.3 - A title may have more than one FTID-xref; add another for-each -->
			<xsl:for-each select="ftid:Title[processing-instruction('FTID-xref')]|ftid:AdditionalTitles/ftid:Title[processing-instruction('FTID-xref')]">
				<xsl:for-each select="processing-instruction('FTID-xref')">
					<span id="{.}"/>
			    </xsl:for-each>
			</xsl:for-each>
			<div class="NonNormalTitle">
				<hr/>
				<h3>
					<xsl:for-each select="ftid:Title|ftid:AdditionalTitles/ftid:Title[not(@checklistIndex = 'e')]">
						<xsl:call-template name="NNCTitles"/>
					</xsl:for-each>
				</h3>
				<xsl:if test="ftid:Effectivities">
					<span style="font-style:normal">
						<xsl:apply-templates select="ftid:Effectivities">
							<xsl:with-param name="isOverridden" select="true()"/>
						</xsl:apply-templates>
					</span>
				</xsl:if>
			</div>
			<xsl:apply-templates mode="TmpRev-phase" 
			  select="*[not(self::ftid:Effectivities or self::ftid:Title or self::ftid:Light or self::ftid:AdditionalTitles)]"/>
			<xsl:apply-templates select="@end" mode="TmpRev-phase"/>
		</div>
	</xsl:template>
	
     <!-- IXP 4.3 - Replace “MemoryLineColor” PI and the “ender MemoryEnd” PI with the MemoryEndIndicator element  -->
     <xsl:template match="ftid:MemoryEndIndicator" mode="TmpRev-phase" >
     	<xsl:variable name="memoryLineColor" select="@indicatorColor" />
		<xsl:choose>
			<xsl:when test="$memoryLineColor='Red'">
					<hr class="MemoryRed"/>
			</xsl:when>
			<xsl:otherwise>
				   <hr class="Memory"/>
			</xsl:otherwise>
		</xsl:choose>
	 </xsl:template>

	<xsl:template match="ftid:NonNormal/ftid:AdditionalTitles/ftid:Title"/>

	<xsl:template name="NNCTitles">
		<xsl:if test="@checklistIndex = 'U' and not($isQRH2)">
			<span>U&#160;</span>
		</xsl:if>
		<xsl:if test="@checklistIndex = 'e'">[&#160;]&#160;</xsl:if>
		<xsl:if test="parent::ftid:AdditionalTitles">
			<br/>or<br/>
		</xsl:if>
		<xsl:apply-templates mode="TmpRev-phase" select="node()[self::text()|self::ftid:hit|self::ftid:Effectivities|self::ftid:iLink]"/>
	</xsl:template>


	<xsl:template match="ftid:CheckListPreamble">
		<xsl:apply-templates select="ftid:Light" mode="TmpRev-phase" />
		<xsl:apply-templates select="../ftid:AdditionalTitles" mode="TmpRev-phase"/>
		<xsl:apply-templates select="ftid:WarnCondition" mode="TmpRev-phase"/>
	</xsl:template>

	<xsl:template match="ftid:AdditionalTitles[ftid:Title/@checklistIndex='e']">
		<xsl:variable name="nbrTitles" select="count(ftid:Title[@checklistIndex='e'])" />
		<xsl:variable name="leftCount" select="($nbrTitles div 2) + ($nbrTitles mod 2)" />

		<dl class="AdditionalTitles">
			<dt><xsl:value-of select="$messages-label"/>:</dt>
			<!-- dividing the messages up into two columns -->
			<dd>
				<div class="MsgContainer">
					<xsl:apply-templates select="ftid:Title[@checklistIndex='e'][position() &lt;= $leftCount]" mode="TmpRev-phase" />
				</div>
				<xsl:if test="$nbrTitles &gt; 1">
					<div class="MsgContainer">
						<xsl:apply-templates select="ftid:Title[@checklistIndex='e'][position() &gt; $leftCount]" mode="TmpRev-phase" />
					</div>
				</xsl:if>
			</dd>
		</dl>
	</xsl:template> 


	<xsl:template match="ftid:AdditionalTitles/ftid:Title[@checklistIndex='e']">
		<div>
			<xsl:apply-templates mode="TmpRev-phase" select="node()[self::text()|self::ftid:hit|self::ftid:Effectivities|self::ftid:iLink]" />
		</div>
	</xsl:template>


	<xsl:template match="ftid:ProcActionsGrp">
	<xsl:choose>
	    <xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
		    <span  class="RevMark" title="{@rev:revHighlight}">
		
     <!-- enclose inside rev bar span -->
		        <xsl:choose>
			        <xsl:when test="$isEFBOutput">
				        <xsl:apply-templates select="." mode="EFB" />
			        </xsl:when>
			        <xsl:otherwise>
				        <xsl:variable name="isNumbered" select="$isQRH2 and 
									((parent::ftid:NonNormal and 
										not(child::ftid:DeferItems or child::ftid:ConsiderationItems or child::ftid:Opnote)
										and child::*[not(self::ftid:Effectivities or self::ftid:table or self::ftid:Title or self::ftid:NavigationStep or self::ftid:Note or self::ftid:Caution or self::ftid:Warning or self::ftid:InoperativeItems or self::ftid:GraphicSet)]))"/>
				        <xsl:apply-templates select="ftid:Title" mode="TmpRev-phase" />
				        <div class="ProcActionsGrp">
					        <xsl:attribute name="class">
						        <xsl:text>ProcActionsGrp</xsl:text>
						        <xsl:if test="not($isQRH2) and @recall='Y'"> Recall</xsl:if>
					        </xsl:attribute>
					        <xsl:if test="$isNumbered and not(child::ftid:MemoryEndIndicator)">
						        <div class="ProcActionsGrpNumber">
							        <xsl:value-of select="count(preceding-sibling::ftid:ProcActionsGrp[not(child::ftid:DeferItems or child::ftid:ConsiderationItems or child::ftid:Opnote or child::ftid:MemoryEndIndicator) and child::*[not(self::ftid:Effectivities or self::ftid:table or self::ftid:Title or self::ftid:NavigationStep or self::ftid:Note or self::ftid:Caution or self::ftid:Warning or self::ftid:InoperativeItems or self::ftid:GraphicSet)]]) + 1"/>
						        </div>
					        </xsl:if>
					        <div>
						        <xsl:if test="$isNumbered">
							        <xsl:attribute name="class">ProcActionsGrpContent</xsl:attribute>
						        </xsl:if>
						        <xsl:apply-templates mode="TmpRev-phase" select ="*[not(self::ftid:Title)]"/>
					        </div>
				        </div>
				        <xsl:apply-templates select="@recall" mode="TmpRev-phase"/>
				        <xsl:apply-templates select="@end" mode="TmpRev-phase"/>
			        </xsl:otherwise>
		        </xsl:choose>
		
				</span>
	        </xsl:when>
            <xsl:otherwise>
            
       <!-- no rev bar span -->
		        <xsl:choose>
			        <xsl:when test="$isEFBOutput">
				        <xsl:apply-templates select="." mode="EFB" />
			        </xsl:when>
			        <xsl:otherwise>
				        <xsl:variable name="isNumbered" select="$isQRH2 and 
									((parent::ftid:NonNormal and 
										not(child::ftid:DeferItems or child::ftid:ConsiderationItems or child::ftid:Opnote)
										and child::*[not(self::ftid:Effectivities or self::ftid:table or self::ftid:Title or self::ftid:NavigationStep or self::ftid:Note or self::ftid:Caution or self::ftid:Warning or self::ftid:InoperativeItems or self::ftid:GraphicSet)]))"/>
				        <xsl:apply-templates select="ftid:Title" mode="TmpRev-phase" />
				        <div class="ProcActionsGrp">
					        <xsl:attribute name="class">
						        <xsl:text>ProcActionsGrp</xsl:text>
						        <xsl:if test="not($isQRH2) and @recall='Y'"> Recall</xsl:if>
					        </xsl:attribute>
					        <xsl:if test="$isNumbered and not(child::ftid:MemoryEndIndicator)">
						        <div class="ProcActionsGrpNumber">
							        <xsl:value-of select="count(preceding-sibling::ftid:ProcActionsGrp[not(child::ftid:DeferItems or child::ftid:ConsiderationItems or child::ftid:Opnote or child::ftid:MemoryEndIndicator) and child::*[not(self::ftid:Effectivities or self::ftid:table or self::ftid:Title or self::ftid:NavigationStep or self::ftid:Note or self::ftid:Caution or self::ftid:Warning or self::ftid:InoperativeItems or self::ftid:GraphicSet)]]) + 1"/>
						        </div>
					        </xsl:if>
					        <div>
						        <xsl:if test="$isNumbered">
							        <xsl:attribute name="class">ProcActionsGrpContent</xsl:attribute>
						        </xsl:if>
						        <xsl:apply-templates mode="TmpRev-phase" select ="*[not(self::ftid:Title)]"/>
					        </div>
				        </div>
				        <xsl:apply-templates select="@recall" mode="TmpRev-phase"/>
				        <xsl:apply-templates select="@end" mode="TmpRev-phase"/>
			        </xsl:otherwise>
		        </xsl:choose>  
  
            </xsl:otherwise>
        </xsl:choose>
	</xsl:template>


	<xsl:template match="ftid:ProcActionsGrp" mode="EFB">
		<xsl:variable name="isNumbered" select="$isQRH2 and 
									((parent::ftid:NonNormal and 
										not(child::ftid:DeferItems or child::ftid:ConsiderationItems or child::ftid:Opnote)
										and child::*[not(self::ftid:Effectivities or self::ftid:table or self::ftid:Title or self::ftid:NavigationStep or self::ftid:Note or self::ftid:Caution or self::ftid:Warning or self::ftid:InoperativeItems or self::ftid:GraphicSet)]))"/>
		<xsl:apply-templates select="ftid:Title" mode="TmpRev-phase" />
		<table class="ProcActionsGrp">
			<xsl:if test="ancestor::ftid:Supplementary and not(ancestor::ftid:ProcActionsGrp)"><xsl:attribute name="style">margin-left:1.5em</xsl:attribute></xsl:if>
			<tr>
				<xsl:if test="$isNumbered and not(child::ftid:MemoryEndIndicator)">
					<td class="number">
						<xsl:value-of select="count(preceding-sibling::ftid:ProcActionsGrp[not(child::ftid:DeferItems or child::ftid:ConsiderationItems or child::ftid:Opnote or child::ftid:MemoryEndIndicator) and child::*[not(self::ftid:Effectivities or self::ftid:table or self::ftid:Title or self::ftid:NavigationStep or self::ftid:Note or self::ftid:Caution or self::ftid:Warning or self::ftid:InoperativeItems or self::ftid:GraphicSet)]]) + 1"/>
					</td>
				</xsl:if>
				<td class="content">
					<xsl:apply-templates mode="TmpRev-phase" select ="*[not(self::ftid:Title)]"/>
				</td>
			</tr>
		</table>
		<xsl:apply-templates select="@recall" mode="TmpRev-phase"/>
		<xsl:apply-templates select="@end" mode="TmpRev-phase"/>
	</xsl:template>



	<xsl:template match="ftid:ProcActionsGrp/ftid:Title">
	    <!-- IXP 4.2 - make sure the parent is a NonNormal element -->
	    <xsl:if test="ancestor::NonNormal">
	        <hr />
		</xsl:if>
		<h3 class="Title">
			<xsl:apply-templates mode="TmpRev-phase"/>
		</h3>
	</xsl:template>

    <!-- IXP 4.2 - recall attribute no longer needed for memoryline; disgard  -->
    <xsl:template match="@recall" >
	</xsl:template>

	

	<xsl:template match="@end">
		<xsl:if test=". = 'Y' and not(parent::*/parent::*[@end='Y'])">
			<div class="End">
				&#9608;&#9608; &#9608;&#9608; &#9608;&#9608; &#9608;&#9608;
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="ftid:Step | ftid:ExtendedStep">
		<xsl:choose>
			<xsl:when test="ancestor::ftid:Normal or ancestor::ftid:Supplementary">
				<xsl:apply-templates mode="TmpRev-phase"/>
			</xsl:when>
			<xsl:otherwise>
				<div>
					<xsl:attribute name="style">
						<xsl:if test="not(parent::ftid:Command/@crm)">clear:both;</xsl:if>
						<xsl:if test="/ftid:Procedures/ftid:NonNormal and parent::ftid:Command/@crm">margin-right:3.5em;</xsl:if>
						<xsl:if test="not($isQRH2) and ancestor::ftid:NonNormal">
							<xsl:text>font-weight:bold;</xsl:text>
						</xsl:if>
					</xsl:attribute>
					<xsl:apply-templates mode="TmpRev-phase"/>
				</div>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>


	<xsl:template match="ftid:WarnCondition">
		<xsl:apply-templates select="ftid:Effectivities" mode="TmpRev-phase"/>
		<table class="warnCondition">
			<tbody>
				<tr>
					<td class="conditionLabel"><xsl:value-of select="$condition-label"/>:</td>
					<td class="content">
						<xsl:apply-templates select="*[not(self::ftid:Effectivities)]" mode="TmpRev-phase"/>
					</td>
				</tr>
				<xsl:if test="following-sibling::*[1][self::ftid:Objective]">
					<tr>
						<td class="objectiveLabel"><xsl:value-of select="$objective-label"/>:</td>
						<td class="content">
							<xsl:apply-templates mode="TmpRev-phase" select="following-sibling::*[1][self::ftid:Objective]/*"/>
						</td>
					</tr>
				</xsl:if>
			</tbody>
		</table>
	</xsl:template>


	<!--<xsl:template match="ftid:WarnCondition">
		<xsl:apply-templates select="ftid:Effectivities" mode="TmpRev-phase" />
		<dl class="WarnCondition">
			<dt>Condition:</dt>
			<dd>
				<xsl:apply-templates select="*[not(self::ftid:Effectivities)]" mode="TmpRev-phase" />
			</dd>
			<xsl:if test="following-sibling::*[1][self::ftid:Objective]">
				<dt>Objective:</dt>
				<dd>
					<xsl:apply-templates mode="TmpRev-phase" select="following-sibling::*[1][self::ftid:Objective]/*"/>
				</dd>
			</xsl:if>
		</dl>
	</xsl:template>-->

	<xsl:template match="ftid:DeferItems">
		<xsl:if test="not(preceding-sibling::*[1][self::ftid:DeferItems])">
       <p class="DeferItems"><xsl:value-of select="$deferred_items-label"/></p>
		</xsl:if>
		<xsl:apply-templates mode="TmpRev-phase" select="ftid:Destin"/>
		<div class="DeferItems">
			<xsl:apply-templates mode="TmpRev-phase" select="*[not(self::ftid:Destin)]"/>
		</div>
	</xsl:template>



	<xsl:template match="ftid:ExcludeItems">
		<div class="ExcludeItems">
			<xsl:apply-templates mode="TmpRev-phase" select="*[not(self::ftid:ExcludeTitle)]"/>

			<ul class="ExcludeTitle">
				<xsl:apply-templates select="ftid:ExcludeTitle"/>
			</ul>
		</div>
	</xsl:template>


	<xsl:template match="ftid:ExcludeTitle">
		<li>
			<p>
				<xsl:apply-templates mode="TmpRev-phase" />
			</p>
		</li>
	</xsl:template>


	<xsl:template match="ftid:InoperativeItems">
		<xsl:apply-templates mode="TmpRev-phase" select="ftid:Effectivities"/>
		<div class="InopItems">
			<xsl:apply-templates select="ftid:Title" mode="TmpRev-phase" />
			<xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Effectivities or self::ftid:Title)]"/>
		</div>
	</xsl:template>

	<xsl:template match="ftid:InoperativeItems/ftid:Title">
		<p class="Title">
			<xsl:apply-templates mode="TmpRev-phase"/>
		</p>
	</xsl:template>


	<xsl:template match="ftid:InopCondition">
		<p class="Condition">
			<xsl:apply-templates mode="TmpRev-phase"/>
		</p>
	</xsl:template>


	<xsl:template match="ftid:InopEffect[child::*|node()]">
		<p class="Effect">
			<xsl:apply-templates mode="TmpRev-phase"/>
		</p>
	</xsl:template>


</xsl:stylesheet>