package model;

import java.sql.Connection;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class VEtatStockMatiere extends GenericDAO<VEtatStockMatiere> {

    private int idMatiere;
    private String nomMatiere;
    private double quantite;

    public VEtatStockMatiere() {
    }

    public static ArrayList<VEtatStockMatiere> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new VEtatStockMatiere().findAll(con);
        }
    }

    public static VEtatStockMatiere getById(int id) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new VEtatStockMatiere().findById(con, id);
        }
    }

}
