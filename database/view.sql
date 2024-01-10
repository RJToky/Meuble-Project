create or replace view VDetailMatiere as(
    select m1.id idMatiere, m1.nom nomMatiere, coalesce(pm1.prixUnitaire, 0) prixUnitaire
    from Matiere m1
    left join (
        select pm2.*
        from PrixMatiere pm2
        join Matiere m2 on m2.id = pm2.idMatiere
        where pm2.dateInsertion = (
            select max(pm3.dateInsertion)
            from PrixMatiere pm3
            where pm3.idMatiere = m2.id
        )
        order by pm2.idMatiere asc
    ) pm1 on pm1.idMatiere = m1.id
);

create or replace view VMeubleValeur as(
    select m.id idMeuble, m.nom nomMeuble, t.id idTaille, t.nom nomTaille, sum(fm.quantite * vdm.prixUnitaire) valeur
    from Meuble m
    join FabricationMeuble fm on fm.idMeuble = m.id
    join Taille t on t.id = fm.idTaille
    join VDetailMatiere vdm on vdm.idMatiere = fm.idMatiere
    group by m.id, t.id
);