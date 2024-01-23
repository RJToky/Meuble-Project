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

    private int id;
    private String nomEmploye;
    private int idOuvrier;
    private String nomOuvrier;
    private String dateEmbauche;
    private int anneeExperience;
    private String profil;
    private double tauxHoraire;

    public VProfilEmploye() {
    }

    public VProfilEmploye(int id, int idOuvrier, String nomEmploye, String nomOuvrier, String dateEmbauche, int anneeExperience, String profil, double tauxHoraire) {
        this.id = id;
        this.nomEmploye = nomEmploye;
        this.idOuvrier = idOuvrier;
        this.nomOuvrier = nomOuvrier;
        this.dateEmbauche = dateEmbauche;
        this.anneeExperience = anneeExperience;
        this.profil = profil;
        this.tauxHoraire = tauxHoraire;
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
