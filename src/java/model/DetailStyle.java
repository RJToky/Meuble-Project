package model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;

@Data
@EqualsAndHashCode(callSuper = false)
public class DetailStyle extends GenericDAO<DetailStyle> {

    private int id;
    private int idStyle;
    private int ordre;
}
