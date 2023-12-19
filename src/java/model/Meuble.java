package model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class Meuble extends GenericDAO<Meuble> {
    int id;
    String nom;
    int idCategorie;
    int idStyle;

    public Meuble() {
    }

    public Meuble(int id, String nom, int idCategorie, int idStyle) {
        this.id = id;
        this.nom = nom;
        this.idCategorie = idCategorie;
        this.idStyle = idStyle;
    }

    public void insert() throws SQLException, Exception, ClassNotFoundException {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }

    public static ArrayList<Meuble> getAll() throws Exception {
        Connection con = ConnectionPostgres.getConnection();
        ArrayList<Meuble> meubles = new Meuble().findAll(con);
        con.close();
        return meubles;
    }
    
    public static Meuble getById(int id) throws Exception {
        Connection con = ConnectionPostgres.getConnection();
        Meuble meuble = new Meuble().findById(con, id);
        con.close();
        return meuble;
    }

    public static ArrayList<Meuble> getMeubles(int idMatiere) throws ClassNotFoundException, SQLException, Exception {
        Connection con = ConnectionPostgres.getConnection();
        ArrayList<Meuble> meubles = new ArrayList<>();
        String query = """
                       SELECT * FROM meuble WHERE id IN(
                            SELECT idMeuble from FabricationMeuble GROUP BY idMeuble
                       )
                       """;
        meubles = new Meuble().find(con, query);
        con.close();
        return meubles;
    }

}