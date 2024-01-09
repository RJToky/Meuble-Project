package model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;

@Data
@EqualsAndHashCode(callSuper = false)
public class StyleMatiere extends GenericDAO<StyleMatiere> {

    private int id;
    private int idStyle;
    private int idMatiere;

    public StyleMatiere() {
    }

    public StyleMatiere(int id, int idStyle, int idMatiere) {
        this.id = id;
        this.idStyle = idStyle;
        this.idMatiere = idMatiere;
    }
}
