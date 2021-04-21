/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package motelsline.server.models.dao;

import java.sql.*;
import motelsline.server.models.Motel;

/**
 *
 * @author Cleyber
 */
public class DaoMotel {
    
    public int registrar(Motel motel){
        Conexion conexion = new Conexion(); 
        int registrado = 0;
        try{
            PreparedStatement statement = conexion.prepareStatement("INSERT INTO motel(nombre, direccion, telefono, correo) VALUES (?, ?, ?, ?)");
            statement.setString(1, motel.getNombre());
            statement.setString(2, motel.getDireccion());
            statement.setString(3, motel.getTelefono());
            statement.setString(4, motel.getCorreo());
            registrado  = statement.executeUpdate();
            
            /*PreparedStatement statementId = conexion.prepareStatement("SELECT * FROM motel");
            ResultSet result = statementId.executeQuery();
            id = Integer.parseInt(result.getString("id_motel"));   */         
        }catch(SQLException se){
            System.out.println("Error al insertar motel: " + se.toString());
        }catch(NullPointerException npe){
            System.out.println("Inserción nula: " + npe.toString());
        }finally{
            try{
                conexion.desconectar();
            }catch(Exception ex){
                System.out.println("Error al cerrar la conexión: " + ex.toString());
            }
        }
        return registrado;
    }
    
    public static Motel getMotel(){
        Conexion conexion = new Conexion();
        Motel motel = new Motel();
        try{
            PreparedStatement statement = conexion.prepareStatement("SELECT * FROM motel LIMIT 1");
            ResultSet result = statement.executeQuery();
            if(result.next()){
                motel.setNombre(result.getString("nombre"));
                motel.setDireccion(result.getString("direccion"));
                motel.setCorreo(result.getString("correo"));
                motel.setTelefono(result.getString("telefono"));
                motel.setId(result.getInt("id_motel"));
            }else{
                return null;
            }
        }catch(SQLException se){
            System.out.println("Error en la consulta del motel: " + se.toString());
        }catch(NullPointerException npe){
            System.out.println("consulta del motel nula: " + npe.toString());
        }finally{
            try{
                conexion.desconectar();
            }catch(Exception ex){
               System.out.println("Error al cerrar la conexión: " + ex.toString()); 
            }
        }
        return motel;
    }
    
    
}
