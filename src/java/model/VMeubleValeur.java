package model;

import java.sql.Connection;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class VMeubleValeur extends GenericDAO<VMeubleValeur> {

    private int idMeuble;
    private String nomMeuble;
    private int idTaille;
    private String nomTaille;
    private double valeur;

    public VMeubleValeur() {
    }

    public static ArrayList<VMeubleValeur> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new VMeubleValeur().findAll(con);
        }
    }

    public static ArrayList<VMeubleValeur> getByValeurMinMax(double valeurMin, double valeurMax) throws Exception {
        if (valeurMin < 0 || valeurMax < 0) {
            throw new Exception("La valeur doit etre positive");
        }
        if (valeurMin > valeurMax) {
            throw new Exception("La valeur min doit etre inferieur ou egale a la valeur max");
        }
        try (Connection con = ConnectionPostgres.getConnection()) {
            VMeubleValeur vMeubleValeur = new VMeubleValeur();
            String query = """
                        select *
                        from VMeubleValeur
                        where valeur between %s and %s
                    """.formatted(valeurMin, valeurMax);
            ArrayList<VMeubleValeur> vMeubleValeurs = vMeubleValeur.find(con, query);
            return vMeubleValeurs;
        }
    }

}
