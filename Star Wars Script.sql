-- STAR WARS WORLD OVERVIEW --

-- OVERVIEW OF TABLES
SELECT TOP 5 * FROM StarWarsCharacters
SELECT TOP 5 * FROM StarWarsPlanets
SELECT TOP 5 * FROM StarWarsSpecies
SELECT TOP 5 * FROM StarWarsStarships
SELECT TOP 5 * FROM StarWarsVehicles

--DATA EVALUATION

--Evaluation of species data
SELECT DISTINCT species
FROM StarWarsCharacters
;


--Evaluation of planets data
SELECT DISTINCT name
FROM StarWarsPlanets
;


--Selection of characters and missing data
SELECT   name
		,species
		,homeworld
FROM StarWarsCharacters
WHERE species = 'NA'
OR homeworld = 'NA'
;


--Adding missing values to enrich data
UPDATE StarWarsCharacters
SET homeworld = 'Dagobah'
WHERE name = 'Yoda';

UPDATE StarWarsCharacters
SET homeworld = 'Halowan'
WHERE name = 'IG-88';

UPDATE StarWarsCharacters
SET homeworld = 'Endor'
WHERE name = 'Arvel Crynyd';

UPDATE StarWarsCharacters
SET homeworld = 'Coruscant'
WHERE name = 'Qui-Gon Jinn';

UPDATE StarWarsCharacters
SET species = 'Human'
WHERE name = 'Ric Olié';

UPDATE StarWarsCharacters
SET species = 'Human'
WHERE name = 'Quarsh Panaka';

UPDATE StarWarsCharacters
SET homeworld = 'Coruscant'
WHERE name = 'R4-P17';

UPDATE StarWarsCharacters
SET species = 'Droid'
WHERE name = 'R4-P17';

UPDATE StarWarsCharacters
SET species = 'Umbaran'
WHERE name = 'Sly Moore';

UPDATE StarWarsCharacters
SET homeworld = 'Artorias'
WHERE name = 'Finn';

UPDATE StarWarsCharacters
SET homeworld = 'Jakku'
WHERE name = 'Rey';

UPDATE StarWarsCharacters
SET homeworld = 'Yavin IV'
WHERE name = 'Poe Dameron';

UPDATE StarWarsCharacters
SET homeworld = 'Jakku'
WHERE name = 'BB8';

UPDATE StarWarsCharacters
SET species = 'Human'
WHERE name = 'Captain Phasma';

UPDATE StarWarsCharacters
SET homeworld = 'Parnassos'
WHERE name = 'Captain Phasma';


--Selection of species and missing data
SELECT	 name
		,homeworld
FROM StarWarsSpecies
WHERE homeworld = 'NA'
;


--Adding missing values to enrich data
UPDATE StarWarsSpecies
SET homeworld = 'Dagobah'
WHERE name = 'Yoda''s species';



--Characters and missing information from planets
SELECT   swc.name
		,swc.species
		,swc.homeworld
		,swp.climate
		,swp.terrain
		,swp.surface_water
		,swp.gravity
FROM StarWarsCharacters swc
LEFT JOIN StarWarsPlanets swp
ON swp.name = swc.homeworld
WHERE swp.climate IS NULL
;
--Missing Planets
--Artorias
--Halowan
--Parnassos



--Adding missing planet infomration
INSERT INTO StarWarsPlanets
VALUES   ('Artorias','','','','temperate','1 standard','oceans, forests, mountains','','')
		,('Halowan','','','','temperate, arid','1 standard','desrt, mountains','','0')
		,('Parnassos','','','','hot','1 standard','oceans, caves, plateaus, cliffs','','0')
;


--Unification of terminology
SELECT DISTINCT classification 
FROM StarWarsSpecies
;
UPDATE StarWarsSpecies
SET classification = REPLACE(classification,'mammals','mammal')
;
UPDATE StarWarsSpecies
SET classification = REPLACE(classification,'reptile','reptilian')
;


--Error on assigment of variables addition of a designation into classification
SELECT  DISTINCT CONCAT (classification, ' - ',designation)
FROM StarWarsSpecies
;

