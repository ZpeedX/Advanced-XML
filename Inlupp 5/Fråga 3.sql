SELECT XMLELEMENT(NAME "Alla", XMLAGG(X))
FROM(
	SELECT XMLELEMENT(NAME "F�rfattare",
			  XMLATTRIBUTES(Author.name AS "Namn", eCountry as "Land"),
			  XMLAGG(XMLELEMENT(NAME "Bok" ,
					    XMLATTRIBUTES(Book.title as "Titel", 
					    OriginalLanguage as "OriginalSpr�k", 
					    Book.genre as "Genre")))) as X
	FROM  author INNER JOIN
	      authorship ON author.id = authorship.author INNER JOIN
	      book ON authorship.book = book.id,
	      XMLTABLE('$I//Country' PASSING Info as "I"
	      	COLUMNS
	      	eCountry	VARCHAR(20)		PATH '.')
	group by name, eCountry)