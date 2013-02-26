<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- This XSL Stylesheet created by SharePoint Experts, Inc. -->
<!-- http://sharepointexperience.com -->

    <xsl:output method="html" indent="yes"/>
    <!-- This template is the "wrapper" or "container" for the custom view. -->
    <xsl:template match="/">
        <!-- This is the actual wrapper element that will be emitted -->
        <div>
            <!-- This will tell the data view to look for the actual content
and come back when it's done. -->
            <xsl:apply-templates/>
        </div>
        <!-- end wrapper -->
    </xsl:template>
    <xsl:template match="/dsQueryResponse/Rows/Row">
        <!-- This markup is used for each item in the list -->
        <p><xsl:value-of select="@Title"/></p>
    </xsl:template>
</xsl:stylesheet>