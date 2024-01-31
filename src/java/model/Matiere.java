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

    public ArrayList<FormuleMeuble> getFormuleMeubles() throws ClassNotFoundException, SQLException, Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            String query = """
                        select *
                        from FormuleMeuble
                        where idMatiere = %s
                        order by idMeuble asc
                    """.formatted(this.getId());
            ArrayList<FormuleMeuble> formuleMeubles = new FormuleMeuble().find(con, query);
            for (FormuleMeuble formuleMeuble : formuleMeubles) {
                formuleMeuble.setMeuble(Meuble.getById(con, formuleMeuble.getIdMeuble()));
                formuleMeuble.setTaille(new Taille().findById(con, formuleMeuble.getIdTaille()));
                formuleMeuble.setMatiere(new Matiere().findById(con, formuleMeuble.getIdMatiere()));
            }
            return formuleMeubles;
        }
    }
}
