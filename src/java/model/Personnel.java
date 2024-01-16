package model;

import lombok.Data;
import java.sql.*;
import java.util.ArrayList;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class Personnel extends GenericDAO<Personnel> {

    private int id;
    private String nom;

    public Personnel() {
    }

    public Personnel(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public static ArrayList<Personnel> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Personnel().findAll(con);
        }
    }

    public static Personnel getById(Connection con, int id) throws Exception {
        return new Personnel().findById(con, id);
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }
}
