<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <ul class="peopledirectory">
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  <xsl:template match="Row">
    <li>
      <h2>
        <xsl:value-of select="@LastName"/>, 
        <xsl:value-of select="@FirstName"/>
      </h2>
      <img alt="Photo of {@FirstName} {@LastName}" src="{@URLToPhoto}" title="Photo of {@FirstName} {@LastName}"/>
      <a href="mailto:{@Email}">
        <xsl:value-of select="@Email"/>
      </a>
      <p>Department: 
        <xsl:value-of select="@Department"/>
      </p>
    </li>
  </xsl:template>
</xsl:stylesheet>