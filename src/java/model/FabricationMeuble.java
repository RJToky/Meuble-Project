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

    
    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }

}