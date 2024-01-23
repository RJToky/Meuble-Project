package model;

import lombok.Data;
import java.sql.*;
import java.util.ArrayList;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class Profil extends GenericDAO<Profil> {

    private int id;
    private String nom;
    private int annee;
    private int coefficient;

    public Profil() {
    }

    public Profil(int id, String nom, int annee, int coefficient) {
        this.id = id;
        this.nom = nom;
        this.annee = annee;
        this.coefficient = coefficient;
    }

    public static ArrayList<Profil> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Profil().findAll(con);
        }
    }

    public static Profil getById(Connection con, int id) throws Exception {
        return new Profil().findById(con, id);
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }
}
