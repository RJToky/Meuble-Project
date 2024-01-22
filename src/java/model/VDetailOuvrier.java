package model;

import java.sql.Connection;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class VDetailOuvrier extends GenericDAO<VDetailOuvrier> {

    private int id;
    private String nomOuvrier;
    private double tauxHoraire;

    public VDetailOuvrier() {
    }

    public static ArrayList<VDetailOuvrier> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new VDetailOuvrier().findAll(con);
        }
    }

    public static VDetailOuvrier getById(Connection con, int id) throws Exception {
        return new VDetailOuvrier().findById(con, id);
    }
}
