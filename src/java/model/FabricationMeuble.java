package model;

import java.sql.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class FabricationMeuble extends GenericDAO<FabricationMeuble> {
    int id;
    int idMeuble;
    int idTaille;
    int idMatiere;
    double quantite;

    public FabricationMeuble() {
    }

    public FabricationMeuble(int id, int idMeuble, int idTaille, int idMatiere, double quantite) {
        this.id = id;
        this.idMeuble = idMeuble;
        this.idTaille = idTaille;
        this.idMatiere = idMatiere;
        this.quantite = quantite;
    }

    
    public void insert(String[] listIdMatieres, String[] quantites) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            for (int i = 0; i < listIdMatieres.length; i++) {
                FabricationMeuble fm = new FabricationMeuble(0, this.idMeuble, this.idMatiere, Integer.parseInt(listIdMatieres[i]), Double.parseDouble(quantites[i]));
                fm.save(con);
            }
            con.close();
        }

    }

}