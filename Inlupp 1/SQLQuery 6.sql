SELECT e.
FROM(
SELECT XMLQUERY('for $a in $e
return element Kursl�ngd {attribute antalveckor{$a//l�ngd}}'
PASSING Info AS "e") as e
				FROM Kurs)