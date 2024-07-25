CREATE DATABASE pokemones
-- Crear la tabla de Pokémon
CREATE TABLE pokemon (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(50),
    habilidad VARCHAR(50),
    ataque INT,
    defensa INT,
    velocidad INT
);

-- Crear la tabla de Entrenadores
CREATE TABLE entrenadores (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    edad INT,
    ciudad VARCHAR(50)
);

-- Crear la tabla intermedia para la relación entre Entrenadores y Pokémon
CREATE TABLE entrenador_pokemon (
    entrenador_id INT,
    pokemon_id INT,
    PRIMARY KEY (entrenador_id, pokemon_id),
    FOREIGN KEY (entrenador_id) REFERENCES entrenadores(id),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(id)
);

-- Crear la tabla de Batallas
CREATE TABLE batallas (
    id INT PRIMARY KEY,
    entrenador1_id INT,
    entrenador2_id INT,
    pokemon1_id INT,
    pokemon2_id INT,
    fecha DATE,
    resultado VARCHAR(50),
    FOREIGN KEY (entrenador1_id) REFERENCES entrenadores(id),
    FOREIGN KEY (entrenador2_id) REFERENCES entrenadores(id),
    FOREIGN KEY (pokemon1_id) REFERENCES pokemon(id),
    FOREIGN KEY (pokemon2_id) REFERENCES pokemon(id)
);

-- Insertar datos en la tabla de Entrenadores
INSERT INTO entrenadores (id, nombre, edad, ciudad) VALUES
(1, 'Ash Ketchum', 10, 'Pueblo Paleta'),
(2, 'Misty', 12, 'Ciudad Celeste');


-- Insertar datos en la tabla de Pokémon
INSERT INTO pokemon (id, nombre, tipo, habilidad, ataque, defensa, velocidad) VALUES
(1, 'Pikachu', 'Eléctrico', 'Electrostático', 55, 40, 90),
(2, 'Charmander', 'Fuego', 'Mar Llamas', 52, 43, 65),
(3, 'Squirtle', 'Agua', 'Torrente', 48, 65, 43),
(4, 'Bulbasaur', 'Planta', 'Espesura', 49, 49, 45),
(5, 'Eevee', 'Normal', 'Adaptable', 55, 50, 55),
(6, 'Jigglypuff', 'Normal', 'Cuerpo Puro', 45, 20, 20),
(7, 'Gengar', 'Fantasma', 'Levita', 65, 60, 110),
(8, 'Onix', 'Roca', 'Cabeza Roca', 45, 160, 70),
(9, 'Snorlax', 'Normal', 'Inmunidad', 110, 65, 30),
(10, 'Mewtwo', 'Psíquico', 'Presión', 110, 90, 130),
(11, 'Charizard', 'Fuego/Volador', 'Mar Llamas', 84, 78, 100),
(12, 'Dragonite', 'Dragón/Volador', 'Foco Interno', 134, 95, 80),
(13, 'Lucario', 'Lucha/Acero', 'Impasible', 110, 70, 90),
(14, 'Garchomp', 'Dragón/Tierra', 'Velo Arena', 130, 95, 102),
(15, 'Greninja', 'Agua/Siniestro', 'Mutatipo', 95, 67, 122),
(16, 'Tyranitar', 'Roca/Siniestro', 'Chorro Arena', 134, 110, 61),
(17, 'Metagross', 'Acero/Psíquico', 'Cuerpo Puro', 135, 130, 70),
(18, 'Blaziken', 'Fuego/Lucha', 'Mar Llamas', 120, 70, 80),
(19, 'Gardevoir', 'Psíquico/Hada', 'Sincronía', 65, 65, 80),
(20, 'Gallade', 'Psíquico/Lucha', 'Impasible', 125, 65, 80);


-- Relacionar entrenadores con Pokémon
INSERT INTO entrenador_pokemon (entrenador_id, pokemon_id) VALUES
(1, 1),  -- Ash Ketchum - Pikachu
(1, 2),  -- Ash Ketchum - Charmander
(1, 3),  -- Ash Ketchum - Squirtle
(1, 4),  -- Ash Ketchum - Bulbasaur
(1, 5),  -- Ash Ketchum - Eevee
(1, 6),  -- Ash Ketchum - Jigglypuff
(1, 7),  -- Ash Ketchum - Gengar
(1, 8),  -- Ash Ketchum - Onix
(1, 9),  -- Ash Ketchum - Snorlax
(1, 10), -- Ash Ketchum - Mewtwo
(2, 11), -- Misty - Charizard
(2, 12), -- Misty - Dragonite
(2, 13), -- Misty - Lucario
(2, 14), -- Misty - Garchomp
(2, 15), -- Misty - Greninja
(2, 16), -- Misty - Tyranitar
(2, 17), -- Misty - Metagross
(2, 18), -- Misty - Blaziken
(2, 19), -- Misty - Gardevoir
(2, 20); -- Misty - Gallade

-- Insertar datos en la tabla de Batallas
INSERT INTO batallas (id, entrenador1_id, entrenador2_id, pokemon1_id, pokemon2_id, fecha, resultado) VALUES
(1, 1, 2, 1, 11, '2024-07-20', 'Gana Ash'),
(2, 1, 2, 3, 12, '2024-07-21', 'Gana Misty');

-- Consultas y operaciones requeridas

-- Ver la tabla completa de Pokémon
SELECT * FROM pokemon;

-- Eliminar un registro duplicado en la tabla Pokémon
DELETE FROM pokemon
WHERE id NOT IN (
    SELECT MIN(id)
    FROM pokemon
    GROUP BY nombre, tipo, habilidad, ataque, defensa, velocidad
);

-- Verificar la tabla de Entrenadores
SELECT * FROM entrenadores;

-- Actualizar el nombre de uno de los entrenadores Pokémon
UPDATE entrenadores
SET nombre = 'Brock'
WHERE id = 2;

-- Verificar la tabla de Entrenadores después de la actualización
SELECT * FROM entrenadores;

-- Verificar la tabla de Pokémon
SELECT * FROM pokemon;

-- Insertar datos en la tabla de Batallas
-- Asegúrate de que los IDs de entrenadores y Pokémon existen antes de insertar
INSERT INTO batallas (id, entrenador1_id, entrenador2_id, pokemon1_id, pokemon2_id, fecha, resultado) VALUES
(3, 1, 2, 1, 12, '2024-07-22', 'Gana Ash');

-- Ver la tabla de Batallas
SELECT * FROM batallas;

-- OPERACIONES MULTITABLA

-- Unir las tablas de Pokémon, entrenadores y la tabla intermedia para ver los nombres
SELECT e.nombre AS entrenador, p.nombre AS pokemon
FROM entrenadores e
JOIN entrenador_pokemon ep ON e.id = ep.entrenador_id
JOIN pokemon p ON ep.pokemon_id = p.id;

