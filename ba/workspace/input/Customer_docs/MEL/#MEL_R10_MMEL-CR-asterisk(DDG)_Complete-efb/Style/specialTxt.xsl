<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ftid="http://www.boeing.com/FTID-ML"
                xmlns:rev="http://www.boeing.com/FTID-ML/Revision"
                xmlns:xlink="http://www.w3.org/1999/xlink">


	<!--<xsl:template match="ftid:Caution|ftid:Warning">
		<xsl:apply-templates mode="TmpRev-phase" select="ftid:Effectivities"/>		
		<dl class="CautionWarning">
			<dt class="{name()}">
				<xsl:value-of select="concat(name(), ':')"/>
			</dt>
			<dd>
				<xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Effectivities)]"/>
			</dd>
		</dl>
	</xsl:template>-->

	<xsl:template match="ftid:Caution | ftid:Warning">
		<xsl:apply-templates select="ftid:Effectivities" mode="TmpRev-phase"/>
		<xsl:choose>
	        <xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
		        <span  class="RevMark" title="{@rev:revHighlight}">
					<table class="cautionOrWarning">
						<tbody>
							<tr>
								<td class="{name()}Label">
									<xsl:choose>
										<xsl:when test="self::ftid:Warning"><xsl:value-of select="$warning-label"/>:</xsl:when>
										<xsl:otherwise><xsl:value-of select="$caution-label"/>:</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="content">
									<xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Effectivities)]"/>
								</td>
							</tr>
						</tbody>
					</table>
				</span>
	        </xsl:when>
	        <xsl:otherwise>
	        	<table class="cautionOrWarning">
					<tbody>
						<tr>
							<td class="{name()}Label">
								<xsl:choose>
									<xsl:when test="self::ftid:Warning"><xsl:value-of select="$warning-label"/>:</xsl:when>
									<xsl:otherwise><xsl:value-of select="$caution-label"/>:</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="content">
								<xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Effectivities)]"/>
							</td>
						</tr>
					</tbody>
				</table>
			</xsl:otherwise>
        </xsl:choose>
	</xsl:template>


	<xsl:template match="ftid:Note | ftid:Opnote">
		<xsl:apply-templates select="ftid:Effectivities" mode="TmpRev-phase"/>
		
		<xsl:choose>
	        <xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
		        <span  class="RevMark" title="{@rev:revHighlight}">
		
		            <table class="noteOrOpnote">
			            <tr>
				            <td style="width:4em">
					            <xsl:choose>
						            <xsl:when test="/ftid:DispatchItems">
							            <xsl:choose>
								            <xsl:when test="$note-label = 'Note'">NOTE</xsl:when>
								            <xsl:otherwise><xsl:value-of select="$note-label"/></xsl:otherwise>
							            </xsl:choose>
							            <xsl:choose>
								            <xsl:when test="preceding-sibling::*[1][self::ftid:Note]">
									            <xsl:apply-templates mode="calc-position" select="preceding-sibling::*[1]"/>
								            </xsl:when>
								            <xsl:when test="following-sibling::*[1][self::ftid:Note]">1</xsl:when>
							            </xsl:choose>
							            <xsl:text>:</xsl:text>
						            </xsl:when>
						            <xsl:otherwise>
							            <span style="font-weight:bold">
								            <xsl:value-of select="$note-label"/>:
							            </span>
						            </xsl:otherwise>
					            </xsl:choose>
				            </td>
				            <td>
					            <xsl:apply-templates select="*[not(self::ftid:Effectivities)]" mode="TmpRev-phase"/>
				            </td>
			            </tr>
		            </table>
		
				</span>
	        </xsl:when>
            <xsl:otherwise>
  
  		        <table class="noteOrOpnote">
			        <tr>
				        <td style="width:4em">
				        <xsl:choose>
				            <xsl:when test="/ftid:DispatchItems">
							        <xsl:choose>
								        <xsl:when test="$note-label = 'Note'">NOTE</xsl:when>
								        <xsl:otherwise><xsl:value-of select="$note-label"/></xsl:otherwise>
							        </xsl:choose>
							        <xsl:choose>
								        <xsl:when test="preceding-sibling::*[1][self::ftid:Note]">
								           <xsl:apply-templates mode="calc-position" select="preceding-sibling::*[1]"/>
								        </xsl:when>
								         <xsl:when test="following-sibling::*[1][self::ftid:Note]">1</xsl:when>
							        </xsl:choose>
							        <xsl:text>:</xsl:text>
						        </xsl:when>
						        <xsl:otherwise>
							        <span style="font-weight:bold">
								        <xsl:value-of select="$note-label"/>:
							        </span>
						        </xsl:otherwise>
					        </xsl:choose>
				        </td>
				        <td>
					        <xsl:apply-templates select="*[not(self::ftid:Effectivities)]" mode="TmpRev-phase"/>
				        </td>
			        </tr>
		        </table>
  
		    </xsl:otherwise>
        </xsl:choose>
	</xsl:template>


	<xsl:template match="ftid:Note" mode="calc-position">
		<xsl:param name="counter">2</xsl:param>
		<xsl:choose>
			<xsl:when test="preceding-sibling::*[1][self::ftid:Note]">
				<xsl:apply-templates select="preceding-sibling::*[1]" mode="calc-position">
					<xsl:with-param name="counter">
						<xsl:value-of select="$counter + 1"/>
					</xsl:with-param>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$counter"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="ftid:Emphasis[//text()]">
		<span>
			<xsl:attribute name="style">
				<xsl:if test="not(string-length(@color) = 0)">
					<xsl:value-of select="concat('color:', @color, ';')"/>;
				</xsl:if>
				<xsl:if test="not(string-length(@bgColor) = 0)">
					<xsl:value-of select="concat('background-color:', @bgColor, ';')"/>;
				</xsl:if>
				<xsl:if test="contains(@script,'super')">vertical-align: baseline;font-size: 0.75em;position: relative;top: -0.5em;</xsl:if>
				<xsl:if test="contains(@script,'sub')">vertical-align: text-top;font-size: 0.75em;position: relative;top: 0.5em;</xsl:if>
				<xsl:if test="not(string-length(@txtEffect) = 0)">
					<xsl:choose>
						<xsl:when test="@txtEffect = 'strikethrough'">text-decoration: line-through;</xsl:when>
						<xsl:when test="@txtEffect = 'double underline'">border-bottom: double 3px;</xsl:when>
						<xsl:otherwise>
						    <xsl:text>text-decoration:</xsl:text>
							<xsl:value-of select="concat(@txtEffect, ';')"/>
							<!-- handles underline & overline-->
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="not(string-length(@txtStyle) = 0)">
					<xsl:if test="contains(@txtStyle,'bold')">font-weight:bold;</xsl:if>
					<xsl:if test="contains(@txtStyle,'italic')">font-style:italic;</xsl:if>
				</xsl:if>
				<!-- the following line is a hack for an "or" between ftid:Light elements -->
				<xsl:if test="normalize-space(text()) = 'or' and parent::ftid:Light">display:block;width:5em;float:left;text-align:center;padding-top:1em;</xsl:if>
			</xsl:attribute>
			<xsl:apply-templates mode="TmpRev-phase"/>
		</span>
	</xsl:template>


	<xsl:template match="ftid:iLink">
		<xsl:apply-templates mode="TmpRev-phase" select="ftid:Effectivities"/>
		<xsl:choose>
			<xsl:when test="parent::ftid:Title or parent::ftid:Para or parent::ftid:NavigationStep">
				<!-- the link is 'inline' in a Title or Para-->
				<xsl:call-template name="iLink"/>
			</xsl:when>
			<xsl:otherwise>
				<!-- the link needs to be a 'block' element-->
				<p>
					<xsl:call-template name="iLink"/>
				</p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="iLink">
		<!-- FYI:
          @domainRef = path to the target product
            @fileRef = target file name
            @linkRef = id of the target content in the file
    -->
		<xsl:choose>
			<xsl:when test="$isEFBOutput">
				<xsl:choose>
					<xsl:when test="string-length(@fileRef) &gt; 0">
						<span>
							<xsl:if test="not(ancestor::ftid:Title or ancestor::ftid:Para)">
								<xsl:attribute name="style">width:100%; padding:0.25em; margin-bottom:-0.4em</xsl:attribute>
							</xsl:if>
							<xsl:if test="string-length(@domainRef)=0 or @domainRef = 'local' or @domainRef = '-' or not(string-length(@linkRef)=0)">
								<xsl:attribute name="class">EFBLink</xsl:attribute>
								<xsl:attribute name="onmouseover">this.className='EFBLinkOver'</xsl:attribute>
								<xsl:attribute name="onmouseout">this.className='EFBLink'</xsl:attribute>
								<xsl:choose>
									<xsl:when test="$isPreview">
										<xsl:attribute name="title">Links are disabled in the Preview window.</xsl:attribute>
										<xsl:attribute name="onclick">alert('Links are disabled in the Preview window.'); return false;</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="onclick">
											<xsl:text>this.className='EFBLinkClick';</xsl:text>
											<xsl:choose>
												<xsl:when test="not(string-length(@linkRef)= 0)">
													<xsl:text>document.title='content://</xsl:text>
													<xsl:if test="not(string-length(@domainRef)=0) and not(@domainRef = 'local') and not(@domainRef='-')">
														<xsl:value-of select="concat(@domainRef, '/')"/>
													</xsl:if>
													<xsl:choose>
														<xsl:when test="starts-with(@linkRef,'URN:')"><xsl:value-of select="substring-after(@linkRef, 'URN:')"/></xsl:when>
														<xsl:otherwise><xsl:value-of select="@linkRef"/></xsl:otherwise>
													</xsl:choose>
													<xsl:text>'</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<!-- "local" FileLink but no locRef: open destination file to extract a PU id for EDB to use -->
													<xsl:variable name="path">
														<xsl:value-of select="concat($BasePath, '/XML/', @fileRef)"/>
													</xsl:variable>
													<!-- construct javascript call -->
													<xsl:text>javascript:loadLinkByID('</xsl:text>
													<xsl:call-template name="escape-characters-for-javascript">
														<xsl:with-param name="inputString">
															<xsl:value-of select="$path"/>
														</xsl:with-param>
													</xsl:call-template>
													<xsl:text>')</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
							<xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Effectivities)]"/>
						</span>
					
					</xsl:when>
					<xsl:otherwise><xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Effectivities)]"/></xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<a>
					<xsl:attribute name="href">
						<xsl:choose>
							<xsl:when test="string-length(@fileRef) &gt; 0">
								<xsl:choose>
									<xsl:when test="@domainRef='local' or @domainRef='-' or string-length(@domainRef) = 0 or not(@domainRef)">..</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat('../../', @domainRef)"/>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="starts-with(@linkRef,'URN:')"><xsl:value-of select="concat('/XML/', @fileRef, '#', substring-after(@linkRef, 'URN:'))"/></xsl:when>
									<xsl:when test="string-length(@linkRef) &gt; 0"><xsl:value-of select="concat('/XML/', @fileRef, '#', @linkRef)"/></xsl:when>
									<xsl:otherwise><xsl:value-of select="concat('/XML/', @fileRef)"/></xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise><xsl:value-of select="concat('#', @linkRef)"/></xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:apply-templates  mode="TmpRev-phase" select="node()[not(self::ftid:Effectivities)]" />
				</a>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:variable name="apos">'</xsl:variable>
	<xsl:variable name="quot">"</xsl:variable>
	<xsl:variable name="bkslash">\</xsl:variable>

	<xsl:template name="escape-characters-for-javascript">
		<xsl:param name="inputString"/>
		<xsl:choose>
			<xsl:when test="contains($inputString, $bkslash)">
				<xsl:call-template name="escape-characters-for-javascript">
					<xsl:with-param name="inputString" select="substring-before($inputString, $bkslash)"/>
				</xsl:call-template>
				<xsl:text>\\</xsl:text>
				<xsl:call-template name="escape-characters-for-javascript">
					<xsl:with-param name="inputString" select="substring-after($inputString, $bkslash)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="contains($inputString, $quot)">
				<xsl:call-template name="escape-characters-for-javascript">
					<xsl:with-param name="inputString" select="substring-before($inputString, $quot)"/>
				</xsl:call-template>
				<xsl:text>\"</xsl:text>
				<xsl:call-template name="escape-characters-for-javascript">
					<xsl:with-param name="inputString" select="substring-after($inputString, $quot)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="contains($inputString, $apos)">
				<xsl:call-template name="escape-characters-for-javascript">
					<xsl:with-param name="inputString" select="substring-before($inputString, $apos)"/>
				</xsl:call-template>
				<xsl:text>\'</xsl:text>
				<xsl:call-template name="escape-characters-for-javascript">
					<xsl:with-param name="inputString" select="substring-after($inputString, $apos)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$inputString"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="ftid:Address">
		<div class="Address">
			<xsl:apply-templates mode="TmpRev-phase"/>
		</div>
	</xsl:template>


	<xsl:template match="ftid:ChgDesc" />


	<!-- used for EFB search highlighting -->
	<xsl:template match="ftid:hit">
		<span id="hit" class="Hit" style="background-color: Yellow; color:Black; ">
			<xsl:apply-templates mode="TmpRev-phase"/>
		</span>
	</xsl:template>
	
	<!-- IXP 4.3 - Special symbol font PIs for Wingdings character -->
	<xsl:template match="processing-instruction('Font-Wingdings')" mode="TmpRev-phase">
		<span style="font-family:Wingdings"><xsl:value-of select="." disable-output-escaping="yes"/></span>
	</xsl:template>
	
	<xsl:template match="processing-instruction('Font-Wingdings2')" mode="TmpRev-phase">
		<span style="font-family:Wingdings 2"><xsl:value-of select="." disable-output-escaping="yes"/></span>
	</xsl:template>
	
	<xsl:template match="processing-instruction('Font-Wingdings3')" mode="TmpRev-phase">
	    <xsl:variable name="wingChar" select="."/>
		<span style="font-family:Wingdings 3"><xsl:value-of select="." disable-output-escaping="yes"/></span>
	</xsl:template>

</xsl:stylesheet>