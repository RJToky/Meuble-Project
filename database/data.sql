INSERT INTO matiere (nom)
VALUES ('Matiere A');
INSERT INTO matiere (nom)
VALUES ('Matiere B');
INSERT INTO matiere (nom)
VALUES ('Matiere C');
INSERT INTO matiere (nom)
VALUES ('Matiere D');

INSERT INTO "style" (nom)
VALUES ('Style A');
INSERT INTO "style" (nom)
VALUES ('Style B');
INSERT INTO "style" (nom)
VALUES ('Style C');

INSERT INTO matierestyle (idmatiere, idstyle)
VALUES (1, 1);
INSERT INTO matierestyle (idmatiere, idstyle)
VALUES (1, 2);
INSERT INTO matierestyle (idmatiere, idstyle)
VALUES (1, 3);
INSERT INTO matierestyle (idmatiere, idstyle)
VALUES (2, 2);
INSERT INTO matierestyle (idmatiere, idstyle)
VALUES (2, 3);
INSERT INTO matierestyle (idmatiere, idstyle)
VALUES (3, 1);
INSERT INTO matierestyle (idmatiere, idstyle)
VALUES (3, 2);
INSERT INTO matierestyle (idmatiere, idstyle)
VALUES (3, 3);
INSERT INTO matierestyle (idmatiere, idstyle)
VALUES (4, 1);
INSERT INTO matierestyle (idmatiere, idstyle)
VALUES (4, 3);

INSERT INTO taille (nom)
VALUES ('Taille A');
INSERT INTO taille (nom)
VALUES ('Taille B');
INSERT INTO taille (nom)
VALUES ('Taille C');

INSERT INTO categorie (nom)
VALUES ('Categ A');
INSERT INTO categorie (nom)
VALUES ('Categ B');
INSERT INTO categorie (nom)
VALUES ('Categ C');
INSERT INTO categorie (nom)
VALUES ('Categ D');

INSERT INTO meuble (nom, idcategorie, idstyle)
VALUES ('Meuble A', 1, 2);
INSERT INTO meuble (nom, idcategorie, idstyle)
VALUES ('Meuble B', 2, 1);
INSERT INTO meuble (nom, idcategorie, idstyle)
VALUES ('Meuble C', 1, 3);
INSERT INTO meuble (nom, idcategorie, idstyle)
VALUES ('Meuble D', 1, 2);
INSERT INTO meuble (nom, idcategorie, idstyle)
VALUES ('Meuble E', 3, 1);
INSERT INTO meuble (nom, idcategorie, idstyle)
VALUES ('Meuble F', 2, 2);
INSERT INTO meuble (nom, idcategorie, idstyle)
VALUES ('Meuble G', 3, 2);
INSERT INTO meuble (nom, idcategorie, idstyle)
VALUES ('Meuble H', 1, 3);
INSERT INTO meuble (nom, idcategorie, idstyle)
VALUES ('Meuble K', 1, 2);
INSERT INTO meuble (nom, idcategorie, idstyle)
VALUES ('Meuble I', 3, 2);

INSERT INTO fabricationmeuble (idmeuble, idtaille, idmatiere, quantite) 
	VALUES (1, 1, 1, 2.0);
INSERT INTO fabricationmeuble (idmeuble, idtaille, idmatiere, quantite) 
	VALUES (1, 1, 3, 3.0);
INSERT INTO fabricationmeuble (idmeuble, idtaille, idmatiere, quantite) 
	VALUES (2, 3, 1, 2.0);
INSERT INTO fabricationmeuble (idmeuble, idtaille, idmatiere, quantite) 
	VALUES (2, 2, 2, 4.0);
INSERT INTO fabricationmeuble (idmeuble, idtaille, idmatiere, quantite) 
	VALUES (3, 2, 2, 1.0);
INSERT INTO fabricationmeuble (idmeuble, idtaille, idmatiere, quantite) 
	VALUES (3, 2, 1, 4.0);
INSERT INTO fabricationmeuble (idmeuble, idtaille, idmatiere, quantite) 
	VALUES (3, 1, 2, 2.0);
INSERT INTO fabricationmeuble (idmeuble, idtaille, idmatiere, quantite) 
	VALUES (2, 2, 1, 4.0);


---------------------------------------------------------


insert into Matiere values
    (default, 'Tissu'),
    (default, 'Perle'),
    (default, 'Chaine');

insert into "Style" values
    (default, 'Boheme');

insert into MatiereStyle values
    (default, 1, 1),
    (default, 2, 1),
    (default, 3, 1);

insert into Categorie values
    (default, 'Table'),
    (default, 'Chaise'),
    (default, 'Canape');

insert into Taille values
    (default, 'Petit'),
    (default, 'Grand');

insert into Meuble values
    (default, 'Canape Boheme', 3, 1);

insert into FabricationMeuble values
    (default, 1, 1, 1, 2),
    (default, 1, 1, 2, 10),
    (default, 1, 1, 3, 3),
    (default, 1, 2, 1, 4),
    (default, 1, 2, 2, 30),
    (default, 1, 2, 3, 5);
