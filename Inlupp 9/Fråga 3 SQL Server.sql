SELECT M�rke.brand as namn, namn, count(*) as antalanst�llningar
		FROM(
			SELECT DISTINCT brand, c.value('@employer', 'varchar(20)') namn, pid
			FROM Person INNER JOIN car ON car.owner = person.pid CROSS APPLY employments.nodes('//employment') AS X(c)
	) F�retag,
	(SELECT DISTINCT brand, owner from car) M�rke
	WHERE M�rke.owner = F�retag.pid
	AND  M�rke.brand = F�retag.brand
	GROUP BY M�rke.brand, namn
	ORDER BY M�rke.brand
FOR XML AUTO, ROOT('Resultat')