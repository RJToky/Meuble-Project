package model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;

@Data
@EqualsAndHashCode(callSuper = false)
public class CoefficientTaille extends GenericDAO<CoefficientTaille> {

    private int id;
    private double coefficient;
    private double volumeHoraire;
    private String dateInsertion;
}
