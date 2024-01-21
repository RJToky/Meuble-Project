package model;

import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDateTime;
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
    private String dateInsertion;
    
    public DetailTaille(int id, int idTaille, int ordre) {
        this.id = id;
        this.idTaille = idTaille;
        this.ordre = ordre;
    }

    public DetailTaille() {
    }
    
    public void insert() throws SQLException, Exception, ClassNotFoundException {
        try (Connection con = ConnectionPostgres.getConnection()) {
            this.setDateInsertion(LocalDateTime.now().toString());
            this.save(con);
        }
    }
}
