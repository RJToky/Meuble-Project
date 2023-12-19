package model;

import java.sql.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class FabricationMeuble extends GenericDAO<FabricationMeuble> {
    private int id;
    private int idMeuble;
    private int idTaille;
    private int idMatiere;
    private double quantite;
    
    private Meuble meuble;
    private Taille taille;
    private Matiere matiere;

    public FabricationMeuble() {
    }

    public FabricationMeuble(int id, int idMeuble, int idTaille, int idMatiere, double quantite) {
        this.id = id;
        this.idMeuble = idMeuble;
        this.idTaille = idTaille;
        this.idMatiere = idMatiere;
        this.quantite = quantite;
    }

    public void insert(String[] listIdMatiere, String[] quantites) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            for (int i = 0; i < listIdMatiere.length; i++) {
                FabricationMeuble fabricationMeuble = new FabricationMeuble(0, this.getIdMeuble(), this.getIdTaille(), Integer.parseInt(listIdMatiere[i]), Double.parseDouble(quantites[i]));
                fabricationMeuble.save(con);
            }
        }
    }
}
