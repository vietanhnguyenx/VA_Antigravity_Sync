<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rev="http://www.boeing.com/FTID-ML/Revision"
                xmlns:ftid="http://www.boeing.com/FTID-ML">

  <!--
======================================================================
Boeing Proprietary and Confidential - All Rights Reserved.

This XSL is covered under the Boeing Copyright for Flight Operations 
digital data.  Permission to use this XSL is subject to the entitlement
of the information or documents in which this XSL is applied.
======================================================================
-->


  <!-- ==================================================== -->
  <!--   Deals with bulletins      -->
  <!-- ==================================================== -->

  
  <xsl:template match="ftid:BulletinMetaData">
    <div id="headerTable" class="BulletinMetaData" style="display:none">
      <!-- javascript id - do not change-->
      <!-- styles are inline here due to IE's difficulty in applying CSS
           stylesheets to frames dynamically via Javascript.-->
      <table style="font-family:Arial; table-layout:auto; width:100%; border:solid 3px Gray;
                    text-align:center;
                    background-color:#778899; color:Black; margin-bottom:1em; font-weight:bold;">
        <tr>
          <td>
            <span style="white-space:nowrap">
              <xsl:apply-templates select="@model" mode="TmpRev-phase"/>
              <xsl:text> </xsl:text>
              <xsl:apply-templates select="@manualName" mode="TmpRev-phase"/>
            </span>
            <br/>
            <span style="white-space:nowrap;color:White;">
              <xsl:value-of select="ftid:BulletinNumber" />
            </span>
          </td>--
        </tr>
      </table>
    </div>
    <xsl:apply-templates mode="TmpRev-phase" select="ftid:CustomerName"/>
    <table style="width:50%; float:right">
      <xsl:apply-templates mode="TmpRev-phase" select="ftid:BulletinNumber"/>
      <xsl:apply-templates mode="TmpRev-phase" select="ftid:BulletinDate"/>
    </table>
    <div style="width:100%; clear:both"/>
    <xsl:apply-templates mode="TmpRev-phase" select="ftid:DocumentEffectivity"/>
  </xsl:template>

  
  <xsl:template match="ftid:CustomerName">
    <h2 style="text-align:center; padding-bottom:0.5em">
      <xsl:value-of select="$bulletin_title-label"/>
      <br/><xsl:value-of select="$bulletin_for-label"/><br/>
      <xsl:apply-templates mode="TmpRev-phase"/>
    </h2>
  </xsl:template>

  
  <xsl:template match="ftid:BulletinNumber | ftid:BulletinDate">
    <tr>
      <td class="RowHeader">
        <xsl:choose>
          <xsl:when test="self::ftid:BulletinNumber"><xsl:value-of select="$bulletin_number-label"/>:</xsl:when>
          <xsl:otherwise><xsl:value-of select="$bulletin_date-label"/>:</xsl:otherwise>
        </xsl:choose>
      </td>
      <td>
        <xsl:apply-templates mode="TmpRev-phase"/>
        <xsl:if test="self::ftid:BulletinNumber and @rev:revNumber">
          <xsl:text> R</xsl:text>
          <xsl:apply-templates select="@rev:revNumber" mode="TmpRev-phase" />
        </xsl:if>
      </td>
    </tr>
  </xsl:template>


  <xsl:template match="ftid:DocumentEffectivity">
    <div style="font-weight:bold;">
      <xsl:value-of select="$document_effectivity-label"/><xsl:text>: </xsl:text>
      <xsl:apply-templates mode="TmpRev-phase"/>
    </div>
  </xsl:template>

  <!-- Starts - CR- Revision missing from airplane range -->
  <!-- Check for Revision info against each text and apply revision bars wherever required -->
  <xsl:template match="ftid:BulletinEffectivityInfo//text()[string-length(normalize-space(.)) > 0]" mode="TmpRev-phase">
    <div style="text-indent:-9.5em;padding-left:9.5em;margin-bottom:1em;">
      <span style="font-weight:bold;">
        <xsl:value-of select="$airplane_effectivity-label"/>:        
      </span>
      <xsl:choose>
        <!-- checking for revision info -->
        <xsl:when test="$boolShowRevisionMarkings and (following-sibling::processing-instruction('FTID-rev')[1]='end' and not(ancestor::ftid:table[@rev:revStatus] or ancestor::ftid:GraphicSet[@rev:revStatus] or ancestor::ftid:LocationDiagram[@rev:revStatus]))">
          <span class="RevMark"
              title="{ancestor::*[@rev:revHighlight][1]/@rev:revHighlight}">
            <!-- @title above is used by jQuery to show highlight text -->
            <xsl:value-of select="."/>
          </span>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>
    <!-- Ends - CR- Revision missing from airplane range -->
  <xsl:template match="ftid:BulletinSubject">
    <xsl:apply-templates select="/ftid:Bulletin/ftid:BulletinMetaData/ftid:BulletinEffectivityInfo"/>
    <div style="text-indent:-4.15em;padding-left:4.15em;margin-bottom:1em;">
      <span style="font-weight:bold;"><xsl:value-of select="$bulletin_subject-label"/>: </span>
      <xsl:apply-templates mode="TmpRev-phase"/>
    </div>
  </xsl:template>

  
  <xsl:template match="ftid:BulletinReason">
    <div style="text-indent:-4.25em;padding-left:4.25em;margin-bottom:1em;">
      <span style="font-weight:bold;margin-bottom:1em;"><xsl:value-of select="$bulletin_reason-label"/>: </span>
      <xsl:apply-templates  select="*[1]" mode="TmpRev-phase"/>
    </div>
    <xsl:for-each select="*[position() &gt; 1]">
      <div style="clear:both; padding-left:4.25em;margin-bottom: 1em;">
        <xsl:apply-templates select="." mode="TmpRev-phase" />
      </div>
    </xsl:for-each>
    <xsl:apply-templates select="../ftid:BulletinMetaData/ftid:BulletinRevInfo" mode="layout"/>
  </xsl:template>

  
  <xsl:template match="ftid:BulletinReason/ftid:Para[not(preceding-sibling::*)]">
    <xsl:apply-templates mode="TmpRev-phase"/>
  </xsl:template>

  
  <xsl:template match="ftid:BulletinRevInfo" mode="layout">
    <div style="clear:both; padding-left:4.25em;margin-bottom: 1em;">
      <xsl:apply-templates select="." mode="TmpRev-phase" />
    </div>
  </xsl:template>

  
  <xsl:template match="ftid:Disclaimer">
    <div class="Disclaimer">
      <xsl:apply-templates mode="TmpRev-phase"/>
    </div>
    <br/>
  </xsl:template>

  
  <xsl:template match="ftid:CS3Number">
    <p>
      <xsl:apply-templates mode="TmpRev-phase"/>
    </p>
  </xsl:template>

</xsl:stylesheet>
