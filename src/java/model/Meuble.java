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

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
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
                SELECT *
                FROM Matiere
                WHERE id IN (
                    SELECT idMatiere
                    FROM MatiereStyle
                    WHERE idStyle IN (
                        SELECT s.id
                        FROM Meuble m
                        JOIN Style s ON s.id = m.idStyle
                        WHERE m.id = %s
                    )
                )
            """.formatted(this.getId());
            matieres = new Matiere().find(con, query);
        }
        return matieres;
    }
}
