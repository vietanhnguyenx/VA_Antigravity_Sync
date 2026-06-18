<?xml version="1.0" encoding="utf-8"?>

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
-->


  <!-- ==================================================== -->
  <!--                 Document Heading                     -->
  <!-- ==================================================== -->
  <xsl:template match="/*[not(self::ftid:NOC)]">
    <!-- Matches any root element (NOT document root), e.g. Procedures, DispatchItem, Bulletin, etc. -->
    <xsl:if test="$boolShowRevisionMarkings and $isEFBOutput">
      <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"&gt;</xsl:text>
    </xsl:if>
    <html>
      <head>
        <xsl:choose>
          <xsl:when test="$isEFBOutput">
            <xsl:if test="$boolShowRevisionMarkings">
              <script type="text/javascript" src="{$BasePath}/JS/jquery.js"></script>
              <script type="text/javascript" src="{$BasePath}/JS/ixp_utility.js" ></script>
            </xsl:if>
            <script type="text/javascript">
              <![CDATA[
							function loadLinkByID(xmlFile) {
							try {//Internet Explorer
							var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
							}
							catch (e) {
							try {//Firefox, Mozilla, Opera, etc.
							var xmlDoc = document.implementation.createDocument("", "", null);
							}
							catch (e) { alert(e.message) }
							}
							try {
							xmlDoc.validateOnParse = false;
							xmlDoc.async = false;
							xmlDoc.load(xmlFile);
							document.title = "content://" + xmlDoc.documentElement.getElementsByTagName("*")[3].attributes.getNamedItem("id").value;
							}
							catch (e) { alert(e.message) }
							}
							]]>
            </script>
            <link rel="stylesheet" type="text/css">
              <xsl:attribute name="href">
                <xsl:value-of select="$StylePath"/>
                <xsl:choose>
                  <xsl:when test="contains($DayMode, 'true')">/ftidStyleDay.css</xsl:when>
                  <xsl:otherwise>/ftidStyleNight.css</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
            </link>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <xsl:if test=".//ftid:Effectivities[not(string-length(ftid:Effectivity/@effectAirplaneList) = 0) or not(substring-before(substring-after(ftid:EffectivitywSB/@effectAirplaneList, 'ADDED('), ')')='') or not(substring-before(substring-after(ftid:EffectivitywSB/@effectAirplaneList, 'CHANGES('), ')')='')]">
              <META name="Effectivity" content="Tail ID" />
              <!-- preceding META must be capitalized for efb -->
            </xsl:if>
            <base target="DocFrame" />
          </xsl:when>
          <xsl:otherwise>
            <title>
              <xsl:value-of select="concat(ftid:PUMetaData/ftid:PUInfo/@sectionName,*[2]/ftid:Title)"/>
            </title>
            <link rel="stylesheet" type="text/css" href="{$StylePath}/ftidStyleNight.css" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <script type="text/javascript" src="{'..'}/JS/jquery.js"></script>
            <script type="text/javascript" src="{'..'}/JS/ixp_utility.js" ></script>
          </xsl:otherwise>
        </xsl:choose>
      </head>
      <body id="textContent">
        <!-- preceding "textContent" id is required by the EFB.  DO NOT CHANGE -->
        <xsl:choose>
          <xsl:when test="$isEFBOutput">
            <xsl:attribute name="class">EFB</xsl:attribute>
            <xsl:if test="$boolShowRevisionMarkings">
              <xsl:attribute name="onload">
                <xsl:value-of select="concat('revAndCocBars(true, false);', 'previewMode(', $isPreview, ');')"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="onload">
              <xsl:value-of select="concat('writeHeaderFrame();', 'previewMode(', $isPreview, ');')"/>
              <!-- previewMode() disables the links on a page when in the IXP preview window -->
              <!-- writeHeaderFrame() calls revBars() after completion, so no need to do so here. -->
            </xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="ftid:TitlePage">
            <xsl:attribute name="class">TitlePage</xsl:attribute>
            <xsl:apply-templates mode="TmpRev-phase" select="ftid:PUMetaData" />
            <xsl:apply-templates mode="TmpRev-phase" select="ftid:TitlePage" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="$isEFBOutput and not(concat(ftid:PUMetaData/ftid:PUEffectivity/@airframe, 
																													ftid:PUMetaData/ftid:PUEffectivity/@engine, 
																													ftid:PUMetaData/ftid:RegulatoryInfo/@agencyName,
																													ftid:PUMetaData/ftid:PUEffectivity/@equipment) = '')">
                <span class="Effectivities">
                  <xsl:if test="not(concat(ftid:PUMetaData/ftid:PUEffectivity/@airframe, ftid:PUMetaData/ftid:PUEffectivity/@engine)='')">
                    <xsl:text>Airframe/Engine: </xsl:text><xsl:apply-templates select="ftid:PUMetaData/ftid:PUEffectivity/@airframe" mode="TmpRev-phase" />/<xsl:apply-templates select="ftid:PUMetaData/ftid:PUEffectivity/@engine" mode="TmpRev-phase" />
                  </xsl:if>
                  <xsl:if test="not(string-length(ftid:PUMetaData/ftid:RegulatoryInfo/ftid:RegulatoryInfoItem/@agencyName) = 0)">
                    <xsl:text>, </xsl:text>
                    <xsl:apply-templates select="ftid:PUMetaData/ftid:RegulatoryInfo/ftid:RegulatoryInfoItem/@agencyName" mode="TmpRev-phase" />
                  </xsl:if>
                  <xsl:if test="not(string-length(ftid:PUMetaData/ftid:PUEffectivity/@equipment) = 0)">
                    <xsl:text>, </xsl:text>
                    <xsl:apply-templates select="ftid:PUMetaData/ftid:PUEffectivity/@equipment" mode="TmpRev-phase" />
                  </xsl:if>
                  <xsl:text> </xsl:text>
                </span>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates mode="TmpRev-phase" select="ftid:PUMetaData" />
              </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates mode="TmpRev-phase" select="ftid:PUMetaData/ftid:PUEffectivity/ftid:Effectivities" />
            <xsl:choose>
              <xsl:when test="$SectionToPrint">
                <xsl:apply-templates select="//*[not(string-length(@id)=0) and contains($SectionToPrint, @id)]/ancestor-or-self::*[preceding-sibling::ftid:PUMetaData]" mode="TmpRev-phase"/>
              </xsl:when>
              <xsl:otherwise>

                <!-- IXP 4.4 - implement rev bar for the entire publish unit (web page) -->
                <xsl:choose>
                  <xsl:when test="$boolShowRevisionMarkings and ftid:PUMetaData/ftid:PURevInfo/@rev:revHighlight 
                                                                                                      and processing-instruction('FTID-rev')[starts-with(.,'start')]">
                    <span  class="RevMark" title="{ftid:PUMetaData/ftid:PURevInfo/@rev:revHighlight}">
                      <xsl:apply-templates mode="TmpRev-phase" select="*[not(self::ftid:PUMetaData)]" />
                    </span>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates mode="TmpRev-phase" select="*[not(self::ftid:PUMetaData)]" />
                  </xsl:otherwise>
                </xsl:choose>

              </xsl:otherwise>
            </xsl:choose>
            <hr />
          </xsl:otherwise>
        </xsl:choose>
        <p class="EARFooter">
          <xsl:value-of select="/processing-instruction('FTID-ExportCopyrightStatement')"/>
        </p>
      </body>
    </html>
  </xsl:template>


  <xsl:template match="@manualNumber">
    <xsl:text>[</xsl:text>
    <!-- replace dashes with &#8209; - a non-wrapping dash -->
    <xsl:value-of select="translate(., '-', '&#8209;')" />
    <xsl:text>]</xsl:text>
  </xsl:template>

  <xsl:template match="ftid:PUMetaData">
    <div id="headerTable" style="display:none;">
      <!-- javascript id - do not change -->
      <!-- styles are inline here due to IE's difficulty in applying CSS
					 stylesheets to frames dynamically via Javascript.-->
      <table style="font-family:Arial; table-layout:auto; width:100%;
										background-color:#778899; color:Black; margin-bottom:1em;">
        <tr>
          <td colspan="2"
							style="padding:2px;border-bottom: solid 1px White; font-size: larger;">
            <xsl:apply-templates select="ftid:PUInfo/@customerName" />
            <xsl:text> </xsl:text>
            <xsl:value-of select="ftid:PUInfo/@model" />
            <xsl:text> </xsl:text>
            <xsl:value-of select="ftid:PUInfo/@manualName" />
            <xsl:if test="not(string-length(ftid:PUInfo/@manualNumber) = 0)">
              <span style="padding-left:.5em;">
                <xsl:value-of select="ftid:PUInfo/@manualNumber" />
              </span>
            </xsl:if>
          </td>
        </tr>
        <tr>
          <td style="padding:2px;	text-align:left; width: 80%; color:White;">
            <span style="font-size:larger;">
              <xsl:value-of select="ftid:PUInfo/@chapterName" />
            </span>
            <xsl:if test="not(string-length(ftid:PUInfo/@sectionName) = 0) ">
              <xsl:text> : </xsl:text>
              <span style="white-space:nowrap">
                <xsl:value-of  select="ftid:PUInfo/@sectionName" />
              </span>
            </xsl:if>
          </td>
          <td style="padding:2px;	width:20%; text-align:center;	border-left:solid 1px White; color:White; font-size:larger;">
            <xsl:value-of select="ftid:PUInfo/@chapterNumber" />
            <xsl:if test="not(string-length(ftid:PUInfo/@sectionNumber) = 0)">-</xsl:if>
            <xsl:value-of select="ftid:PUInfo/@sectionNumber" />
          </td>
        </tr>
        <xsl:if test="parent::ftid:Performances">
          <tr class="Performances" >
            <td colspan="2" style="border-top:solid 1px white">
              <xsl:if test="not(string-length(ftid:PUEffectivity/@airframe) = 0)">
                <xsl:text>Airframe/Engine: </xsl:text>
                <xsl:value-of select="ftid:PUEffectivity/@airframe" />
                <xsl:text>/</xsl:text>
                <xsl:value-of select="ftid:PUEffectivity/@engine"/>
              </xsl:if>
              <xsl:if test="not(string-length(ftid:RegulatoryInfo/ftid:RegulatoryInfoItem/@agencyName) = 0)">
                <xsl:text>, </xsl:text>
                <xsl:value-of select="ftid:RegulatoryInfo/ftid:RegulatoryInfoItem/@agencyName" />
              </xsl:if>
              <xsl:if test="not(string-length(ftid:PUEffectivity/@equipment) = 0)">
                <xsl:text>, </xsl:text>
                <xsl:value-of select="ftid:PUEffectivity/@equipment"  />
              </xsl:if>
            </td>
          </tr>
        </xsl:if>
      </table>
    </div>
  </xsl:template>


</xsl:stylesheet>