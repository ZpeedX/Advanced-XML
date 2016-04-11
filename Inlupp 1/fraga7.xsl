<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
� � <html>
��� <head><title>Produktionsbolag</title></head>
��� <body>
    <xsl:variable name="doc" select="document('Filmdatabas.xml')" />
     <xsl:for-each select="$doc//Produktionsbolag[not(. = preceding::Produktionsbolag/.)]">
      <xsl:variable name="P" select="." />   
        <h1><xsl:value-of select="$P"/></h1> 
	<table border="1">
                <tr>
                    <th>Titel</th>    
                    <th>�r</th>
                    <th>Regiss�r</th>
                    <th>Regiss�rens Land</th>
                    <th>Antal sk�despelare</th>
                </tr>
                 <xsl:for-each select="$doc//Film[Produktionsbolag/. = $P]">
                     <tr>
                         <td><xsl:value-of select="@Titel"/></td>
                         <td><xsl:value-of select="@�r"/></td>
                         <td><xsl:value-of select="Regiss�r/@Namn"/></td>
                         <td><xsl:value-of select="Regiss�r/@Land"/></td>
                         <td><xsl:value-of select="count(Sk�dis)"/></td>
                         
                     </tr>
                 </xsl:for-each>
     
	</table>
        <hr/>
        </xsl:for-each>
��� </body>
� � </html>
</xsl:template>
</xsl:transform>