package model;

import java.sql.Connection;
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
            this.save(con);
        }
    }

}
