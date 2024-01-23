package model;

import java.sql.Connection;
import java.time.LocalDateTime;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class PrixVenteMeuble extends GenericDAO<PrixVenteMeuble> {

    private int id;
    private int idMeuble;
    private int idTaille;
    private double prixVente;
    private String dateInsertion;

    public PrixVenteMeuble(int id, int idMeuble, int idTaille, double prixVente) {
        this.id = id;
        this.idMeuble = idMeuble;
        this.idTaille = idTaille;
        this.prixVente = prixVente;
    }

    public PrixVenteMeuble() {
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.setDateInsertion(LocalDateTime.now().toString());
            this.save(con);
        }
    }

}
