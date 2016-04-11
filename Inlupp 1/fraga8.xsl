<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" />
<xsl:template match="/">
    <xsl:element name="Resultat">
    <xsl:variable name="doc" select="document('Filmdatabas.xml')" />
    <xsl:for-each select="$doc//Film">
         <xsl:sort select="@�r" order="ascending" data-type="number" />
        <xsl:variable name="F" select="." />  
    <xsl:element name="Filmer">
        <xsl:attribute name="Titel">
            <xsl:value-of select="@Titel" />
        </xsl:attribute>
        <xsl:attribute name="�r">
            <xsl:value-of select="@�r" />
        </xsl:attribute>
        <xsl:attribute name="Produktionsbolag">
            <xsl:value-of select="Produktionsbolag" />
        </xsl:attribute>
        <xsl:attribute name="Regiss�r">
            <xsl:value-of select="Regiss�r/@Namn" />
        </xsl:attribute>
         <xsl:for-each select="Sk�dis">
       <xsl:element name="Sk�dis">
           <xsl:value-of select="@Namn" />
       </xsl:element>
         </xsl:for-each>
    </xsl:element>
    </xsl:for-each>
    </xsl:element>
</xsl:template>
</xsl:transform>