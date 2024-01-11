create or replace view VDetailMatiere as(
    select m1.id, m1.nom nomMatiere, coalesce(pm1.prixUnitaire, 0) prixUnitaire
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
    select m.id, m.nom nomMeuble, t.id idTaille, t.nom nomTaille, sum(fm.quantite * vdm.prixUnitaire) valeur
    from Meuble m
    join FabricationMeuble fm on fm.idMeuble = m.id
    join Taille t on t.id = fm.idTaille
    join VDetailMatiere vdm on vdm.id = fm.idMatiere
    group by m.id, t.id
    order by m.id asc
);

create or replace view VEtatStockMatiere as(
    select m.id, m.nom nomMatiere, coalesce((sum(msm.quantiteEntree) - sum(msm.quantiteSortie)), 0) quantite
    from Matiere m
    left join MouvementStockMatiere msm on msm.idMatiere = m.id
    group by m.id, m.nom
    order by m.id asc
);