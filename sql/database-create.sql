create table bddFilms.langue (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    libelle CHARACTER(16) NOT NULL,
    abr CHARACTER(4) NOT NULL
);

create table bddFilms.realisateur (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    nom CHARACTER(32) NOT NULL,
    prenom CHARACTER(32) NOT NULL
);

create table bddFilms.acteur (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    nom CHARACTER(32) NOT NULL,
    prenom CHARACTER(32) NOT NULL
);

create table bddFilms.genre (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    libelle CHARACTER(16) NOT NULL
);

create table bddFilms.metrage (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    libelle CHARACTER(16) NOT NULL
);

create table bddFilms.film (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    titreFR CHARACTER(64) NOT NULL,
    sousTitreFR CHARACTER(32),
    annee CHARACTER(4) NOT NULL,
    id_realisateur INT(9),
    id_metrage INT(9),
    FOREIGN KEY (id_realisateur) REFERENCES bddFilms.realisateur (id),
    FOREIGN KEY (id_metrage) REFERENCES bddFilms.metrage (id)
);

create table bddFilms.serie (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    titreFR CHARACTER(32) NOT NULL,
    annee_debut CHARACTER(4) NOT NULL,
    annee_fin CHARACTER(4)
);

create table bddFilms.saison (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    titreFR CHARACTER(32),
    numero INT(2),
    id_serie INT(9),
    id_realisateur INT(9),
    FOREIGN KEY (id_serie) REFERENCES bddFilms.serie (id),
    FOREIGN KEY (id_realisateur) REFERENCES bddFilms.realisateur (id)
);

create table bddFilms.episode (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    titreFR CHARACTER(32) NOT NULL,
    numero INT(2),
    id_serie INT(9),
    FOREIGN KEY (id_serie) REFERENCES bddFilms.serie (id)
);

create table bddFilms.indexRecherche (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    titreVO CHARACTER(32) NOT NULL,
    sousTitreVO CHARACTER(32),
    id_film INT(9),
    id_serie INT(9),
    FOREIGN KEY (id_film) REFERENCES bddFilms.film (id),
    FOREIGN KEY (id_serie) REFERENCES bddFilms.serie (id)
);

create table bddFilms.video (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    qualite CHARACTER(32) NOT NULL,
    duree INT(2),
    sousTitres BOOLEAN NOT NULL DEFAULT TRUE,
    chemin CHARACTER(255)
);

-- tables de liaison

create table bddFilms.film_apour_langue (
    id_film INT(9) NOT NULL,
    id_langue INT(9) NOT NULL,
    CONSTRAINT id PRIMARY KEY (id_film, id_langue),
    FOREIGN KEY (id_film) REFERENCES bddFilms.film (id),
    FOREIGN KEY (id_langue) REFERENCES bddFilms.langue (id)
);

create table bddFilms.film_apour_acteur (
    id_film INT(9) NOT NULL,
    id_acteur INT(9) NOT NULL,
    CONSTRAINT id PRIMARY KEY (id_film, id_acteur),
    FOREIGN KEY (id_film) REFERENCES bddFilms.film (id),
    FOREIGN KEY (id_acteur) REFERENCES bddFilms.acteur (id)
);

create table bddFilms.film_apour_genre (
    id_film INT(9) NOT NULL,
    id_genre INT(9) NOT NULL,
    CONSTRAINT id PRIMARY KEY (id_film, id_genre),
    FOREIGN KEY (id_film) REFERENCES bddFilms.film (id),
    FOREIGN KEY (id_genre) REFERENCES bddFilms.genre (id)
);

create table bddFilms.serie_apour_langue (
    id_serie INT(9) NOT NULL,
    id_langue INT(9) NOT NULL,
    CONSTRAINT id PRIMARY KEY (id_serie, id_langue),
    FOREIGN KEY (id_serie) REFERENCES bddFilms.serie (id),
    FOREIGN KEY (id_langue) REFERENCES bddFilms.langue (id)
);

create table bddFilms.serie_apour_acteur (
    id_serie INT(9) NOT NULL,
    id_acteur INT(9) NOT NULL,
    CONSTRAINT id PRIMARY KEY (id_serie, id_acteur),
    FOREIGN KEY (id_serie) REFERENCES bddFilms.serie (id),
    FOREIGN KEY (id_acteur) REFERENCES bddFilms.acteur (id)
);

create table bddFilms.serie_apour_genre (
    id_serie INT(9) NOT NULL,
    id_genre INT(9) NOT NULL,
    CONSTRAINT id PRIMARY KEY (id_serie, id_genre),
    FOREIGN KEY (id_serie) REFERENCES bddFilms.serie (id),
    FOREIGN KEY (id_genre) REFERENCES bddFilms.genre (id)
);
--+-------------------------------------+
--| Template for linking tables.        |
--+-------------------------------------+
-- create table bddFilms.template (
--     id_templateA INT(9) NOT NULL,
--     id_templateB INT(9) NOT NULL,
--     CONSTRAINT id PRIMARY KEY (id_templateA, id_templateB),
--     FOREIGN KEY (id_templateA) REFERENCES bddFilms.templateA (id),
--     FOREIGN KEY (id_templateB) REFERENCES bddFilms.templateB (id)
-- );

commit;
