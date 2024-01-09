package model;

import java.sql.*;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class Matiere extends GenericDAO<Matiere> {

    private int id;
    private String nom;
    private double prixUnitaire;

    public Matiere() {
    }

    public Matiere(int id, String nom, double prixUnitaire) throws Exception {
        this.id = id;
        this.nom = nom;
        this.setPrixUnitaire(prixUnitaire);
    }

    public static ArrayList<Matiere> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Matiere().findAll(con);
        }
    }

    public static Matiere getById(Connection con, int id) throws Exception {
        return new Matiere().findById(con, id);
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }

    public ArrayList<FabricationMeuble> getFabricationMeubles() throws ClassNotFoundException, SQLException, Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            String query = """
                select *
                from FabricationMeuble
                where idMatiere = %s
                order by idMeuble asc
            """.formatted(this.getId());
            ArrayList<FabricationMeuble> fabricationMeubles = new FabricationMeuble().find(con, query);
            for (FabricationMeuble fabricationMeuble : fabricationMeubles) {
                fabricationMeuble.setMeuble(Meuble.getById(con, fabricationMeuble.getIdMeuble()));
                fabricationMeuble.setTaille(Taille.getById(con, fabricationMeuble.getIdTaille()));
                fabricationMeuble.setMatiere(Matiere.getById(con, fabricationMeuble.getIdMatiere()));
            }
            return fabricationMeubles;
        }
    }

    public void setPrixUnitaire(double prixUnitaire) throws Exception {
        if (prixUnitaire <= 0) {
            throw new Exception("Le prix unitaire doit etre superieur a zero");
        }
        this.prixUnitaire = prixUnitaire;
    }
}