UPDATE StarWarsSpecies
SET classification = REPLACE(classification,'sentient','reptilian')
WHERE classification='sentient'
AND designation='reptilian'
;
UPDATE StarWarsSpecies
SET designation = REPLACE(designation,'reptilian','sentient')
WHERE classification='reptilian'
AND designation='reptilian'
;



-- Replacing N/A and NA with blanks
UPDATE StarWarsCharacters
SET height = REPLACE(height,'N/A','')
;
UPDATE StarWarsCharacters
SET mass = REPLACE(mass,'N/A','')
;
UPDATE StarWarsCharacters
SET hair_color = REPLACE(hair_color,'N/A','')
;
UPDATE StarWarsCharacters
SET skin_color = REPLACE(skin_color,'N/A','')
;
UPDATE StarWarsCharacters
SET eye_color = REPLACE(eye_color,'N/A','')
;
UPDATE StarWarsCharacters
SET birth_year = REPLACE(birth_year,'N/A','')
;
UPDATE StarWarsCharacters
SET gender = REPLACE(gender,'N/A','')
;
UPDATE StarWarsCharacters
SET homeworld = REPLACE(homeworld,'N/A','')
;
UPDATE StarWarsCharacters
SET species = REPLACE(species,'N/A','')	
;
UPDATE StarWarsPlanets
SET climate = REPLACE(climate,'NA','')
;
UPDATE StarWarsPlanets
SET gravity = REPLACE(gravity,'NA','')
;
UPDATE StarWarsPlanets
SET terrain = REPLACE(terrain,'NA','')
;
UPDATE StarWarsPlanets
SET surface_water = REPLACE(surface_water,'NA','')	
;
UPDATE StarWarsSpecies
SET classification = REPLACE(classification,'NA','')
;
UPDATE StarWarsSpecies
SET skin_colors = REPLACE(skin_colors,'NA','')
;
UPDATE StarWarsSpecies
SET hair_colors = REPLACE(hair_colors,'NA','')
;
UPDATE StarWarsSpecies
SET eye_colors = REPLACE(eye_colors,'NA','')	
;
UPDATE StarWarsSpecies
SET average_lifespan = REPLACE(average_lifespan,'NA','')
;
UPDATE StarWarsSpecies
SET language = REPLACE(language,'NA','')
;
UPDATE StarWarsStarships
SET max_atmosphering_speed = REPLACE(max_atmosphering_speed,'NA','')
;
UPDATE StarWarsStarships
SET max_atmosphering_speed = REPLACE(max_atmosphering_speed,'1000km','1000')
;
UPDATE StarWarsStarships
SET manufacturer = REPLACE(manufacturer,'Incom','Incom Corporation')
;
UPDATE StarWarsVehicles
SET manufacturer = REPLACE(manufacturer,'Incom','Incom Corporation')
;



--EVALUATION OF DATA
--Selection of general information per character
SELECT   name
		,birth_year
		,species
		,homeworld
FROM StarWarsCharacters
;


--Character information tallest and shortest character
SELECT *
FROM StarWarsCharacters
WHERE height = (
				SELECT MAX(height)
				FROM StarWarsCharacters
			  )
UNION
SELECT *
FROM StarWarsCharacters
WHERE height = (
				SELECT MIN(height)
				FROM StarWarsCharacters
			  )
;


--Character information heaviest and lightest character
SELECT *
FROM StarWarsCharacters
WHERE mass = (
				SELECT MAX(mass)
				FROM StarWarsCharacters
			  )
			  UNION
			  SELECT *
FROM StarWarsCharacters
WHERE mass = (
				SELECT MIN(mass)
				FROM StarWarsCharacters
			  )
;


--Number of characters per species and homeworld
SELECT   homeworld
		,species
		,COUNT(*)		AS Characters
FROM StarWarsCharacters
GROUP BY homeworld
		,species
ORDER BY homeworld
		,species
;



--Characters and their planets
SELECT   swc.name
		,swc.homeworld
		,swp.climate
		,swp.terrain
		,swp.surface_water
		,swp.gravity
FROM StarWarsCharacters swc
LEFT JOIN StarWarsPlanets swp
ON swp.name = swc.homeworld
;


--Characters and their species
SELECT   swc.name
		,LOWER (swc.species)	AS species
		,sws.classification
		,sws.designation
		,LOWER (sws.language)	AS language
