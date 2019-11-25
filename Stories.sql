-- STORY #1
-- CRÉATION DE LA BASE DE DONNÉES
create DATABASE base_de_donnees CHARACTER SET 'utf8';

-- CRÉATION DE LA TABLE UTILISATEUR

create TABLE Utilisateur (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email VARCHAR(80) NOT NULL,
    mot_de_passe VARCHAR(200) NOT NULL,
    pseudo VARCHAR(20) NOT NULL,
    adresse VARCHAR(80),
    code_postal CHAR (5),
    ville VARCHAR(80),
    pays VARCHAR(80),
    numero_portable VARCHAR (10) ,
    numero_fixe VARCHAR (10) ,
    inscription DATETIME,
    PRIMARY KEY(id),
    UNIQUE(email),
    UNIQUE(pseudo)

)
ENGINE = INNODB;

-- CREATION DE LA TABLE SERVICE

create TABLE Service (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_utilisateur INT UNSIGNED NOT NULL,
    nom VARCHAR(50) NOT NULL,
    description VARCHAR(500)NOT NULL,
    adresse VARCHAR (80) NOT NULL,
    code_postal CHAR (5)  NOT NULL,
    ville VARCHAR (80)NOT NULL,
    pays VARCHAR (80)NOT NULL,
    date_et_heure DATETIME NOT NULL,
    informations_complementaires TEXT,
    PRIMARY KEY (id)

)
ENGINE = INNODB;

--CREATION DE LA TABLE SERVICE-UTILISATEUR

create TABLE Service_utilisateur (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_service INT UNSIGNED NOT NULL,
    id_utilisateur INT UNSIGNED NOT NULL,
    inscription DATETIME NOT NULL,
    PRIMARY KEY(id)
)
ENGINE INNODB;

--CREATION DE LA TABLE MESSAGE

create TABLE Message(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_expediteur INT UNSIGNED NOT NULL,
    id_receveur INT UNSIGNED NOT NULL,
    contenu_message VARCHAR(500) NOT NULL,
    envois DATETIME NOT NULL,
    PRIMARY KEY(id)
)
ENGINE INNODB;

-- STORY #3
-- CREATION DE 10 UTILISATEURS DANS LA TABLE UTILISATEURS

insert into Utilisateur (email, mot_de_passe, pseudo, inscription)
values
 ('wu.yuyuan@hotmail.com', 'dksdfqjih', 'yuyuan', '1800-11-11 01:11:11'),
 ('broboris@vraibro.com', 'dksdbrozsfdc', 'bob', '1789-11-11 01:11:11'),
 ('teddylefou@neurone.fr', 'sdfghjk', 'ted', '2019-11-11 01:11:11'),
 ('kevin@paillettes.fr', 'moulure', 'kevin', '1994-11-11 01:11:11'),
 ('wu.yuan@hotmail.com', 'dksdfqjih', 'yuan', '1800-11-11 01:11:11'),
 ('broris@vraibro.com', 'dksdbrozsfdc', 'bo', '1789-11-11 01:11:11'),
 ('tedlefou@neurone.fr', 'sdfghjk', 'tedd', '2019-11-11 01:11:11'),
 ('wyuan@hotmail.com', 'dksdfqjih', 'yun', '1800-11-11 01:11:11'),
 ('brris@vraibro.com', 'dksdbrozsfdc', 'bodddb', '1789-11-11 01:11:11'),
 ('keviddn@paillettes.fr', 'moulure', 'keviddn', '1994-11-11 01:11:11');

-- MODIFICATION DE LA TAILLE DU MOT DE PASSE

ALTER TABLE Utilisateur
MODIFY mot_de_passe VARCHAR(200) NOT NULL

