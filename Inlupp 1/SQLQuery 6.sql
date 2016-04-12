SELECT XMLELEMENT(NAME"Resultat", XMLAGG(kursl�ngd))
FROM
(SELECT XMLELEMENT(NAME "Kursl�ngd", XMLATTRIBUTES(l�ngder AS "antalveckor", (SUM(snitt)/COUNT(snitt)) as "snittpris")) AS kursl�ngd
FROM
				(
				SELECT XMLCAST(XMLQUERY('$e//l�ngd'
PASSING Info AS "e") as INTEGER) as l�ngder, XMLCAST(XMLQUERY('$e//pris'
PASSING Info AS "e") as INTEGER) as snitt
FROM Kurs)
group by l�ngder)
