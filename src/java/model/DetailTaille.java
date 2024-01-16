package model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;

@Data
@EqualsAndHashCode(callSuper = false)
public class DetailTaille extends GenericDAO<DetailTaille> {
    
    private int id;
    private int idTaille;
    private int ordre;
}
