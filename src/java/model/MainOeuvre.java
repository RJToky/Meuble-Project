package model;

import java.sql.Connection;
import java.util.ArrayList;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class MainOeuvre extends GenericDAO<MainOeuvre> {

    private int id;
    private int idStyle;
    private int idPoste;
    private double heureTravail;
    private int nombrePersonne;

    private Style style;
    private Poste poste;

    public MainOeuvre() {
    }

    public MainOeuvre(int id, int idStyle, int idPoste, double heureTravail, int nombrePersonne) {
        this.id = id;
        this.idStyle = idStyle;
        this.idPoste = idPoste;
        this.heureTravail = heureTravail;
        this.nombrePersonne = nombrePersonne;
    }

    public static ArrayList<MainOeuvre> getAll() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            ArrayList<MainOeuvre> mainOeuvres = new MainOeuvre().findAll(con);
            for (MainOeuvre mainOeuvre : mainOeuvres) {
                mainOeuvre.setStyle(Style.getById(con, mainOeuvre.getIdStyle()));
                mainOeuvre.setPoste(Poste.getById(con, mainOeuvre.getIdPoste()));
            }
            return mainOeuvres;
        }
    }

    public static MainOeuvre getById(int id) throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            return new MainOeuvre().findById(con, id);
        }
    }

    public void insert() throws Exception {
        try (Connection con = ConnectionPostgres.getConnection()) {
            if (this.heureTravail <= 0 || this.nombrePersonne <= 0) {
                throw new Exception("Le nombre doit etre positive");
            }
            this.save(con);
        }
    }

}