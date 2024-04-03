CREATE DATABASE IF NOT EXISTS imdb;

USE imdb;

CREATE TABLE IF NOT EXISTS film (
    film_id INT AUTO_INCREMENT NOT NULL,
    title VARCHAR(300) NOT NULL,
    description TEXT NOT NULL,
    release_year INT NOT NULL,
    PRIMARY KEY (film_id)
);

CREATE TABLE IF NOT EXISTS actor (
    actor_id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (actor_id)
);

CREATE TABLE film_actor (
    actor_id INT,
    film_id INT,
    PRIMARY KEY (actor_id, film_id)
);

ALTER TABLE film
ADD COLUMN last_update DATETIME;

ALTER TABLE actor
ADD COLUMN last_update DATETIME;

ALTER TABLE film_actor
ADD CONSTRAINT fk_actor_id FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
ADD CONSTRAINT fk_film_id FOREIGN KEY (film_id) REFERENCES film(film_id);


INSERT INTO actor (first_name, last_name) VALUES
('Enzo', 'Gomez'),
('Ricardo', 'Garcia'),
('Thiago', 'Pereira'),
('Facundo', 'Gonzales');

INSERT INTO film (title, description, release_year) VALUES
('El Padrino', 'La película explora temas de poder, lealtad y tragedia en el mundo del crimen organizado.', 1972),
('Forrest Gump', 'Forrest Gump, un hombre con un coeficiente intelectual bajo, pero con una habilidad extraordinaria para estar presente en momentos clave de la historia de Estados Unidos, mientras busca el amor y su lugar en el mundo.', 1994),
('El Señor de los Anillos', 'La película sigue el viaje del joven hobbit Frodo Bolsón y su compañía mientras intentan destruir un poderoso anillo que amenaza con sumir a la Tierra Media en la oscuridad.', 2001),
('Origen', 'Un equipo de ladrones especializados en el robo de secretos corporativos utiliza tecnología para entrar en los sueños de las personas y extraer información valiosa.', 2010);

INSERT INTO film_actor (actor_id, film_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);
