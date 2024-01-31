package model;

import java.sql.Connection;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class FormuleMeuble extends GenericDAO<FormuleMeuble> {

    private int id;
    private int idMeuble;
    private int idTaille;
    private int idMatiere;
    private double quantite;

    private Meuble meuble;
    private Taille taille;
    private Matiere matiere;

    public FormuleMeuble() {
    }

    public FormuleMeuble(int id, int idMeuble, int idTaille, int idMatiere, double quantite) {
        this.id = id;
        this.idMeuble = idMeuble;
        this.idTaille = idTaille;
        this.idMatiere = idMatiere;
        this.quantite = quantite;
    }

    public void insert(String[] listIdMatiere, double[] quantites) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            for (int i = 0; i < listIdMatiere.length; i++) {
                if (quantites[i] != 0) {
                    FormuleMeuble formuleMeuble = new FormuleMeuble(0, this.getIdMeuble(), this.getIdTaille(),
                            Integer.parseInt(listIdMatiere[i]), quantites[i]);
                    formuleMeuble.save(con);
                }
            }
        }
    }

    public ArrayList<FormuleMeuble> getByIdMeuble() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            String query = """
                        select *
                        from FormuleMeuble
                        where idMeuble = %s
                    """.formatted(this.getIdMeuble());

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
