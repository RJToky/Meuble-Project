package model;

import java.sql.Connection;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class VStatistiqueVente extends GenericDAO<VStatistiqueVente> {

    private int idMeuble;
    private int idTaille;
    private int idGenre;
    private String nomGenre;
    private double nombreVente;

    public VStatistiqueVente() {
    }

    public VStatistiqueVente(int idMeuble, int idTaille, int idGenre, String nomGenre, double nombreVente) {
        this.idMeuble = idMeuble;
        this.idTaille = idTaille;
        this.idGenre = idGenre;
        this.nomGenre = nomGenre;
        this.nombreVente = nombreVente;
    }

    public static ArrayList<VStatistiqueVente> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new VStatistiqueVente().findAll(con);
        }
    }

    public static ArrayList<VStatistiqueVente> getByMeubleTaille(int idMeuble, int idTaille) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            VStatistiqueVente vStatistiqueVente = new VStatistiqueVente();
            String query = """
                select *
                from VStatistiqueVente
                where
                    idMeuble = %s
                    and idTaille = %s
            """.formatted(idMeuble, idTaille);
            ArrayList<VStatistiqueVente> vStatistiqueVentes = vStatistiqueVente.find(con, query);
            return vStatistiqueVentes;
        }
    }

}
