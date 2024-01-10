package model;

import java.sql.Connection;
import java.util.ArrayList;
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

    public void insert(String[] listIdMatiere, double[] quantites) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            for (int i = 0; i < listIdMatiere.length; i++) {
                if (quantites[i] != 0) {
                    FabricationMeuble fabricationMeuble = new FabricationMeuble(0, this.getIdMeuble(), this.getIdTaille(), Integer.parseInt(listIdMatiere[i]), quantites[i]);
                    fabricationMeuble.save(con);
                }
            }
        }
    }
    
    public ArrayList<FabricationMeuble> getByIdMeuble() throws Exception {
        try(Connection con = ConnectionPostgres.getConnection()) {
            String query = """
                select *
                from FabricationMeuble
                where idMeuble = %s
            """.formatted(this.getIdMeuble());
            
            ArrayList<FabricationMeuble> fabricationMeubles = new FabricationMeuble().find(con, query);
            for (FabricationMeuble fabricationMeuble : fabricationMeubles) {
                fabricationMeuble.setMeuble(Meuble.getById(con, fabricationMeuble.getIdMeuble()));
                fabricationMeuble.setTaille(new Taille().findById(con, fabricationMeuble.getIdTaille()));
                fabricationMeuble.setMatiere(new Matiere().findById(con, fabricationMeuble.getIdMatiere()));
            }
            return fabricationMeubles;
        }
    }
}
