package model;

import java.sql.Connection;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class PrixMatiere extends GenericDAO<PrixMatiere> {

    private int id;
    private int idMatiere;
    private Double prixUnitaire;
    private String dateInsertion;

    public PrixMatiere() {
    }

    public PrixMatiere(int id, int idMatiere, Double prixUnitaire, String dateInsertion) throws Exception {
        this.id = id;
        this.idMatiere = idMatiere;
        this.setPrixUnitaire(prixUnitaire);
        this.dateInsertion = dateInsertion;
    }

    public static ArrayList<PrixMatiere> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new PrixMatiere().findAll(con);
        }
    }

    public static PrixMatiere getById(int id) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new PrixMatiere().findById(con, id);
        }
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }

    public void setPrixUnitaire(double prixUnitaire) throws Exception {
        if (prixUnitaire <= 0) {
            throw new Exception("Le prix unitaire doit etre superieur a zero");
        }
        this.prixUnitaire = prixUnitaire;
    }
}
