package model;

import lombok.Data;
import java.sql.*;
import java.util.ArrayList;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class Categorie extends GenericDAO<Categorie> {

    private int id;
    private String nom;

    public Categorie() {
    }

    public Categorie(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public static ArrayList<Categorie> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Categorie().findAll(con);
        }
    }

    public static Categorie getById(Connection con, int id) throws Exception {
        return new Categorie().findById(con, id);
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }
}
