package model;

import java.sql.*;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class Matiere extends GenericDAO<Matiere> {
    int id;
    String nom;

    public Matiere() {
    }

    public Matiere(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public static ArrayList<Matiere> getAll() throws Exception {
        ArrayList<Matiere> matieres;
        try (Connection con = ConnectionPostgres.getConnection()) {
            matieres = new Matiere().findAll(con);
        }
        return matieres;
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }

}