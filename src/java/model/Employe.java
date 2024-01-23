package model;

import lombok.Data;
import java.sql.*;
import java.util.ArrayList;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class Employe extends GenericDAO<Employe> {

    private int id;
    private String nom;

    public Employe() {
    }

    public Employe(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public static ArrayList<Employe> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Employe().findAll(con);
        }
    }

    public static Employe getById(Connection con, int id) throws Exception {
        return new Employe().findById(con, id);
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }
}
