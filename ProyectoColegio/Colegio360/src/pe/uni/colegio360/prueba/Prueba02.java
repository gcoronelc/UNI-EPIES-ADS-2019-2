package pe.uni.colegio360.prueba;

import java.util.Map;
import pe.uni.colegio360.service.LogonService;


public class Prueba02 {

    public static void main(String[] args) {

        // Datos
        String usuario = "KGUZMAN";
        String clave = "123456";
        // Proceso
        LogonService service = new LogonService();
        int rpta = service.validarUsuario(usuario, clave);
        // Reporte
        if( rpta == 1){
            System.out.println("Hola: Proceso ok." );
        } else {
            System.err.println("Datos incorrectos.");
        }
        

    }
    
}
