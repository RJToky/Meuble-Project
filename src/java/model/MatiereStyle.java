package model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;

@Data
@EqualsAndHashCode(callSuper = false)
public class MatiereStyle extends GenericDAO<MatiereStyle> {
    private int id;
    private int idMatiere;
    private int idStyle;

    public MatiereStyle() {
    }

    public MatiereStyle(int id, int idMatiere, int idStyle) {
        this.id = id;
        this.idMatiere = idMatiere;
        this.idStyle = idStyle;
    }
}