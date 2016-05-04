XQUERY
let $a := db2-fn:sqlquery('
					SELECT XMLELEMENT(NAME "Spr�k", XMLATTRIBUTES(OriginalLanguage AS "namn", antal AS "antalb�cker"))
					FROM
					(SELECT OriginalLanguage, Count(*) antal FROM Book GROUP BY OriginalLanguage)')
return element Resultat  {$a}