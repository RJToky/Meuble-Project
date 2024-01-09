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
            if (listIdMatiere != null) {
                Style lastStyle = this.findLast(con);
                lastStyle.addMatieres(con, listIdMatiere);
            }
        }
    }

    public void addMatieres(Connection con, String[] listIdMatiere) throws Exception {
        for (String idMatiere : listIdMatiere) {
            StyleMatiere styleMatiere = new StyleMatiere(0, this.getId(), Integer.parseInt(idMatiere));
            styleMatiere.save(con);
        }
    }

    public void addMatieres(String[] listIdMatiere) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            for (String idMatiere : listIdMatiere) {
                StyleMatiere styleMatiere = new StyleMatiere(0, this.getId(), Integer.parseInt(idMatiere));
                styleMatiere.save(con);
            }
        }
    }

    public ArrayList<Matiere> getMatieres() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            String query = """
                select m.*
                from Matiere m
                join StyleMatiere sm on m.id = sm.idMatiere
                where sm.idStyle = %s
            """.formatted(this.getId());
            return new Matiere().find(con, query);
        }
    }

    public ArrayList<Matiere> getNotMatieres() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            String query = """
                select m.*
                from Matiere m
                where id not in (
                    select m.id
                    from Matiere m
                    join StyleMatiere sm on m.id = sm.idMatiere
                    where sm.idStyle = %s
                )
            """.formatted(this.getId());
            return new Matiere().find(con, query);
        }
    }
}
