package model;

import java.sql.Connection;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class MouvementStockMatiere extends GenericDAO<MouvementStockMatiere> {

    private int id;
    private int idMatiere;
    private double quantiteEntree;
    private double quantiteSortie;
    private String dateInsertion;

    public MouvementStockMatiere() {
    }

    public MouvementStockMatiere(int id, int idMatiere, double quantiteEntree, double quantiteSortie, String dateInsertion) throws Exception {
        this.id = id;
        this.idMatiere = idMatiere;
        this.quantiteEntree = quantiteEntree;
        this.quantiteSortie = quantiteSortie;
        this.dateInsertion = dateInsertion;
    }

    public static ArrayList<MouvementStockMatiere> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new MouvementStockMatiere().findAll(con);
        }
    }

    public static MouvementStockMatiere getById(int id) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new MouvementStockMatiere().findById(con, id);
        }
    }

    public void entrerStock() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            if(this.getQuantiteEntree() > 0) {
                this.setQuantiteSortie(0);
                this.save(con);
            } else {
                throw new Exception("La quantite doit etre positive");
            }
        }
    }
    
    public void sortirStock() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            if(this.getQuantiteSortie() > 0) {
                this.setQuantiteEntree(0);
                this.save(con);
            } else {
                throw new Exception("La quantite doit etre positive");
            }
        }
    }

}
