<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ftid="http://www.boeing.com/FTID-ML" version="1.0" xmlns:exslt="http://exslt.org/common">
  <!--
    Jeppesen Proprietary and Confidential
	Copyright Jeppesen Sanderson, Inc., 2005
	All Rights Reserved.

	Modified by Boeing for FTID data
-->
  <xsl:variable name="colWidth" select="18"/>
  <xsl:variable name="totalColWidth" select="20"/>
  <xsl:variable name="maxCols">
	  <xsl:choose>
		  <xsl:when test="floor(($screenWidth - (floor($screenWidth div $totalColWidth) + 1)) div $totalColWidth) &lt; 4"><xsl:value-of select="floor(($screenWidth - (floor($screenWidth div $totalColWidth) + 1)) div $totalColWidth)"/></xsl:when>
		  <xsl:otherwise>4</xsl:otherwise>
	  </xsl:choose>
  </xsl:variable> 
  <xsl:template match="ftid:tgroup">
    <xsl:param name="colStart" select="1"/>
    <xsl:variable name="columnCount">
      <xsl:choose>
        <xsl:when test="@cols">
          <xsl:value-of select="@cols"/>
        </xsl:when>
        <xsl:when test="ftid:row/ftid:entry">
          <xsl:value-of select="count(ftid:row/ftid:entry)"/>
        </xsl:when>
        <xsl:otherwise><xsl:value-of select="$maxCols"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="pageSpan">
      <xsl:choose>
        <xsl:when test="($columnCount - $colStart) &lt; $maxCols">
          <xsl:value-of select="$columnCount +1 - $colStart"/>
        </xsl:when>
        <xsl:otherwise><xsl:value-of select="$maxCols"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:apply-templates select="ftid:thead">
      <xsl:with-param name="colStart" select="number($colStart)"/>
      <xsl:with-param name="span" select="number($pageSpan)"/>
    </xsl:apply-templates>
    <xsl:apply-templates select="ftid:tbody">
      <xsl:with-param name="colStart" select="number($colStart)"/>
      <xsl:with-param name="span" select="number($pageSpan)"/>
    </xsl:apply-templates>
    <xsl:apply-templates select="ftid:tfoot">
      <xsl:with-param name="colStart" select="number($colStart)"/>
      <xsl:with-param name="span" select="number($pageSpan)"/>
    </xsl:apply-templates>
    <xsl:choose>
      <xsl:when test="($colStart + $maxCols) &lt;= $columnCount">
        <xsl:text>&#xd;... Continue ...&#xd;</xsl:text>
        <xsl:apply-templates select=".">
          <xsl:with-param name="colStart" select="$colStart + $maxCols"/>
        </xsl:apply-templates>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  
  
  <xsl:template match="ftid:tbody">
    <xsl:param name="colStart"/>
    <xsl:param name="span"/>
    <xsl:if test="not(parent::ftid:tgroup/ftid:thead)">
      <xsl:call-template name="insertHeadingSeparator">
        <xsl:with-param name="span" select="$span"/>
      </xsl:call-template>
    </xsl:if>
    <xsl:apply-templates select="ftid:row">
      <xsl:with-param name="colStart" select="$colStart"/>
      <xsl:with-param name="span" select="$span"/>
    </xsl:apply-templates>
  </xsl:template>
  
  
  <xsl:template match="ftid:thead | ftid:tfoot">
    <xsl:param name="colStart"/>
    <xsl:param name="span"/>
    <xsl:call-template name="insertHeadingSeparator">
      <xsl:with-param name="span" select="$span"/>
    </xsl:call-template>
    <xsl:apply-templates select="ftid:row">
      <xsl:with-param name="colStart" select="$colStart"/>
      <xsl:with-param name="span" select="$span"/>
    </xsl:apply-templates>
    <xsl:call-template name="insertHeadingSeparator">
      <xsl:with-param name="span" select="$span"/>
    </xsl:call-template>
  </xsl:template>
  
  
  <xsl:template match="ftid:row">
    <xsl:param name="colStart"/>
    <xsl:param name="span"/>
    
	<!-- we know there are only four entries at the max.  And we need to print rows until all entries have printed their content -->
    <!-- For a colStart, you can retrieve the entry that applies using:
        - If a colname attribute is present, get the entry with the colname = colStart + index
        - Else if there exists an entry where position is a value in the interval defined by namest and nameend attributes then grab that entry
        - Else if there is a preceding row with an entry with a morerows falling on this row, display an empty entry
        - Else grab the entry at the position colStart + index
    -->
    <!-- Display all the content in the first column that applies, leave the other columns empty -->
    <xsl:variable name="string1">
      <!-- The entire string of cell 1 in this row, ends with ***PIPE=1*** or ***PIPE=0***-->
      <xsl:apply-templates select="." mode="display">
        <xsl:with-param name="colNum" select="number($colStart)"/>
      </xsl:apply-templates>
    </xsl:variable>
    <xsl:variable name="string2">
      <!-- The entire string of cell 2 in this row -->
      <xsl:if test="$span > 1">
        <xsl:apply-templates select="." mode="display">
          <xsl:with-param name="colNum" select="number($colStart + 1)"/>
        </xsl:apply-templates>
      </xsl:if>
    </xsl:variable>
    <xsl:variable name="string3">
      <!-- The entire string of cell 3 in this row -->
      <xsl:if test="$span > 2">
        <xsl:apply-templates select="." mode="display">
          <xsl:with-param name="colNum" select="number($colStart + 2)"/>
        </xsl:apply-templates>
      </xsl:if>
    </xsl:variable>
    <xsl:variable name="string4">
      <!-- The entire string of cell 4 in this row -->
      <xsl:if test="$span > 3">
        <xsl:apply-templates select="." mode="display">
          <xsl:with-param name="colNum" select="number($colStart + 3)"/>
        </xsl:apply-templates>
      </xsl:if>
    </xsl:variable>
    <xsl:call-template name="row-chopper">
      <xsl:with-param name="remainingString1" select="$string1"/>
      <xsl:with-param name="string1col" select="number($colStart)"/>
      <xsl:with-param name="remainingString2" select="$string2"/>
      <xsl:with-param name="string2col" select="number($colStart + 1)"/>
      <xsl:with-param name="remainingString3" select="$string3"/>
      <xsl:with-param name="string3col" select="number($colStart + 2)"/>
      <xsl:with-param name="remainingString4" select="$string4"/>
      <xsl:with-param name="string4col" select="number($colStart + 3)"/>
      <xsl:with-param name="span" select="$span"/>
    </xsl:call-template>
    <xsl:call-template name="insertLineSeparator">
      <xsl:with-param name="span" select="$span"/>
    </xsl:call-template>
  </xsl:template>
  
  
  <xsl:template match="ftid:row" mode="display">
    <xsl:param name="colNum"/>
    <xsl:choose>
      <xsl:when test="ftid:entry[@colname = $colNum]">
        <!-- 1 2 -->
        <xsl:apply-templates select="ftid:entry[@colname = $colNum]" mode="display"/>
        <xsl:text>***PIPE=1***</xsl:text>
      </xsl:when>
      <xsl:when test="ftid:entry[@namest = $colNum]">
        <xsl:apply-templates select="ftid:entry[@namest = $colNum]" mode="display"/>
        <xsl:text>***PIPE=0***</xsl:text>
      </xsl:when>
      <xsl:when test="ftid:entry[$colNum &gt; @namest and $colNum &lt;@nameend]">
        <!-- We are in the middle of the interval, display an empty cell -->
        <xsl:text>***PIPE=0***</xsl:text>
      </xsl:when>
      <xsl:when test="ftid:entry[$colNum=@nameend]">
        <!-- We are in the middle of the interval, display an empty cell -->
        <xsl:text>***PIPE=1***</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <!-- No column name or no column because of a previous morerows or no column left -->
        <xsl:variable name="spanningEntry">
          <xsl:for-each select="preceding-sibling::ftid:row">
            <xsl:variable name="pos" select="position()"/>
            <xsl:choose>
              <xsl:when test="ftid:entry[@colname = $colNum][@morerows &gt;= $pos]">single</xsl:when>
            </xsl:choose>
            <xsl:choose>
              <xsl:when test="ftid:entry[@namest &lt;= $colNum and @nameend &gt; $colNum][@morerows &gt;= $pos]">spanning</xsl:when>
            </xsl:choose>
            <xsl:choose>
              <xsl:when test="ftid:entry[@namest &lt;= $colNum and @nameend = $colNum][@morerows &gt;= $pos]">endspanning</xsl:when>
            </xsl:choose>
          </xsl:for-each>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="starts-with($spanningEntry, 'single')">
            <!-- empty cell with pipe -->
            <xsl:text>***PIPE=1***</xsl:text>
          </xsl:when>
          <xsl:when test="starts-with($spanningEntry, 'spanning')">
            <!-- empty cell without pipe -->
            <xsl:text>***PIPE=0***</xsl:text>
          </xsl:when>
		  <xsl:when test="starts-with($spanningEntry, 'endspanning')">
            <!-- empty cell with pipe -->
            <xsl:text>***PIPE=1***</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:variable name="previousColname" select="ftid:entry[@colname &lt; $colNum ][last()]"/>
            <xsl:variable name="previousNameend" select="ftid:entry[@nameend &lt; $colNum ][last()]"/>
            <xsl:choose>
              <xsl:when test="not($previousColname) and not($previousNameend)">
                <!-- no previously named entry, grab the entry at the colNum position-->
                <xsl:apply-templates select="ftid:entry[$colNum]" mode="display"/>
                <xsl:text>***PIPE=1***</xsl:text>
              </xsl:when>
              <xsl:when test="$previousNameend and not($previousColname) ">
                <!-- start from the previousNameend-->
                <xsl:if test="$previousNameend/following-sibling::ftid:entry">
                  <xsl:apply-templates select="$previousNameend/following-sibling::ftid:entry[$colNum - $previousNameend/@nameend]" mode="display"/>
                  <xsl:text>***PIPE=1***</xsl:text>
                </xsl:if>
              </xsl:when>
              <xsl:when test="$previousColname and not($previousNameend) ">
                <!-- start from the previousColname -->
                <xsl:if test="$previousColname/following-sibling::ftid:entry">
                  <xsl:apply-templates select="$previousColname/following-sibling::ftid:entry[$colNum - $previousColname/@colname]" mode="display"/>
                  <xsl:text>***PIPE=1***</xsl:text>
                </xsl:if>
              </xsl:when>
              <xsl:otherwise>
                <!-- get the entry closest to the colNum -->
                <xsl:choose>
                  <xsl:when test="number($previousColname/@colname) > number($previousNameend/@nameend)">
                    <!-- start from the previousColname -->
                    <xsl:apply-templates select="$previousColname/following-sibling::ftid:entry[$colNum - $previousColname/@colname]" mode="display"/>
                    <xsl:text>***PIPE=1***</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <!-- start from the previousNameend -->
                    <xsl:apply-templates select="$previousNameend/following-sibling::ftid:entry[$colNum - $previousNameend/@nameend]" mode="display"/>
                    <xsl:text>***PIPE=1***</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  
  <xsl:template match="ftid:entry" mode="display">
    <!-- value of all children of the entry with para and listitem child converted -->
    <xsl:variable name="flattened-entry">
		<entry-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
			<entry>
				<Para>
					<xsl:for-each select=".//ftid:Para|.//ftid:Warning|.//ftid:Caution|.//ftid:Note|.//ftid:GraphicSet|.//text()[not(ancestor::ftid:GraphicSet or parent::ftid:Para or parent::ftid:Emphasis/parent::ftid:Para or parent::ftid:iLink/parent::ftid:Para or parent::*/parent::ftid:Effectivities/parent::ftid:Para)]">
						<xsl:if test="not(position() = 1)"><xsl:text> _ </xsl:text></xsl:if>
						<xsl:choose>
							<xsl:when test="self::ftid:GraphicSet"><xsl:text>[ Inline Graphic(s) ]</xsl:text></xsl:when>
							<xsl:when test="self::ftid:Warning"><xsl:text>WARNING: </xsl:text></xsl:when>
							<xsl:when test="self::ftid:Caution"><xsl:text>CAUTION: </xsl:text></xsl:when>
							<xsl:when test="self::ftid:Note"><xsl:text>Note: </xsl:text></xsl:when>
							<xsl:when test="self::ftid:Para">
								<xsl:if test="@recall='Y'">#</xsl:if>
								<xsl:for-each select=".//text()">
									<xsl:if test="not(position() = 1)">
										<xsl:choose>
											<xsl:when test="not(parent::ftid:Emphasis or parent::ftid:iLink or preceding-sibling::ftid:Emphasis or preceding-sibling::ftid:iLink)"><xsl:text> _ </xsl:text></xsl:when>
											<xsl:otherwise><xsl:text> </xsl:text></xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:value-of select="normalize-space(.)"/>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise><xsl:value-of select="normalize-space(.)"/></xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</Para>
			</entry>
		</entry-node-set>
    </xsl:variable>
    <xsl:variable name="line">
      <xsl:for-each select="exslt:node-set($flattened-entry)/ftid:entry-node-set/ftid:entry/ftid:Para/node()">
        <xsl:apply-templates select="." mode="convert"/>
        <xsl:text> </xsl:text>
      </xsl:for-each>
    </xsl:variable>
    <xsl:value-of select="$line"/>
  </xsl:template>
    
  
  <!--
	======================================================================
	  "Pseudo-tables" section - Structures not marked up as tables but displayed as tables
	======================================================================
  -->
	<xsl:template match="ftid:GlossaryList">
		<xsl:variable name="GlossaryList-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all">
				  <tgroup cols="2">
					<tbody>
						<xsl:for-each select="*">
							<row>
								<xsl:choose>
									<xsl:when test="self::ftid:Guide">
										<entry namest="1" nameend="2" align="center"><Para><xsl:value-of select="."/></Para></entry>
									</xsl:when>
									<xsl:otherwise><!-- GlossaryItem -->
										<entry colname="1"><Para><xsl:value-of select="ftid:Term"/></Para></entry>
										<entry colname="2">
											<Para><xsl:for-each select="ftid:Definition"><xsl:if test="preceding-sibling::ftid:Definition"> _ </xsl:if><xsl:value-of select="."/></xsl:for-each></Para>
										</entry>
									</xsl:otherwise>
								</xsl:choose>
							</row>
						</xsl:for-each>
					</tbody>
				  </tgroup>
				</table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($GlossaryList-converted-to-table)/ftid:table-node-set/ftid:table"/>
	</xsl:template>

	<xsl:template match="ftid:BulletinList">
		<xsl:variable name="BulletinList-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all">
				  <tgroup cols="5">
				    <thead>
						<row>
							<entry colname="1"><Para>Number</Para></entry>
							<entry colname="2"><Para>Subject</Para></entry>
							<entry colname="3"><Para>Ref. No</Para></entry>
							<entry colname="4"><Para>Date</Para></entry>
							<entry colname="5"><Para>Status</Para></entry>
						</row>
				    </thead>
					<tbody>
						<xsl:for-each select="ftid:BulletinItem">
							<row>
								<entry colname="1"><Para><xsl:value-of select="ftid:BulletinNumber"/></Para></entry>
								<entry colname="2"><Para><xsl:value-of select="ftid:BulletinSubject"/></Para></entry>
								<entry colname="3"><Para><xsl:value-of select="ftid:BulletinRefNo"/></Para></entry>
								<entry colname="4"><Para><xsl:value-of select="ftid:BulletinDate"/></Para></entry>
								<entry colname="5"><Para><xsl:value-of select="ftid:BulletinStatus"/></Para></entry>
							</row>
						</xsl:for-each>
					</tbody>
				  </tgroup>
				</table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($BulletinList-converted-to-table)/ftid:table-node-set/ftid:table"/>
	</xsl:template>


	<xsl:template match="ftid:DispatchCondition">
	  <xsl:param name="level" select="0"/>
	  <xsl:param name="position" select="1"/>
	  <xsl:if test="@repairInterval or @nbrInstalled or @nbrRequired or @maintIndicator or @opsIndicator or @techIndicator">
		<xsl:if test="@dispCondOptions">
			<xsl:if test="(parent::ftid:MELItem or parent::ftid:MELSubItem) and preceding-sibling::ftid:DispatchCondition">
				<xsl:apply-templates mode="forDescendants" select="parent::*/ftid:Title"/>
			</xsl:if>
			<xsl:variable name="title">
				<xsl:value-of select="../@itemNbr"/><xsl:value-of select="@dispCondOptions"/>: <xsl:value-of select="ftid:Title"/>
			</xsl:variable>
			<xsl:call-template name="chopper">
				<xsl:with-param name="level" select="$level"/>
				<xsl:with-param name="remainingString" select="normalize-space($title)"/>
				<xsl:with-param name="align" select="'center'"/>
			</xsl:call-template>
			<xsl:text>&#xd;</xsl:text>
		</xsl:if>
		<xsl:text>&#xd;</xsl:text>
		<xsl:variable name="DispatchCondition-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all">
				  <tgroup cols="4">
					<thead>
					  <row>
						<entry colname="1">
						  <Para align="center">Interval</Para>
						</entry>
						<entry colname="2">
						  <Para align="center">Installed</Para>
						</entry>
						<entry colname="3">
						  <Para align="center">Required</Para>
						</entry>
						<entry colname="4">
						  <Para align="center">Procedure</Para>
						</entry>
					  </row>
					</thead>
					<tbody>
					  <row>
						<entry colname="1">
						  <Para align="left"><xsl:value-of select="@repairInterval"/></Para>
						</entry>
						<entry colname="2">
						  <Para align="left"><xsl:value-of select="@nbrInstalled"/></Para>
						</entry>
						<entry colname="3">
						  <Para align="left"><xsl:value-of select="@nbrRequired"/></Para>
						</entry>
						<entry colname="4">
						  <Para align="left"><xsl:value-of select="@maintIndicator"/> <xsl:value-of select="@opsIndicator"/> <xsl:value-of select="@techIndicator"/></Para>
						</entry>
					  </row>
					</tbody>
				  </tgroup>
				</table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($DispatchCondition-converted-to-table)/ftid:table-node-set/ftid:table"/>	
		<xsl:text>&#xd;</xsl:text>
	  </xsl:if>	
      <xsl:apply-templates select="node()[not(self::ftid:Title)]">
        <xsl:with-param name="level" select="$level"/>
        <xsl:with-param name="position" select="$position"/>
      </xsl:apply-templates>
	</xsl:template>
	
	
	<xsl:template match="ftid:EffectXRefList">
		<xsl:param name="level" select="0"/>
		<xsl:param name="position" select="1"/>
		<xsl:variable name="EffectXRefList-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all">
				  <tgroup cols="{count(ftid:EffectXRefItem[1]/ftid:AircraftID)}">
					<thead>
					  <row>
						<xsl:for-each select="ftid:EffectXRefItem[1]/ftid:AircraftID">
							<entry>
							  <Para align="center"><xsl:value-of select="@idDesc"/></Para>
							</entry>
						</xsl:for-each>
					  </row>
					</thead>
					<tbody>
					  <xsl:for-each select="ftid:EffectXRefItem">
						<row>
							<xsl:for-each select="ftid:AircraftID"><entry><Para><xsl:value-of select="@idValue"/></Para></entry></xsl:for-each>
						</row>
					  </xsl:for-each>
					</tbody>
				  </tgroup>
				</table>
			</table-node-set>
		</xsl:variable>
		<xsl:apply-templates select="exslt:node-set($EffectXRefList-converted-to-table)/ftid:table-node-set/ftid:table"/>
	</xsl:template>
  
  
	<xsl:template match="ftid:EICASList">
		<xsl:variable name="EICASList-converted-to-table">
			<table-node-set xmlns="http://www.boeing.com/FTID-ML" xmlns:rev="http://www.boeing.com/FTID-ML/Revision">
				<table frame="all">
				  <tgroup cols="3">
					<thead>
					  <row>
						<entry colname="1">
						  <Para align="center"><xsl:value-of select="ftid:EICASListItem[1]/ftid:EICASMessage"/></Para>
						</entry>
						<entry colname="2">
						  <Para align="center"><xsl:value-of select="ftid:EICASListItem[1]/ftid:EICASLevelWithRefs/ftid:EICASLevel"/></Para>
						</entry>
						<entry colname="3">
						  <Para align="center"><xsl:value-of select="ftid:EICASListItem[1]/ftid:EICASLevelWithRefs/ftid:MMELItemRef"/></Para>
						</entry>
					  </row>
					</thead>
					<tbody>
					  <xsl:for-each select=".//ftid:EICASLevelWithRefs[parent::ftid:EICASListItem[preceding-sibling::ftid:EICASListItem]]">
						  <row>
							<entry colname="1">
							  <Para align="left"><xsl:value-of select="../ftid:EICASMessage//text()"/></Para>
							</entry>
							<entry colname="2">
							  <Para align="left"><xsl:value-of select="ftid:EICASLevel//text()"/></Para>
							</entry>
							<entry colname="3">
								<Para>
								  <xsl:for-each select="ftid:MMELItemRef//ftid:iLink|ftid:MMELItemRef/ftid:Para"><xsl:if test="(self::ftid:Para and preceding-sibling::ftid:Para) or (not(self::ftid:Para) and preceding-sibling::*)"> _ </xsl:if><xsl:if test="@recall = 'Y'"> #</xsl:if><xsl:value-of select="."/></xsl:for-each>
								</Para>
							</entry>
						  </row>
					  </xsl:for-each>
					</tbody>
				  </tgroup>
				</table>
			</table-node-set>
		</xsl:variable>
		<xsl:call-template name="insertRule"/><xsl:text>&#xd;</xsl:text>
		<xsl:apply-templates select="exslt:node-set($EICASList-converted-to-table)/ftid:table-node-set/ftid:table"/>
		<xsl:text>&#xd;</xsl:text><xsl:text>&#xd;</xsl:text>
	</xsl:template>


  <!--
	======================================================================
		Named templates for use in table printing
	======================================================================
  -->
  <xsl:template name="row-chopper">
    <!-- prints the content of the row line by line -->
    <xsl:param name="remainingString1"/>
    <xsl:param name="string1col"/>
    <xsl:param name="remainingString2"/>
    <xsl:param name="string2col"/>
    <xsl:param name="remainingString3"/>
    <xsl:param name="string3col"/>
    <xsl:param name="remainingString4"/>
    <xsl:param name="string4col"/>
    <xsl:param name="span"/>
    <xsl:text>| </xsl:text>
    <xsl:variable name="string1">
      <xsl:call-template name="cell-chopper">
        <xsl:with-param name="remainingString" select="normalize-space($remainingString1)"/>
        <xsl:with-param name="colNum" select="$string1col"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:value-of select="$string1"/>
    <xsl:variable name="string2">
      <xsl:call-template name="cell-chopper">
        <xsl:with-param name="remainingString" select="normalize-space($remainingString2)"/>
        <xsl:with-param name="colNum" select="$string2col"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:value-of select="$string2"/>
    <xsl:variable name="string3">
      <xsl:call-template name="cell-chopper">
        <xsl:with-param name="remainingString" select="normalize-space($remainingString3)"/>
        <xsl:with-param name="colNum" select="$string3col"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:value-of select="$string3"/>
    <xsl:variable name="string4">
      <xsl:call-template name="cell-chopper">
        <xsl:with-param name="remainingString" select="normalize-space($remainingString4)"/>
        <xsl:with-param name="colNum" select="$string4col"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:value-of select="$string4"/>
    <xsl:text>&#xd;</xsl:text>
    <xsl:if test="substring-before(normalize-space($remainingString1), '***PIPE=') or substring-before(normalize-space($remainingString2), '***PIPE=') or substring-before(normalize-space($remainingString3), '***PIPE=') or substring-before(normalize-space($remainingString4), '***PIPE=')"><!-- Another line needed to complete row's content -->
      <xsl:call-template name="row-chopper">
        <xsl:with-param name="remainingString1">
          <xsl:choose>
            <xsl:when test="substring($string1, string-length($string1) - 2) = ' | ' and substring($string1, string-length($string1) - 3) = '- | '">
              <xsl:value-of select="substring($remainingString1, string-length(normalize-space($string1))-2)"/>
            </xsl:when>
            <xsl:when test="substring($string1, string-length($string1) - 2) = ' | '">
              <xsl:value-of select="substring($remainingString1, string-length(normalize-space($string1)))"/>
            </xsl:when>
            <xsl:when test="substring(normalize-space($string1), string-length(normalize-space($string1))) = '-'">
              <xsl:value-of select="substring($remainingString1, string-length(normalize-space($string1)))"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="substring($remainingString1, string-length(normalize-space($string1))+2)"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
        <xsl:with-param name="string1col" select="$string1col"/>
        <xsl:with-param name="remainingString2">
          <xsl:choose>
            <xsl:when test="substring($string2, string-length($string2) - 2) = ' | ' and substring($string2, string-length($string2) - 3) = '- | '">
              <xsl:value-of select="substring($remainingString2, string-length(normalize-space($string2))-2)"/>
            </xsl:when>
            <xsl:when test="substring($string2, string-length($string2) - 2) = ' | '">
              <xsl:value-of select="substring($remainingString2, string-length(normalize-space($string2)))"/>
            </xsl:when>
            <xsl:when test="substring(normalize-space($string2), string-length(normalize-space($string2))) = '-'">
              <xsl:value-of select="substring($remainingString2, string-length(normalize-space($string2)))"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="substring($remainingString2, string-length(normalize-space($string2))+2)"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
        <xsl:with-param name="string2col" select="$string2col"/>
        <xsl:with-param name="remainingString3">
          <xsl:choose>
            <xsl:when test="substring($string3, string-length($string3) - 2) = ' | ' and substring($string3, string-length($string3) - 3) = '- | '">
              <xsl:value-of select="substring($remainingString3, string-length(normalize-space($string3))-2)"/>
            </xsl:when>
            <xsl:when test="substring($string3, string-length($string3) - 2) = ' | '">
              <xsl:value-of select="substring($remainingString3, string-length(normalize-space($string3)))"/>
            </xsl:when>
            <xsl:when test="substring(normalize-space($string3), string-length(normalize-space($string3))) = '-'">
              <xsl:value-of select="substring($remainingString3, string-length(normalize-space($string3)))"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="substring($remainingString3, string-length(normalize-space($string3))+2)"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
        <xsl:with-param name="string3col" select="$string3col"/>
        <xsl:with-param name="remainingString4">
          <xsl:choose>
            <xsl:when test="substring($string4, string-length($string4) - 2) = ' | ' and substring($string4, string-length($string4) - 3) = '- | '">
              <xsl:value-of select="substring($remainingString4, string-length(normalize-space($string4))-2)"/>
            </xsl:when>
            <xsl:when test="substring($string4, string-length($string4) - 2) = ' | '">
              <xsl:value-of select="substring($remainingString4, string-length(normalize-space($string4)))"/>
            </xsl:when>
            <xsl:when test="substring(normalize-space($string4), string-length(normalize-space($string4))) = '-'">
              <xsl:value-of select="substring($remainingString4, string-length(normalize-space($string4)))"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="substring($remainingString4, string-length(normalize-space($string4))+2)"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
        <xsl:with-param name="string4col" select="$string4col"/>
        <xsl:with-param name="span" select="$span"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  
  
  <xsl:template name="cell-chopper">
    <!-- renders one line at a time in a cell  -->
    <xsl:param name="remainingString"/>
    <xsl:param name="colNum"/>
    <!-- For testing of spanning entry text wrapping -->
    <!--<xsl:param name="colWidth">
		<xsl:choose>
			<xsl:when test="string-length(ftid:entry[$colNum]/@nameend) &gt; 0 and string-length(ftid:entry[$colNum]/@namest) &gt; 0">
				<xsl:value-of select="$colWidth + $colWidth * (ftid:entry[$colNum]/@nameend - ftid:entry[$colNum]/@namest)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$colWidth"/>
			</xsl:otherwise>
		</xsl:choose>
    </xsl:param>-->
    <xsl:variable name="string" select="substring-before($remainingString, '***PIPE=')"/>
    <xsl:variable name="index">
      <xsl:choose>
        <xsl:when test="string-length($string) &lt;= $colWidth"><xsl:value-of select="string-length($string)"/></xsl:when>
       <xsl:otherwise>
        <xsl:variable name="substring" select="substring(normalize-space($string), 0, $colWidth)"/>
        <xsl:variable name="breakPoint">
			<xsl:call-template name="lastIndexOfSpace">
				<xsl:with-param name="original"><xsl:value-of select="$substring"/></xsl:with-param>
				<xsl:with-param name="input"><xsl:value-of select="$substring"/></xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="$breakPoint"/>
       </xsl:otherwise>
     </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$index = -1"><xsl:value-of select="substring($string, 1, $colWidth - 1)"/>-</xsl:when>
      <xsl:when test="$index = string-length($string)">
        <xsl:value-of select="$string"/>
        <xsl:call-template name="fillCell">
          <xsl:with-param name="charWidth" select="$colWidth - string-length($string)"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="substring($string, 1, $index + 1)"/>
        <xsl:call-template name="fillCell">
          <xsl:with-param name="charWidth" select="$colWidth - $index -1"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="starts-with(substring-after($remainingString, '***PIPE='), '1')">
        <xsl:text> | </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>   </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  
  <xsl:template name="fillCell">
    <xsl:param name="charWidth" select="$colWidth"/>
    <!-- empty cell -->
    <xsl:variable name="spaceString" select="'                                        '"/>
    <xsl:value-of select="substring($spaceString, 1, $charWidth)"/>
  </xsl:template>
  
  
  <xsl:template name="insertLineSeparator">
    <xsl:param name="span"/>
    <xsl:variable name="spaceString" select="'--------------------------------------------------------------------------------------------'"/>
    <xsl:value-of select="substring($spaceString, 1, ($span * $totalColWidth) + $span + 1)"/>
    <xsl:text>&#xd;</xsl:text>
  </xsl:template>
  
  
  <xsl:template name="insertHeadingSeparator">
    <xsl:param name="span"/>
    <xsl:variable name="spaceString" select="'============================================================================================'"/>
    <xsl:value-of select="substring($spaceString, 1, ($span * $totalColWidth) + $span + 1)"/>
    <xsl:text>&#xd;</xsl:text>
  </xsl:template>
  
  
</xsl:stylesheet>
