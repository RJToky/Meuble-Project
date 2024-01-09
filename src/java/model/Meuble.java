package model;

import java.sql.Connection;
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

    public void insert(String[] listIdTaille) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
            if (listIdTaille != null) {
                Meuble lastMeuble = this.findLast(con);
                lastMeuble.addTaille(con, listIdTaille);
            }
        }
    }

    public void addTaille(Connection con, String[] listIdTaille) throws Exception {
        for (String idTaille : listIdTaille) {
            MeubleTaille meubleTaille = new MeubleTaille(0, this.getId(), Integer.parseInt(idTaille));
            meubleTaille.save(con);
        }
    }

    public void addTaille(String[] listIdTaille) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            for (String idTaille : listIdTaille) {
                MeubleTaille meubleTaille = new MeubleTaille(0, this.getId(), Integer.parseInt(idTaille));
                meubleTaille.save(con);
            }
        }
    }

    public static ArrayList<Meuble> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Meuble().findAll(con);
        }
    }

    public static Meuble getById(Connection con, int id) throws Exception {
        Meuble meuble = new Meuble().findById(con, id);
        meuble.setCategorie(Categorie.getById(con, meuble.getIdCategorie()));
        meuble.setStyle(Style.getById(con, meuble.getIdStyle()));
        return meuble;
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

    public ArrayList<Taille> getTailles() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            String query = """
                select t.*
                from Taille t
                join MeubleTaille mt on t.id = mt.idTaille
                where mt.idMeuble = %s
            """.formatted(this.getId());
            return new Taille().find(con, query);
        }
    }

    public ArrayList<Taille> getNotTailles() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            String query = """
                select t.*
                from Taille t
                where id not in (
                    select t.id
                    from Taille t
                    join MeubleTaille mt on t.id = mt.idTaille
                    where mt.idMeuble = %s
                )
            """.formatted(this.getId());
            return new Taille().find(con, query);
        }
    }
}
