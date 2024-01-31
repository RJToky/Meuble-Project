package model;

import java.sql.Connection;
import java.time.LocalDateTime;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class Meuble extends GenericDAO<Meuble> {

    private int id;
    private String nom;
    private int idCategorie;
    private int idStyle;

    private Categorie categorie;
    private Style style;

    public Meuble() {
    }

    public Meuble(int id, String nom, int idCategorie, int idStyle) {
        this.id = id;
        this.nom = nom;
        this.idCategorie = idCategorie;
        this.idStyle = idStyle;
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }

    public static ArrayList<Meuble> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            ArrayList<Meuble> meubles = new Meuble().findAll(con);
            for (Meuble meuble : meubles) {
                meuble.setCategorie(Categorie.getById(con, meuble.getIdCategorie()));
                meuble.setStyle(Style.getById(con, meuble.getIdStyle()));
            }
            return meubles;
        }
    }

    public static Meuble getById(Connection con, int id) throws Exception {
        Meuble meuble = new Meuble().findById(con, id);
        meuble.setCategorie(Categorie.getById(con, meuble.getIdCategorie()));
        meuble.setStyle(Style.getById(con, meuble.getIdStyle()));
        return meuble;
    }

    public static Meuble getById(int id) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            Meuble meuble = new Meuble().findById(con, id);
            meuble.setCategorie(Categorie.getById(con, meuble.getIdCategorie()));
            meuble.setStyle(Style.getById(con, meuble.getIdStyle()));
            return meuble;
        }
    }

    public static Meuble getLast() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Meuble().findLast(con);
        }
    }

    public ArrayList<Matiere> getMatieres() throws Exception {
        ArrayList<Matiere> matieres;
        try (Connection con = ConnectionPostgres.getConnection()) {
            String query = """
                        select *
                        from Matiere
                        where id in (
                            select idMatiere
                            from StyleMatiere
                            where idStyle in (
                                select s.id
                                from Meuble m
                                join Style s on s.id = m.idStyle
                                where m.id = %s
                            )
                        )
                    """.formatted(this.getId());
            matieres = new Matiere().find(con, query);
        }
        return matieres;
    }

    public ArrayList<FormuleMeuble> getFormuleMeubles() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            String query = """
                        select *
                        from FormuleMeuble
                        where idMeuble = %s
                    """.formatted(this.getId());
            return new FormuleMeuble().find(con, query);
        }
    }

    public ArrayList<FormuleMeuble> getFormuleMeubles(int idTaille) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            String query = """
                        select *
                        from FormuleMeuble
                        where
                            idMeuble = %s
                            and idTaille = %s
                    """.formatted(this.getId(), idTaille);
            return new FormuleMeuble().find(con, query);
        }
    }

    public void verifierStockMatiere(Connection con, ArrayList<FormuleMeuble> formuleMeubles, int quantite)
            throws Exception {
        StringBuilder message = new StringBuilder();
        boolean quantiteInsuffisante = false;
        for (FormuleMeuble formuleMeuble : formuleMeubles) {
            VEtatStockMatiere vEtatStockMatiere = new VEtatStockMatiere().findById(con,
                    formuleMeuble.getIdMatiere());
            if (vEtatStockMatiere.getQuantite() - formuleMeuble.getQuantite() * quantite < 0) {
                quantiteInsuffisante = true;
                message
                        .append("<p>Matiere : ")
                        .append(vEtatStockMatiere.getNomMatiere())
                        .append(", Quantite necessaire : ")
                        .append(formuleMeuble.getQuantite() * quantite)
                        .append(", Quantite restante : ")
                        .append(vEtatStockMatiere.getQuantite())
                        .append("</p>");
            }
        }
        if (quantiteInsuffisante) {
            throw new Exception(message.toString());
        }
    }

    public void fabriquer(int idTaille, int quantite, String dateInsertion) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            String dateNow = LocalDateTime.now().toString();
            ArrayList<FormuleMeuble> formuleMeubles = this.getFormuleMeubles(idTaille);

            this.verifierStockMatiere(con, formuleMeubles, quantite);

            for (FormuleMeuble formuleMeuble : formuleMeubles) {
                MouvementStockMatiere stockMatiere = new MouvementStockMatiere(0, formuleMeuble.getIdMatiere(), 0,
                        formuleMeuble.getQuantite() * quantite, dateNow);
                stockMatiere.sortirStock();
            }

            StockMeuble stockMeuble = new StockMeuble(0, this.getId(), idTaille, quantite, dateInsertion);
            stockMeuble.save(con);
        }
    }

    public void verifierStockMeuble(Connection con, int idMeuble, int idTaille, int quantite) throws Exception {
        StringBuilder message = new StringBuilder();
        boolean quantiteInsuffisante = false;
        VEtatStockMeuble vEtatStockMeuble = VEtatStockMeuble.getByMeubleTaille(idMeuble, idTaille);

        if (vEtatStockMeuble.getQuantite() - quantite < 0) {
            quantiteInsuffisante = true;
            message
                    .append("<p>Quantite restante : ")
                    .append(vEtatStockMeuble.getQuantite())
                    .append("</p>");
        }
        if (quantiteInsuffisante) {
            throw new Exception(message.toString());
        }
    }

    public void vendre(int idClient, int idTaille, int quantite, String dateVente) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.verifierStockMeuble(con, this.getId(), idTaille, quantite);

            VenteMeuble venteMeuble = new VenteMeuble(0, this.getId(), idTaille, quantite, idClient, dateVente);
            venteMeuble.insert();
        }
    }
}
