
package motelsline.server.models.dao;

import java.sql.*;

/**
 *
 * @author APRENDIZ
 */
public class Conexion {
    
    private Connection conex;
   
    
    public Conexion(){
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.conex = DriverManager.getConnection("jdbc:mysql://localhost/motelsline","root", "");
        } catch (Exception ex) {
            System.out.println("Error en la conexion a la base de datos" + ex.toString());
        }
        
    }
    public void desconectar() {
        try {
            this.conex.close();
        }
        catch (SQLException ex) {
        }
    }

    public PreparedStatement prepareStatement(String sql){
        try {
            return this.conex.prepareStatement(sql);
        } catch (Exception ex) {
            return null;
        }
    }
    
    public Connection getConexion(){
        return conex;
    }
    
    public boolean transaccion(){
        try {
            conex.setAutoCommit(false);
            return true;
        } catch (SQLException ex) {
            System.out.println("Error en metodo transaccion: " + ex);
        }
        return false;
    }
    
    public boolean guardarTrans(){
        try {
            conex.commit();
            conex.setAutoCommit(true);
            return true;
        } catch (SQLException ex) {
            System.out.println("Error en metodo guardarTrans: " + ex);
        }
        return false;
    }
    
    public boolean cancelarTrans(){
        try {
            conex.rollback();
            conex.setAutoCommit(true);
            return true;
        } catch (SQLException ex) {
            System.out.println("Error en metodo cancelarTrans: " + ex);
        }
        return false;
    }
}
