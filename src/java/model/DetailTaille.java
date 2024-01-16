package model;

import java.sql.Connection;
import java.sql.SQLException;
import lombok.Data;
import lombok.EqualsAndHashCode;
import rj.util.GenericDAO;
import util.ConnectionPostgres;

@Data
@EqualsAndHashCode(callSuper = false)
public class DetailTaille extends GenericDAO<DetailTaille> {
    
    private int id;
    private int idTaille;
    private int ordre;
    
    public DetailTaille(int id, int idTaille, int ordre) {
        this.id = id;
        this.idTaille = idTaille;
        this.ordre = ordre;
    }

    public DetailTaille() {
    }
    
    public void insert() throws SQLException, Exception, ClassNotFoundException {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.save(con);
        }
    }
}
