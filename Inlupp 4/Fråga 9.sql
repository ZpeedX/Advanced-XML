XQUERY
let $a := db2-fn:sqlquery('
					SELECT XMLELEMENT(NAME "Spr�k", XMLATTRIBUTES(OriginalLanguage AS "namn", Count(*) AS "antalb�cker"))
				     FROM Book GROUP BY OriginalLanguage')
return element Resultat  {$a}