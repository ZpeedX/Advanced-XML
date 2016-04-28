XQUERY
let $a := db2-fn:sqlquery('
SELECT XMLELEMENT(NAME "Spr�k", XMLATTRIBUTES(OriginalLanguage AS "Namn", AntalSpr�k AS "AntalSpr�k"))
FROM
(SELECT OriginalLanguage, Count(*) AntalSpr�k FROM Book GROUP BY OriginalLanguage)')
return element Resultat  {$a}