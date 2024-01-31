package model;

import lombok.Data;
import java.sql.*;
import java.util.ArrayList;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class Poste extends GenericDAO<Poste> {

    private int id;
    private String nom;

    public Poste() {
    }

    public Poste(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public static ArrayList<Poste> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Poste().findAll(con);
        }
    }

    public static Poste getById(Connection con, int id) throws Exception {
        return new Poste().findById(con, id);
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }
}
