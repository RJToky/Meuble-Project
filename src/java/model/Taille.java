package model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import java.sql.*;
import java.util.ArrayList;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class Taille extends GenericDAO<Taille> {
    private int id;
    private String nom;

    public Taille() {
    }

    public Taille(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public static ArrayList<Taille> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Taille().findAll(con);
        }
    }

    public static Taille getById(Connection con, int id) throws Exception {
        return new Taille().findById(con, id);
    }

    public void insert() throws SQLException, Exception, ClassNotFoundException {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }
}
