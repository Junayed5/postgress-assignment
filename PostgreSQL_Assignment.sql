-- Active: 1747622916822@@127.0.0.1@5432@conservation_db
--Database create
CREATE DATABASE conservation_db;

--Table create

CREATE TABLE rangers(
    ranger_id SERIAL UNIQUE PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL UNIQUE,
    region VARCHAR(100) NOT NULL
);

CREATE TABLE species(
    species_id SERIAL UNIQUE PRIMARY KEY,
    common_name VARCHAR(200),
    scientific_name TEXT,
    discovery_date TIMESTAMP NOT NULL,
    conservation_status VARCHAR(100)
);

CREATE TABLE sightings(
    sighting_id SERIAL UNIQUE PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    sighting_time TIMESTAMP ,
    "location" TEXT,
    notes TEXT
);