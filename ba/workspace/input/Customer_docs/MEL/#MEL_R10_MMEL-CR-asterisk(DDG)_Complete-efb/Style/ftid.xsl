<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:ftid="http://www.boeing.com/FTID-ML"
				xmlns:rev="http://www.boeing.com/FTID-ML/Revision">

	<xsl:output method="html"
				indent="yes"
				encoding="UTF-8"
				doctype-system="http://www.w3.org/TR/html4/loose.dtd"
				doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
							/>

	<xsl:strip-space elements="*"/>


	<!--
======================================================================
Boeing Proprietary and Confidential - All Rights Reserved.

This XSL is covered under the Boeing Copyright for Flight Operations 
digital data.  Permission to use this XSL is subject to the entitlement
of the information or documents in which this XSL is applied.
======================================================================
-->
	<!-- EFB parameters -->
	<xsl:param name="BasePath"
			   select="'..'" />
	<xsl:param name="StylePath"
			   select="'../Style'" />
	<xsl:param name="DayMode"
			   select="'false'" />
	<xsl:param name="SectionToPrint" />
	<xsl:param name="ShowEfbRevisionMarkings"
			   select="'false'" />

	<!-- Effectivity filtering parameters -->
	<xsl:param name="TailNumber" />
	<xsl:param name="TailNumberList" />

	<!-- IXP related parameters -->
	<xsl:param name="preview"
			   select="'No'" />
	<xsl:variable name="isPreview"
				  select="contains($preview, 'Yes')" />

	<!-- This variable will be used throughout to determine whether to output EFB-specific code or standard code -->
	<!-- The two are swapped for ease of troubleshooting -->
	<xsl:variable name="isEFBOutput"
				  select="not($StylePath = '../Style')" />
	<!--<xsl:variable name="isEFBOutput"
				  select="true()" />-->

	<!-- variable indicating whether rev bars should be shown or not (show if either EFB rev bar flag is true, or content's not being viewed in EFB) -->
	<xsl:variable name="boolShowRevisionMarkings"
			   select="contains($ShowEfbRevisionMarkings, 'true') or not($isEFBOutput)" />

	<xsl:variable name="isQRH2"
				  select="/ftid:Procedures/processing-instruction('FTID-Style') = 'QRH2'" />

	<!-- Toggles filtering on/off for testing -->
	<xsl:variable name="isFiltered"
				  select="true()" />


	<!-- custom auto-text variables -->
	<xsl:variable name="note-label">
		<xsl:choose>
			<xsl:when test="//ftid:Note[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:Note[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Note</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="warning-label">
		<xsl:choose>
			<xsl:when test="//ftid:Warning[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:Warning[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>WARNING</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="caution-label">
		<xsl:choose>
			<xsl:when test="//ftid:Caution[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:Caution[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>CAUTION</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="confirm-label">
		<xsl:choose>
			<xsl:when test="//ftid:Action[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:Action[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Confirm</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="choose_one-label">
		<xsl:choose>
			<xsl:when test="//ftid:ChoiceItems[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:ChoiceItems[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Choose One</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="condition-label">
		<xsl:choose>
			<xsl:when test="//ftid:WarnCondition[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:WarnCondition[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Condition</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="objective-label">
		<xsl:choose>
			<xsl:when test="//ftid:Objective[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:Objective[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Objective</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="deferred_items-label">
		<xsl:choose>
			<xsl:when test="//ftid:DeferItems[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:DeferItems[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Deferred Items</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="messages-label">
		<xsl:choose>
			<xsl:when test="//ftid:AdditionalTitles[ftid:Title/@checklistIndex='e'][1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:AdditionalTitles[ftid:Title/@checklistIndex='e'][1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Messages</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="document_effectivity-label">
		<xsl:choose>
			<xsl:when test="//ftid:DocumentEffectivity[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:DocumentEffectivity[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Document Effectivity</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="bulletin_title-label">
		<xsl:choose>
			<xsl:when test="//ftid:Bulletin/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:Bulletin/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Flight Crew Operations Manual Bulletin</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="bulletin_for-label">
		<xsl:choose>
			<xsl:when test="//ftid:CustomerName/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:CustomerName/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>for</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="bulletin_date-label">
		<xsl:choose>
			<xsl:when test="//ftid:BulletinDate/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:BulletinDate/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Date</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="bulletin_number-label">
		<xsl:choose>
			<xsl:when test="//ftid:BulletinNumber/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:BulletinNumber/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Number</xsl:otherwise>
		</xsl:choose>	
	</xsl:variable>
	<xsl:variable name="bulletin_subject-label">
		<xsl:choose>
			<xsl:when test="//ftid:BulletinSubject/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:BulletinSubject/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Subject</xsl:otherwise>
		</xsl:choose>		
	</xsl:variable>
	<xsl:variable name="bulletin_reason-label">
		<xsl:choose>
			<xsl:when test="//ftid:BulletinReason/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:BulletinReason/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Reason</xsl:otherwise>
		</xsl:choose>			
	</xsl:variable>
	<xsl:variable name="airplane_effectivity-label">
		<xsl:choose>
			<xsl:when test="//ftid:BulletinEffectivityInfo/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:BulletinEffectivityInfo/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Airplane Effectivity</xsl:otherwise>
		</xsl:choose>	
	</xsl:variable>
	<xsl:variable name="bulletin_package_revision-label">
		<xsl:choose>
			<xsl:when test="//ftid:ManualInfo/processing-instruction('FTID-customLabel')"><xsl:value-of select="substring-before(substring-after(//ftid:ManualInfo/processing-instruction('FTID-customLabel'),'bulletin_package_revision-label='),'|')"/></xsl:when>
			<xsl:otherwise>Bulletin Package Revision</xsl:otherwise>
		</xsl:choose>	
	</xsl:variable>
	<xsl:variable name="bulletin_package_date-label">
		<xsl:choose>
			<xsl:when test="//ftid:ManualInfo/processing-instruction('FTID-customLabel')"><xsl:value-of select="substring-before(substring-after(//ftid:ManualInfo/processing-instruction('FTID-customLabel'),'bulletin_package_date-label='),'|')"/></xsl:when>
			<xsl:otherwise>Bulletin Package Date</xsl:otherwise>
		</xsl:choose>	
	</xsl:variable>
	<xsl:variable name="bulletin_addendum_message-label">
		<xsl:choose>
			<xsl:when test="//ftid:ManualInfo/processing-instruction('FTID-customLabel')"><xsl:value-of select="substring-before(substring-after(//ftid:ManualInfo/processing-instruction('FTID-customLabel'),'bulletin_addendum_message-label='),'|')"/></xsl:when>
			<xsl:otherwise>This Bulletin Package is an Addendum to</xsl:otherwise>
		</xsl:choose>	
	</xsl:variable>
	<xsl:variable name="EICAS_messages-label">
		<xsl:choose>
			<xsl:when test="//ftid:EICASMessages[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:EICASMessages[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>EICAS Status Messages</xsl:otherwise>
		</xsl:choose>		
	</xsl:variable>
	<xsl:variable name="placards-label">
		<xsl:choose>
			<xsl:when test="//ftid:Placards[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:Placards[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>PLACARDS</xsl:otherwise>
		</xsl:choose>		
	</xsl:variable>
	<xsl:variable name="maintenance_note-label">
		<xsl:choose>
			<xsl:when test="//ftid:MaintenanceNote[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:MaintenanceNote[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>MAINTENANCE NOTE</xsl:otherwise>
		</xsl:choose>		
	</xsl:variable>
	<xsl:variable name="operation_note-label">
		<xsl:choose>
			<xsl:when test="//ftid:OperationNote[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:OperationNote[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>OPERATIONS NOTE</xsl:otherwise>
		</xsl:choose>		
	</xsl:variable>
		<xsl:variable name="maintenance_procedure-label">
		<xsl:choose>
			<xsl:when test="//ftid:MaintenanceProcedure[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:MaintenanceProcedure[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>MAINTENANCE (M)</xsl:otherwise>
		</xsl:choose>		
	</xsl:variable>
	<xsl:variable name="operation_procedure-label">
		<xsl:choose>
			<xsl:when test="//ftid:OperationProcedure[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:OperationProcedure[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>OPERATIONS (O)</xsl:otherwise>
		</xsl:choose>		
	</xsl:variable>
	<xsl:variable name="interval-label">
		<xsl:choose>
			<xsl:when test="/ftid:DispatchItems/processing-instruction('FTID-customLabel')"><xsl:value-of select="/ftid:DispatchItems/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Interval</xsl:otherwise>
		</xsl:choose>			
	</xsl:variable>
	<xsl:variable name="installed-label">
		<xsl:choose>
			<xsl:when test="//ftid:MELItem[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:MELItem[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Installed</xsl:otherwise>
		</xsl:choose>			
	</xsl:variable>
	<xsl:variable name="required-label">
		<xsl:choose>
			<xsl:when test="//ftid:MELItem[1]/ftid:Title/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:MELItem[1]/ftid:Title/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Required</xsl:otherwise>
		</xsl:choose>			
	</xsl:variable>
	<xsl:variable name="procedure-label">
		<xsl:choose>
			<xsl:when test="//ftid:DispatchCondition[1]/processing-instruction('FTID-customLabel')"><xsl:value-of select="//ftid:DispatchCondition[1]/processing-instruction('FTID-customLabel')"/></xsl:when>
			<xsl:otherwise>Procedure</xsl:otherwise>
		</xsl:choose>			
	</xsl:variable>
	<xsl:variable name="doc_number-label">
		<xsl:choose>
			<xsl:when test="//ftid:ManualInfo/processing-instruction('FTID-customLabel')"><xsl:value-of select="substring-before(substring-after(//ftid:ManualInfo/processing-instruction('FTID-customLabel'),'doc_number-label='),'|')"/></xsl:when>
			<xsl:otherwise>Document Number</xsl:otherwise>
		</xsl:choose>		
	</xsl:variable>
	<xsl:variable name="rev_number-label">
		<xsl:choose>
			<xsl:when test="//ftid:ManualInfo/processing-instruction('FTID-customLabel')"><xsl:value-of select="substring-before(substring-after(//ftid:ManualInfo/processing-instruction('FTID-customLabel'),'rev_number-label='),'|')"/></xsl:when>
			<xsl:otherwise>Revision Number</xsl:otherwise>
		</xsl:choose>		
	</xsl:variable>
	<xsl:variable name="rev_date-label">
		<xsl:choose>
			<xsl:when test="//ftid:ManualInfo/processing-instruction('FTID-customLabel')"><xsl:value-of select="substring-before(substring-after(//ftid:ManualInfo/processing-instruction('FTID-customLabel'),'rev_date-label='),'|')"/></xsl:when>
			<xsl:otherwise>Revision Date</xsl:otherwise>
		</xsl:choose>		
	</xsl:variable>
	<xsl:variable name="advisory_marker-label">
		<xsl:choose>
			<xsl:when test="//ftid:ADVISORY[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"><xsl:value-of select="//ftid:ADVISORY[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"/></xsl:when>
			<xsl:otherwise>ADVISORY INFORMATION</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="pmc_off_marker-label">
		<xsl:choose>
			<xsl:when test="//ftid:PMC-OFF[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"><xsl:value-of select="//ftid:PMC-OFF[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"/></xsl:when>
			<xsl:otherwise>PMC-OFF</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="all_engines_marker-label">
		<xsl:choose>
			<xsl:when test="//ftid:ALL-ENGINES[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"><xsl:value-of select="//ftid:ALL-ENGINES[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"/></xsl:when>
			<xsl:otherwise>ALL ENGINES</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="alt_mode_eec-label">
		<xsl:choose>
			<xsl:when test="//ftid:ALT-MODE-EEC[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"><xsl:value-of select="//ftid:ALT-MODE-EEC[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"/></xsl:when>
			<xsl:otherwise>ALTERNATE MODE EEC</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="alt_eec_mode-label">
		<xsl:choose>
			<xsl:when test="//ftid:ALT-EEC-MODE[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"><xsl:value-of select="//ftid:ALT-EEC-MODE[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"/></xsl:when>
			<xsl:otherwise>ALTERNATE EEC MODE</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="alt_thrust_marker-label">
		<xsl:choose>
			<xsl:when test="//ftid:ALT-THRUST-SETTING[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"><xsl:value-of select="//ftid:ALT-THRUST-SETTING[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"/></xsl:when>
			<xsl:otherwise>ALT THRUST SETTING</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="gear_down_marker-label">
		<xsl:choose>
			<xsl:when test="//ftid:GEARDOWN[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"><xsl:value-of select="//ftid:GEARDOWN[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"/></xsl:when>
			<xsl:otherwise>GEAR DOWN</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="engine_inop_marker-label">
		<xsl:choose>
			<xsl:when test="//ftid:ENGINE-INOP[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"><xsl:value-of select="//ftid:ENGINE-INOP[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"/></xsl:when>
			<xsl:otherwise>ENGINE INOP</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="one_engine_inop_marker-label">
		<xsl:choose>
			<xsl:when test="//ftid:ENGINE-INOP1[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"><xsl:value-of select="//ftid:ENGINE-INOP1[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"/></xsl:when>
			<xsl:otherwise>1 ENGINE INOP</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="two_engines_inop_marker-label">
		<xsl:choose>
			<xsl:when test="//ftid:ENGINE-INOP2[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"><xsl:value-of select="//ftid:ENGINE-INOP2[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"/></xsl:when>
			<xsl:otherwise>2 ENGINES INOP</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="go_around_thrust_marker-label">
		<xsl:choose>
			<xsl:when test="//ftid:GO-AROUND-THRUST[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"><xsl:value-of select="//ftid:GO-AROUND-THRUST[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"/></xsl:when>
			<xsl:otherwise>GO AROUND THRUST</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="max_continuous_thrust_marker-label">
		<xsl:choose>
			<xsl:when test="//ftid:MAX-CONT-THRUST[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"><xsl:value-of select="//ftid:MAX-CONT-THRUST[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"/></xsl:when>
			<xsl:otherwise>MAX CONTINUOUS THRUST</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="spare_engine_carriage_marker-label">
		<xsl:choose>
			<xsl:when test="//ftid:SPARE-ENGINE-CARRIAGE[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"><xsl:value-of select="//ftid:SPARE-ENGINE-CARRIAGE[1]/following-sibling::node()[1][self::processing-instruction('FTID-customLabel')]"/></xsl:when>
			<xsl:otherwise>SPARE ENGINE CARRIAGE</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="approved_by-label">
		<xsl:choose>
			<xsl:when test="//ftid:ApprovalPersonnel/processing-instruction('FTID-customLabel')"><xsl:value-of select="substring-before(substring-after(//ftid:ApprovalPersonnel/processing-instruction('FTID-customLabel'),'approved_by-label='),'|')"/></xsl:when>
			<xsl:otherwise>APPROVED BY</xsl:otherwise>
		</xsl:choose>	
	</xsl:variable>
	<xsl:variable name="original_signed-label">
		<xsl:choose>
			<xsl:when test="//ftid:ApprovalPersonnel/processing-instruction('FTID-customLabel')"><xsl:value-of select="substring-before(substring-after(//ftid:ApprovalPersonnel/processing-instruction('FTID-customLabel'),'original_signed-label='),'|')"/></xsl:when>
			<xsl:otherwise>(Original Signed By)</xsl:otherwise>
		</xsl:choose>	
	</xsl:variable>
	
			
	<xsl:variable name="aecr-string">
		<xsl:if test="$isFiltered and not(string-length(concat($TailNumber, $TailNumberList)) = 0)">
			<xsl:choose>
				<xsl:when test="$isPreview">
					<xsl:value-of select="$TailNumberList" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="aecr-path">
						<xsl:value-of select="concat($BasePath, '/XML/_AECR.xml')" />
					</xsl:variable>
					<!-- Creates a string in "ac1, 123, ... xyz," format.  Ends with a comma.-->
					<xsl:for-each select="document($aecr-path)//ftid:AircraftID[@idValue=$TailNumber]/../ftid:AircraftID[not(string-length(@idValue) = 0)]">
						<xsl:value-of select="concat(@idValue, ',')"/>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:variable>


	<xsl:template match="*|/">
		<xsl:choose>
			<xsl:when test="$isFiltered">
				<xsl:apply-templates mode="TmpRev-phase"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="text()"
				  mode="TmpRev-phase">
		<xsl:choose>
			<xsl:when test="$isEFBOutput">
				<xsl:choose>
					<!-- checking for revision info -->
					<xsl:when test="$boolShowRevisionMarkings and (following-sibling::processing-instruction('FTID-rev')[1]='end' and not(ancestor::ftid:table[@rev:revStatus] or ancestor::ftid:GraphicSet[@rev:revStatus] or ancestor::ftid:LocationDiagram[@rev:revStatus]))">
						<span  class="RevMark"
							  title="{ancestor::*[@rev:revHighlight][1]/@rev:revHighlight}">
							<!-- @title above is used by jQuery to show highlight text -->
							<xsl:value-of select="."/>
						</span>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="."/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<!-- checking for revision info -->
					<xsl:when test="$boolShowRevisionMarkings and (following-sibling::processing-instruction('FTID-rev')[1]='end' and not(ancestor::ftid:table[@rev:revStatus] or ancestor::ftid:GraphicSet[@rev:revStatus] or ancestor::ftid:LocationDiagram[@rev:revStatus]))">
						<span  class="RevMark"
							  title="{ancestor::*[@rev:revHighlight][1]/@rev:revHighlight}">
							<!-- @title above is used by jQuery to show highlight text -->
							<xsl:choose>
								<xsl:when test="ancestor::*[@coc]"><span class="coc"><xsl:value-of select="."/></span></xsl:when>
								<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
							</xsl:choose>
						</span>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="ancestor::*[@coc]"><span class="coc"><xsl:value-of select="."/></span></xsl:when>
							<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!-- checks each attribute to see if it has been revised, and marks it appropriately -->
	<xsl:template match="@*"
				  mode="TmpRev-phase">
		<xsl:choose>
			<xsl:when test="$boolShowRevisionMarkings and parent::*/@rev:revStatus = 'R' ">
				<!-- Change the above test (when approved) to:  
									parent::*/@rev:revStatus = 'R' and contains(parent::*/node()[1][self::processing-instruction('FTID-rev')], concat('|', name(), '|'))  -->
				<!-- this will add a check for a first-child PI in the format <?FTID-rev |changedNode1|changedNode2|?> 
						 and allow us to differentiate between changed and unchanged attributes -->
				<xsl:text> </xsl:text>
				<span  class="RevMark"
					  title="{string(../@rev:revHighlight)}">
					<xsl:apply-templates select="."/>
				</span>
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="*"
				  mode="TmpRev-phase">
		<xsl:variable name="isPUMetaData"
					  select="boolean(ftid:PUMetaData)"/>
		<xsl:variable name="effectivity-effectAirplaneList">
			<xsl:choose>
				<xsl:when test="$isPUMetaData">
					<xsl:value-of select="ftid:PUMetaData/ftid:PUEffectivity/ftid:Effectivities/ftid:Effectivity/@effectAirplaneList"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="ftid:Effectivities/ftid:Effectivity/@effectAirplaneList"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="effectivitywSB-effectAirplaneList-added">
			<xsl:choose>
				<xsl:when test="$isPUMetaData">
					<xsl:value-of select="substring-before(substring-after(ftid:PUMetaData/ftid:PUEffectivity/ftid:Effectivities/ftid:EffectivitywSB/@effectAirplaneList, 'ADDED('), ')')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="substring-before(substring-after(ftid:Effectivities/ftid:EffectivitywSB/@effectAirplaneList, 'ADDED('), ')')"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="effectivitywSB-effectAirplaneList-changes">
			<xsl:choose>
				<xsl:when test="$isPUMetaData">
					<xsl:value-of select="substring-before(substring-after(ftid:PUMetaData/ftid:PUEffectivity/ftid:Effectivities/ftid:EffectivitywSB/@effectAirplaneList, 'CHANGES('), ')')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="substring-before(substring-after(ftid:Effectivities/ftid:EffectivitywSB/@effectAirplaneList, 'CHANGES('), ')')"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="not($isFiltered) or string-length($aecr-string) = 0 or concat($effectivity-effectAirplaneList, $effectivitywSB-effectAirplaneList-added, $effectivitywSB-effectAirplaneList-changes) = ''">
				<!-- No filter -->
				<xsl:call-template name="TmpRev-phase"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="filter">
					<xsl:with-param name="input-string"
									select="$aecr-string"/>
					<!-- adding commas to beginning and end of the list of effectities to facilitate searching -->
					<xsl:with-param name="effectivity-all"
									select="concat(',', $effectivity-effectAirplaneList, $effectivitywSB-effectAirplaneList-added, $effectivitywSB-effectAirplaneList-changes, ',')"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="filter">
		<xsl:param name="input-string"/>
		<xsl:param name="effectivity-all"/>

		<xsl:if test="$input-string">
			<!-- surrounding this effectivity with commas to clearly delimit the search -->
			<!-- this prevents unwanted instances of '123' matching '4123' or '123B' etc. -->
			<xsl:variable name="searchString"
						  select="concat(',', substring-before($input-string, ','), ',')"/>
			<xsl:choose>
				<xsl:when test="contains($effectivity-all, $searchString)">
					<!-- effective -->
					<xsl:call-template name="TmpRev-phase"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="filter">
						<xsl:with-param name="input-string"
										select="substring-after($input-string, ',')"/>
						<xsl:with-param name="effectivity-all"
										select="$effectivity-all"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>


	<xsl:template name="TmpRev-phase">
		<xsl:choose>
			<xsl:when test="@rev:revStatus = 'T'">
				<div class="TmpRev-phase">
					<p style="margin-bottom:0em;">Temporary Instruction</p>
					<xsl:apply-templates select="."/>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="processing-instruction('FTID-xref') and (not($isEFBOutput) or self::ftid:Title)">
				    <xsl:for-each select="processing-instruction('FTID-xref')">
				        <span id="{.}"/>
				    </xsl:for-each>
				</xsl:if>
				<xsl:choose><!-- deleted revision checking (to draw rev bar) not needed for EFB viewing with flag off or if ancestor is revised table/GraphicSet, so only do that in the "otherwise" case -->
					<xsl:when test="not($boolShowRevisionMarkings) or (ancestor::ftid:table[@rev:revStatus] or ancestor::ftid:GraphicSet[@rev:revStatus] or ancestor::ftid:LocationDiagram[@rev:revStatus])">
						<xsl:apply-templates select="."/>
					</xsl:when>
					<xsl:otherwise>
						<!-- If immediately preceded by a deleted revision, process it -->
						<xsl:if test="preceding-sibling::node()[1][self::processing-instruction('FTID-rev')[starts-with(.,'deleted')]]">
						    <xsl:apply-templates select="preceding-sibling::node()[1]"/>
						</xsl:if>
						<xsl:apply-templates select="."/>
						<!-- If immediately followed by a deleted revision and there is nothing else after, process it (because then it's not immediately preceding anything and hence won't be caught by the logic two lines above) -->
						<xsl:if test="following-sibling::node()[1][self::processing-instruction('FTID-rev')[starts-with(.,'deleted') and not(following-sibling::node())]]">
						    <xsl:apply-templates select="following-sibling::node()[1]"/>
						</xsl:if>	
						<!-- IXP 4.2 - check for immediately following child delete revision.  The MEL DispatchConditions might have them.-->			
						<xsl:if test="child::node()[1][self::processing-instruction('FTID-rev')[starts-with(.,'deleted') and not(following-sibling::node())]]">
						    <xsl:apply-templates select="child::node()[1]"/>
						</xsl:if>	
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	
	<xsl:template match="processing-instruction('FTID-rev')[starts-with(.,'deleted')]">
		<xsl:variable name="highlight-with-quotes" select="substring-after(.,'deleted highlight=')"/>
		<xsl:if test="$boolShowRevisionMarkings"><div class="RevMark" title="{substring($highlight-with-quotes,2,string-length($highlight-with-quotes) - 2)}">&#160;</div></xsl:if>
	</xsl:template>


	<xsl:template name="setIDAttribute">
		<xsl:param name="hasBody"
				   select="false()" />
		<xsl:attribute name="id">
			<xsl:choose>
				<!-- id of the closest ancestor with an id-->
				<xsl:when test="string-length(@id) = 0 or $hasBody">
					<xsl:variable name="ancestorID"
								  select="ancestor::*[@id][1]/@id" />
					<xsl:variable name="count">
						<xsl:choose>
							<xsl:when test="self::ftid:Title and preceding-sibling::* and not(parent::*/@id)"><xsl:value-of select="concat('-', count(parent::*/preceding::*))"/></xsl:when>
							<xsl:otherwise><xsl:value-of select="concat('-', count(preceding::*))" /></xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="body">
						<xsl:if test="self::ftid:SDBody or $hasBody">-body</xsl:if>
					</xsl:variable>
					<xsl:value-of select="concat($ancestorID, $count, $body)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="@id"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>


	<xsl:template match="ftid:SDBody">
		<div>
		   <xsl:choose>
                <!-- IXP 4.2 - updates for new Rev Bar template  -->
	            <xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
		            <span  class="RevMark" title="{@rev:revHighlight}">
			            <xsl:call-template name="setIDAttribute" />
			            <xsl:apply-templates mode="TmpRev-phase"/>
					</span>
	            </xsl:when>
	            <xsl:otherwise>
			        <xsl:call-template name="setIDAttribute" />
			        <xsl:apply-templates mode="TmpRev-phase"/>	    
	    		</xsl:otherwise>
            </xsl:choose>
		</div>
	</xsl:template>





	<!-- =========================================== -->
	<!-- include XSLT files  -->
	<!-- =========================================== -->
	<xsl:include href="noc.xsl"/>
	<xsl:include href="nnc.xsl"/>
	<xsl:include href="ftidHeader.xsl"/>
	<xsl:include href="titlePage.xsl"/>
	<xsl:include href="dispatch.xsl"/>
	<xsl:include href="titles.xsl"/>
	<xsl:include href="blocks.xsl"/>
	<xsl:include href="specialTxt.xsl"/>
	<xsl:include href="graphic.xsl"/>
	<xsl:include href="table.xsl"/>
	<xsl:include href="derived.xsl"/>
	<xsl:include href="PerfMarkers.xsl"/>
	<xsl:include href="bulletins.xsl"/>
</xsl:stylesheet>