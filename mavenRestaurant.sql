SELECT *
FROM consumer_preferences

SELECT *
FROM consumers

SELECT *
FROM ratings

SELECT *
FROM restaurant_cuisines

SELECT *
FROM restaurants

--Joining 5 tables of the Restaurant Challenge

SELECT *
FROM consumer_preferences a 
JOIN ratings b
ON a.Consumer_ID = b.Consumer_ID
JOIN  consumers c ON b.Consumer_ID = c.Consumer_ID
JOIN restaurants d ON c.Country = d.country 
JOIN restaurant_cuisines e ON d.Restaurant_ID = e.Restaurant_ID

--Age grouping

SELECT COUNT(*) as Total,
       COUNT(CASE WHEN Age<=23 THEN 1 END) AS LESS,
	   COUNT(CASE WHEN Age BETWEEN 24 AND 45 THEN 1 END) AS MORE,
	   COUNT(CASE WHEN Age>=46 THEN 1 END) AS LES,
	   COUNT(CASE WHEN Age<=23 THEN 1 END)/(COUNT(*) +.0) AS '18-23',
	   COUNT(CASE WHEN Age BETWEEN 24 AND 45 THEN 1 END)/(COUNT(*) +.0) AS '24-45',
	   COUNT(CASE WHEN Age>=46 THEN 1 END)/(COUNT(*)+.0) AS '46+'
FROM consumers 
	  
--Consumer cuisine preferences by Age-group

SELECT DISTINCT a.Preferred_Cuisine,c.Age
FROM consumer_preferences a 
JOIN ratings b
ON a.Consumer_ID = b.Consumer_ID
JOIN  consumers c ON b.Consumer_ID = c.Consumer_ID
JOIN restaurants d ON c.Country = d.country 
JOIN restaurant_cuisines e ON d.Restaurant_ID = e.Restaurant_ID


--Number of customers per Restaurant with location

SELECT Distinct c.Consumer_ID, d.City,d.State,d.Latitude,d.Longitude,d.Name
FROM consumer_preferences a 
JOIN ratings b
ON a.Consumer_ID = b.Consumer_ID
JOIN  consumers c ON b.Consumer_ID = c.Consumer_ID
JOIN restaurants d ON c.Country = d.country 
JOIN restaurant_cuisines e ON d.Restaurant_ID = e.Restaurant_ID
WHERE c.Country = d.Country
GROUP BY c.Consumer_ID,d.City,d.State,d.Latitude,d.Longitude,d.Name
ORDER BY c.Consumer_ID


--Nos.of consumers per restaurant by cuisine type

SELECT COUNT(d.Name) AS NosofRestaurant,COUNT(c.consumer_ID) as Nosofconsumers,e.Cuisine
FROM consumer_preferences a 
JOIN ratings b
ON a.Consumer_ID = b.Consumer_ID
JOIN  consumers c ON b.Consumer_ID = c.Consumer_ID
JOIN restaurants d ON c.Country = d.country 
JOIN restaurant_cuisines e ON d.Restaurant_ID = e.Restaurant_ID
WHERE a.Consumer_ID = b.Consumer_ID and a.Consumer_ID = c.Consumer_ID
GROUP BY e.Cuisine
ORDER BY COUNT(c.consumer_ID) DESC

