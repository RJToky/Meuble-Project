package model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;

@Data
@EqualsAndHashCode(callSuper = false)
public class SalairePersonnel extends GenericDAO<SalairePersonnel> {

    private int id;
    private int idPersonnel;
    private double salaire;
    private String dateInsertion;
}
