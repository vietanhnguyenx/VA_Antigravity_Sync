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
  <!-- This file contains all the table related elements -->
  <!-- ==================================================== -->
  <!--              Generic Table Area Tags                 -->
  <!-- ==================================================== -->


  <xsl:template match="ftid:table">
    <xsl:apply-templates mode="TmpRev-phase" select="ftid:Title" />
    <xsl:apply-templates mode="TmpRev-phase" select="ftid:Effectivities" />
    <xsl:choose>
      <xsl:when test="parent::ftid:PerfSubTopic">
        <div>
          <xsl:call-template name="setIDAttribute" />
          <xsl:call-template name="table" />
        </div>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="table" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- IXP 4.2 - add rev bar display -->
  <xsl:template name="table">
    <xsl:choose>
      <xsl:when test="$boolShowRevisionMarkings and following-sibling::processing-instruction('FTID-rev')[1]='end'">
        <!-- and preceding-sibling::processing-instruction('FTID-rev')[1]='start'"> -->
        <span class="RevMark" title="{@rev:revHighlight}">
          <table id="{count(preceding::ftid:table)}">
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="ancestor::ftid:Performances">PerfTable </xsl:when>
                <xsl:when test="ancestor::ftid:DispatchProcedure">DispatchProcedure </xsl:when>
                <xsl:when test="ancestor::ftid:SDBody">SDBody </xsl:when>
              </xsl:choose>
              <xsl:choose>
                <xsl:when test="@frame = 'top'">BorderTop </xsl:when>
                <xsl:when test="@frame = 'bottom'">BorderBottom </xsl:when>
                <xsl:when test="@frame = 'all'">BorderAll </xsl:when>
                <xsl:when test="@frame = 'topbot'">BorderTop BorderBottom </xsl:when>
                <xsl:when test="@frame = 'sides'">BorderSides </xsl:when>
              </xsl:choose>
              <xsl:if test="$boolShowRevisionMarkings and (@rev:revStatus = 'R' or @rev:revStatus = 'N')">RevMark</xsl:if>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="@rev:revHighlight"/>
            </xsl:attribute>
            <xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Title | self::ftid:Effectivities)]" />
          </table>
        </span>
      </xsl:when>
      <xsl:otherwise>
        <table id="{count(preceding::ftid:table)}">
          <xsl:attribute name="class">
            <xsl:choose>
              <xsl:when test="ancestor::ftid:Performances">PerfTable </xsl:when>
              <xsl:when test="ancestor::ftid:DispatchProcedure">DispatchProcedure </xsl:when>
              <xsl:when test="ancestor::ftid:SDBody">SDBody </xsl:when>
            </xsl:choose>
            <xsl:choose>
              <xsl:when test="@frame = 'top'">BorderTop </xsl:when>
              <xsl:when test="@frame = 'bottom'">BorderBottom </xsl:when>
              <xsl:when test="@frame = 'all'">BorderAll </xsl:when>
              <xsl:when test="@frame = 'topbot'">BorderTop BorderBottom </xsl:when>
              <xsl:when test="@frame = 'sides'">BorderSides </xsl:when>
            </xsl:choose>
            <xsl:if test="$boolShowRevisionMarkings and (@rev:revStatus = 'R' or @rev:revStatus = 'N')">RevMark</xsl:if>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:value-of select="@rev:revHighlight"/>
          </xsl:attribute>
          <xsl:apply-templates mode="TmpRev-phase" select="node()[not(self::ftid:Title | self::ftid:Effectivities)]" />
        </table>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="ftid:table/ftid:Title">
    <h3 style="margin-bottom:0em;">
      <xsl:apply-templates mode="TmpRev-phase" />
    </h3>
    <xsl:apply-templates select="ftid:Effectivities" mode="TmpRev-phase" />
  </xsl:template>

  <xsl:template match="ftid:colspec">
    <xsl:choose>
      <xsl:when test="ancestor::ftid:Performances and @colname='1'">
        <!-- if a Performance Table, only set the width of the first column-->
        <col width="{translate(@colwidth, '*', '%')}"/>
      </xsl:when>
      <xsl:when test="not(ancestor::ftid:Performances)">
        <col width="{translate(@colwidth, '*', '%')}" />
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="ftid:tgroup">
    <xsl:apply-templates select="ftid:colspec" mode="TmpRev-phase"/>
    <xsl:apply-templates select="ftid:thead | ftid:tfoot" mode="TmpRev-phase"/>
    <xsl:if test="ftid:tbody/ftid:row[descendant::ftid:GraphicSet or descendant::text()]">
      <tbody>
        <xsl:apply-templates select="ftid:Effectivities" mode="TmpRev-phase"/>
        <xsl:if test="not(ftid:Effectivities) and preceding-sibling::*[1][self::ftid:tgroup[ftid:Effectivities]]">
          <tr>
            <td colspan="{parent::ftid:tgroup/@cols}" style="border:0px">&#160;</td>
          </tr>
        </xsl:if>
        <xsl:apply-templates select="ftid:tbody/ftid:row[descendant::ftid:GraphicSet or descendant::text()]" mode="TmpRev-phase" />
      </tbody>
    </xsl:if>
  </xsl:template>


  <xsl:template match="ftid:tbody">
    <!-- the <tbody> tag is inserted in the tgroup template -->
    <xsl:apply-templates mode="TmpRev-phase" select="ftid:row[descendant::ftid:GraphicSet or descendant::text()]" />
    <!-- skips rows with nothing in them -->
  </xsl:template>


  <xsl:template match="ftid:thead">
    <thead>
      <xsl:apply-templates mode="TmpRev-phase" select="ftid:row" />
    </thead>
  </xsl:template>

  
  <xsl:template match="ftid:row">
    <tr>
      <xsl:apply-templates mode="TmpRev-phase" select="ftid:entry" />
    </tr>
  </xsl:template>

  
  <xsl:template match="ftid:tfoot">
    <tfoot>
      <xsl:apply-templates mode="TmpRev-phase" select="ftid:row" />
    </tfoot>
  </xsl:template>

  
  <xsl:template match="ftid:tgroup/ftid:Effectivities">
    <xsl:param name="isOverridden" select="false()"/>
    <xsl:if test="not(following-sibling::*[self::ftid:Title]) or $isOverridden">
      <tr>
        <td colspan="{parent::ftid:tgroup/@cols}" style="border:0px">
          <p class="Effectivity">
            <xsl:choose>
              <xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight">
                <span class="RevMark" title="{@rev:revHighlight}">
                  <xsl:call-template name="EffectivityText"/>
                </span>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="EffectivityText"/>
              </xsl:otherwise>
            </xsl:choose>
          </p>
          <!-- Included EffectAirplaneList data to the O/P HTML to provide filter functionality-->
          <div class="EffectivityAirplanes" style="display:none">
            <xsl:call-template name="EffectivityAirplaneList"/>
          </div>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>

  <xsl:template name="RowColumnSpan">
    <xsl:if test="./@morerows &gt; 0">
      <xsl:attribute name="rowspan">
        <xsl:value-of select="./@morerows + 1" />
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="not(string-length(@nameend) = 0)">
      <xsl:attribute name="colspan">
        <xsl:value-of select="@nameend - @namest + 1" />
      </xsl:attribute>
    </xsl:if>
  </xsl:template>


  <xsl:template match="ftid:tbody/ftid:row/ftid:entry">
    <td>
      <xsl:call-template name="RowColumnSpan"/>
      <xsl:apply-templates mode="TmpRev-phase" />
    </td>
  </xsl:template>


  <xsl:template match="ftid:thead/ftid:row/ftid:entry">
    <th>
      <xsl:if test="@align='left'">
        <xsl:attribute name="style">
          text-align:left<xsl:if test="count(../ftid:entry) = 1">; border:none</xsl:if>
        </xsl:attribute>
      </xsl:if>
      <xsl:call-template name="RowColumnSpan"/>
      <xsl:apply-templates mode="TmpRev-phase" />
    </th>
  </xsl:template>


  <xsl:template match="ftid:tfoot/ftid:row/ftid:entry">
    <td class="TableFooter">
      <xsl:call-template name="RowColumnSpan"/>
      <xsl:apply-templates mode="TmpRev-phase"/>
    </td>
  </xsl:template>


  <xsl:template match="ftid:entry/ftid:Para/text()">
    <!-- uses non-breaking dashes to prevent unwanted separation of negative numbers-->
    <xsl:choose>
      <xsl:when test="$boolShowRevisionMarkings and following-sibling::processing-instruction('FTID-rev') = 'end'">
        <span  class="RevMark"  title="{@rev:revHighlight}">
          <!-- spaces added before and after to prevent losing spaces-->
          <xsl:value-of select="concat(' ', translate(., '-', '&#8209;'), ' ')"/>
        </span>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="translate(., '-', '&#8209;')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>



  <xsl:template match="ftid:EffectXRefList">
    <br />
    <table frame="all" style="border:solid 2px; padding:2px; width:100%" cellspacing="1">
      <thead />
      <tr>
        <xsl:for-each select="ftid:EffectXRefItem[1]/ftid:AircraftID">
          <th style="margin-bottom:1em;">
            <xsl:apply-templates select="@idDesc" mode="TmpRev-phase" />
          </th>
        </xsl:for-each>
      </tr>
      <xsl:apply-templates mode="TmpRev-phase" />
    </table>
    <br />
  </xsl:template>



  <xsl:template match="ftid:EffectXRefItem">
    <tr>
      <xsl:apply-templates mode="TmpRev-phase" />
    </tr>
  </xsl:template>



  <xsl:template match="ftid:AircraftID">
    <td style="text-align:center">
      <xsl:apply-templates select="@idValue" mode="TmpRev-phase"/>
    </td>
  </xsl:template>



  <xsl:template match="ftid:PerfData">
    <p>
      <xsl:apply-templates mode="TmpRev-phase" />
    </p>
  </xsl:template>



  <xsl:template match="ftid:GlossaryList">
    <br />
    <table class="GlossaryList Bordered">
      <tbody>
        <xsl:apply-templates mode="TmpRev-phase" />
      </tbody>
    </table>
    <br />
  </xsl:template>



  <xsl:template match="ftid:GlossaryItem">
    <tr>
      <xsl:apply-templates mode="TmpRev-phase" select="ftid:Term" />
      <!-- Definitions are handled in Term template -->
    </tr>
  </xsl:template>



  <xsl:template match="ftid:Guide">
    <th colspan="2" style="font-weight:bold; text-align:center; padding-top:0.25em; padding-bottom:0.25em">
      <xsl:apply-templates mode="TmpRev-phase" />
    </th>
  </xsl:template>


  <xsl:template match="ftid:Term">
    <td style="width:15%" class="GlossaryCell">
      <xsl:apply-templates mode="TmpRev-phase" />
    </td>
    <td class="GlossaryCell">
      <xsl:for-each select="following-sibling::ftid:Definition">
        <xsl:apply-templates mode="TmpRev-phase" />
      </xsl:for-each>
    </td>
  </xsl:template>


  <xsl:template match="ftid:Approvals">
    <div class="Approvals">
      <table class="Approvals" >
        <xsl:if test="$isEFBOutput">
          <xsl:attribute name="style">width:auto;</xsl:attribute>
        </xsl:if>
        <xsl:apply-templates mode="TmpRev-phase" />
      </table>
    </div>
  </xsl:template>


  <xsl:template match="ftid:ApprovalPersonnel">
    <tr class="ApprovalRow">
      <td class="ApprovedBy">
        <!-- IXP 4.3 - new Approval template can have multiple values for signed by role -->
        <xsl:choose>
          <xsl:when test="processing-instruction('FTID-customLabel')">
            <xsl:value-of select="substring-before(substring-after(processing-instruction('FTID-customLabel'),'approved_by-label='),'|')"/>
          </xsl:when>
          <xsl:otherwise>APPROVED BY</xsl:otherwise>
        </xsl:choose>
        :
      </td>
      <td>
        <div class="SignedBy">
          <xsl:value-of select="$original_signed-label"/>
        </div>
      </td>
    </tr>
    <tr>
      <td></td>
      <td class="ApprovalInfo">
        <xsl:apply-templates mode="TmpRev-phase" select="ftid:SignatureName" />
        <br />
        <xsl:apply-templates mode="TmpRev-phase" select="ftid:SignaturePosition" />
      </td>
    </tr>
  </xsl:template>


  <xsl:template match="ftid:BulletinItem|ftid:SBItem">
    <tr>
      <xsl:apply-templates mode="TmpRev-phase" />
    </tr>
  </xsl:template>


  <xsl:template match="ftid:EICASListItem">
    <tr>
      <xsl:apply-templates mode="TmpRev-phase" select="ftid:Effectivities|ftid:EICASMessage|ftid:EICASLevelWithRefs[1]" />
    </tr>
    <xsl:for-each select="ftid:EICASLevelWithRefs[position() &gt; 1]">
      <tr>
        <xsl:apply-templates mode="TmpRev-phase" />
      </tr>
    </xsl:for-each>
  </xsl:template>


  <xsl:template match="ftid:BulletinItem/ftid:BulletinNumber|ftid:BulletinItem/ftid:BulletinSubject|ftid:BulletinRefNo|ftid:BulletinItem/ftid:BulletinDate|ftid:BulletinStatus|ftid:SBNo|ftid:SBTitle|ftid:SBDate|ftid:EICASLevel">
    <td>
      <xsl:apply-templates mode="TmpRev-phase" />
    </td>
  </xsl:template>


  <xsl:template match="ftid:EICASMessage">
    <td rowspan="{count(../ftid:EICASLevelWithRefs)}">
      <xsl:apply-templates mode="TmpRev-phase" />
    </td>
  </xsl:template>


  <xsl:template match="ftid:MMELItemRef">
    <!-- IXP 4.3.1 - new rev bar -->
    <xsl:choose>
      <xsl:when test="$boolShowRevisionMarkings and ./@rev:revHighlight and child::processing-instruction('FTID-rev')[starts-with(.,'start')]">
        <span  class="RevMark"  title="{@rev:revHighlight}">
          <td>
            <xsl:apply-templates mode="TmpRev-phase" />
          </td>
        </span>
      </xsl:when>
      <xsl:otherwise>
        <td>
          <xsl:apply-templates mode="TmpRev-phase" />
        </td>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template match="ftid:EICASList">
    <xsl:if test="processing-instruction('FTID-xref')" >
      <span id="{processing-instruction('FTID-xref')}"/>
    </xsl:if>
    <table class="EICASList" id="{@id}">
      <thead>
        <tr>
          <th>
            <xsl:value-of select="ftid:EICASListItem[1]/ftid:EICASMessage" />
          </th>
          <th>
            <xsl:value-of select="ftid:EICASListItem[1]/ftid:EICASLevelWithRefs/ftid:EICASLevel" />
          </th>
          <th>
            <xsl:value-of select="ftid:EICASListItem[1]/ftid:EICASLevelWithRefs/ftid:MMELItemRef" />
          </th>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates mode="TmpRev-phase" select="ftid:EICASListItem[position() &gt; 1]" />
      </tbody>
    </table>
  </xsl:template>


  <xsl:template match="ftid:EffectXRefList">
    <table frame="all" class="EffectXRefList">
      <thead/>
      <tr>
        <xsl:for-each select="ftid:EffectXRefItem[1]/ftid:AircraftID">
          <th>
            <xsl:apply-templates select="@idDesc" mode="TmpRev-phase"/>
            <br/>
          </th>
        </xsl:for-each>
      </tr>
      <xsl:apply-templates mode="TmpRev-phase"/>
    </table>
    <br/>
  </xsl:template>


  <xsl:template match="ftid:EffectXRefItem">
    <tr>
      <xsl:apply-templates mode="TmpRev-phase"/>
    </tr>
  </xsl:template>


  <xsl:template match="ftid:AircraftID">
    <td>
      <xsl:attribute name="style">text-align:center</xsl:attribute>
      <p>
        <xsl:apply-templates select="@idValue" mode="TmpRev-phase"/>
      </p>
    </td>
  </xsl:template>


  <xsl:template match="ftid:GlossaryList">
    <table class="GlossaryList">
      <xsl:apply-templates mode="TmpRev-phase"/>
    </table>
  </xsl:template>


  <xsl:template match="ftid:GlossaryItem">
    <tr>
      <xsl:apply-templates mode="TmpRev-phase" select="ftid:Term"/>
      <!-- Definitions are handled in Term template -->
    </tr>
  </xsl:template>


  <xsl:template match="ftid:Guide">
    <!-- throws in a "dummy" row to make it look like separate tables
				 in the event of multiple Guide elements in one GlossaryList-->
    <xsl:if test="preceding-sibling::*">
      <tr style="border:none;height:1em;">
        <td style="border:none">&#160;</td>
      </tr>
    </xsl:if>
    <th colspan="2">
      <xsl:apply-templates mode="TmpRev-phase"/>
    </th>
  </xsl:template>


  <xsl:template match="ftid:Term">
    <td style="width:15%">
      <p>
        <xsl:apply-templates mode="TmpRev-phase"/>
      </p>
    </td>
    <td style="width:85%">
      <xsl:for-each select="following-sibling::ftid:Definition">
        <p>
          <xsl:apply-templates mode="TmpRev-phase"/>
        </p>
      </xsl:for-each>
    </td>
  </xsl:template>

  <xsl:template match="ftid:BulletinList | SBList">
    <table class="BulletinList">
      <thead>
        <tr>
          <th>Number</th>
          <xsl:choose>
            <xsl:when test="self::ftid:BulletinList">
              <th>Subject</th>
              <xsl:if test="ftid:BulletinItem/ftid:BulletinRefNo/text()">
                <th>Ref. No.</th>
              </xsl:if>
            </xsl:when>
            <xsl:otherwise>
              <th>Title</th>
            </xsl:otherwise>
          </xsl:choose>
          <th>Date</th>
          <xsl:if test="self::ftid:BulletinList">
            <th>Status</th>
          </xsl:if>
        </tr>
      </thead>
      <xsl:apply-templates mode="TmpRev-phase"/>
    </table>
  </xsl:template>


  <xsl:template match="ftid:BulletinItem|ftid:SBItem">
    <tr>
      <xsl:apply-templates mode="TmpRev-phase"/>
    </tr>
  </xsl:template>

  <xsl:template match="ftid:BulletinRefNo">
    <xsl:if test="../../ftid:BulletinItem/ftid:BulletinRefNo/text()">
      <td>
        <p>
          <xsl:apply-templates mode="TmpRev-phase"/>
        </p>
      </td>
    </xsl:if>
  </xsl:template>

  <xsl:template match="ftid:BulletinItem/*[not(self::ftid:BulletinRefNo)] | ftid:SBItem/*">
    <td>
      <p>
        <xsl:apply-templates mode="TmpRev-phase"/>
      </p>
    </td>
  </xsl:template>

</xsl:stylesheet>