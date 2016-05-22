SELECT XMLELEMENT(NAME "Resultat", XMLAGG(G))
FROM
(
	SELECT XMLELEMENT(NAME "Genre", XMLATTRIBUTES(COALESCE(Genre, 'Ingen Genre') as "namn", antalb�cker as "antalb�cker"), 
					  XMLAGG(XMLELEMENT(NAME "Spr�k", Langs))) as G
	FROM
	   (SELECT DISTINCT Genre, 
		       (SELECT COUNT(*) 
		        FROM BOOK 
		        WHERE COALESCE(book.Genre, '0') = COALESCE(b.Genre, '0')) as antalb�cker, 
		        Lang as Langs
		FROM Edition INNER JOIN BOOK as b ON b.id = Edition.book,
						XMLTABLE('$Info//Translation' Passing Translations AS "Info"
				      	COLUMNS
				      	Lang			VARCHAR(20)		Path '@Language'
				      )
		UNION
		SELECT DISTINCT Genre, 
			   (SELECT COUNT(*) 
		        FROM BOOK 
		        WHERE COALESCE(book.Genre, 'N/A') = COALESCE(b.Genre, 'N/A')) as antalb�cker, 
			   Originallanguage as Langs
		FROM book as b	      
	)
	GROUP BY Genre, antalb�cker
)