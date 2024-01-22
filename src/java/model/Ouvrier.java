package model;

import lombok.Data;
import java.sql.*;
import java.util.ArrayList;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class Ouvrier extends GenericDAO<Ouvrier> {

    private int id;
    private String poste;

    public Ouvrier() {
    }

    public Ouvrier(int id, String poste) {
        this.id = id;
        this.poste = poste;
    }

    public static ArrayList<Ouvrier> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Ouvrier().findAll(con);
        }
    }

    public static Ouvrier getById(Connection con, int id) throws Exception {
        return new Ouvrier().findById(con, id);
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }
}
