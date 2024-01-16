package model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;

@Data
@EqualsAndHashCode(callSuper = false)
public class PrixVenteMeuble extends GenericDAO<PrixVenteMeuble> {

    private int id;
    private int idMeuble;
    private int idTaille;
    private double prixVente;
}
