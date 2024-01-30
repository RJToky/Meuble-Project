package model;

import java.sql.Connection;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class VEtatStockMeuble extends GenericDAO<VEtatStockMeuble> {

    private int idMeuble;
    private int idTaille;
    private double quantite;
    
    private Meuble meuble;
    private Taille taille;

    public VEtatStockMeuble() {
    }

    public static ArrayList<VEtatStockMeuble> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            ArrayList<VEtatStockMeuble> vEtatStockMeubles = new VEtatStockMeuble().findAll(con);
            for (VEtatStockMeuble vEtatStockMeuble : vEtatStockMeubles) {
                vEtatStockMeuble.setMeuble(Meuble.getById(con, vEtatStockMeuble.getIdMeuble()));
                vEtatStockMeuble.setTaille(new Taille().findById(con, vEtatStockMeuble.getIdTaille()));
            }
            return vEtatStockMeubles;
        }
    }

    public static VEtatStockMeuble getByMeubleTaille(int idMeuble, int idTaille) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            String query = """
                select *
                from VEtatStockMeuble
                where
                    idMeuble = %s
                    and idTaille = %s
            """.formatted(idMeuble, idTaille);
            
            return new VEtatStockMeuble().find(con, query).get(0);
        }
    }

}
