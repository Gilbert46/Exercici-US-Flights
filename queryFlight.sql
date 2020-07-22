/* 1.	Quantitat de registres de la taula de vols:*/
SELECT COUNT(*) FROM flights;
/* 2.	Retard promig de sortida i arribada segons l’aeroport origen.*/
SELECT Origin, AVG(ArrDelay), AVG(DepDelay) FROM flights GROUP BY Origin;
/* 3.	Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen. A més,
 volen que els resultat es mostrin de la següent forma (fixa’t en l’ordre de les files): */
SELECT Origin, colYear, colMonth, AVG(ArrDelay) AS prom_arribades FROM flights 
	GROUP BY colMonth, Origin ORDER BY Origin, colYear, colMonth;
/* 4.	Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen (mateixa 
consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes del codi de 
l’aeroport es mostri el nom de la ciutat. Resultat: */
SELECT City, colYear, colMonth, AVG(ArrDelay) AS prom_arribades FROM flights JOIN usairports
	ON flights.Origin = usairports.IATA
	GROUP BY colMonth, Origin ORDER BY City, colYear, colMonth;
/* 5.	Les companyies amb més vols cancelats, per mesos i any. A més, han d’estar ordenades de forma 
que les companyies amb més cancel·lacions apareguin les primeres. */
SELECT UniqueCarrier, colYear, colMonth, COUNT(Cancelled) AS total_cancelled 
	FROM flights WHERE Cancelled = 1 
	GROUP BY UniqueCarrier ORDER BY COUNT(Cancelled) DESC;
/* 6.	L’identificador dels 10 avions que més distància han recorregut fent vols. */
SELECT TailNum, Distance FROM flights GROUP BY TailNum
	ORDER BY Distance DESC LIMIT 1, 10;
/* 7.	Companyies amb el seu retard promig només d’aquelles les quals els seus vols arriben al seu
 destí amb un retràs promig major de 10 minuts. */
SELECT UniqueCarrier, AVG(ArrDelay) AS ArriDelay FROM flights 
    GROUP BY UniqueCarrier HAVING AVG(ArrDelay) > 10 ORDER BY ArriDelay DESC;
    
