package model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import java.sql.*;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class Taille extends GenericDAO<Taille> {
    int id;
    String nom;

    public Taille() {
    }

    public Taille(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public void insert() throws SQLException, Exception, ClassNotFoundException {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }

    }
}