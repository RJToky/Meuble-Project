package model;

import java.sql.Connection;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class StockMatiere extends GenericDAO<StockMatiere> {

    private int id;
    private int idMatiere;
    private double quantite;
    private String dateInsertion;

    public StockMatiere() {
    }

    public StockMatiere(int id, int idMatiere, double quantite, String dateInsertion) throws Exception {
        this.id = id;
        this.idMatiere = idMatiere;
        this.quantite = quantite;
        this.dateInsertion = dateInsertion;
    }

    public static ArrayList<StockMatiere> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new StockMatiere().findAll(con);
        }
    }

    public static StockMatiere getById(int id) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new StockMatiere().findById(con, id);
        }
    }

    public void entrerStock() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            if(this.getQuantite() > 0) {
                this.save(con);
            } else {
                throw new Exception("La quantite doit etre positive");
            }
        }
    }
    
    public void sortirStock() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            if(this.getQuantite() < 0) {
                this.save(con);
            } else {
                throw new Exception("La quantite doit etre negative");
            }
        }
    }

}
