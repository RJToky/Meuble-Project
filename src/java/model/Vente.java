package model;

import lombok.Data;
import java.sql.*;
import java.util.ArrayList;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class Vente extends GenericDAO<Vente> {

    private int id;
    private int idMeuble;
    private int idTaille;
    private int quantite;
    private int idClient;
    private String dateVente;

    public Vente() {
    }

    public Vente(int id, int idMeuble, int idTaille, int quantite, int idClient, String dateVente) {
        this.id = id;
        this.idMeuble = idMeuble;
        this.idTaille = idTaille;
        this.quantite = quantite;
        this.idClient = idClient;
        this.dateVente = dateVente;
    }

    public static ArrayList<Vente> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Vente().findAll(con);
        }
    }

    public static Vente getById(Connection con, int id) throws Exception {
        return new Vente().findById(con, id);
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            if(this.quantite <= 0) {
                throw new Exception("La quantite doit etre positive");
            }
            this.save(con);
        }
    }
}
