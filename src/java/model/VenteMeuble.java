package model;

import lombok.Data;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class VenteMeuble extends GenericDAO<VenteMeuble> {

    private int id;
    private int idMeuble;
    private int idTaille;
    private int quantite;
    private int idClient;
    private String dateInsertion;

    public VenteMeuble() {
    }

    public VenteMeuble(int id, int idMeuble, int idTaille, int quantite, int idClient, String dateInsertion) {
        this.id = id;
        this.idMeuble = idMeuble;
        this.idTaille = idTaille;
        this.quantite = quantite;
        this.idClient = idClient;
        this.dateInsertion = dateInsertion;
    }

    public static ArrayList<VenteMeuble> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new VenteMeuble().findAll(con);
        }
    }

    public static VenteMeuble getById(Connection con, int id) throws Exception {
        return new VenteMeuble().findById(con, id);
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            if (this.quantite <= 0) {
                throw new Exception("La quantite doit etre positive");
            }
            this.setDateInsertion(LocalDateTime.now().toString());
            this.save(con);
        }
    }
}
