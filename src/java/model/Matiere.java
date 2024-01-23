package model;

import java.sql.*;
import java.time.LocalDateTime;
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

    public Matiere() {
    }

    public Matiere(int id, String nom) throws Exception {
        this.id = id;
        this.nom = nom;
    }

    public static ArrayList<Matiere> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Matiere().findAll(con);
        }
    }

    public static Matiere getById(int id) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Matiere().findById(con, id);
        }
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
                fabricationMeuble.setTaille(new Taille().findById(con, fabricationMeuble.getIdTaille()));
                fabricationMeuble.setMatiere(new Matiere().findById(con, fabricationMeuble.getIdMatiere()));
            }
            return fabricationMeubles;
        }
    }
}