FROM StarWarsCharacters swc
LEFT JOIN StarWarsSpecies sws
ON sws.name = swc.species
;



--Characters, species and planets
SELECT   swc.name
		,LOWER (swc.species)	AS species
		,sws.classification
		,sws.designation
		,swc.homeworld
		,swp.climate
		,swp.terrain	
FROM StarWarsCharacters swc
LEFT JOIN StarWarsPlanets swp
ON swp.name = swc.homeworld
LEFT JOIN StarWarsSpecies sws
ON sws.name = swc.species
;

SELECT   LOWER (swc.species)	AS species
		,sws.classification
		,sws.designation
		,swc.homeworld
		,swp.climate
		,swp.terrain	
FROM StarWarsCharacters swc
LEFT JOIN StarWarsPlanets swp
ON swp.name = swc.homeworld
LEFT JOIN StarWarsSpecies sws
ON sws.name = swc.species
;



--Integration of vehicles and starships
SELECT   name	
		,model
		,manufacturer
		,cost_in_credits
		,[length]
		,max_atmosphering_speed
		,crew
		,passengers
		,cargo_capacity
		,consumables
		,starship_class
FROM StarWarsStarships
UNION
SELECT   name	
		,model
		,manufacturer
		,cost_in_credits
		,[length]
		,max_atmosphering_speed
		,crew
		,passengers
		,cargo_capacity
		,consumables
		,vehicle_class
FROM StarWarsVehicles
;



--Create table after Cleaning and sorting vehicles and starships

CREATE TABLE StarWarsAllShips (
		 name NVARCHAR(50)
		,model NVARCHAR(50)
		,manufacturer NVARCHAR(100)
		,cost_in_credits BIGINT
		,[length] FLOAT
		,max_atmosphering_speed NVARCHAR(50)
		,crew INT
		,passengers INT
		,cargo_capacity BIGINT
		,consumables NVARCHAR(50)
		,shipclass NVARCHAR(50)
);

INSERT INTO StarWarsAllShips
SELECT   name	
		,model
		,manufacturer
		,cost_in_credits
		,[length]
		,max_atmosphering_speed
		,crew
		,passengers
		,cargo_capacity
		,consumables
		,CASE 
			WHEN starship_class LIKE '%speeder%' THEN 'speeder'
			WHEN starship_class LIKE '%transport%' THEN 'transport'	
			WHEN starship_class LIKE '%craft%' THEN 'craft'	
			WHEN starship_class LIKE '%freighter%' THEN 'freighter'
			WHEN starship_class LIKE '%wheeled%' THEN 'walker'
			WHEN starship_class LIKE '%walker%' THEN 'walker'	
			WHEN starship_class LIKE '%fighter%' THEN 'starfighter'	
			WHEN starship_class LIKE '%destroyer%' THEN 'destroyer'
			WHEN starship_class LIKE '%corvette%' THEN 'corvette'
			WHEN starship_class LIKE '%cruiser%' THEN 'cruiser'	
			WHEN starship_class LIKE '%submarine%' THEN 'submarine'	
			WHEN starship_class LIKE '%yacht%' THEN 'yacht'
			WHEN starship_class LIKE '%dreadnought%' THEN 'dreadnought'
			WHEN starship_class LIKE '%tank%' THEN 'tank'	
			WHEN starship_class LIKE '%barge%' THEN 'barge'	
			WHEN starship_class LIKE '%bomber%' THEN 'bomber'
			WHEN starship_class LIKE '%battlestation%' THEN 'battlestation'
		ELSE 'ship' END AS ship_class
