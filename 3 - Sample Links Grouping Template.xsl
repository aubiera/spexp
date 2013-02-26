<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <!-- 
    XSL Key
    name = the name for your group-by key. You'll refer to this by name later
    match = the element you're grouping (For SharePoint, this is ALWAYS "Row")
    use = The attribute by which you want to group
  -->

  <xsl:key name="group-by-department" match="Row" use="@Category"/>

  <xsl:template match="/">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  <!-- For SharePoint, change "NavLinks" to "Rows" -->
  <xsl:template match="NavLinks">
    <!--
      Unique grouped rows: 
        Change "group-by-department" to the name of your key
        Change "@Category" to the field by which you are grouping
        That's it
    -->
  	<xsl:for-each
  		select="Row[count(. | key('group-by-department', @Category)[1]) = 1]">
  		<xsl:sort select="@Category"/>
      <!-- here's the "parent" content for each unique group -->
      <xsl:comment>BEGIN Group for <xsl:value-of select="@Category"/></xsl:comment>
  		<li class="group-{translate(@Category, ' ','')}">
  			<h1>
  				<xsl:value-of select="@Category"/>
  			</h1>
  			<ul>
  				<xsl:for-each select="key('group-by-department', @Category)">
            <!-- Here's the repeating section for each actual row -->
  					<xsl:sort select="@Title"/>
  					<li>
  						<a href="{@href}">
  							<xsl:value-of select="@Title"/>
  						</a>
  					</li>
  				</xsl:for-each>
  			</ul>
  		</li>
      <xsl:comment>/END/ Group for <xsl:value-of select="@Category"/></xsl:comment>
  	</xsl:for-each>
  </xsl:template>
</xsl:stylesheet>