package model;

import java.sql.Connection;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class VDetailPoste extends GenericDAO<VDetailPoste> {

    private int idPoste;
    private String nomPoste;
    private double tauxHoraire;

    public VDetailPoste() {
    }

    public static ArrayList<VDetailPoste> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new VDetailPoste().findAll(con);
        }
    }

    public static VDetailPoste getById(Connection con, int id) throws Exception {
        return new VDetailPoste().findById(con, id);
    }
}
