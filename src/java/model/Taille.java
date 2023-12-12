package model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;

@Data
@EqualsAndHashCode(callSuper = false)
public class Taille extends GenericDAO<Taille> {
    int id;
    String nom;

    public Taille() {
    }

    public Taille(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }
    
}