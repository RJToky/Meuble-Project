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
drop table Ouvrier cascade;
drop table TauxHoraire cascade;
drop table PrixVenteMeuble cascade;
drop table MainOeuvre cascade;
drop table Profil cascade;
drop table Employe cascade;
drop table Embauche cascade;
drop table Genre cascade;
drop table Client cascade;
drop table Vente cascade;

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
    nom varchar(50) not null,
    coefficient int
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

create table Ouvrier(
    id serial primary key,
    nom varchar(50) not null
);

create table TauxHoraire(
    id serial primary key,
    idOuvrier int references Ouvrier(id),
    valeur double precision not null,
    dateInsertion timestamp not null
);

create table PrixVenteMeuble(
    id serial primary key,
    idMeuble int references Meuble(id),
    idTaille int references Taille(id),
    prixVente double precision not null,
    dateInsertion timestamp not null
);

create table MainOeuvre(
    id serial primary key,
    idStyle int references Style(id),
    idOuvrier int references Ouvrier(id),
    heureTravail double precision not null,
    nombrePersonne int not null
);

create table Profil(
    id serial primary key,
    nom varchar(50) not null,
    annee int not null,
    coefficient int not null
);

create table Employe(
    id serial primary key,
    nom varchar(50) not null
);

create table Embauche(
    id serial primary key,
    idEmploye int references Employe(id),
    idOuvrier int references Ouvrier(id),
    dateEmbauche date not null
);

create table Genre(
    id serial primary key,
    nom varchar(50) not null
);

create table Client(
    id serial primary key,
    nom varchar(50) not null,
    idGenre int references Genre(id)
);

create table Vente(
    id serial primary key,
    idMeuble int references Meuble(id),
    idTaille int references Taille(id),
    quantite int not null,
    idClient int references Client(id),
    dateVente date not null
);
