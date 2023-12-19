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

    public ArrayList<Meuble> getAll() throws Exception {
        Connection con = ConnectionPostgres.getConnection();
        ArrayList<Meuble> meubles = new Meuble().findAll(con);
        con.close();
        return meubles;
    }

    public ArrayList<Meuble> getMeubles(int idMatiere) throws ClassNotFoundException, SQLException, Exception {
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

    public ArrayList<Matiere> getMatieres() throws Exception {
        ArrayList<Matiere> matieres;
        try (Connection con = ConnectionPostgres.getConnection()) {
            String query
                    = """
                        SELECT m.* FROM (SELECT * FROM fabricationmeuble WHERE idMeuble = %s) fm JOIN
                        (SELECT * FROM matiere) m ON fm.idMatiere=m.id
                        """.formatted(this.id);
            matieres = new Matiere().find(con, query);
        }
        return matieres;
    }

}