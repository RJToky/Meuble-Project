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
    join FormuleMeuble fm on fm.idMeuble = m.id
    join Taille t on t.id = fm.idTaille
    join VDetailMatiere vdm on vdm.idMatiere = fm.idMatiere
    group by m.id, t.id
    order by m.id asc
);

create or replace view VEtatStockMatiere as(
    select m.id idMatiere, m.nom nomMatiere, coalesce((sum(msm.quantiteEntree) - sum(msm.quantiteSortie)), 0) quantite
    from Matiere m
    left join MouvementStockMatiere msm on msm.idMatiere = m.id
    group by m.id, m.nom
    order by m.id asc
);

create or replace view VDetailPoste as(
    select p1.id idPoste, p1.nom nomPoste, coalesce(th1.valeur, 0) tauxHoraire
    from Poste p1
    left join (
        select th2.*
        from TauxHoraire th2
        join Poste p2 on p2.id = th2.idPoste
        where th2.dateInsertion = (
            select max(th3.dateInsertion)
            from TauxHoraire th3
            where th3.idPoste = p2.id
        )
        order by th2.idPoste asc
    ) th1 on th1.idPoste = p1.id
);

create or replace view VCoutStyle as(
    select mo.idStyle, mo.idPoste, mo.heureTravail, mo.nombrePersonne, (mo.heureTravail * mo.nombrePersonne * vdp.tauxHoraire) cout
    from MainOeuvre mo
    join VDetailPoste vdp on vdp.idPoste = mo.idPoste
);

-- oooo
create or replace view VCoutMainOeuvre as(
    select m.id idMeuble, m.nom nomMeuble, t.id idTaille, t.nom nomTaille, sum(vcs.cout * t.coefficient) cout
    from Meuble m, Taille t, VCoutStyle vcs
    where
        vcs.idStyle = m.idStyle
    group by m.id, m.nom, t.id, t.nom
    order by t.coefficient asc
);

create or replace view VPrixRevientMeuble as(
    select vmv.idMeuble, vmv.nomMeuble, vmv.idTaille, vmv.nomTaille, (vmv.valeur + vcmo.cout) prixRevient
    from VMeubleValeur vmv, VCoutMainOeuvre vcmo
    where
        vmv.idTaille = vcmo.idTaille
        and vmv.idMeuble = vcmo.idMeuble
);

create or replace view VMeubleBenefice as(
    select res.idMeuble, res.nomMeuble, res.idTaille, res.nomTaille, max(res.prixVente) prixVente, max(res.prixRevient) prixRevient, max(res.benefice) benefice
    from (
        (
        select vprm.idMeuble, vprm.nomMeuble, vprm.idTaille, vprm.nomTaille, res.prixVente, vprm.prixRevient, (res.prixVente - vprm.prixRevient) benefice
        from VPrixRevientMeuble vprm, (
            select res.idMeuble, res.idTaille, max(res.prixVente) prixVente
            from (
                (
                    select pvm.idMeuble, pvm.idTaille, pvm.prixVente
                    from prixVenteMeuble pvm
                )
                union
                (
                    select m.id idMeuble, t.id idTaille, 0 prixVente
                    from Meuble m, Taille t
                )
            ) res
            group by res.idMeuble, res.idTaille
        ) res
        where
            vprm.idTaille = res.idTaille
            and vprm.idMeuble = res.idMeuble
        )
        union
        (
            select m.id idMeuble, m.nom nomMeuble, t.id idTaille, t.nom nomTaille, 0 prixVente, 0 prixRevient, 0 benefice
            from Meuble m, Taille t
        )
    ) res
    group by res.idMeuble, res.nomMeuble, res.idTaille, res.nomTaille 
);

create or replace view VEmployeEmbauche as(
    select e.id idEmploye, e.nom nomEmploye, emb.idPoste, p.nom nomPoste, emb.dateEmbauche
    from Employe e
    join Embauche emb on emb.idEmploye = e.id
    join Poste p on p.id = emb.idPoste
);

create or replace view VProfilEmploye as(
    select vee.*, extract(year from age(current_date, vee.dateEmbauche)) anneeExperience,
        (
            select p.nom
            from Profil p
            where
                extract(year from age(current_date, vee.dateEmbauche)) >= p.annee
            order by p.annee desc
            limit 1
        ) profil,
        ((
            select p.coefficient
            from Profil p
            where
                extract(year from age(current_date, vee.dateEmbauche)) >= p.annee
            order by p.annee desc
            limit 1
        ) * vdp.tauxHoraire) tauxHoraire
    from VEmployeEmbauche vee
    join VDetailPoste vdp on vdp.idPoste = vee.idPoste
);

create or replace view VStatistiqueVente as(
    select res.idMeuble, res.idTaille, res.idGenre, res.nomGenre, sum(res.nombreVente) nombreVente
    from (
        (
            select vm.idMeuble, vm.idTaille, c.idGenre, g.nom nomGenre, sum(vm.quantite) nombreVente
            from VenteMeuble vm
            join Client c on c.id = vm.idClient
            join Genre g on g.id = c.idGenre
            group by vm.idMeuble, vm.idTaille, c.idGenre, g.nom
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
                    select sm.idMeuble, sm.idTaille, sm.quantite
                    from StockMeuble sm
                )
                union
                (
                    select vm.idMeuble, vm.idTaille, vm.quantite * -1
                    from VenteMeuble vm
                )
            ) res
            group by res.idMeuble, res.idTaille
        )
    ) res
    group by res.idMeuble, res.idTaille
);