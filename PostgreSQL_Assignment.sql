-- Active: 1747622916822@@127.0.0.1@5432@conservation_db
--Database create
CREATE DATABASE conservation_db;

--Table create

CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL UNIQUE,
    region VARCHAR(100) NOT NULL
);

CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(200),
    scientific_name TEXT,
    discovery_date DATE  NOT NULL,
    conservation_status VARCHAR(100)
);


CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    "location" TEXT,
    sighting_time TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    notes TEXT
);


SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;

DROP TABLE sightings;
-- Insert table data here
INSERT INTO rangers("name", region) VALUES
    ('Alice green', 'Northern Hills'),
    ('Bob White', 'River Delta'),
    ('Carol King', 'Mountain Range')

INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status) VALUES
    ('Snow Leopard', 'Panthera uncia','1775-01-01','Endangered'),
    ('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
    ('Red Panda', 'Ailurus fulgens', '1825-01-01','Vulnerable'),
    ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

INSERT INTO sightings(species_id, ranger_id, "location", sighting_time, notes) VALUES
    (1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
    (2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
    (3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
    (1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

-- POSTGRESQL PROBLEMS 

-- Problem 1

INSERT INTO rangers("name", region) VALUES('Derek Fox', 'Coastal Plains');
SELECT * FROM rangers;
-- Problem 2

SELECT count(*) AS unique_species_count FROM (SELECT common_name FROM species NATURAL JOIN sightings GROUP BY common_name);

-- Problem 3

SELECT * FROM sightings WHERE "location" LIKE '%Pass%';

-- Problem 4

SELECT name, count(*) AS total_sightings FROM rangers NATURAL JOIN sightings GROUP BY name;

-- problem 5

SELECT common_name FROM species LEFT JOIN sightings ON species.species_id = sightings.species_id WHERE sightings.species_id IS NULL;

-- Problem 6

SELECT common_name, MAX(sighting_time), "name" FROM species NATURAL JOIN sightings NATURAL JOIN rangers GROUP BY common_name,"name" ORDER BY MAX(sighting_time) DESC LIMIT 2;

-- Problem 7

ALTER TABLE species ADD COLUMN status VARCHAR(50);
UPDATE species SET status = 'Historic' WHERE discovery_date < '1800-01-01';

SELECT * FROM species;
-- problem 8

SELECT sighting_id, (
    CASE 
        WHEN extract(HOUR FROM sighting_time) BETWEEN 5 AND 11 THEN 'Morning'
        WHEN extract(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN extract(HOUR FROM sighting_time) BETWEEN 18 AND 24 THEN 'Evening'
        ELSE 'Night'
    END
) AS time_of_day FROM sightings;


-- Problem 9

DELETE FROM rangers
WHERE ranger_id NOT IN (SELECT ranger_id FROM sightings WHERE ranger_id IS NOT NULL);

SELECT * FROM rangers;
SELECT * FROM sightings;
SELECT * FROM species;
-- Completed