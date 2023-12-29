package model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;
import java.sql.Connection;
import java.util.ArrayList;

@Data
@EqualsAndHashCode(callSuper = false)
public class Style extends GenericDAO<Style> {
    private int id;
    private String nom;

    public Style() {
    }

    public Style(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public static ArrayList<Style> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Style().findAll(con);
        }
    }

    public static Style getById(Connection con, int id) throws Exception {
        return new Style().findById(con, id);
    }

    public static Style getLast() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Style().findLast(con);
        }
    }

    public void insert(String[] listIdMatiere) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
            Style lastStyle = this.findLast(con);
            if (listIdMatiere != null) {
                lastStyle.addMatieres(con, listIdMatiere);
            }
        }
    }

    public void addMatieres(Connection con, String[] listIdMatiere) throws Exception {
        for (String idMatiere : listIdMatiere) {
            MatiereStyle matiereStyle = new MatiereStyle(0, Integer.parseInt(idMatiere), this.getId());
            matiereStyle.save(con);
        }
    }

    public void addMatieres(String[] listIdMatiere) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            for (String idMatiere : listIdMatiere) {
                MatiereStyle matiereStyle = new MatiereStyle(0, Integer.parseInt(idMatiere), this.getId());
                matiereStyle.save(con);
            }
        }
    }

    public ArrayList<Matiere> getMatieres() throws Exception {
        ArrayList<Matiere> matieres;
        try (Connection con = ConnectionPostgres.getConnection()) {
            String query = """
                SELECT m.*
                FROM Matiere m
                JOIN MatiereStyle ms ON m.id = ms.idMatiere
                WHERE ms.idStyle = %s
            """.formatted(this.getId());
            matieres = new Matiere().find(con, query);
        }
        return matieres;
    }

    public ArrayList<Matiere> getNotMatieres() throws Exception {
        ArrayList<Matiere> matieres;
        try (Connection con = ConnectionPostgres.getConnection()) {
            String query = """
                SELECT m.*
                FROM Matiere m
                WHERE id NOT IN (
                        SELECT
                            m.id
                        FROM
                            Matiere m
                        JOIN MatiereStyle ms ON m.id = ms.idMatiere
                        WHERE
                            ms.idStyle = %s
                )
            """.formatted(this.getId());
            matieres = new Matiere().find(con, query);
        }
        return matieres;
    }
}
