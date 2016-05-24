SELECT DISTINCT F�rg.color as "namn", name as namn,  antalg as antalarbetsgivare, antalanst as antalanst�llda
FROM
(
SELECT name, pid,
		(
		SELECT COUNT(*)
		FROM(
		SELECT DISTINCT c.value('.', 'varchar(20)') as employer, pid
		FROM person CROSS APPLY 
		employments.nodes('//@employer') AS X(c)) as "*"
		WHERE pid = p.pid
		group by pid
					) antalg,
		(
		SELECT COUNT(*)
		FROM(
		SELECT  c.value('.', 'varchar(20)') as employment, pid
		FROM person CROSS APPLY 
		employments.nodes('//employment') AS X(c)) as "*"
					WHERE pid = p.pid
					group by pid
					) antalanst		 
		FROM Person p
		) Person, car as F�rg
WHERE Person.pid = F�rg.owner
ORDER BY F�rg.color 
FOR XML AUTO, ROOT('Resultat')
	
