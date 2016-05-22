SELECT COALESCE(Genre, 'Ingen genre') as "@namn", 
		       (SELECT COUNT(*)
		        FROM BOOK
		        WHERE COALESCE(book.Genre, '0') = COALESCE(Bok.Genre, '0')) as "@antalb�cker",
				(SELECT Spr�k
				FROM
					(SELECT c.value('@Language', 'varchar(20)') as Spr�k
					FROM Edition INNER JOIN BOOK ON book.id = Edition.book CROSS APPLY Translations.nodes('//Translation') AS X(c)
					WHERE  COALESCE(Bok.genre, '0') = COALESCE(Book.genre, '0')
					UNION
					(SELECT OriginalLanguage as Spr�k
					FROM Book
					WHERE  COALESCE(Bok.genre, '0') = COALESCE(Book.genre, '0')
					)) "*"
				FOR XML PATH(''), ELEMENTS, TYPE) "*"
FROM BOOK as Bok
GROUP BY Genre 
FOR XML PATH('Genre'), ROOT('Resultat')