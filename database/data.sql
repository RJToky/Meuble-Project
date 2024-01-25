insert into Matiere values
    (default, 'Tissu'),
    (default, 'Perle'),
    (default, 'Chaine');

insert into PrixMatiere values
    (default, 1, 1000, '2024-01-01 10:00:00'),
    (default, 2, 2000, '2024-01-01 10:00:00'),
    (default, 3, 1500, '2024-01-01 10:00:00');

insert into MouvementStockMatiere values
    (default, 1, 4, 0, '2024-01-01 12:00:00'),
    (default, 1, 1, 0, '2024-01-01 13:00:00'),
    (default, 2, 10, 0, '2024-01-01 14:00:00'),
    (default, 3, 6, 0, '2024-01-01 15:00:00'),

    (default, 1, 0, 2, '2024-01-02 10:00:00'),
    (default, 2, 0, 10, '2024-01-02 10:00:00'),
    (default, 3, 0, 3, '2024-01-02 10:00:00');

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
    (default, 'Petit', 1),
    (default, 'Grand', 2);

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

insert into CommandeMeuble values
    (default, 1, 1, 1, '2024-01-02 10:00:00');

insert into Genre values
    (default, 'Homme'),
    (default, 'Femme');