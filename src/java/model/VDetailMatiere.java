package model;

import java.sql.*;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class VDetailMatiere extends GenericDAO<VDetailMatiere> {

    private int idMatiere;
    private String nomMatiere;
    private double prixUnitaire;

    public VDetailMatiere() {
    }

    public static ArrayList<VDetailMatiere> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new VDetailMatiere().findAll(con);
        }
    }

    public static VDetailMatiere getById(Connection con, int id) throws Exception {
        return new VDetailMatiere().findById(con, id);
    }
}
