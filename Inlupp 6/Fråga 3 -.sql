SELECT name AS Namn,  Info.value('(//Country)[1]', 'varchar(20)') as Land , title as Titel, OriginalLanguage as OriginalSpr�k, Genre
	FROM  author as F�rfattare INNER JOIN 
	      authorship ON F�rfattare.id = authorship.author INNER JOIN
	      book as Bok ON authorship.book = Bok.id
FOR XML AUTO, ROOT('Alla')