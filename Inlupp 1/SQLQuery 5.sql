SELECT kurs.kurskod[Kurstillf�lle/@kurskod], kursben [Kurstillf�lle/@kursnamn], ktillf.sdat [Kurstillf�lle/@startdatum], 
ktillf.lokal [Kurstillf�lle/@lokal], l�rare.lnamn [Kurstillf�lle/L�rare], COUNT(deltag.elev) [Kurstillf�lle/AntalElever]

FROM kurs INNER JOIN
     ktillf ON kurs.kurskod = ktillf.kurs INNER JOIN
     deltag ON ktillf.sdat = deltag.sdat AND ktillf.kurs = deltag.kurs
	 INNER JOIN l�rare ON l�rare.lid = ktillf.l�rare
	 GROUP BY kurs.kurskod, kursben, ktillf.sdat, ktillf.lokal, l�rare.lnamn
FOR XML PATH(''), ROOT('Resultat')
