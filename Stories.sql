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

alter table Utilisateur
modify mot_de_passe VARCHAR(200) NOT NULL

-- STORY #4
-- mise à jour de l'utilisateurs (id 26 à 35)
update Utilisateur
set adresse = "45 rue de je ne sais pas quoi", code_postal = "80200", ville = "Péronne", pays = "France", numero_portable = "0600780650", numero_fixe = "0167008960"
where id = 26;
update Utilisateur
set adresse = "22 v'la les condés ", code_postal = "75013", ville = "paris", pays = "France", numero_portable = "0603454560", numero_fixe = "0000000000"
where id = 27;
update Utilisateur
set adresse = "chez tonton ", code_postal = "75016", ville = "beijing", pays = "CHINE", numero_portable = "0670895647", numero_fixe = "0170895647"
where id = 28;
update Utilisateur
set adresse = "Chez tata ", code_postal = "60120", ville = "tokyo", pays = "japon", numero_portable = "0600890000", numero_fixe = "0100007800"
where id = 29;
update Utilisateur
set adresse = "46 rue du moulin ", code_postal = "59200", ville = "Lille", pays = "France", numero_portable = "0690786756", numero_fixe = "0123400009"
where id = 30;
update Utilisateur
set adresse = "39 rue de la rose", code_postal = "56000", ville = "le mans", pays = "france", numero_portable = "0670000000", numero_fixe = "0167800965"
where id = 31;
update Utilisateur
set adresse = "78 rue du général", code_postal = "78200", ville = "Saint quentin en yvelines", pays = "france", numero_portable = "0680907090", numero_fixe = "0307908000"
where id = 32;
update Utilisateur
set adresse = "place de la fontaine", code_postal = "69000", ville = "Lyon", pays = "france", numero_portable = "0607090500", numero_fixe = "0200709970"
where id = 33;
update Utilisateur
set adresse = "6 impasse des joncquilles", code_postal = "75010", ville = "paris", pays = "france", numero_portable = "0608090457", numero_fixe = "0305799640"
where id = 34;
update Utilisateur
set adresse = "Chez Romain ", code_postal = "80210", ville = "nanning", pays = "chine", numero_portable = "0000000000", numero_fixe = "0000000000"
where id = 35;


-- STORY #5
-- Ajouter la clé étranger dans la table de service
-- Creation des 10 services différents

insert into Service (id_utilisateur, nom, description, adresse, code_postal, ville, pays, date_et_heure, informations_complementaires)
	values
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

delete from Service
where id = 11;

--  STORY #6
--  création des 12 Utilisateurs services

insert into Service_utilisateur (id_service, id_utilisateur, inscription)
values
(1,27,'2019-11-25 12:00:00'),
(2,26,'2019-11-24 12:00:00'),
(3,34,'2019-12-10 13:45:34'),
(5,31,'2019-10-25 20:45:34'),
(4,34,'2019-04-30 15:25:30'),
(6,26,'2019-07-26 14:24:20'),
(7,29,'2019-06-12 12:00:00'),
(8,35,'2019-12-01 01:07:46'),
(9,30,'2019-12-31 21:27:12'),
(10,28,'2019-11-29 08:34:54'),
(5,33,'2019-11-23 11:28:32'),
(8,32,'2019-12-13 02:23:12');

-- ADD FOREIGN KEY Service -> Utilisateur

alter table Service
add FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id) ON delete CASCADE ON update CASCADE;

-- add foreign keys service utilisateur = > utilisateur et services
alter table Service_utilisateur
add FOREIGN KEY (id_service) REFERENCES Service(id) ON delete CASCADE ON update CASCADE,
ADD FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id) ON delete CASCADE ON update CASCADE;

-- STORY #7
-- add 25 messages dans la table message

