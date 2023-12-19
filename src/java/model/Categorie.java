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
    int id;
    String nom;

    public Categorie() {
    }

    public Categorie(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }
    
    public static ArrayList<Categorie> getAll() throws Exception {
        ArrayList<Categorie> categories;
        try (Connection con = ConnectionPostgres.getConnection()) {
            categories = new Categorie().findAll(con);
        }
        return categories;
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }

}