/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package motelsline.server.models.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import motelsline.server.models.Habitaciones;
import motelsline.server.models.Imagen;

/**
 *
 * @author Anderson Velez
 */
public class DaoHabitaciones {
    public int insertar(Habitaciones habitacion){
        Conexion conexion = new Conexion();
        try{            
            PreparedStatement statement = conexion.prepareStatement("INSERT INTO habitaciones(nombre, cantidad, descripcion, precio, cantidad_horas, hora_adicional, persona_adicional, id_motel) values (?, ?, ?, ?, ?, ?, ?, (SELECT id_motel FROM motel LIMIT 1))");
            if(statement == null){
                return 0;
            }
            statement.setString(1, habitacion.getNombre());
            statement.setInt(2, habitacion.getCantidad());
            statement.setString(3, habitacion.getDescripcion());            
            statement.setDouble(4, habitacion.getPrecio());
            statement.setInt(5, habitacion.getCantidadHoras());
            statement.setDouble(6, habitacion.getHoraAdicional());
            statement.setDouble(7, habitacion.getPersonaAdicional());
            statement.executeUpdate(); 
            PreparedStatement statement2 = conexion.prepareStatement("SELECT id_habitacion FROM habitaciones ORDER BY id_habitacion desc  limit 1");
            ResultSet result = statement2.executeQuery();
            result.next();
            int id = result.getInt("id_habitacion");
            
            return id;
        }catch(SQLException ex){
            System.out.println("Error al insertar la habitacion " + ex.toString());
            return 0;
        }finally{                
            try{
                conexion.desconectar();
            }catch(Exception ex){
               System.out.println("ERROR AL CERRAR LA CONEXIÓN " + ex); 
            }
        }
    }
    
    public ArrayList<Habitaciones> consultarAll(){
        Conexion conexion = new Conexion(); 
        try{ 
        ArrayList<Habitaciones> list = new ArrayList();        
        PreparedStatement statement = conexion.prepareStatement("SELECT * FROM habitaciones");
        ResultSet result = statement.executeQuery();
        
        while(result.next()){
            Habitaciones habitacion = new Habitaciones();
            ArrayList<Imagen> listIma = new ArrayList();
            
            habitacion.setNombre(result.getString("nombre"));
            habitacion.setCantidad(result.getInt("cantidad"));
            habitacion.setDescripcion(result.getString("descripcion"));
            habitacion.setPrecio(result.getDouble("precio"));
            habitacion.setCantidadHoras(result.getInt("cantidad_horas"));
            habitacion.setHoraAdicional(result.getDouble("hora_adicional"));
            habitacion.setPersonaAdicional(result.getDouble("persona_adicional"));
            habitacion.setId(result.getInt("id_habitacion"));
            
            PreparedStatement stateIma = conexion.prepareStatement("SELECT * FROM fotos_habitaciones WHERE id_habitacion = ?");
            stateIma.setInt(1, habitacion.getId());
            ResultSet resultIma = stateIma.executeQuery();
            
            while(resultIma.next()){
                Imagen imagen = new Imagen();
                imagen.setId(resultIma.getInt("id_foto"));                
                imagen.setNombre(resultIma.getString("nombre"));
                listIma.add(imagen);
            }
            habitacion.setImagenes(listIma);
                    
            list.add(habitacion);
        }
        
        return list;
        }catch(SQLException e){
            System.out.print("DAO: " + e.toString());
            return null;
        }finally{
            try{
                conexion.desconectar();
            }catch(Exception ex){
                System.out.println("ERROR EN DESCONEXIÓN " + ex);
            }
        }        
    }
    
    
    public int eliminar(int id){
        Conexion conexion = new Conexion();
        int eliminado = 0;
        try{         
        PreparedStatement statement = conexion.prepareStatement("DELETE FROM habitaciones WHERE id_habitacion = ?");
        statement.setInt(1, id);
        eliminado = statement.executeUpdate();  
        }catch(SQLException ex){            
            System.out.println("ERROR no se pudo eliminar la habitacion: " + ex);
        }finally{
            try{
               conexion.desconectar(); 
            }catch(Exception ex){
                System.out.println("ERROR AL CERRAR LA CONEXIÓN" + ex);
            }
        }
        return eliminado;
    }
    
