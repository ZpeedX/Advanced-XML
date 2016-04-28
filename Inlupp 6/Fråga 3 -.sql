SELECT name AS Namn,  c.value('.', 'varchar(20)') as Land , title as Titel, OriginalLanguage as OriginalSpr�k, genre
	FROM  author as F�rfattare INNER JOIN 
	      authorship ON F�rfattare.id = authorship.author INNER JOIN
	      book as Bok ON authorship.book = Bok.id CROSS APPLY Info.nodes('//Country') AS X(c)
FOR XML AUTO, ROOT('Alla')