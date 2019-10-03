package pe.uni.colegio360.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import pe.uni.colegio360.db.AccesoDB;

public class LogonService {

	/**
	 *
	 * @param usuario
	 * @param clave
	 * @return 1: Ok, 0: Datos incorrectos, -1: Error en el proceso
	 */
	public int validarUsuario(String usuario, String clave) {
		// Estado Inicial
		int rpta = 0;
		// Variables
		Connection cn = null;
		String sql = "select count(1) cont "
						+ "from dbo.tb_usuario "
						+ "where usuario = ? "
						+ "and   clave  = ? ";
		Map<String, Object> rec = null;
		// Proceso
		try {
			cn = AccesoDB.getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, usuario);
			ps.setString(2, clave);
			ResultSet rs = ps.executeQuery();
			rs.next();
			rpta = rs.getInt("cont");
			rs.close();
			ps.close();
		} catch (Exception e) {
			rpta = -1;
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		// Reporte
		return rpta;
	}

}
