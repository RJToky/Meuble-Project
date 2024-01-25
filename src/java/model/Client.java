package model;

import lombok.Data;
import java.sql.*;
import java.util.ArrayList;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class Client extends GenericDAO<Client> {

    private int id;
    private String nom;
    private int idGenre;

    public Client() {
    }

    public Client(int id, String nom, int idGenre) {
        this.id = id;
        this.nom = nom;
        this.idGenre = idGenre;
    }

    public static ArrayList<Client> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Client().findAll(con);
        }
    }

    public static Client getById(Connection con, int id) throws Exception {
        return new Client().findById(con, id);
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }
}
