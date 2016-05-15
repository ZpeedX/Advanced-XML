SELECT name "@Namn", country as "@Land", (SELECT DISTINCT c.value('.', 'varchar(20)') as Spr�k 
								FROM edition CROSS APPLY Translations.nodes('//*[@Publisher = sql:column("name")]/@Language') AS X(c)
								FOR XML PATH(''), TYPE, ELEMENTS) "*" 
FROM Publisher
FOR XML PATH('F�rlag'), ROOT('Resultat')