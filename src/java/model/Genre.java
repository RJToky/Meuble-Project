package model;

import lombok.Data;
import java.sql.*;
import java.util.ArrayList;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class Genre extends GenericDAO<Genre> {

    private int id;
    private String nom;

    public Genre() {
    }

    public Genre(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public static ArrayList<Genre> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Genre().findAll(con);
        }
    }

    public static Genre getById(Connection con, int id) throws Exception {
        return new Genre().findById(con, id);
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }
}
