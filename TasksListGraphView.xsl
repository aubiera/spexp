<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">

    <!-- This XSL Stylesheet created by SharePoint Experts, Inc. -->
    <!-- http://sharepointexperience.com -->

    <xsl:param name="canvasHeight">480</xsl:param>
    <xsl:param name="canvasWidth">640</xsl:param>
    <xsl:param name="maxBarHeight">400</xsl:param>
    <xsl:param name="barWidth">50</xsl:param>
    <xsl:param name="barGutter">10</xsl:param>
    <xsl:variable name="barTotalWidth" select="$barGutter + $barWidth"/>
    <xsl:variable name="labelY" select="$maxBarHeight + (($canvasHeight - $maxBarHeight) div 2)"/>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">


        <svg width="{$canvasWidth}" height="{$canvasHeight}" xmlns="http://www.w3.org/2000/svg"
            xsl:exclude-result-prefixes="#default">
            <g>
                <xsl:apply-templates/>
            </g>
            <style>
                .task_pri_1High{
                    fill:red;
                }
                
                .task_pri_2Normal{
                    fill:yellow;
                }
                
                .task_pri_3Low{
                    fill:green;
                }
                
                text{
                    font-weight:bold;
                    fill:white;
                    stroke:black;
                    stroke-width:1px;
                    font-size:20px;
                }</style>
        </svg>

    </xsl:template>
    <xsl:template match="/dsQueryResponse/Rows/Row">
        <xsl:variable name="barHeight" select="$maxBarHeight * @PercentComplete."/>
        <xsl:variable name="barY" select="$maxBarHeight - $barHeight"/>
        <xsl:variable name="barX" select="(position() - 1) * $barTotalWidth"/>
        <xsl:variable name="textX" select="$barX + ($barWidth div 2)"/>
        <a xlink:href="/webdev/dustin.miller.201302/Lists/Tasks/DispForm.aspx?ID={@ID}" title="Link to {@Title}">
        <rect id="task_{@ID}" height="{$barHeight}" width="{$barWidth}" y="{$barY}" x="{$barX}"
            stroke-width="1" stroke="#000000" fill="#FF0000"
            class="task_pri_{translate(@Priority,'() ','')}"/>
            </a>
        <text xml:space="preserve" text-anchor="middle" font-family="Sans-serif" font-size="12" id="task_label_{@ID}" y="{$labelY}" x="{$textX}" stroke-width="0" stroke="#000000" fill="#000000">
            <xsl:value-of select="@Title"/></text>

    </xsl:template>
</xsl:stylesheet>
