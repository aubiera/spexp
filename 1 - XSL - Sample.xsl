<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <ul>
      <xsl:apply-templates />
    </ul>
  </xsl:template>
  

  <xsl:template match="truck">
    <li>
      <xsl:value-of select="@make"/> 
      <xsl:value-of select="@model"/>
    </li> 
  </xsl:template>

</xsl:stylesheet>