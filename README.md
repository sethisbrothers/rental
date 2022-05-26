Ajouté un film

INSERT INTO `films` (`titre`,`date_de_sortie`,`durée`,`réalisateur`) VALUES ('John WICK',2021, 150,'MARVEL');

modifier un film

UPDATE `films` SET `titre` = 'JACKIE CHAN' WHERE id=1;

UPDATE `films` SET `date_de_sortie` = 2001 WHERE id=1;

UPDATE `films` SET `durée` = 100 WHERE id=1;

UPDATE `films` SET `réalisateur` = 'chiwuan' WHERE id=1;

supprimer un film

DELETE FROM `films` WHERE `id`=1;

ajouter un client

INSERT INTO `clients` (`nom`,`prenom`,`email`) VALUES ('KODJO','AMIVI','kodami@gmail.com');

modifier un client

UPDATE `clients` SET `nom`='AKAKPO' WHERE `id`=2;

UPDATE `clients` SET `prenom`='adjo' WHERE `id`=2;

UPDATE `clients` SET `email`='Akadjo@gmail.com' WHERE `id`=2;

supprimer un client

DELETE FROM `clients` WHERE `id`=3;

afficher les 3 derniers films ajoutés

SELECT * FROM rental.films ORDER BY idfilms ASC LIMIT 3;