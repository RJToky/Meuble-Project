package model;

import java.sql.Connection;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class Embauche extends GenericDAO<Embauche> {

    private int id;
    private int idEmploye;
    private int idOuvrier;
    private String dateEmbauche;

    public Embauche() {
    }

    public Embauche(int id, int idEmploye, int idOuvrier, String dateEmbauche) {
        this.id = id;
        this.idEmploye = idEmploye;
        this.idOuvrier = idOuvrier;
        this.dateEmbauche = dateEmbauche;
    }

    public static ArrayList<Embauche> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new Embauche().findAll(con);
        }
    }

    public static Embauche getById(Connection con, int id) throws Exception {
        return new Embauche().findById(con, id);
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }
}
