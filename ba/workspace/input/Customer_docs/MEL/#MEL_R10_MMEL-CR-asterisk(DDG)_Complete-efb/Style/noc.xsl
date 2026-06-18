<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
								xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
								xmlns:ftid="http://www.boeing.com/FTID-ML"
								xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
	<!-- CHECK COMPLETE -->
	<!--
======================================================================
Boeing Proprietary and Confidential - All Rights Reserved.

This XSL is covered under the Boeing Copyright for Flight Operations 
digital data.  Permission to use this XSL is subject to the entitlement
of the information or documents in which this XSL is applied.
======================================================================
-->

	<xsl:output method="html" encoding="UTF-8"
							doctype-system="http://www.w3.org/TR/html4/loose.dtd"
							doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

	<xsl:template name="dot">
		<!-- a bullet like a bulleted list: • -->
		<span class="dot">&#8226;</span>
	</xsl:template>


	<xsl:template match="ftid:NOC">
		<xsl:choose>
			<xsl:when test="$isEFBOutput">
				<xsl:apply-templates select="." mode="EFB" />
			</xsl:when>
			<xsl:otherwise>
				<html>
					<head>
						<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
						<script type="text/javascript" src="../js/jquery.js"/>
						<script type="text/javascript" src="../js/mktree.js" ></script>
						<link rel="stylesheet" href="../js/mktree.css"/>
					</head>
					<body>
						<div class="TOCTitle">
							<p id="title">Table Of Contents</p>
							<div id="dropshadow">
								<p id="expander">
									<img class="plus" src="..\\js\\plus.gif"/>
									<xsl:text>Expand All</xsl:text>
								</p>
							</div>
						</div>
						<ul class="mktree" id="tree1">
							<xsl:apply-templates />
						</ul>
					</body>
				</html>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="ftid:SuperSection">
		<li>
			<xsl:call-template name="expandingSpan">
				<xsl:with-param name="innerText" select="@titleRef"/>
			</xsl:call-template>
			<ul>
				<xsl:choose>
					<xsl:when test="contains(@titleRef,'Preface')">
						<xsl:apply-templates select="ftid:Chapter/ftid:Section"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates/>
					</xsl:otherwise>
				</xsl:choose>
			</ul>
		</li>
	</xsl:template>


	<xsl:template match="ftid:Chapter">
		<li>
			<xsl:variable name="firstSection" select="./ftid:Section[1]" />
			<xsl:variable name="fileRef" select="$firstSection/@fileRef"/>
			<xsl:variable name="mapFrom" select="$firstSection/ftid:NavigationItem/@mapFrom"/>
			<xsl:variable name="chapterName-colon-or-null"><xsl:choose><xsl:when test="string-length($firstSection/@chapterName) &gt; 0">: </xsl:when></xsl:choose></xsl:variable>
			<xsl:call-template name="expandingSpan">
				<xsl:with-param name="innerText" select="concat($firstSection/@chapterNumber, $chapterName-colon-or-null, $firstSection/@chapterName)"/>
			</xsl:call-template>
			<ul>
				<xsl:choose>
					<xsl:when test="starts-with($fileRef, 'Chapter-') or starts-with($fileRef, 'Chap-')">
						<xsl:apply-templates select="ftid:Section/*"/>
					</xsl:when>
					<xsl:when test="starts-with($mapFrom, 'GenericUnit') or starts-with($mapFrom, 'MELItem') or starts-with($mapFrom, 'CDLItem') or starts-with($mapFrom, 'EICASList')">
						<xsl:apply-templates select="./ftid:Section/ftid:NavigationItem"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="ftid:Section"/>
					</xsl:otherwise>
				</xsl:choose>
			</ul>
		</li>
	</xsl:template>


	<xsl:template match="ftid:Section">
		<!-- changed from match="ftid:Section[not(@superSectionNumber = '0')]" 
				 due to skipping TitlePage.xml Section.
		-->
		<!-- IXP 4.3 - display NavigationItems for the Preface in the NOC-->
		<!-- <xsl:variable name="isPreface" select="boolean(@chapterName = 'Preface')"/> -->
		<xsl:variable name="isPreface" select="false()"/>
		<xsl:variable name="chapterName-colon-or-null"><xsl:choose><xsl:when test="string-length(@chapterName) &gt; 0">: </xsl:when></xsl:choose></xsl:variable>
		<xsl:variable name="sectionName-colon-or-null"><xsl:choose><xsl:when test="string-length(@sectionName) &gt; 0">: </xsl:when></xsl:choose></xsl:variable>
		<li>
			<xsl:choose>
				<!-- the following codes indicate front matter -->
				<xsl:when test="contains(@idRef, '.ECR.') or contains(@idRef, '.GLO.') or
												contains(@idRef, '.FMR.') or contains(@idRef, '.BLR.') or
												contains(@idRef, '.INT.') or contains(@idRef, '.TP.')">
					<a target="DocFrame" href="{@fileRef}#{@idRef}">
						<xsl:choose>
							<xsl:when test="not(*) or $isPreface">
								<xsl:call-template name="dot"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="expandAttribute"/>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="not(string-length(@superSectionNumber) = 0)">
								<xsl:value-of select="concat(@chapterNumber, $chapterName-colon-or-null, @chapterName)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(@sectionNumber, $sectionName-colon-or-null, @sectionName)"/>
							</xsl:otherwise>
						</xsl:choose>
					</a>
					<xsl:if test="not($isPreface)">
						<xsl:apply-templates/>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="SectTitle">
						<xsl:choose>
							<xsl:when test="not(string-length(@superSectionNumber) = 0)">
								<xsl:value-of select="@chapterName"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@sectionName"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="@chapterNumber = 'NC'">
							<a target="DocFrame" href="{@fileRef}">
								<xsl:choose>
									<xsl:when test="not(*) or $isPreface">
										<xsl:call-template name="dot"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="expandAttribute"/>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:value-of select="concat(@chapterNumber, '-Normal Checklists')"/>
							</a>
						</xsl:when>
						<xsl:when test="contains($SectTitle, 'Revision Notice')">
							<a target="DocFrame" href="{@fileRef}">
								<xsl:choose>
									<xsl:when test="not(*) or $isPreface">
										<xsl:call-template name="dot"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="expandAttribute"/>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:value-of select="concat(@chapterNumber, '-', @sectionNumber)"/>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<a target="DocFrame" href="{@fileRef}">
								<xsl:choose>
									<xsl:when test="not(*) or $isPreface">
										<xsl:call-template name="dot"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="expandAttribute"/>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="not($isPreface)">
									<xsl:value-of select="@chapterNumber"/>
								</xsl:if>
								<xsl:if test="not(string-length(@sectionNumber) = 0)">
									<xsl:if test="not(string-length(@chapterNumber) = 0) and not($isPreface)">-</xsl:if>
									<xsl:choose>
										<xsl:when test="@sectionName= 'Bulletin'">
											<xsl:value-of select="@sectionName"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="@sectionNumber"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="string-length(concat(@sectionNumber, $SectTitle)) &gt; 0">
									<xsl:text>: </xsl:text>
								</xsl:if>
								<xsl:choose>
									<xsl:when test="@sectionName= 'Bulletin'">
										<xsl:value-of select="@sectionNumber"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$SectTitle"/>
									</xsl:otherwise>
								</xsl:choose>
							</a>
							<!-- IXP 4.3 - display NavigationItems for the Preface in the NOC-->
							<!-- <xsl:if test="not(@chapterName = 'Preface')"> -->
								<xsl:if test="*">
									<ul>
										<xsl:apply-templates/>
									</ul>
								</xsl:if>
							<!-- </xsl:if> -->
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</li>
	</xsl:template>


	<!--<xsl:template match="ftid:Normal|ftid:NormalChecklist">
		<li>
			<xsl:call-template name="dottedLink">
				<xsl:with-param name="href" select="concat(../@fileRef, '#', @idRef)"/>
			</xsl:call-template>
			<xsl:apply-templates/>
		</li>
	</xsl:template>-->


	<xsl:template match="ftid:NavigationItem">
		<li>
			<a target="DocFrame" href="{ancestor::ftid:Section/@fileRef}#{./@idRef}">
				<xsl:choose>
					<xsl:when test="not(*)">
						<xsl:call-template name="dot"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="expandAttribute"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="@mapFrom = 'MELItem' or @mapFrom = 'CDLItem'">
					<xsl:value-of select="concat(@labelRef, ' ')"/>
				</xsl:if>
				<xsl:call-template name="titleRef" />
			</a>
			<xsl:choose>
				<xsl:when test="*">
					<ul>
						<xsl:apply-templates/>
					</ul>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
		</li>
	</xsl:template>


	<xsl:template match="ftid:NavigationList[child::*]">
		<xsl:apply-templates/>
	</xsl:template>


	<!--<xsl:template match="ftid:LimitSubject">
		<li>
			<xsl:call-template name="dottedLink">
				<xsl:with-param name="href" select="concat(../@fileRef, '#', @idRef)"/>
			</xsl:call-template>
			<xsl:choose>
				<xsl:when test="./ftid:LimitSystem">
					<ul>
						<xsl:apply-templates/>
					</ul>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
		</li>
	</xsl:template>


	<xsl:template match="ftid:LimitSystem">
		<li>
			<xsl:call-template name="dottedLink">
				<xsl:with-param name="href" select="concat(../../@fileRef, '#', @idRef)"/>
			</xsl:call-template>
			<xsl:choose>
				<xsl:when test="./ftid:LimitSystemItem">
					<ul>
						<xsl:apply-templates/>
					</ul>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
		</li>
	</xsl:template>-->


	<!--<xsl:template match="ftid:SDSubject|ftid:Supplementary">
		<li>
			<xsl:call-template name="dottedLink">
				<xsl:with-param name="href" select="concat(../@fileRef, '#', @idRef)"/>
			</xsl:call-template>
			<xsl:choose>
				<xsl:when test="./ftid:SDSubSubject">
					<ul>
						<xsl:apply-templates/>
					</ul>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
		</li>
	</xsl:template>


	<xsl:template match="ftid:SDSubSubject">
		<li>
			<xsl:call-template name="dottedLink">
				<xsl:with-param name="href" select="concat(../../@fileRef, '#', @idRef)"/>
			</xsl:call-template>
			<xsl:choose>
				<xsl:when test="./ftid:SDSubjItem">
					<ul>
						<xsl:apply-templates/>
					</ul>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
		</li>
	</xsl:template>


	-->
	<!-- removed PerLevel3, LimitSystemItem, LimitBody & SDBody-->
	<!--
	<xsl:template match="ftid:SDSubjItem">
		<li>
			<xsl:call-template name="dottedLink">
				<xsl:with-param name ="href" select="concat(ancestor::ftid:Section/@fileRef, '#', @idRef)"/>
			</xsl:call-template>
		</li>
	</xsl:template>-->
	
	<!-- ixp 4.2 - add rev bar display -->
	<xsl:template match="ftid:SDSubjItem">
	    <xsl:choose>
            <xsl:when test="$boolShowRevisionMarkings and following-sibling::processing-instruction('FTID-rev')[1]='end'">
	            <span  class="RevMark" title="{@rev:revHighlight}">
			        <xsl:apply-templates mode="TmpRev-phase"/>
	             </span>
	        </xsl:when>	
	        <xsl:otherwise>
	      		<xsl:apply-templates mode="TmpRev-phase"/>
	    	</xsl:otherwise>
        </xsl:choose>
	</xsl:template>
	
	<!-- ================== -->
	<!--  NNC Index Section -->
	<xsl:template match="ftid:NNCIndex">
		<li>
			<xsl:call-template name="expandingSpan">
				<xsl:with-param name="innerText" select="'NNC Index'"/>
			</xsl:call-template>
			<ul>
				<xsl:apply-templates select="ftid:IndexGroup"/>
			</ul>
		</li>
	</xsl:template>


	<xsl:template match="ftid:Index">
		<li>
			<xsl:call-template name="expandingSpan">
				<xsl:with-param name="innerText">
					<xsl:choose>
						<xsl:when test="starts-with(@indexType,'QAI')">Quick Action</xsl:when>
						<xsl:when test="starts-with(@indexType,'Light')">Lights</xsl:when>
						<xsl:when test="starts-with(@indexType,'UAI')">Unannunciated</xsl:when>
						<xsl:when test="starts-with(@indexType,'AI')">Annunciated</xsl:when>
						<xsl:when test="starts-with(@indexType,'NNC')">NNC</xsl:when>
						<xsl:when test="starts-with(@indexType,'ALL')">General</xsl:when>
					</xsl:choose>
					<xsl:text> Index</xsl:text>
				</xsl:with-param>
			</xsl:call-template>
			<ul>
				<xsl:apply-templates />
			</ul>
		</li>
	</xsl:template>


	<xsl:template match="ftid:IndexList[ftid:IndexGroup]">
		<li>
			<xsl:apply-templates select="ftid:IndexGroup"/>
			<ul>
				<xsl:apply-templates select="ftid:IndexItem"/>
			</ul>
		</li>
	</xsl:template>


	<xsl:template match="ftid:IndexList/ftid:IndexGroup">
		<xsl:call-template name="expandingSpan">
			<xsl:with-param name="innerText" select="@groupName"/>
		</xsl:call-template>
	</xsl:template>


	<xsl:template match="ftid:IndexItem">
		<li>
			<xsl:call-template name="dottedLink">
				<xsl:with-param name="href" select="concat(@fileRef, '#', @idRef)" />
			</xsl:call-template>
		</li>
	</xsl:template>


	<xsl:template name="expandingSpan">
		<xsl:param name="innerText"/>
		<span class='expands'>
			<img class="plus" src="..\\js\\plus.gif"/>
			<img class="minus" src="..\\js\\minus.gif"/>
			<xsl:value-of select="$innerText"/>
		</span>
	</xsl:template>


	<xsl:template name="expandAttribute">
		<xsl:attribute name="class">expands</xsl:attribute>
		<img class="plus" src="..\\js\\plus.gif"/>
		<img class="minus" src="..\\js\\minus.gif"/>
	</xsl:template>


	<xsl:template name="dottedLink">
		<xsl:param name="href"/>
		<a target="DocFrame" href="{$href}">
			<xsl:if test="not(*)">
				<xsl:call-template name="dot"/>
			</xsl:if>
			<xsl:call-template name="titleRef"/>
		</a>
	</xsl:template>


	<xsl:template name="titleRef">
		<xsl:choose>
			<xsl:when test="string-length(@titleRef)=0">[ untitled ]</xsl:when>
			<xsl:otherwise>
			    <xsl:choose>
			       <xsl:when test="processing-instruction('emphasize-with')='size'">
			           <span class="LargeFont">
				            <xsl:value-of select="@titleRef"/>
				        </span>
				    </xsl:when>
				    <xsl:when test="processing-instruction('emphasize-TOC-with')='size'">
			           <span class="LargeFont">
				            <xsl:value-of select="@titleRef"/>
				        </span>
				    </xsl:when>
				    <xsl:when test="processing-instruction('emphasize-Index-with')='size'">
			           <span class="LargeFont">
				            <xsl:value-of select="@titleRef"/>
				        </span>
				    </xsl:when>
				    <xsl:otherwise>
						<xsl:value-of select="@titleRef"/>
					</xsl:otherwise>
				</xsl:choose>	
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!--  ==================  -->
	<!--  EFB MODE TEMPLATES  -->
	<!--  ==================  -->


	<xsl:template match="ftid:NOC" mode="EFB">
		<html>
			<head>
				<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
				<script type="text/javascript" src="{$BasePath}/js/jquery.js"></script>
				<script type="text/javascript">
					<![CDATA[
					$(function () {
							$('.IndexItem')
								.hover(
										function () {
												$(this).addClass('hover');
										}, function () {
												$(this).removeClass('hover');
										})
								.click(function () {
										document.title = $(this).attr('id');
							});
					});
				]]>
				</script>
				<style type="text/css">
					body {
						background-color: black; font-family:Arial; color:White; font-size:120%
					}
					.IndexItem {
						padding: 1em .25em;
						background-image: url('<xsl:value-of select="$BasePath" />/Style/EFBLinkBackground.jpg');
					border:solid 2px black; margin:0;cursor:arrow;
					display:block;
					text-decoration:none;
					color:white;
					}
					.IndexItem:hover {
						border: solid 2px white;
					}
					.IndexGroup { text-transform: uppercase }
					.IndexGroup p { padding: 1em 0 }
					.IndexGroup .IndexItem { margin-left: 2em; }
					.hover { border-color: white; }
				</style>
				<base target="DocFrame" />
			</head>
			<body id="textContent" class="EFBFont EFB">
				<xsl:apply-templates select ="//ftid:IndexList" mode="EFB" />
			</body>
		</html>
	</xsl:template>


	<xsl:template match="ftid:IndexList" mode="EFB">
		<!-- An IndexGroup is optional in an IndexList.  
		     In the HTML, an IndexGroup renders a parent DIV to contain the IndexGroup
				 AND the sibling IndexItem(s), but if there isn't an IndexGroup, we still need to 
				 render the IndexItem(s).  
				 Here is where we decide which route to take.-->
		<xsl:choose>
			<xsl:when test="ftid:IndexGroup">
				<xsl:apply-templates select="ftid:IndexGroup" mode="EFB" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="ftid:IndexItem" mode="EFB" />
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>


	<xsl:template match="ftid:IndexGroup" mode="EFB">
		<div id="{concat(ancestor::ftid:Index/@indexType, '-', @groupName)}" class="IndexGroup">
			<p>
				<xsl:value-of select="@groupName"/>
			</p>
			<xsl:apply-templates select="following-sibling::ftid:IndexItem" mode="EFB"/>
		</div>
	</xsl:template>


	<xsl:template match="ftid:IndexItem" mode="EFB">
		<a class="IndexItem" id="content://{@idRef}" >
			<xsl:value-of select="@titleRef"/>
		</a>
	</xsl:template>





</xsl:stylesheet>