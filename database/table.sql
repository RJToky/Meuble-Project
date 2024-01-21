create database meuble;
\c meuble

drop table Matiere cascade;
drop table PrixMatiere cascade;
drop table MouvementStockMatiere cascade;
drop table Style cascade;
drop table StyleMatiere cascade;
drop table Categorie cascade;
drop table Taille cascade;
drop table Meuble cascade;
drop table MeubleTaille cascade;
drop table FabricationMeuble cascade;
drop table CommandeMeuble cascade;
drop table CoefficientStyle cascade;
drop table CoefficientTaille cascade;
drop table Ouvrier cascade;
drop table SalaireOuvrier cascade;
drop table PrixVenteMeuble cascade;

create table Matiere(
    id serial primary key,
    nom varchar(50) not null
);

create table PrixMatiere(
    id serial primary key,
    idMatiere int references Matiere(id),
    prixUnitaire double precision not null,
    dateInsertion timestamp not null
);

create table MouvementStockMatiere(
    id serial primary key,
    idMatiere int references Matiere(id),
    quantiteEntree double precision,
    quantiteSortie double precision,
    dateInsertion timestamp not null
);

create table Style(
    id serial primary key,
    nom varchar(50) not null
);

create table StyleMatiere(
    id serial primary key,
    idStyle int references Style(id),
    idMatiere int references Matiere(id)
);

create table Categorie(
    id serial primary key,
    nom varchar(50) not null
);

create table Taille(
    id serial primary key,
    nom varchar(50) not null
);

create table Meuble(
    id serial primary key,
    nom varchar(50) not null,
    idCategorie int references Categorie(id),
    idStyle int references Style(id)
);

create table MeubleTaille(
    id serial primary key,
    idMeuble int references Meuble(id),
    idTaille int references Taille(id)
);

create table FabricationMeuble(
    id serial primary key,
    idMeuble int references Meuble(id),
    idTaille int references Taille(id),
    idMatiere int references Matiere(id),
    quantite double precision not null
);

create table CommandeMeuble(
    id serial primary key,
    idMeuble int references Meuble(id),
    idTaille int references Taille(id),
    quantite int not null,
    dateCommande timestamp not null
);

create table DetailTaille(
    id serial primary key,
    idTaille int references Taille(id),
    ordre int not null,
    dateInsertion timestamp not null
);

-- create table CoefficientStyle(
--     id serial primary key,
--     coefficient double precision not null,
--     nombrePersonne int not null,
--     dateInsertion timestamp not null
-- );
-- 
-- create table CoefficientTaille(
--     id serial primary key,
--     coefficient double precision not null,
--     volumeHoraire double precision not null,
--     dateInsertion timestamp not null
-- );

create table Ourvrier(
    id serial primary key,
    type varchar(50) not null
);

create table SalaireOuvrier(
    id serial primary key,
    idOurvrier int references Ourvrier(id),
    salaire double precision not null,
    dateInsertion timestamp not null
);

create table PrixVenteMeuble(
    id serial primary key,
    idMeuble int references Meuble(id),
    idTaille int references Taille(id),
    prixVente double precision not null,
    dateInsertion timestamp not null
);
