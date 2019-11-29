TP - AN1 - [WU YUYUAN] - MYSQL
Questions
1) Quel est le meilleur type de données pour enregistrer les notes d’un étudiant ?
INT

2) Expliquez avec vos mots ce qu’est une jointure et une clé étrangère. En quoi est-ce différent ?
une jointure permet de récupérer des données de plusieurs tables différentes en une seule requête.
La clé étrangère est une contrainte indiquant que la donnée de contrainte se trouve dans une autre table.
une jointure ne utilise que lors une requête.

3) Expliquez avec vos mots ce qu’est une sous requête. Quelle est la différence avec une sous requête corrélée ?
Une sous-requête est une requête à l intérieur d une autre requête.
Une requête corrélée est une requête qui fait référence à une colonne qui n’est pas définie dans SA CLAUSE FROM

4) Expliquez avec vos mots la différence entre une jointure interne et une jointure externe
lors d une requête,
une jointure interne n affiche que quand il trouve les valeur correspondre, si il ne trouve pas il ne envois pas de ligne
une jointure externe retourne toujours la ligne, il affiche NULL quand il n y a pas de valeur

5) Expliquez avec vos mots ce qu’est une clé primaire
une clé primaire est la donnée qui permet d identifier de manière unique un enregistrement dans une table.

Requêtes
1) Importez ExamBDD.sql disponible sur Google Drive

2) Récupérez le nom, le prénom, l’année de naissance (dans une colonne nommée « annee ») et l’âge (dans une colonne nommée « age ») de tous les joueurs en triant par ordre décroissant les années
2 points testé
SELECT nom, prenom, date_naissance AS anne, YEAR(NOW()) - YEAR(date_naissance)  AS age
FROM joueurs
ORDER BY date_naissance DESC;

3) Récupérer le nom de toutes les équipes ayant jouées au moins 1 fois durant les 6 dernier mois
2 points testé
SELECT E1.nom, E2.nom FROM rencontres AS R

LEFT JOIN equipes AS E1
	ON E1.id = R.equipe_exterieur

LEFT JOIN equipes AS E2
	ON E2.id = R.equipe_domicile

WHERE rencontres.date_match > '2017-05-01'


4) Créez le joueur « Alfred Leroy » né le 17 Octobre 1993 occupant le poste d’attaquant, mesurant 1m76 et évoluant dans l’équipe du Stade Rennais depuis le 13 Mai 2011
INSERT INTO joueurs(nom, prenom, date_naissance, taille, poste)
1 point testé
VALUES('Alfred', 'Leroy', '1993-10-17', '176', 'Attaque');
INSERT INTO `assoc_j_e`(`id_joueur`, `id_equipe`, `date_entree`) VALUES ('29','1','2011-05-13');

5) Récupérez le nom, le prénom et la/les nationalité(s) de tous les joueurs ayant marqués au minimum 1 but en match. Triez ces résultats par nom de joueur et par ordre alphabétique.
3 points


SELECT J.nom,J.prenom,  LIMIT 1 FROM 	buts

WHERE buts

SELECT id_joueur LIMIT 1 FROM buts

6) Récupérez UNIQUEMENT la liste des nationalités qui ne sont associées à aucun joueur
2 points
SELECT nom FROM nationalite
NOT IN


7) Mettez à jour le joueur « Alfred Leroy », il s’appelle désormais « Joe Leroy »
1 point testé
UPDATE joueurs
SET nom = 'Joe'
WHERE id = 29;


8) Récupérez le prénom, le nom, le nombre de carton reçu, le nombre de but et le nombre de lettre compris dans le nom (dans une colonne nommé « longueur_nom ») de tous les joueurs ayant la lettre « p » dans leur prénom. Classez ces résultats par « longueur_nom » et par ordre décroissant
4 points
SELECT `prenom`,`nom`,() AS nb_cartons,(SELECT  FROM  WHERE  LIMIT 1) AS longueur_nom
FROM 	joueurs
WHERE 1
AND prenom LIKE '*P*';


9) Récupérez le nombre de nationalité total, le nombre de joueur total, le nombre d’équipe total, le nombre de carton total reçu ainsi que la somme totale des budgets de toutes les équipes (dans des colonnes respectivement nommées « nb_nationalite », « nb_joueur », « nb_equipe », « nb_carton », « somme_budget »)
4 points testé
SELECT (SELECT COUNT(id) FROM nationalite) AS nb_nationalite,
(SELECT COUNT(id) FROM joueurs) AS nb_joueurs,
(SELECT COUNT(id) FROM equipes) AS nb_equipes,
(SELECT COUNT(id) FROM cartons) AS nb_cartons,
(SELECT SUM(budget) FROM equipes) AS somme_budget

10) Récupérez le nombre de rencontre où plus de 2 buts ont été marqués (dans une colonne nommée « nb_rencontre »)
1 point


11) Récupérez le nom des équipes ayant joué un match entre le 1er Janvier 2012 et le 31 décembre 2012
1 point

SELECT equipe_exterieur, equipe_domicile FROM rencontres
WHERE date_match > '2012-01-01' && date_match < '2012-12-31'

GROUP BY id

12) Récupérer le nom et le prénom des joueurs de l’« AS Monaco » ayant pour nationalité l’Allemagne ou l’Argentine
1 point
SELECT (SELECT nom, prenom GROUP BY nom) AS Monaco FROM joueurs
WHERE assoc_j_n.id_nationalite = 2 || assoc_j_n.id_nationalite = 3;



13) Récupérez le nom et le prénom des joueurs ayant marqué plus d’un but lors d’un match
1 point
SELECT nom, prenom
FROM joueur
WHERE

ANY('id_joueur');

14) Récupérez le nom et le prénom (dans une seule colonne nommée « nom_prenom ») des joueurs ayant joué un mois de janvier (peu importe l’année)
3 points



15) Récupérez le nom et le prénom des joueurs ayant été expulsés lors d’un match
2 points
SELECT J.nom, J.prenom FROM assoc_j_c AS AJC

LEFT JOIN joueurs AS J
    ON J.id = AJC.id_joueur

WHERE AJC.id_carton = '2';

16) Récupérez le nom, le total de but marqué, la moyenne des buts marqués et le total de carton reçu pour chaque équipe
2 points

SELECT equipes.nom,

17) Récupérez les joueurs ayant des id compris entre 10 (inclus) et 21 (non-inclus)
1 point
SELECT `nom`, prenom FROM joueurs
WHERE joueurs.id >= 10 && joueurs.id < 21;

18) Récupérez le nom, le prénom, le nom de l’équipe et la date de création de l’équipe de tous les joueurs dont la lettre du prénom comme par « D »
2 points
SELECT joueurs.nom, joueures.prenom, equipes.nom, equipes.date_creation
FROM joueurs, equipes
WHERE joueurs.nom =
AND LIKE'D*'


19) Ecrivez la requête qui permettra de créer la clé étrangère qui va lier la colonne « id_carton » de la table « assoc_j_c » et la table « carton »
1 point
ALTER TABLE assoc_j_c
ADD FOREIGN KEY (id_carton) REFERENCES cartons(id);


20) Supprimez le joueur ayant l’id 29
1 point
DELETE FROM joueurs
WHERE id = 29;