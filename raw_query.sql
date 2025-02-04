CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY, 
    name VARCHAR(50) NOT NULL UNIQUE, 
    type VARCHAR(50) NOT NULL,
    number_of_stars_in_billions NUMERIC(10, 2) NOT NULL, 
    distance_from_earth_in_millions_of_light_years NUMERIC(10, 5)
);

INSERT INTO galaxy (name, type, number_of_stars_in_billions, distance_from_earth_in_millions_of_light_years) 
VALUES 
    ('Milky Way', 'Spiral', 200, 0.00002),
    ('Andromeda', 'Spiral', 1000, 2.54),
    ('Triangulum', 'Spiral', 40, 2.73),
    ('Large Magellanic Cloud', 'Irregular', 10, 0.16),
    ('Sombrero Galaxy', 'Spiral', 100, 29.3),
    ('Whirlpool Galaxy', 'Spiral', 100, 31);



CREATE TABLE star (
    star_id SERIAL PRIMARY KEY, 
    name VARCHAR(50) NOT NULL UNIQUE, 
    type VARCHAR(50) NOT NULL,
    galaxy_id INT NOT NULL, 
    number_of_orbiting_planets INT
);
ALTER TABLE star ADD FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id);

INSERT INTO star (name, type, galaxy_id, number_of_orbiting_planets) 
VALUES 
    ('Sun', 'G-type main-sequence (G2V)', 1, 8),
    ('Betelgeuse', 'Red supergiant (M1-2Ia-Iab)', 1, NULL),
    ('Sirius', 'Main-sequence (A1V)', 1, 1),
    ('Alpha Centauri A', 'G-type main-sequence (G2V)', 1, 1),
    ('Rigel', 'Blue supergiant (B8Ia)', 1, NULL),
    ('Proxima Centauri', 'Red dwarf (M5.5Ve)', 1, 1);



CREATE TABLE planet_type (
    planet_type_id SERIAL PRIMARY KEY, 
    name VARCHAR(50) NOT NULL UNIQUE, 
    description TEXT
);

INSERT INTO planet_type (name, description) 
VALUES 
    ('Terrestrial', 'Rocky planets with solid surfaces, primarily composed of silicate rocks or metals.'),
    ('Gas Giant', 'Large planets with thick atmospheres mostly composed of hydrogen and helium, lacking a solid surface.'),
    ('Ice Giant', 'Similar to gas giants but with more icy and volatile compounds like water, ammonia, and methane.');



CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY, 
    name VARCHAR(50) NOT NULL UNIQUE, 
    planet_type_id INT NOT NULL,
    star_id INT NOT NULL, 
    has_life BOOLEAN,
    number_of_orbiting_moons INT
);
ALTER TABLE planet ADD FOREIGN KEY(star_id) REFERENCES star(star_id);
ALTER TABLE planet ADD FOREIGN KEY(planet_type_id) REFERENCES planet_type(planet_type_id);

INSERT INTO planet (name, planet_type_id, star_id, has_life, number_of_orbiting_moons) 
VALUES 
    ('Mercury', 1, 1, FALSE, 0),
    ('Venus', 1, 1, FALSE, 0),
    ('Earth', 1, 1, TRUE, 1),
    ('Mars', 1, 1, FALSE, 2),
    ('Jupiter', 2, 1, FALSE, 79),
    ('Saturn', 2, 1, FALSE, 83),
    ('Uranus', 2, 1, FALSE, 27),
    ('Neptune', 2, 1, FALSE, 14),
    ('Proxima Centauri b', 1, 6, FALSE, NULL),
    ('Sirius b1', 1, 3, FALSE, NULL),
    ('Alpha Centauri Bb', 1, 4, FALSE, NULL),
    ('Kepler-442b', 1, 1, FALSE, NULL);



CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY, 
    name VARCHAR(50) NOT NULL UNIQUE, 
    type VARCHAR(50) NOT NULL,
    planet_id INT NOT NULL, 
    is_spherical BOOLEAN
);
ALTER TABLE moon ADD FOREIGN KEY(planet_id) REFERENCES planet(planet_id);

INSERT INTO moon (name, type, planet_id, is_spherical) 
VALUES 
    ('Moon', 'Natural Satellite', 3, TRUE), 
    ('Phobos', 'Captured Asteroid', 4, FALSE), 
    ('Deimos', 'Captured Asteroid', 4, FALSE), 
    ('Io', 'Volcanic Moon', 5, TRUE), 
    ('Europa', 'Ice Moon', 5, TRUE), 
    ('Ganymede', 'Largest Moon', 5, TRUE), 
    ('Callisto', 'Cratered Moon', 5, TRUE), 
    ('Titan', 'Thick Atmosphere Moon', 6, TRUE), 
    ('Enceladus', 'Ice Moon', 6, TRUE), 
    ('Mimas', 'Small Icy Moon', 6, TRUE), 
    ('Triton', 'Retrograde Orbit Moon', 8, TRUE), 
    ('Proteus', 'Irregular Moon', 8, FALSE), 
    ('Oberon', 'Icy Moon', 7, TRUE), 
    ('Titania', 'Largest Uranian Moon', 7, TRUE), 
    ('Miranda', 'Deformed Moon', 7, TRUE), 
    ('Ariel', 'Icy Moon', 7, TRUE), 
    ('Umbriel', 'Dark Moon', 7, TRUE), 
    ('Charon', 'Binary System Moon', 9, TRUE), 
    ('Nix', 'Small Irregular Moon', 9, FALSE), 
    ('Hydra', 'Small Irregular Moon', 9, FALSE);
