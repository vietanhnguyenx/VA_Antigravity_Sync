<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
								xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
								xmlns:ftid="http://www.boeing.com/FTID-ML"
								xmlns:rev="http://www.boeing.com/FTID-ML/Revision">

	<xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
	<xsl:variable name="lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>

	<xsl:template match="ftid:Graphic|ftid:GraphicSet|ftid:LocationDiagram">
		<div id="{@id}">
			<xsl:if test="$boolShowRevisionMarkings and (@rev:revStatus = 'R' or @rev:revStatus = 'N') and not(ancestor::*[@rev:revStatus = 'R' or @rev:revStatus = 'N'])">
				<xsl:attribute name="class">RevMark</xsl:attribute>
				<xsl:attribute name="title"><xsl:value-of select="@rev:revHighlight"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="TmpRev-phase"/>
		</div>
	</xsl:template>


	<xsl:template match="ftid:Illustration">
		<xsl:apply-templates mode="TmpRev-phase" select="ftid:Title | ftid:Effectivities"/>
		<xsl:if test="not(@fileRef = '')">
			<xsl:variable name="extension"><xsl:call-template name="get-filename-extension"><xsl:with-param name="filename" select="@fileRef"/></xsl:call-template></xsl:variable>
			<xsl:variable name="lowerCaseExtension" select="translate($extension,$upper,$lower)"/>
			<xsl:choose>
				<xsl:when test="ancestor::*[@coc]">
				    <span class="coc">
				    
				            <xsl:choose>
					            <xsl:when test="$isEFBOutput">
						            <img class="efbImage" alt="{Title}" onmouseover="this.className='efbOver'" onmouseout="this.className='efbOut'" >
							            <xsl:attribute name="src">
								            <xsl:choose>
									            <xsl:when test="$lowerCaseExtension = 'jpeg' or $lowerCaseExtension = 'jpg' or $lowerCaseExtension = 'png' or $lowerCaseExtension = 'gif'">
									                <xsl:value-of select="concat($BasePath,'/Images/',substring(@fileRef, 2))"/>
									            </xsl:when>
									            <xsl:otherwise><xsl:value-of select="concat($BasePath,'/Images/',substring(@fileRef, 2),'.jpg')"/></xsl:otherwise>
								            </xsl:choose>
							            </xsl:attribute>
							            <xsl:attribute name="onclick">
								            <xsl:choose>
									            <xsl:when test="$lowerCaseExtension = 'jpeg' or $lowerCaseExtension = 'jpg' or $lowerCaseExtension = 'png' or $lowerCaseExtension = 'gif'">
									                <xsl:value-of select='concat("document.title=&#39;image://Images/", substring(@fileRef, 2), "&#39;")'/>
									            </xsl:when>
									            <xsl:otherwise><xsl:value-of select='concat("document.title=&#39;image://Images/", substring(@fileRef, 2), ".jpg&#39;")'/></xsl:otherwise>
									            <!-- &#39; = single quote character -->
								            </xsl:choose>
							            </xsl:attribute>
						            </img>
					            </xsl:when>
					            <xsl:otherwise>
						            <img>
							            <xsl:if test="$boolShowRevisionMarkings and (@rev:revStatus = 'R' or @rev:revStatus = 'N') and not(ancestor::*[@rev:revStatus = 'R' or @rev:revStatus = 'N'])">
								            <xsl:attribute name="class">RevMark</xsl:attribute>
								            <xsl:attribute name="title"><xsl:value-of select="@rev:revHighlight"/></xsl:attribute>
							            </xsl:if>
							            <xsl:attribute name="src">
								            <xsl:choose>
									            <xsl:when test="$lowerCaseExtension = 'jpeg' or $lowerCaseExtension = 'jpg' or $lowerCaseExtension = 'png' or $lowerCaseExtension = 'gif'">
									                <xsl:value-of select="concat('../Images/',substring(@fileRef, 2))"/>
									            </xsl:when>
									            <xsl:otherwise><xsl:value-of select="concat('../Images/',substring(@fileRef, 2),'.jpg')"/></xsl:otherwise>
								            </xsl:choose>
							            </xsl:attribute>
						            </img>
					            </xsl:otherwise>
				            </xsl:choose>
			
			        </span>
			    </xsl:when>
			    <xsl:otherwise>
			    

				            <xsl:choose>
					            <xsl:when test="$isEFBOutput">
						            <img class="efbImage" alt="{Title}" onmouseover="this.className='efbOver'" onmouseout="this.className='efbOut'" >
							            <xsl:attribute name="src">
								            <xsl:choose>
									            <xsl:when test="$lowerCaseExtension = 'jpeg' or $lowerCaseExtension = 'jpg' or $lowerCaseExtension = 'png' or $lowerCaseExtension = 'gif'">
									                <xsl:value-of select="concat($BasePath,'/Images/',substring(@fileRef, 2))"/>
									            </xsl:when>
									            <xsl:otherwise><xsl:value-of select="concat($BasePath,'/Images/',substring(@fileRef, 2),'.jpg')"/></xsl:otherwise>
								            </xsl:choose>
							            </xsl:attribute>
							            <xsl:attribute name="onclick">
								            <xsl:choose>
									            <xsl:when test="$lowerCaseExtension = 'jpeg' or $lowerCaseExtension = 'jpg' or $lowerCaseExtension = 'png' or $lowerCaseExtension = 'gif'">
									                <xsl:value-of select='concat("document.title=&#39;image://Images/", substring(@fileRef, 2), "&#39;")'/>
									            </xsl:when>
									            <xsl:otherwise><xsl:value-of select='concat("document.title=&#39;image://Images/", substring(@fileRef, 2), ".jpg&#39;")'/></xsl:otherwise>
									            <!-- &#39; = single quote character -->
								            </xsl:choose>
							            </xsl:attribute>
						            </img>
					            </xsl:when>
					            <xsl:otherwise>
						            <img>
							            <xsl:if test="$boolShowRevisionMarkings and (@rev:revStatus = 'R' or @rev:revStatus = 'N') and not(ancestor::*[@rev:revStatus = 'R' or @rev:revStatus = 'N'])">
								            <xsl:attribute name="class">RevMark</xsl:attribute>
								            <xsl:attribute name="title"><xsl:value-of select="@rev:revHighlight"/></xsl:attribute>
							            </xsl:if>
							            <xsl:attribute name="src">
								            <xsl:choose>
									            <xsl:when test="$lowerCaseExtension = 'jpeg' or $lowerCaseExtension = 'jpg' or $lowerCaseExtension = 'png' or $lowerCaseExtension = 'gif'">
									                <xsl:value-of select="concat('../Images/',substring(@fileRef, 2))"/>
									            </xsl:when>
									            <xsl:otherwise><xsl:value-of select="concat('../Images/',substring(@fileRef, 2),'.jpg')"/></xsl:otherwise>
								            </xsl:choose>
							            </xsl:attribute>
						            </img>
					            </xsl:otherwise>
				            </xsl:choose>

			
			    </xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:apply-templates mode="TmpRev-phase" select="ftid:Warning | ftid:Caution | ftid:Note"/>
	</xsl:template>


	<xsl:template match="ftid:CalloutDescription">
		<div>
			<xsl:choose>
		         <!-- IXP 4.2 - updates for new Rev Bar template  -->
	            <xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
		            <span  class="RevMark" title="{@rev:revHighlight}">
			            <xsl:apply-templates mode="TmpRev-phase" select="ftid:Title | ftid:Effectivities | node()[not(self::ftid:Title|self::ftid:Effectivities|self::ftid:CalloutIcon)]"/>
					</span>
	             </xsl:when>
	             <xsl:otherwise>
	                <xsl:apply-templates mode="TmpRev-phase" select="ftid:Title | ftid:Effectivities | node()[not(self::ftid:Title|self::ftid:Effectivities|self::ftid:CalloutIcon)]"/>
	             </xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	
	<xsl:template name="get-filename-extension">
		<xsl:param name="filename"/>
		<xsl:choose>
			<xsl:when test="string-length(substring-after($filename,'.')) = 0"><xsl:value-of select="$filename"/></xsl:when><!-- Once there isn't any '.' (remaining), return the value -->
			<xsl:otherwise><xsl:call-template name="get-filename-extension"><xsl:with-param name="filename" select="substring-after($filename,'.')"/></xsl:call-template></xsl:otherwise><!-- otherwise recurse with string after first '.' -->
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>