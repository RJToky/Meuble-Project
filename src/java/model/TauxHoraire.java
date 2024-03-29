package model;

import java.sql.Connection;
import java.time.LocalDateTime;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class TauxHoraire extends GenericDAO<TauxHoraire> {

    private int id;
    private int idPoste;
    private double valeur;
    private String dateInsertion;

    public TauxHoraire() {
    }

    public TauxHoraire(int id, int idPoste, double valeur) {
        this.id = id;
        this.idPoste = idPoste;
        this.valeur = valeur;
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.setDateInsertion(LocalDateTime.now().toString());
            this.save(con);
        }
    }
}