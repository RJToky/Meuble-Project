create database meuble;
\c meuble

drop table Matiere cascade;
drop table PrixMatiere cascade;
drop table Style cascade;
drop table StyleMatiere cascade;
drop table Categorie cascade;
drop table Taille cascade;
drop table Meuble cascade;
drop table MeubleTaille cascade;
drop table FabricationMeuble cascade;

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

create table StockMatiere(
    id serial primary key,
    idMatiere int references Matiere(id),
    quantite double precision not null,
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
    quantite double precision
);

create table CommandeMeuble(
    id serial primary key,
    idMeuble int references Meuble(id),
    idTaille int references Taille(id),
    quantite int not null,
    dateCommande timestamp not null
);

insert into CommandeMeuble values
    (default, 1, 1, 1, now())
;

select * 
from CommandeMeuble cm
join Meuble m on m.id = cm.idMeuble