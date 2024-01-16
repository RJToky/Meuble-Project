package model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;

@Data
@EqualsAndHashCode(callSuper = false)
public class CoefficientStyle extends GenericDAO<CommandeMeuble> {

    private int id;
    private double coefficient;
    private int nombrePersonne;
    private String dateInsertion;
}
