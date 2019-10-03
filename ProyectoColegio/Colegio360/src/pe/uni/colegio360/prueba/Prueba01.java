package pe.uni.colegio360.prueba;

import java.sql.Connection;
import pe.uni.colegio360.db.AccesoDB;


public class Prueba01 {
   
    public static void main(String[] args) {
        try {
            Connection cn = AccesoDB.getConnection();
            System.out.println("OK");
            cn.close();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}