insert into Message (id_expediteur,id_receveur,contenu_message,envois)
values
(26,35,'coucou aimes tu le coréen ?','2019-11-28 11:12:57'),
(27, 34,'bonjour tout court', '2019-11-29 12:12:56'),
(28,33,'bonjour tout long','2019-11-29 13:13:13'),
(29,32,'hello world','2019-11-30 13:12:00'),
(30,31,'passe moi la moutarde','2019-12-01 12:12:12'),
(31,30,'est ce que tu veux le sel aussi','2019-12-01 18:13:12'),
(30,31,'oui je veux bien ramene le chips aussi','2019-12-01 18:14:12'),
(31,30,'ok ca marche','2019-12-01 18:15:12'),
(31,30,'a tout','2019-12-01 18:16:12'),
(35,26 ,'et je peux savoir en quoi ca te regarde ?','2019-12-01 12:13:12'),
(26,35,'lol je t invite ce soir... ou pas','2019-12-02 12:13:12'),
(35,26,'ca marche gros, rdv ce soir à 19H30 au métro','2019-12-02 13:13:12'),
(26,35,'je suis la','2019-12-28 12:14:12'),
(26,35,'tes ou','2019-12-28 12:15:12'),
(26,35,'tes la?','2019-12-28 12:16:12'),
(26,35,'ou tu es?','2019-12-28 12:17:12'),
(26,35,'merde','2019-12-28 12:18:12'),
(26,35,'je men vais','2019-12-28 12:19:12'),
(35,26,'je suis la','2019-12-28 18:13:12'),
(35,26,'tu es partie?','2019-12-28 18:14:12'),
(35,26,'desole','2019-12-28 18:15:12'),
(35,26,'jai un enpechement','2019-12-28 18:17:12'),
(35,26,'tu reviens?','2019-12-28 18:18:12'),
(35,26,'merde','2019-12-28 18:19:12'),
(35,26,'je men vais moi aussi','2019-12-28 18:20:12');


-- ADD clé étranger dans la table message
alter table Message
add FOREIGN KEY(id_expediteur) REFERENCES Utilisateur(id) ON delete CASCADE ON update CASCADE,
ADD FOREIGN KEY(id_receveur) REFERENCES Utilisateur(id) ON delete CASCADE ON update CASCADE;


-- nouveaux messages pour completer notre base de données

insert into Message (id_expediteur,id_receveur,contenu_message,envois)
values
(26,30,'ca va','2019-11-28 12:13:57'),
(30,26,'nickel mec, ce soir c est psg real','2019-11-28 13:12:57'),
(26,30,'on va le voir devant une binouze ?','2019-11-28 14:12:57'),
(30,26, 'ca va','2019-11-28 15:12:57'),
(26,28,'hé au fait on va voir ce soir le march, que dirais tu d  une bonne pizz ?','2019-11-28 14:12:57'),
(28,26,'desole je n aime pas les sports de beaufs. je vais a l opera ce soir avec la daronne de K.','2019-11-28 15:12:57'),
(26,28,'arretons les blagues sur les daronnes','2019-11-28 16:12:57');

-- STORY #8
-- reception par ordre du dernier message reçu
-- PREMIER ESSAIS

select contenu_message, id_expediteur, id_receveur, envois from Message
where (id_receveur = 26 and id_expediteur != 26)
or (id_expediteur = 26 and id_receveur != 26)
order by envois desc;


-- DEUXIEME ESSAI

select contenu_message, (id_expediteur+id_receveur) as somme from Message
where id_expediteur = 26 or id_receveur = 26
group by somme
order by envois desc

-- Troisième essai
select contenu_message, (id_expediteur + id_receveur) as envois
where max(envois) FROM Message
GRUOP BY somme;


-- CODE IVANN

