package motelsline.server.models.dao;

import java.sql.*;
import java.util.ArrayList;
import motelsline.server.models.Imagen;
import motelsline.server.models.Servicios;

/**
 *
 * @author APRENDIZ
 */
public class DaoServicios {
    
    public int insertar(Servicios servicio){
        Conexion conexion = new Conexion();
        try{            
            PreparedStatement statement = conexion.prepareStatement("INSERT INTO servicios(nombre, descripcion, precio) values (?, ?, ?)");
            if(statement == null){
                return 0;
            }
            statement.setString(1, servicio.getNombre());
            statement.setString(2, servicio.getDescripcion());            
            statement.setDouble(3, servicio.getPrecio());
            statement.executeUpdate(); 
            PreparedStatement statement2 = conexion.prepareStatement("SELECT id_servicio FROM servicios ORDER BY id_servicio desc  limit 1");
            ResultSet result = statement2.executeQuery();
            result.next();
            int id = result.getInt("id_servicio");
            
            return id;
        }catch(SQLException ex){
            System.out.println("Error al insertar servicio " + ex.toString());
            return 0;
        }finally{                
            try{
                conexion.desconectar();
            }catch(Exception ex){
               System.out.println("ERROR AL CERRAR LA CONEXIÓN " + ex); 
            }
        }
    }
    
    public ArrayList<Servicios> consultarAll(){
        Conexion conexion = new Conexion(); 
        try{ 
        ArrayList<Servicios> list = new ArrayList();        
        PreparedStatement statement = conexion.prepareStatement("SELECT * FROM servicios");
        ResultSet result = statement.executeQuery();
        
        while(result.next()){
            Servicios servicio = new Servicios();
            ArrayList<Imagen> listIma = new ArrayList();
            
            servicio.setNombre(result.getString("nombre"));
            servicio.setPrecio(result.getDouble("precio"));
            servicio.setDescripcion(result.getString("descripcion")); 
            servicio.setId(result.getInt("id_servicio"));
            
            PreparedStatement stateIma = conexion.prepareStatement("SELECT * FROM fotos_servicios WHERE id_servicio = ?");
            stateIma.setInt(1, servicio.getId());
            ResultSet resultIma = stateIma.executeQuery();
            
            while(resultIma.next()){
                Imagen imagen = new Imagen();
                imagen.setId(resultIma.getInt("id_foto"));                
                imagen.setNombre(resultIma.getString("nombre"));
                listIma.add(imagen);
            }
            servicio.setImagenes(listIma);
                    
            list.add(servicio);
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
        PreparedStatement statement = conexion.prepareStatement("DELETE FROM servicios WHERE id_servicio = ?");
        statement.setInt(1, id);
        eliminado = statement.executeUpdate();  
        }catch(SQLException ex){            
            System.out.println("ERROR no se pudo eliminar el servicio: " + ex);
        }finally{
            try{
               conexion.desconectar(); 
            }catch(Exception ex){
                System.out.println("ERROR AL CERRAR LA CONEXIÓN" + ex);
            }
        }
        return eliminado;
    }
    
    public Servicios consultar(int id){
        Conexion conexion = new Conexion();
        try{    
            PreparedStatement statement = conexion.prepareStatement("SELECT * FROM servicios WHERE id_servicio = ?");
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            if(result.next()){
                Servicios servicio = new Servicios();
                servicio.setId(result.getInt("id_servicio"));
                servicio.setNombre(result.getString("nombre"));
                servicio.setPrecio(result.getDouble("precio"));
                servicio.setDescripcion(result.getString("descripcion"));
                
                PreparedStatement stateIma = conexion.prepareStatement("SELECT * FROM fotos_servicios WHERE id_servicio = ?");
                stateIma.setInt(1, servicio.getId());
                ResultSet resultIma = stateIma.executeQuery();
                ArrayList<Imagen> listIma = new ArrayList();

                while(resultIma.next()){
                    Imagen imagen = new Imagen();
                    imagen.setId(resultIma.getInt("id_foto"));
                    imagen.setNombre(resultIma.getString("nombre"));
                    listIma.add(imagen);
                }
                servicio.setImagenes(listIma);
                
                
                return servicio;
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
    
    public int modificar(Servicios servicio){
        Conexion conexion = new Conexion();
        int modificado = 0;
        try{        
        PreparedStatement statement = conexion.prepareStatement("UPDATE servicios SET nombre = ?, precio = ?, descripcion = ? WHERE id_servicio = ?");
        statement.setString(1, servicio.getNombre());
        statement.setDouble(2, servicio.getPrecio());
        statement.setString(3, servicio.getDescripcion());
        statement.setInt(4, servicio.getId());
        modificado = statement.executeUpdate();        
        }catch(SQLException ex){
            System.out.println("ERROR no se pudo modificar el servicio :" + ex);
        }finally{                
            try{
                conexion.desconectar();
            }catch(Exception ex){
                System.out.println("ERROR al desconectar la conexión " + ex);
            }
        }
        return modificado;
        
    }
    
    public int insertarImagenes(Servicios servicio){
        Conexion conexion = new Conexion();
        int imgInsertada = 0;
        try{            
            for(Imagen imagen : servicio.getImagenes()){
                if(imagen.getId() == 0){
                    PreparedStatement statement = conexion.prepareStatement("INSERT INTO fotos_servicios (id_servicio, nombre) VALUES (?, ?)");
                    statement.setInt(1, servicio.getId());
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
            PreparedStatement statement = conexion.prepareStatement("DELETE FROM fotos_servicios WHERE id_foto = ?");
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
    
}
