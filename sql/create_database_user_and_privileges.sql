CREATE DATABASE IF NOT EXISTS bddFilms;
SHOW DATABASES;

-- Allready created by docker compose mysql image.
-- CREATE USER 'php'@'%' IDENTIFIED BY 'php';
SELECT User FROM mysql.user;

GRANT ALL PRIVILEGES ON bddFilms.* TO 'php'@'%';

FLUSH PRIVILEGES;