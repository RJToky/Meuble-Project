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
    int id;
    String nom;

    public Style() {
    }

    public Style(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public static ArrayList<Style> getAll() throws Exception {
        ArrayList<Style> styles;
        try (Connection con = ConnectionPostgres.getConnection()) {
            styles = new Style().findAll(con);
        }
        return styles;
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
                select
                    m.*
                from
                    matiere m
                join MatiereStyle ms on m.id = ms.idMatiere
                where
                    ms.idStyle = %s
            """.formatted(this.id);
            matieres = new Matiere().find(con, query);
        }
        return matieres;
    }

    public ArrayList<Matiere> getNotMatieres() throws Exception {
        ArrayList<Matiere> matieres;
        try (Connection con = ConnectionPostgres.getConnection()) {
            String query = """
               select
                    m.*
                from
                    matiere m
                where
                    id not in (
                        select
                            m.id
                        from
                            matiere m
                        join MatiereStyle ms on m.id = ms.idMatiere
                        where
                            ms.idStyle = %s
                    )
                    """.formatted(this.id);
            matieres = new Matiere().find(con, query);
        }
        return matieres;
    }
    
}
