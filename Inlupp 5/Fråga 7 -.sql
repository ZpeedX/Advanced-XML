SELECT XMLELEMENT(NAME "Resultat", XMLAGG(F))
FROM
(
SELECT XMLELEMENT(NAME "F�rlag", XMLATTRIBUTES(name as "Namn", Country as "Land"),
					 XMLAGG(XMLELEMENT(NAME "Spr�k", Lang))) as F
FROM
(SELECT DISTINCT name, country, Lang
	FROM book INNER JOIN
	      edition ON book.id = edition.book, Publisher, 
	      XMLTABLE('$Info//Translation' Passing Translations AS "Info"
	      			COLUMNS
	      			Publishers		VARCHAR(20)		Path '@Publisher',
	      			Lang			VARCHAR(20)		Path '@Language'
	      			)
	WHERE Name = Publishers)
	group by Country, name)