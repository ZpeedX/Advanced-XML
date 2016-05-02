SELECT name "@Namn", country as "@Land", (SELECT DISTINCT c.value('@Language', 'varchar(20)') as Spr�k 
								FROM edition CROSS APPLY Translations.nodes('//Translation') AS X(c)
								WHERE Publisher.name = c.value('@Publisher', 'varchar(20)')
								FOR XML PATH(''), TYPE, ELEMENTS) "*" 
FROM Publisher
FOR XML PATH('F�rlag'), ROOT('Resultat')