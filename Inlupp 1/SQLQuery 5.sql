SELECT XMLELEMENT(NAME "Resultat", XMLAGG(ktillf))
FROM
(SELECT XMLELEMENT(NAME "Kurstillf�lle",
XMLATTRIBUTES(kurs.kurskod AS "kurskod", kurs.kursben AS "kursnamn", ktillf.sdat AS "startdat", ktillf.lokal AS "lokal"),
XMLFOREST(l�rare.lnamn AS "L�rare", count(deltag.elev) AS "AntalElever")) as ktillf
FROM kurs INNER JOIN
     ktillf ON kurs.kurskod = ktillf.kurs INNER JOIN
     deltag ON ktillf.sdat = deltag.sdat AND ktillf.kurs = deltag.kurs
	 INNER JOIN l�rare ON l�rare.lid = ktillf.l�rare
	 GROUP BY kurs.kurskod, kursben, ktillf.sdat, ktillf.lokal, l�rare.lnamn)

