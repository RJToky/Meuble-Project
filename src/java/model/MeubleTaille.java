package model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;

@Data
@EqualsAndHashCode(callSuper = false)
public class MeubleTaille extends GenericDAO<MeubleTaille> {

    private int id;
    private int idMeuble;
    private int idTaille;

    public MeubleTaille() {
    }

    public MeubleTaille(int id, int idMeuble, int idTaille) {
        this.id = id;
        this.idMeuble = idMeuble;
        this.idTaille = idTaille;
    }
}
