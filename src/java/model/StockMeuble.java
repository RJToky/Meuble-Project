package model;

import java.sql.Connection;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class StockMeuble extends GenericDAO<StockMeuble> {

    private int id;
    private int idMeuble;
    private int idTaille;
    private int quantite;
    private String dateInsertion;

    private Meuble meuble;
    private Taille taille;

    public StockMeuble() {
    }

    public StockMeuble(int id, int idMeuble, int idTaille, int quantite, String dateInsertion) {
        this.id = id;
        this.idMeuble = idMeuble;
        this.idTaille = idTaille;
        this.quantite = quantite;
        this.dateInsertion = dateInsertion;
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }
}
