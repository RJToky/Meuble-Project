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

create or replace view VDetailOuvrier as(
    select o1.id, o1.nom nomOuvrier, coalesce(th1.valeur, 0) tauxHoraire
    from Ouvrier o1
    left join (
        select th2.*
        from TauxHoraire th2
        join Ouvrier o2 on o2.id = th2.idOuvrier
        where th2.dateInsertion = (
            select max(th3.dateInsertion)
            from TauxHoraire th3
            where th3.idOuvrier = o2.id
        )
        order by th2.idOuvrier asc
    ) th1 on th1.idOuvrier = o1.id
);

create or replace view VCoutStyle as(
    select mo.*, (mo.heureTravail * mo.nombrePersonne * vdo.tauxHoraire) cout
    from MainOeuvre mo
    join VDetailOuvrier vdo on vdo.id = mo.idOuvrier
);

create or replace view VCoutMainOeuvre as(
    select m.id, m.nom nomMeuble, t.id idTaille, t.nom nomTaille, sum(vcs.cout * t.coefficient) cout
    from Meuble m
    join MeubleTaille mt on mt.idMeuble = m.id
    join Taille t on t.id = mt.idTaille
    join VCoutStyle vcs on vcs.idStyle = m.idStyle
    group by m.id, m.nom, t.id, t.nom
    order by t.coefficient asc
);

create or replace view VPrixRevientMeuble as(
    select vmv.id, vmv.nomMeuble, vmv.idTaille, vmv.nomTaille, (vmv.valeur + vcmo.cout) prixRevient
    from VMeubleValeur vmv, VCoutMainOeuvre vcmo
    where
        vmv.idTaille = vcmo.idTaille
        and vmv.id = vcmo.id
);

create or replace view VMeubleBenefice as(
    select vprm.id, vprm.nomMeuble, vprm.idTaille, vprm.nomTaille, (pvm.prixVente - vprm.prixRevient) benefice
    from VPrixRevientMeuble vprm, prixVenteMeuble pvm
    where
        vprm.idTaille = pvm.idTaille
        and vprm.id = pvm.idMeuble
);

-- create or replace view VMeubleBenefice as(
--     select vprm.id, vprm.nomMeuble, vprm.idTaille, vprm.nomTaille, coalesce((pvm.prixVente - vprm.prixRevient), 0) benefice
--     from
--         VPrixRevientMeuble vprm,
--         (
--             select m.id idMeuble, t.id idTaille, pvm.prixVente 
--             from Meuble m
--             join MeubleTaille mt on mt.idMeuble = m.id
--             join Taille t on t.id = mt.idTaille
--             left join PrixVenteMeuble pvm on pvm.id = m.id
--         ) pvm
--     where
--         vprm.idTaille = pvm.idTaille
--         and vprm.id = pvm.idMeuble
-- );

create or replace view VEmployeEmbauche as(
    select e.id, e.nom nomEmploye, emb.idOuvrier, o.nom nomOuvrier, emb.dateEmbauche
    from Employe e
    join Embauche emb on emb.idEmploye = e.id
    join Ouvrier o on o.id = emb.idOuvrier
);

create or replace view VProfilEmploye as(
    select vee.*, extract(year from age(current_date, vee.dateEmbauche)) anneeExperience,
        (
            select p.nom
            from profil p
            where
                extract(year from age(current_date, vee.dateEmbauche)) >= p.annee
            order by p.annee desc
            limit 1
        ) profil,
        ((
            select p.coefficient
            from profil p
            where
                extract(year from age(current_date, vee.dateEmbauche)) >= p.annee
            order by p.annee desc
            limit 1
        ) * vdo.tauxHoraire) tauxHoraire
    from VEmployeEmbauche vee
    join VDetailOuvrier vdo on vdo.id = vee.idOuvrier
);

create or replace view VStatistiqueVente as(
    select res.idMeuble, res.idTaille, res.idGenre, res.nomGenre, sum(res.nombreVente) nombreVente
    from (
        (
            select v.idMeuble, v.idTaille, c.idGenre, g.nom nomGenre, v.quantite nombreVente
            from Vente v
            join Client c on c.id = v.idClient
            join Genre g on g.id = c.idGenre
        )
            union
        (
            select m.id idMeuble, t.id idTaille, g.id idGenre, g.nom nomGenre, 0 nombreVente
            from Meuble m, Taille t, Genre g
        )
    ) res
    group by res.idMeuble, res.idTaille, res.idGenre, res.nomGenre
    order by res.idGenre asc
);

create or replace view VEtatStockMeuble as(
    select res.idMeuble, res.idTaille, max(res.quantite) quantite
    from (
        (
        select m.id idMeuble, t.id idTaille, 0 quantite
        from Meuble m, Taille t
        )
        union
        (
            select res.idMeuble, res.idTaille, sum(res.quantite) quantite
            from (
                (
                    select cm.idMeuble, cm.idTaille, cm.quantite
                    from CommandeMeuble cm
                )
                union
                (
                    select v.idMeuble, v.idTaille, v.quantite * -1
                    from Vente v
                )
            ) res
            group by res.idMeuble, res.idTaille
        )
    ) res
    group by res.idMeuble, res.idTaille
);