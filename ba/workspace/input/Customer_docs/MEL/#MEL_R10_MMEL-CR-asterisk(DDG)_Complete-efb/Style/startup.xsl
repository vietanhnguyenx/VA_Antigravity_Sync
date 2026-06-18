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
  <xsl:output method="html" indent="yes" encoding="UTF-8"
              doctype-system="http://www.w3.org/TR/html4/strict.dtd"
              doctype-public="-//W3C//DTD HTML 4.01//EN"
/>

  <xsl:template match="ftid:FTID_Startup">
    <html>
      <head>
        <!-- Javascript method to modify the title information when the querystring has some value -->
        <script type="text/javascript" language="javascript">
          window.onload = function() {
            var queryString = window.location.toString();
            if(queryString.indexOf("query") > 0)
            {
              var name = queryString.substring(queryString.indexOf("=")+1);
              document.title = name;
            }
            else
            {
              document.title = "Flight Operations Documents";
            }
          };
        </script>
        <title>Flight Operations Documents</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="pragma" content="no-cache"/>
      </head>
      <frameset cols="25%, *">
        <frame name="NOCFrame" src="_NOC.xml"/>
        <frameset rows="120px, *">
          <frame name="HeaderFrame"/>
          <frame name="DocFrame"/>
        </frameset>
      </frameset>
      <xsl:apply-templates/>
    </html>
  </xsl:template>

</xsl:stylesheet>