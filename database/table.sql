create database meuble;
\c meuble

drop table Matiere cascade;
drop table Style cascade;
drop table MatiereStyle cascade;
drop table Categorie cascade;
drop table Taille cascade;
drop table Meuble cascade;

create table Matiere(
    id serial primary key,
    nom varchar(50) not null
);

create table Style(
    id serial primary key,
    nom varchar(50) not null
);

create table MatiereStyle(
    id serial primary key,
    idMatiere int references Matiere(id),
    idStyle int references Style(id)
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