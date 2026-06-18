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
Deals with tags that are related to the SDG and EICAS items in the DDG
======================================================================
-->
	<xsl:template match="ftid:EICASMessages|ftid:Placards|ftid:MaintenanceProcedure|ftid:OperationProcedure|ftid:OperationNote|ftid:MaintenanceNote">
		<!-- IXP 4.3.1 - updates for new Rev Bar template  -->
		<xsl:choose>
	        <xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
		         <span  class="RevMark" title="{@rev:revHighlight}">
		            <h3 class="Title" style="text-decoration:underline">
			            <xsl:choose>
				            <xsl:when test="self::ftid:EICASMessages"><xsl:value-of select="$EICAS_messages-label"/></xsl:when>
				            <xsl:when test="self::ftid:Placards"><xsl:value-of select="$placards-label"/></xsl:when>
				            <xsl:when test="self::ftid:MaintenanceProcedure"><xsl:value-of select="$maintenance_procedure-label"/></xsl:when>
				            <xsl:when test="self::ftid:OperationProcedure"><xsl:value-of select="$operation_procedure-label"/></xsl:when>
				            <xsl:when test="self::ftid:OperationNote"><xsl:choose><xsl:when test="string-length(ftid:Title) = 0"><xsl:value-of select="$operation_note-label"/></xsl:when><xsl:otherwise><xsl:apply-templates select="ftid:Title"/></xsl:otherwise></xsl:choose></xsl:when>
				            <xsl:when test="self::ftid:MaintenanceNote"><xsl:choose><xsl:when test="string-length(ftid:Title) = 0"><xsl:value-of select="$maintenance_note-label"/></xsl:when><xsl:otherwise><xsl:apply-templates select="ftid:Title"/></xsl:otherwise></xsl:choose></xsl:when>
			            </xsl:choose>
		            </h3>
		            <xsl:apply-templates mode="TmpRev-phase"/>
		        </span>
		    </xsl:when>
		    <xsl:otherwise>
				<h3 class="Title" style="text-decoration:underline">
			        <xsl:choose>
				        <xsl:when test="self::ftid:EICASMessages"><xsl:value-of select="$EICAS_messages-label"/></xsl:when>
				        <xsl:when test="self::ftid:Placards"><xsl:value-of select="$placards-label"/></xsl:when>
				        <xsl:when test="self::ftid:MaintenanceProcedure"><xsl:value-of select="$maintenance_procedure-label"/></xsl:when>
				        <xsl:when test="self::ftid:OperationProcedure"><xsl:value-of select="$operation_procedure-label"/></xsl:when>
				        <xsl:when test="self::ftid:OperationNote"><xsl:choose><xsl:when test="string-length(ftid:Title) = 0"><xsl:value-of select="$operation_note-label"/></xsl:when><xsl:otherwise><xsl:apply-templates select="ftid:Title"/></xsl:otherwise></xsl:choose></xsl:when>
				        <xsl:when test="self::ftid:MaintenanceNote"><xsl:choose><xsl:when test="string-length(ftid:Title) = 0"><xsl:value-of select="$maintenance_note-label"/></xsl:when><xsl:otherwise><xsl:apply-templates select="ftid:Title"/></xsl:otherwise></xsl:choose></xsl:when>
			        </xsl:choose>
		        </h3>
		        <xsl:apply-templates mode="TmpRev-phase"/>
		    </xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="ftid:CDLItem[not(ftid:DispatchCondition/@nbrInstalled or ftid:CDLSubItem)]">
		<table class="CDLItemHeader">
			<xsl:call-template name="setIDAttribute"/>
			<tr>
				<td class="FirstTD">
					<xsl:apply-templates select="@itemNbr"
										 mode="TmpRev-phase" />
				</td>
				<td>
					<xsl:apply-templates select="ftid:Title"
										 mode="TmpRev-phase"/>
				</td>
			</tr>
		</table>
		<xsl:apply-templates mode="TmpRev-phase"
							 select="*[not(self::ftid:Title)]"/>
	</xsl:template>

	
	<xsl:template match="ftid:EICASMsg">
		<p class="EICASMsg">
			<xsl:apply-templates mode="TmpRev-phase"/>
		</p>
	</xsl:template>

	<xsl:template match="ftid:DispatchCondition[not(@*)]"><xsl:apply-templates mode="TmpRev-phase"/></xsl:template>

	<xsl:template match="ftid:DispatchCondition">
		<div>
		    <xsl:choose>
	            <xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
		            <span  class="RevMark" title="{@rev:revHighlight}">		
		
			            <xsl:call-template name="setIDAttribute" >
				            <xsl:with-param name="hasBody" select="true()"/>
			            </xsl:call-template>
			            <xsl:if test="not(concat(@repairInterval, @nbrInstalled, @nbrRequired, @maintIndicator, @opsIndicator, @techIndicator, @equipOpCapability) = '')">

				            <!-- these empty DIV tags will serve as target links for MELItem(s) and MELSubItem(s) -->
				            <!-- these id's are set here so the EFB will autoscroll to the TOP of the DispatchCondition -->
				            <!-- also due to an EFB bug that will not scroll to the MELItem/MELSubItem row when and ID is assigned on the row -->
				            <xsl:variable name="hasPrecedingDispatchConditions" select="boolean(preceding::ftid:DispatchCondition)"/>
				            <xsl:variable name="hasPrecedingSiblingsDispatchConditions" select="boolean(preceding-sibling::ftid:DispatchCondition)"/>

				            <xsl:for-each select="ancestor::ftid:MELItem | ancestor::ftid:MELSubItem | ancestor::ftid:CDLItem | ancestor::ftid:CDLSubItem">
					            <xsl:if test="not($hasPrecedingSiblingsDispatchConditions) and (not($hasPrecedingDispatchConditions) or position() = last())">
						            <div>
							            <xsl:call-template name="setIDAttribute"/>
						            </div>
					            </xsl:if>
				            </xsl:for-each>
				            <hr />
				            <table class="MELItemHeader">

					            <!-- render the MELItem and MELSubItem rows (ie 22-01-01 and 22-01-01-01)-->
					            <xsl:call-template name="MELItemRows"/>

					            <!-- render the @dispCondOption rows (ie 22-01-01A) -->
					            <xsl:if test="not(string-length(@dispCondOptions) = 0)">
						            <xsl:call-template name="MELItemRows">
							            <xsl:with-param name="dispCondOption" select="@dispCondOptions"/>
						            </xsl:call-template>
					            </xsl:if>

				            </table>
			            </xsl:if>
			            <xsl:call-template name="MELItemTable"/>
			            <xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Title)]" />
								 
					</span>
		        </xsl:when>
		        <xsl:otherwise>
								 
					<xsl:call-template name="setIDAttribute" >
				        <xsl:with-param name="hasBody" select="true()"/>
			        </xsl:call-template>
			        <xsl:if test="not(concat(@repairInterval, @nbrInstalled, @nbrRequired, @maintIndicator, @opsIndicator, @techIndicator, @equipOpCapability) = '')">

				        <!-- these empty DIV tags will serve as target links for MELItem(s) and MELSubItem(s) -->
				        <!-- these id's are set here so the EFB will autoscroll to the TOP of the DispatchCondition -->
				        <!-- also due to an EFB bug that will not scroll to the MELItem/MELSubItem row when and ID is assigned on the row -->
				        <xsl:variable name="hasPrecedingDispatchConditions" select="boolean(preceding::ftid:DispatchCondition)"/>
				        <xsl:variable name="hasPrecedingSiblingsDispatchConditions" select="boolean(preceding-sibling::ftid:DispatchCondition)"/>

				        <xsl:for-each select="ancestor::ftid:MELItem | ancestor::ftid:MELSubItem | ancestor::ftid:CDLItem | ancestor::ftid:CDLSubItem">
					        <xsl:if test="not($hasPrecedingSiblingsDispatchConditions) and (not($hasPrecedingDispatchConditions) or position() = last())">
						        <div>
							        <xsl:call-template name="setIDAttribute"/>
						        </div>
					        </xsl:if>
				        </xsl:for-each>
				        <hr />
				        <table class="MELItemHeader">

					        <!-- render the MELItem and MELSubItem rows (ie 22-01-01 and 22-01-01-01)-->
					        <xsl:call-template name="MELItemRows"/>

					        <!-- render the @dispCondOption rows (ie 22-01-01A) -->
					        <xsl:if test="not(string-length(@dispCondOptions) = 0)">
						        <xsl:call-template name="MELItemRows">
							        <xsl:with-param name="dispCondOption" select="@dispCondOptions"/>
						        </xsl:call-template>
					        </xsl:if>

				        </table>
			        </xsl:if>
			        <xsl:call-template name="MELItemTable"/>
			        <xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Title)]" />				 
								 
			    </xsl:otherwise>
		    </xsl:choose>
		</div>
	</xsl:template>


	<xsl:template name="MELItemRows">
		<xsl:param name="dispCondOption"/>
		<xsl:choose>

			<!-- render the dispCondOption row (actually done last) -->
			<xsl:when test="$dispCondOption">
				<tr>
					<xsl:call-template name="setIDAttribute"/>
					<td class="FirstTD">
						<xsl:apply-templates select="../@itemNbr"
											 mode="TmpRev-phase" />
						<xsl:value-of select="$dispCondOption"/>
						<xsl:if test="not(string-length(@optionalConfigIndicator) = 0)">
							<p class="optionalConfigIndicator">
								<xsl:apply-templates select="@optionalConfigIndicator"
													 mode="TmpRev-phase"/>
							</p>
						</xsl:if>
					</td>
					<td>
						<xsl:apply-templates mode="TmpRev-phase"
											 select="ftid:Title/node()"/>
					</td>
				</tr>
			</xsl:when>

			<!-- render the MELItem and MELSubItem rows -->
			<xsl:otherwise>
				<!-- 
				MELItems and MELSubItem ancestor HTML rows are added for every DispatchCondition.
				If there is a **preceding** DispatchCondition , then the id attributes for 
				MELItems and MELSubItems have already been added to the document, EXCEPT for
				the id of the LAST MELSubItem.
				-->
				<xsl:for-each select="ancestor::ftid:MELItem | ancestor::ftid:MELSubItem | ancestor::ftid:CDLItem | ancestor::ftid:CDLSubItem">
					<xsl:if test="ftid:Effectivities">
						<tr>
							<td colspan="2">
								<xsl:if test="self::ftid:MELSubItem or self::ftid:CDLSubItem">
									<xsl:attribute name="style">padding-top:1em</xsl:attribute>
								</xsl:if>
								<xsl:apply-templates select="ftid:Effectivities">
									<xsl:with-param name="isOverridden">true()</xsl:with-param>
								</xsl:apply-templates>
							</td>
						</tr>
					</xsl:if>
					<tr>
						<td class="FirstTD">
							<xsl:apply-templates select="@itemNbr"
												 mode="TmpRev-phase" />
							<xsl:if test="not(string-length(@optionalConfigIndicator) = 0)">
								<p class="optionalConfigIndicator">
									<xsl:apply-templates select="@optionalConfigIndicator"
														 mode="TmpRev-phase" />
								</p>
							</xsl:if>
						</td>
						<td>
							<xsl:apply-templates select="ftid:Title/node()"
												 mode="TmpRev-phase"/>
						</td>
					</tr>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="MELItemTable">
		<table class="MELItemTable">
			<xsl:call-template name="MELItemHeaderRow"/>
			<tr>
				<td>
					<xsl:apply-templates select="@repairInterval"
										 mode="TmpRev-phase" />
					<xsl:text>&#160;</xsl:text>
				</td>
				<td>
					<xsl:apply-templates select="@nbrInstalled"
										 mode="TmpRev-phase" />
					<xsl:text>&#160;</xsl:text>
				</td>
				<td>
					<xsl:apply-templates select="@nbrRequired"
										 mode="TmpRev-phase" />
					<xsl:text>&#160;</xsl:text>
				</td>
				<td>
					<xsl:apply-templates select="@maintIndicator | @opsIndicator | @techIndicator"
										 mode="TmpRev-phase" />
					<xsl:text>&#160;</xsl:text>
				</td>
				<xsl:if test="not(string-length(@equipOpCapability)=0)">
					<td>
						<xsl:apply-templates select="@equipOpCapability"/>
						<xsl:text>&#160;</xsl:text>
					</td>
				</xsl:if>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="MELItemHeaderRow">
		<tr>
			<th><xsl:value-of select="$interval-label"/></th>
			<th><xsl:value-of select="$installed-label"/></th>
			<th><xsl:value-of select="$required-label"/></th>
			<th><xsl:value-of select="$procedure-label"/></th>
			<xsl:if test="not(string-length(@equipOpCapability)=0)">
				<th>EOC</th>
			</xsl:if>
		</tr>
	</xsl:template>



	<xsl:template match="ftid:DispatchConditionRemarks">
		<xsl:choose>
	        <xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
		        <span  class="RevMark" title="{@rev:revHighlight}">	
	
		            <xsl:apply-templates mode="TmpRev-phase"/>
		            <xsl:if test="not(/ftid:DispatchItems/ftid:CDLItem[ftid:DispatchCondition[not(@*)]])"><hr class="Memory"/></xsl:if>
		
				</span>
		    </xsl:when>
		    <xsl:otherwise>
		    
		        <xsl:apply-templates mode="TmpRev-phase"/>
		        <xsl:if test="not(/ftid:DispatchItems/ftid:CDLItem[ftid:DispatchCondition[not(@*)]])"><hr class="Memory"/></xsl:if>
				    
		    </xsl:otherwise>
		</xsl:choose>
		
	</xsl:template>


	<xsl:template match="ftid:DispatchProcedure">
		<xsl:apply-templates mode="TmpRev-phase" />
	</xsl:template>

</xsl:stylesheet>