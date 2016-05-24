SELECT XMLELEMENT(NAME "Resultat", XMLAGG(p))
FROM(
	SELECT XMLELEMENT(NAME "M�rke", XMLATTRIBUTES(brand as "namn"), 
					  XMLAGG(XMLELEMENT(NAME "F�retag", XMLATTRIBUTES(ag as "namn", antal as "antalanst�lldabil�gare")))) p
	FROM(				  
		SELECT brand, ag, count(*) as antal
		FROM(
			SELECT DISTINCT brand, ag, pid
			FROM Person INNER JOIN car ON car.owner = person.pid, 
				XMLTABLE('$I//employment' PASSING employments AS "I"
								  COLUMNS
								  ag	VARCHAR(20)	PATH '@employer')
								  )
		group by brand, ag
	)
	group by brand
)