package model;

import java.sql.Connection;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class CommandeMeuble extends GenericDAO<CommandeMeuble> {

    private int id;
    private int idMeuble;
    private int idTaille;
    private int quantite;
    private String dateCommande;

    private Meuble meuble;
    private Taille taille;

    public CommandeMeuble() {
    }

    public CommandeMeuble(int id, int idMeuble, int idTaille, int quantite, String dateCommande) {
        this.id = id;
        this.idMeuble = idMeuble;
        this.idTaille = idTaille;
        this.quantite = quantite;
        this.dateCommande = dateCommande;
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }
}
