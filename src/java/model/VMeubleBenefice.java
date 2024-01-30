package model;

import java.sql.Connection;
import java.util.ArrayList;
import util.ConnectionPostgres;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;

@Data
@EqualsAndHashCode(callSuper = false)
public class VMeubleBenefice extends GenericDAO<VMeubleBenefice> {

    private int id;
    private String nomMeuble;
    private int idTaille;
    private String nomTaille;
    private double prixVente;
    private double prixRevient;
    private double benefice;

    public VMeubleBenefice() {
    }
    
    public static ArrayList<VMeubleBenefice> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new VMeubleBenefice().findAll(con);
        }
    }

    public static ArrayList<VMeubleBenefice> getByBeneficeMinMax(double beneficeMin, double beneficeMax) throws Exception {
        if (beneficeMin < 0 || beneficeMax < 0) {
            throw new Exception("La benefice doit etre positive");
        }
        if (beneficeMin > beneficeMax) {
            throw new Exception("La benefice min doit etre inferieur ou egale a la benefice max");
        }
        try (Connection con = ConnectionPostgres.getConnection()) {
            VMeubleBenefice vMeubleBenefice = new VMeubleBenefice();
            String query = """
                select *
                from VMeubleBenefice
                where benefice between %s and %s
            """.formatted(beneficeMin, beneficeMax);
            ArrayList<VMeubleBenefice> vMeubleBenefices = vMeubleBenefice.find(con, query);
            return vMeubleBenefices;
        }
    }
}