select id_expediteur, id_receveur, contenu_message, envois from message
where envois in (select max(envois) from message
where id_receveur = 26
group by id_expediteur;


select contenu_message from Message where envois = (select max(envois) from Message)


-- STORY #9
-- conversation par ordre du dernier message reçu entre deux utilisateurs

select contenu_message from Message
where (id_expediteur = 26 and id_receveur = 35) or (id_expediteur = 35 and id_receveur = 26)
order by envois desc;

-- STORY #10
-- Rechercher la liste de tous les services encore disponibles

SELECT * FROM Service AS S
WHERE S.id NOT IN (SELECT id_service FROM Service_utilisateur)
AND date_et_heure >= NOW()
ORDER BY date_et_heure DESC, ville ASC;

-- STORY #11
-- afficher toutes les infos du service
-- afficher le pseudo du traiteur
-- afficher le numéro du traiteur
-- affichier le pseudo du client

    -- 1) Afficher tous les services
SELECT  S.*, U.pseudo AS pseudo_traiteur, U.numero_portable AS numero_traiteur, (SELECT U2.pseudo FROM Service_utilisateur WHERE SU.id_utilisateur LIMIT 1) as pseudo_client
FROM service AS S

LEFT JOIN Utilisateur AS U
	ON U.id = S.id_utilisateur

LEFT JOIN Service_utilisateur AS SU
	ON SU.id_service = S.id

LEFT JOIN Utilisateur AS U2
    ON U2.id = SU.id_utilisateur


    -- 2) Afficher un service en particulier (NOT NULL)
SELECT  S.*, U.pseudo AS pseudo_traiteur, U.numero_portable AS numero_traiteur, (SELECT U2.pseudo FROM Service_utilisateur WHERE SU.id_utilisateur LIMIT 1) as pseudo_client
FROM service AS S

LEFT JOIN Utilisateur AS U
	ON U.id = S.id_utilisateur

LEFT JOIN Service_utilisateur AS SU
	ON SU.id_service = S.id

LEFT JOIN Utilisateur AS U2
    ON U2.id = SU.id_utilisateur

WHERE S.id = 1  AND U2.pseudo IS NOT NULL

-- STORY #12
-- suppression d'un service proposé

DELETE FROM Service
WHERE id = 8

-- STORY #13
-- suppression d'une de mes inscriptions à un service

DELETE FROM Service_utilisateur
WHERE id_utilsateur = 34 AND id_service = 3

-- STORY #14
-- suppression de mon profil entrainant la suppression de son service, de son inscription et de ses messages
-- 1
DELETE FROM Utilisateur
WHERE id = 30

-- STORY #15
-- suppression d'un message

DELETE FROM Message
WHERE id = 1

-- STORY #16
-- PARTIE 1: récupérer l'historique des services auxquels un utilisateur aura participé

SELECT S.*, U.pseudo AS pseudo_traiteur, U2.*
FROM Service AS S

LEFT JOIN Utilisateur AS U
	ON U.id = S.id_utilisateur

LEFT JOIN Service_utilisateur AS SU
	ON SU.id_service = S.id

LEFT JOIN Utilisateur AS U2
	ON U2.id = SU.id_utilisateur

ORDER BY  S.date_et_heure DESC, S.ville ASC;


-- PARTIE 2: compter le nombres de services
SELECT id_utilisateur, COUNT(*) AS nombre
FROM Service_utilisateur
GROUP BY id_utilisateur

-- code tatuage
SELECT S.*,
(SELECT COUNT(SU.id)
 FROM Service_utilisateur AS SU
 INNER JOIN Utilisateur
 ON SU.id_utilisateur = Utilisateur.id
 WHERE Utilisateur.id = 10)
 AS TOTAL
 FROM Service_utilisateur AS SU
 INNER JOIN Utilisateur
 ON Utilisateur.id = SU.id_utilisateur
 LEFT JOIN Service AS S
 ON S.id_utilisateur =10
 ORDER BY S.date_et_heure,S.ville ASC;

-- STORY #17
-- récupérer les informations du premier service auquel un utilisateur a participé.



-- STORY #18
