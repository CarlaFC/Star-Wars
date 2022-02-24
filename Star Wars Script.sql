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



--Selection of general information per character
SELECT   name
		,birth_year
		,species
		,homeworld
FROM StarWarsCharacters
;


--Characters and their planets
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
;


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



SELECT * FROM StarWarsSpecies
SELECT * FROM StarWarsStarships
SELECT * FROM StarWarsVehicles