    public Habitaciones consultar(int id){
        Conexion conexion = new Conexion();
        try{    
            PreparedStatement statement = conexion.prepareStatement("SELECT * FROM habitaciones WHERE id_habitacion = ?");
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            if(result.next()){
                Habitaciones habitacion = new Habitaciones();
                habitacion.setId(result.getInt("id_habitacion"));
                habitacion.setNombre(result.getString("nombre"));
                habitacion.setCantidad(result.getInt("cantidad"));
                habitacion.setDescripcion(result.getString("descripcion"));
                habitacion.setPrecio(result.getDouble("precio"));
                habitacion.setCantidadHoras(result.getInt("cantidad_horas"));
                habitacion.setHoraAdicional(result.getDouble ("hora_adicional"));
                habitacion.setPersonaAdicional(result.getDouble("persona_adicional"));
                
                PreparedStatement stateIma = conexion.prepareStatement("SELECT * FROM fotos_habitaciones WHERE id_habitacion = ?");
                stateIma.setInt(1, habitacion.getId());
                ResultSet resultIma = stateIma.executeQuery();
                ArrayList<Imagen> listIma = new ArrayList();

                while(resultIma.next()){
                    Imagen imagen = new Imagen();
                    imagen.setId(resultIma.getInt("id_foto"));
                    imagen.setNombre(resultIma.getString("nombre"));
                    listIma.add(imagen);
                }
                habitacion.setImagenes(listIma);
                
                
                return habitacion;
            }
            
        }catch(SQLException ex){
            System.out.println("ERROR SQL :" + ex);
        }finally{
            try{
               conexion.desconectar(); 
            }catch(Exception ex){
                System.out.println("ERROR EN DESCONEXIÓN " + ex);
            }
        }
        return null;
    }
    
    public int modificar(Habitaciones habitacion){
        Conexion conexion = new Conexion();
        int modificado = 0;
        try{        
        PreparedStatement statement = conexion.prepareStatement("UPDATE habitaciones SET nombre = ?, cantidad = ?, descripcion = ?, precio = ?, cantidad_horas = ?, hora_adicional = ?, persona_adicional = ? WHERE id_habitacion = ?");
        statement.setString(1, habitacion.getNombre());
        statement.setDouble(2, habitacion.getCantidad());
        statement.setString(3, habitacion.getDescripcion());
        statement.setDouble(4, habitacion.getPrecio());
        statement.setDouble(5, habitacion.getCantidadHoras());
        statement.setDouble(6, habitacion.getHoraAdicional());
        statement.setDouble(7, habitacion.getPersonaAdicional());
        statement.setInt(8, habitacion.getId());
        modificado = statement.executeUpdate();        
        }catch(SQLException ex){
            System.out.println("ERROR no se pudo modificar la habitacion :" + ex);
        }finally{                
            try{
                conexion.desconectar();
            }catch(Exception ex){
                System.out.println("ERROR al desconectar la conexión " + ex);
            }
        }
        return modificado;
        
    }
    
    public int insertarImagenes(Habitaciones habitacion){
        Conexion conexion = new Conexion();
        int imgInsertada = 0;
        try{            
            for(Imagen imagen : habitacion.getImagenes()){
                if(imagen.getId() == 0){
                    PreparedStatement statement = conexion.prepareStatement("INSERT INTO fotos_habitaciones (id_habitacion, nombre) VALUES (?, ?)");
                    statement.setInt(1, habitacion.getId());
                    statement.setString(2, imagen.getNombre());
                    imgInsertada = statement.executeUpdate();                    
                }
            }            
        }catch(SQLException se){
            System.out.println("ERROR al insertar imagen: " + se.toString());
        }finally{
            try{
                conexion.desconectar();
            }catch(Exception ex){
                System.out.println("ERROR al desconectar la conexion " + ex);
            }
        }
        return imgInsertada;
    }
    
    public int eliminarImagen(Imagen imagen){
        Conexion conexion = new Conexion();
        int imgEliminada = 0;
        try{            
            PreparedStatement statement = conexion.prepareStatement("DELETE FROM fotos_habitaciones WHERE id_foto = ?");
            statement.setInt(1, imagen.getId());
            imgEliminada = statement.executeUpdate();
            
        }catch(SQLException se){
            System.out.println("Error al eliminar la imagen: " + se.toString());
        }finally{                
            try{
                conexion.desconectar();
            }catch(Exception ex){
                System.out.println("ERROR al desconectar la conexión " + ex);
            }            
        }
        return imgEliminada;
    }
    
    public boolean validarNHabitacion(int cantidad){
        Conexion conexion = new Conexion();
        try{
            PreparedStatement statement = conexion.prepareStatement("SELECT * FROM habitaciones WHERE cantidad = ? limit 1");
            statement.setInt(1, cantidad);
            ResultSet result = statement.executeQuery();
            return result.next();
        }catch(SQLException se){
           System.out.println("ERROR en la consulta del numero de la habitacion " + se);
           return false;
        }finally{
            try{
                conexion.desconectar();
            }catch(Exception ex){
                System.out.println("Error al cerrar la conexion " + ex);
            }
        }
    }

   
}
