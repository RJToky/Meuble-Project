package model;

import java.sql.Connection;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class VProfilEmploye extends GenericDAO<VProfilEmploye> {

    private int idEmploye;
    private String nomEmploye;
    private int idPoste;
    private String nomPoste;
    private String dateEmbauche;
    private int anneeExperience;
    private String profil;
    private double tauxHoraire;

    public VProfilEmploye() {
    }

    public static ArrayList<VProfilEmploye> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new VProfilEmploye().findAll(con);
        }
    }

    public static VProfilEmploye getById(int id) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new VProfilEmploye().findById(con, id);
        }
    }

}
