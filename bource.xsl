<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>bources</title>
            </head>
            
            <body>
                <h1>Cotation des societe de type Banque</h1>
                <ul>
                    <li>Code socite : <xsl:value-of select="bource/societe[@type='Bank']/codeSociete"/></li>
                    <li>Nom socite : <xsl:value-of select="bource/societe[@type='Bank']/nomSociete"/></li>
                </ul>
                <table border="2" width="70%">
                    <tr>
                        <th>Num cotation</th><th>date cotation</th><th>val action</th>
                    </tr>
                    <xsl:for-each select="bource/societe[@type='Bank']/cotations/cotation">
                        <tr>
                            <td>
                                <xsl:value-of select="@num"/>
                            </td>
                            <td>
                                <xsl:value-of select="@dateCotation"/>
                            </td>
                            <td>
                                <xsl:value-of select="@valeurAction"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                    <tr>
                        <td colspan="2">Moyenne de cotation </td>
                        <td><xsl:value-of select="avg(bource/societe[@type='Bank']/cotations/cotation/@valeurAction)"/></td>
                    </tr>
                </table>
                
                <ul>
                    <li>
                        Nombre total de societe : <xsl:value-of select="count(bource/societe)"/>
                    </li>
                    <li>
                        Nombre total de societe de type bank : <xsl:value-of select="count(bource/societe[@type='Bank'])"/>
                    </li>
                    <li>
                        Nombre total de societe de type assurance: <xsl:value-of select="count(bource/societe[@type='Assurance'])"/>
                    </li>
                </ul>
                
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>