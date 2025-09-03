create table bddFilms.langue (
    id INT (9) NOT NULL AUTO_INCREMENT,
    libelle CHARACTER (16) NOT NULL,
    abr     CHARACTER (4) NOT NULL  
);

create table bddFilms.realisateur (
    id INT (9) NOT NULL AUTO_INCREMENT,
    nom     CHARACTER (32) NOT NULL,
    prenom  CHARACTER (32) NOT NULL
);

create table bddFilms.acteur (
    id INT (9) NOT NULL AUTO_INCREMENT,
    nom     CHARACTER (32) NOT NULL,
    prenom  CHARACTER (32) NOT NULL
);

create table bddFilms.genre (
    id INT (9) NOT NULL AUTO_INCREMENT,
    libelle CHARACTER (16) NOT NULL
);

create table bddFilms.metrage (
    id INT (9) NOT NULL AUTO_INCREMENT,
    libelle CHARACTER (16) NOT NULL
);

create table bddFilms.film (
    id INT (9) NOT NULL AUTO_INCREMENT,
    titreFR         CHARACTER (64) NOT NULL,
    sous-titreFR    CHARACTER (32),
    annee           CHARACTER (4)  NOT NULL,
    id_realisateur  INT (9)   
);

create table bddFilms.serie (
    id_serie INT (9) NOT NULL AUTO_INCREMENT,
    titreFR     CHARACTER (32) NOT NULL,
    annee_debut CHARACTER (4)  NOT NULL,
    annee_fin   CHARACTER (4)
);

create table bddFilms.saison (
    id_saison INT (9) NOT NULL AUTO_INCREMENT,
    titreFR     CHARACTER (32),
    numero      INT (2)
);

create table bddFilms.episode (
    id_episode INT (9) NOT NULL AUTO_INCREMENT,
    titreFR     CHARACTER (32) NOT NULL,
    numero      INT (2)  
);

create table bddFilms.indexRecherche (
    id_indexRecherche INT (9) NOT NULL AUTO_INCREMENT,
    titreVO     CHARACTER (32) NOT NULL
);

create table bddFilms.video (
    id_video INT (9) NOT NULL AUTO_INCREMENT,
    qualite     CHARACTER (32) NOT NULL,
    duree       INT (2),
    sous-titres BOOLEAN NOT NULL DEFAULT TRUE,
    chemin      CHARACTER (255)
);



-- tables de liaison



create table bddFilms.film_apour_langue (
    id_film     INT (9) NOT NULL,
    id_langue   INT (9) NOT NULL,
    CONSTRAINT id PRIMARY KEY (id_film,id_langue)
);

create table bddFilms.serie_apour_langue (
    id_serie     INT (9) NOT NULL,
    id_langue   INT (9) NOT NULL,
    CONSTRAINT id PRIMARY KEY (id_serie,id_langue)
);

create table bddFilms.template (
    id_template     INT (9) NOT NULL,
    id_template   INT (9) NOT NULL,
    CONSTRAINT id PRIMARY KEY (id_template,id_template)
);








create table bddFilms.template (
    id_template     INT (9) NOT NULL,
    id_template   INT (9) NOT NULL,
    CONSTRAINT id PRIMARY KEY (id_template,id_template)
);