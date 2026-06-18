<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
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
  <!--      Tags related to markers of Performance table    -->
  <!-- ==================================================== -->

  <xsl:template match="ftid:ADVISORY|ftid:PMC-OFF|ftid:ALL-ENGINES|ftid:ALT-MODE-EEC|ftid:ALT-EEC-MODE|ftid:ALT-THRUST-SETTING|
                       ftid:GEARDOWN|ftid:ENGINE-INOP|ftid:ENGINE-INOP1|ftid:ENGINE-INOP2|ftid:GO-AROUND-THRUST|
                       ftid:MAX-CONT-THRUST|ftid:SPARE-ENGINE-CARRIAGE">
    <p>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="self::ftid:ADVISORY|self::ftid:GO-AROUND-THRUST|self::ftid:MAX-CONT-THRUST">Advisory</xsl:when>
          <xsl:otherwise>InvertedTitle</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="self::ftid:ADVISORY"><xsl:value-of select="$advisory_marker-label"/></xsl:when>
        <xsl:when test="self::ftid:PMC-OFF"><xsl:value-of select="$pmc_off_marker-label"/></xsl:when>
        <xsl:when test="self::ftid:ALL-ENGINES"><xsl:value-of select="$all_engines_marker-label"/></xsl:when>
		<xsl:when test="self::ftid:ALT-EEC-MODE"><xsl:value-of select="$alt_eec_mode-label"/></xsl:when>
        <xsl:when test="self::ftid:ALT-MODE-EEC"><xsl:value-of select="$alt_mode_eec-label"/></xsl:when>
        <xsl:when test="self::ftid:ALT-THRUST-SETTING"><xsl:value-of select="$alt_thrust_marker-label"/></xsl:when>
        <xsl:when test="self::ftid:GEARDOWN"><xsl:value-of select="$gear_down_marker-label"/></xsl:when>
        <xsl:when test="self::ftid:ENGINE-INOP"><xsl:value-of select="$engine_inop_marker-label"/></xsl:when>
        <xsl:when test="self::ftid:ENGINE-INOP1"><xsl:value-of select="$one_engine_inop_marker-label"/></xsl:when>
        <xsl:when test="self::ftid:ENGINE-INOP2"><xsl:value-of select="$two_engines_inop_marker-label"/></xsl:when>
        <xsl:when test="self::ftid:GO-AROUND-THRUST"><xsl:value-of select="$go_around_thrust_marker-label"/></xsl:when>
        <xsl:when test="self::ftid:MAX-CONT-THRUST"><xsl:value-of select="$max_continuous_thrust_marker-label"/></xsl:when>
        <xsl:when test="self::ftid:SPARE-ENGINE-CARRIAGE"><xsl:value-of select="$spare_engine_carriage_marker-label"/></xsl:when>
      </xsl:choose>
    </p>
  </xsl:template>

</xsl:stylesheet>