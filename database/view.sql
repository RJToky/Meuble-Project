create or replace view VMeubleValeur as(
    select m.id idMeuble, m.nom nomMeuble, t.id idTaille, t.nom nomTaille, sum(fm.quantite * ma.prixUnitaire) valeur
    from meuble m
    join fabricationMeuble fm on fm.idMeuble = m.id
    join taille t on t.id = fm.idTaille
    join matiere ma on ma.id = fm.idMatiere
    group by m.id, t.id
);