-- STORY #4
-- mise à jour de l'utilisateurs (id 26 à 35)
UPDATE Utilisateur
SET adresse = "45 rue de je ne sais pas quoi", code_postal = "80200", ville = "Péronne", pays = "France", numero_portable = "0600780650", numero_fixe = "0167008960"
WHERE id = 26;
UPDATE Utilisateur
SET adresse = "22 v'la les condés ", code_postal = "75013", ville = "paris", pays = "France", numero_portable = "0603454560", numero_fixe = "0000000000"
WHERE id = 27;
UPDATE Utilisateur
SET adresse = "chez tonton ", code_postal = "75016", ville = "beijing", pays = "CHINE", numero_portable = "0670895647", numero_fixe = "0170895647"
WHERE id = 28;
UPDATE Utilisateur
SET adresse = "Chez tata ", code_postal = "60120", ville = "tokyo", pays = "japon", numero_portable = "0600890000", numero_fixe = "0100007800"
WHERE id = 29;
UPDATE Utilisateur
SET adresse = "46 rue du moulin ", code_postal = "59200", ville = "Lille", pays = "France", numero_portable = "0690786756", numero_fixe = "0123400009"
WHERE id = 30;
UPDATE Utilisateur
SET adresse = "39 rue de la rose", code_postal = "56000", ville = "le mans", pays = "france", numero_portable = "0670000000", numero_fixe = "0167800965"
WHERE id = 31;
UPDATE Utilisateur
SET adresse = "78 rue du général", code_postal = "78200", ville = "Saint quentin en yvelines", pays = "france", numero_portable = "0680907090", numero_fixe = "0307908000"
WHERE id = 32;
UPDATE Utilisateur
SET adresse = "place de la fontaine", code_postal = "69000", ville = "Lyon", pays = "france", numero_portable = "0607090500", numero_fixe = "0200709970"
WHERE id = 33;
UPDATE Utilisateur
SET adresse = "6 impasse des joncquilles", code_postal = "75010", ville = "paris", pays = "france", numero_portable = "0608090457", numero_fixe = "0305799640"
WHERE id = 34;
UPDATE Utilisateur
SET adresse = "Chez Romain ", code_postal = "80210", ville = "nanning", pays = "chine", numero_portable = "0000000000", numero_fixe = "0000000000"
WHERE id = 35;


-- STORY #5
-- Ajouter la clé étranger dans la table de service
-- Creation des 10 services différents

INSERT INTO Service (id_utilisateur, nom, description, adresse, code_postal, ville, pays, date_et_heure, informations_complementaires)
	VALUES
    (26,'traiteur chinois','plat du jour à 7 euros. livraison express','metro porte de champerret', '75017','paris', 'france', '2019-11-24 13:00:00','efficace et bon'),
    (27,'traiteur alsacien','biere et bretzel','port de kiehl','67000', 'strasbourg','france','2019-11-23 12:00:00','HIPS'),
	(28,'chef indien','bison et cochon d Inde','36 rue du ruisseau','75017','Paris','france','2019-12-24 20:30:24','Attention au calumet'),
    (29,'Pasta Pizza','Restaurant Intalien','76 Blv Victor Hugo','92110','Clichy','france','2019-08-14 15:35:26','Il n y a pas de sauce piquante'),
    (30,'Shingane','Restauration coreenne','63 Ave Gambetta','75020','Paris','france','2019-10-23 14:10:05','Divinement bon'),
    (31,'Jabal Liban','Libanais','84 rue du ménilmontant','75020','Paris','france','2019-05-24 23:40:35','Tres bon accueil'),
    (32,'Le Gabriel','Gastronomie Francaise','42 Ave Gabriel','75008','Paris','france','2019-04-24 16:34:56','Un must'),
    (33,'McDonalds','Fast food americian','43 Blv de Verdun','45000','Orléans','france','2019-01-30 12:32:12','Pas assez de sel'),
    (34,'O tacos','faux buritos','49 rue du faubourg','45000','Orléans','France','2019-02-08 12:22:21','cest clairement pas bon'),
    (35,'chido','vrai buritos','2 rue saint philippe du roule','75008','Paris','France','2019-11-28 12:30:30','on verra si cest bon'),
    (36,'O Pavao','cuisine portugaise','25 rue jean jaurès','92300','Levallois-Perret','France','2019-11-26 12:30:00','on verra si cest bon');



--  STORY #6
-- 