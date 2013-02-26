<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- 
    XSL Key
    name = the name for your group-by key. You'll refer to this by name later
    match = the element you're grouping (For SharePoint, this is ALWAYS "Row")
    use = The attribute by which you want to group
  -->

  <xsl:key name="group-by-department" match="Row" use="@Category"/>

  <xsl:template match="/">
  <body>
    <div class="spe-tabs">
      <style scoped="">
        a{
            text-decoration:none;
        }</style>
      <xsl:apply-templates select="//Row[count(. | key('group-by-department', @Category)[1]) = 1]"
        mode="tabs"/>
    </div>
    <a href="#">Outside link</a>
  </body>
  </xsl:template>

  <xsl:template match="Row" mode="tabs">
    <div class="spe-tab">
      <input type="radio" id="tab-{position()}" name="tab-group">
        <xsl:if test="position() = 1">
          <xsl:attribute name="checked"/>
        </xsl:if>
      </input>
      <label for="tab-{position()}">
        <xsl:value-of select="@Category"/>
      </label>
      <div class="spe-tab-content">
        <ul>
          <xsl:apply-templates select="key('group-by-department', @Category)" mode="content"/>
        </ul>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Row" mode="content">
    <li>
      <a href="{@href}" title="Link to {@Title}">
        <xsl:value-of select="@Title"/>
      </a>
    </li>
  </xsl:template>
</xsl:stylesheet>
