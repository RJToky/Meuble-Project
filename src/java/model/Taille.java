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
    private int ordre;

    public Taille() {
    }

    public Taille(int id, String nom, int ordre) {
        this.id = id;
        this.nom = nom;
        this.ordre = ordre;
    }

    public static ArrayList<Taille> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Taille().findAll(con);
        }
    }

    public static Taille getById(int id) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Taille().findById(con, id);
        }
    }

    public void insert() throws SQLException, Exception, ClassNotFoundException {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }
    
    public void update() throws SQLException, Exception, ClassNotFoundException {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.update(con);
        }
    }
}
