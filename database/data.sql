insert into Matiere values
    (default, 'Tissu', 1000),
    (default, 'Perle', 2000),
    (default, 'Chaine', 1500);

insert into Style values
    (default, 'Boheme');

insert into StyleMatiere values
    (default, 1, 1),
    (default, 1, 2),
    (default, 1, 3);

insert into Categorie values
    (default, 'Table'),
    (default, 'Chaise'),
    (default, 'Canape');

insert into Taille values
    (default, 'Petit'),
    (default, 'Grand');

insert into Meuble values
    (default, 'Canape Boheme', 3, 1);

insert into MeubleTaille values
    (default, 1, 1),
    (default, 1, 2);

insert into FabricationMeuble values
    (default, 1, 1, 1, 2),
    (default, 1, 1, 2, 10),
    (default, 1, 1, 3, 3),
    (default, 1, 2, 1, 4),
    (default, 1, 2, 2, 30),
    (default, 1, 2, 3, 5);