FROM StarWarsStarships
UNION
SELECT   name	
		,model
		,manufacturer
		,cost_in_credits
		,[length]
		,max_atmosphering_speed
		,crew
		,passengers
		,cargo_capacity
		,consumables
		,CASE 
			WHEN vehicle_class LIKE '%speeder%' THEN 'speeder'
			WHEN vehicle_class LIKE '%transport%' THEN 'transport'	
			WHEN vehicle_class LIKE '%craft%' THEN 'craft'	
			WHEN vehicle_class LIKE '%freighter%' THEN 'freighter'
			WHEN vehicle_class LIKE '%wheeled%' THEN 'walker'
			WHEN vehicle_class LIKE '%walker%' THEN 'walker'	
			WHEN vehicle_class LIKE '%fighter%' THEN 'starfighter'	
			WHEN vehicle_class LIKE '%destroyer%' THEN 'destroyer'
			WHEN vehicle_class LIKE '%corvette%' THEN 'corvette'
			WHEN vehicle_class LIKE '%cruiser%' THEN 'cruiser'	
			WHEN vehicle_class LIKE '%submarine%' THEN 'submarine'	
			WHEN vehicle_class LIKE '%yacht%' THEN 'yacht'
			WHEN vehicle_class LIKE '%dreadnought%' THEN 'dreadnought'
			WHEN vehicle_class LIKE '%tank%' THEN 'tank'	
			WHEN vehicle_class LIKE '%barge%' THEN 'barge'	
			WHEN vehicle_class LIKE '%bomber%' THEN 'bomber'
			WHEN vehicle_class LIKE '%battlestation%' THEN 'battlestation'
		ELSE 'ship' END AS ship_class
FROM StarWarsVehicles
;


SELECT *
FROM StarWarsAllShips
;



--WITH allships AS 
--(
--SELECT   name	
--		,model
--		,manufacturer
--		,cost_in_credits
--		,[length]
--		,max_atmosphering_speed
--		,crew
--		,passengers
--		,cargo_capacity
--		,consumables
--		,starship_class		 AS class
--FROM StarWarsStarships
--UNION
--SELECT   name	
--		,model
--		,manufacturer
--		,cost_in_credits
--		,[length]
--		,max_atmosphering_speed
--		,crew
--		,passengers
--		,cargo_capacity
--		,consumables
--		,vehicle_class		 AS class
--FROM StarWarsVehicles
--)

--SELECT name	
--		,model
--		,manufacturer
--		,cost_in_credits
--		,[length]
--		,max_atmosphering_speed
--		,crew
--		,passengers
--		,cargo_capacity
--		,consumables
--		,CASE 
--			WHEN class LIKE '%speeder%' THEN 'speeder'
--			WHEN class LIKE '%transport%' THEN 'transport'	
--			WHEN class LIKE '%craft%' THEN 'craft'	
--			WHEN class LIKE '%freighter%' THEN 'freighter'
--			WHEN class LIKE '%wheeled%' THEN 'walker'
--			WHEN class LIKE '%walker%' THEN 'walker'	
--			WHEN class LIKE '%fighter%' THEN 'starfighter'	
--			WHEN class LIKE '%destroyer%' THEN 'destroyer'
--			WHEN class LIKE '%corvette%' THEN 'corvette'
--			WHEN class LIKE '%cruiser%' THEN 'cruiser'	
--			WHEN class LIKE '%submarine%' THEN 'submarine'	
--			WHEN class LIKE '%yacht%' THEN 'yacht'
--			WHEN class LIKE '%dreadnought%' THEN 'dreadnought'
--			WHEN class LIKE '%tank%' THEN 'tank'	
--			WHEN class LIKE '%barge%' THEN 'barge'	
--			WHEN class LIKE '%bomber%' THEN 'bomber'
--			WHEN class LIKE '%battlestation%' THEN 'battlestation'
--		ELSE 'ship' END AS ship_class
--FROM allships
--;


--Ships cost information
SELECT	 shipclass
		,SUM(cost_in_credits)	AS total_cost
		,AVG(cost_in_credits)	AS average_cost
FROM StarWarsAllShips
GROUP BY shipclass
ORDER BY 2 DESC
;


--Fastest ship
SELECT  name	
		,shipclass
		,model
		,manufacturer
		,cost_in_credits
		,[length]
		,max_atmosphering_speed
FROM StarWarsAllShips
WHERE max_atmosphering_speed = (
								SELECT MAX(max_atmosphering_speed)
								FROM StarWarsAllShips
								)
;



--Best cargo ship
SELECT  name	
		,shipclass
		,model
		,manufacturer
		,crew
		,passengers
		,cargo_capacity
		,consumables
FROM StarWarsAllShips
WHERE cargo_capacity = (
								SELECT MAX(cargo_capacity)
								FROM StarWarsAllShips
								)
;