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
import motelsline.server.models.Servicios;
import motelsline.server.models.Usuario;

/**
 *
 * @author Cleyber
 */
public class DaoUsuarios {
    public int insertar(Usuario usuario){
        Conexion conexion = new Conexion();
        int insertado = 0;
        try{
            PreparedStatement statement = conexion.prepareStatement("INSERT INTO usuarios(nombres, apellidos, cedula, correo, clave, rol, id_motel) values (?, ?, ?, ?, ?, ?, (SELECT id_motel FROM motel LIMIT 1))");
            if(statement == null){
                return 0;
            }
            statement.setString(1, usuario.getNombre());
            statement.setString(2, usuario.getApellido());
            statement.setString(3, usuario.getCedula());
            statement.setString(4, usuario.getCorreo());
            statement.setString(5, usuario.getClave());
            statement.setString(6, usuario.getRol());
            insertado = statement.executeUpdate();
        }catch(SQLException ex){
            System.out.println("Error al insertar usuario " + ex.toString());
        }catch(NullPointerException npe){
            System.out.println("Datos nulos en la inserción del cliente: " + npe.toString());
        }finally{
            try{
                conexion.desconectar();
            }catch(Exception ex){
                System.out.println("Error al cerrar conexión" + ex);
            }
        }
        return insertado;
    }

    public Usuario login(Usuario usuario){
        Conexion conexion = new Conexion();
        try{
            PreparedStatement statement = conexion.prepareStatement("SELECT * FROM usuarios WHERE correo = ? AND clave = ? limit 1");
            statement.setString(1, usuario.getCorreo());
            statement.setString(2, usuario.getClave());
            ResultSet result = statement.executeQuery();
           if(result.next()){
               usuario.setNombre(result.getString("nombres"));
               usuario.setApellido(result.getString("apellidos"));
               usuario.setCorreo(result.getString("correo"));
               usuario.setClave(result.getString("clave"));
               usuario.setCedula(result.getString("cedula"));
               usuario.setRol(result.getString("rol"));
               usuario.setId(result.getInt("id_usuario"));
               return usuario;
           }else{
               return null;
           }
        }catch(SQLException ex){
            System.out.println("ERROR EN CATCH DE LOGIN" + ex.toString());
            return null;
        }

    }

    public boolean validarCorreo(String correo){
        Conexion conexion = new Conexion();
        try{
            PreparedStatement statement = conexion.prepareStatement("SELECT * FROM usuarios WHERE correo = ? limit 1");
            statement.setString(1, correo);
            ResultSet result = statement.executeQuery();
            return result.next();
        }catch(SQLException se){
           System.out.println("ERROR en la consulta de correo " + se);
           return false;
        }finally{
            try{
                conexion.desconectar();
            }catch(Exception ex){
                System.out.println("Error al cerrar la conexion " + ex);
            }
        }
    }

    public ArrayList<Usuario> consultarAll(){
        Conexion conexion = new Conexion();
        try{
        ArrayList<Usuario> list = new ArrayList();
        PreparedStatement statement = conexion.prepareStatement("SELECT * FROM usuarios");
        ResultSet result = statement.executeQuery();

        while(result.next()){
            Usuario usuario = new Usuario();
            usuario.setNombre(result.getString("nombres"));
            usuario.setApellido(result.getString("apellidos"));
            usuario.setCorreo(result.getString("correo"));
            usuario.setRol(result.getString("rol"));
            usuario.setCedula(result.getString("cedula"));
            usuario.setId(result.getInt("id_usuario"));
            list.add(usuario);
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

    public Usuario consultar(int id){
        Conexion conexion = new Conexion();
        try{
            PreparedStatement statement = conexion.prepareStatement("SELECT * FROM usuarios WHERE id_usuario = ?");
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            if(result.next()){
                Usuario usuario = new Usuario();
                usuario.setNombre(result.getString("nombres"));
                usuario.setApellido(result.getString("apellidos"));
                usuario.setCorreo(result.getString("correo"));
                usuario.setRol(result.getString("rol"));
                usuario.setCedula(result.getString("cedula"));
                usuario.setClave(result.getString("clave"));
                usuario.setId(result.getInt("id_usuario"));
                return usuario;
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
    public int eliminar(String correo){
        Conexion conexion = new Conexion();
        int eliminado = 0;
        try{
        PreparedStatement statement = conexion.prepareStatement("DELETE FROM usuarios WHERE correo = ?");
        statement.setString(1, correo);
        eliminado = statement.executeUpdate();
        }catch(SQLException ex){
            System.out.println("ERROR SQL:" + ex);
        }catch(NullPointerException npe){
            System.out.println("Conexion nula" + npe.toString());
        }finally{
            try{
                conexion.desconectar();
            }catch(Exception ex){
                System.out.println("ERROR AL CERRA LA CONEXIÓN " + ex);
            }
        }
        return eliminado;
    }

    public int modificar(Usuario usuario){
        Conexion conexion = new Conexion();
        int modificado = 0;
        try{
        PreparedStatement statement = conexion.prepareStatement("UPDATE usuarios SET nombres = ?, apellidos = ?, cedula = ?, clave = ?, correo = ? WHERE id_usuario = ?");
        statement.setString(1, usuario.getNombre());
        statement.setString(2, usuario.getApellido());
        statement.setString(3, usuario.getCedula());
        statement.setString(4, usuario.getClave());
        statement.setString(5, usuario.getCorreo());
        statement.setInt(6, usuario.getId());
        modificado = statement.executeUpdate();
        }catch(SQLException ex){
            System.out.println("ERROR al modificar el usuario :" + ex);
        }catch(NullPointerException npe){
            System.out.println("Conexion nula" + npe.toString());
        }finally{
            try{
                conexion.desconectar();
            }catch(Exception ex){
                System.out.println("ERROR AL CERRA LA CONEXIÓN " + ex);
            }
        }
        return modificado;
    }

    public int eliminar(int id){
        Conexion conexion = new Conexion();
        int eliminado = 0;
        try{
        PreparedStatement statement = conexion.prepareStatement("DELETE FROM usuarios WHERE id_usuario = ?");
        statement.setInt(1, id);
        eliminado = statement.executeUpdate();
        }catch(SQLException ex){
            System.out.println("ERROR no se pudo eliminar el usuario: " + ex);
        }finally{
            try{
               conexion.desconectar();
            }catch(Exception ex){
                System.out.println("ERROR AL CERRAR LA CONEXIÓN" + ex);
            }
        }
        return eliminado;
    }

    public ArrayList<Usuario> consultarAllEmpleados(){
        Conexion conexion = new Conexion();
        try{
        ArrayList<Usuario> list = new ArrayList();
        PreparedStatement statement = conexion.prepareStatement("SELECT * FROM usuarios where rol = 'empleado' ");
        ResultSet result = statement.executeQuery();

        while(result.next()){
            Usuario usuario = new Usuario();
            usuario.setNombre(result.getString("nombres"));
            usuario.setApellido(result.getString("apellidos"));
            usuario.setCorreo(result.getString("correo"));
            usuario.setRol(result.getString("rol"));
            usuario.setCedula(result.getString("cedula"));
            usuario.setId(result.getInt("id_usuario"));
            list.add(usuario);
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

    public boolean validarClave(String clave){
        Conexion conexion = new Conexion();
        try{
            PreparedStatement statement = conexion.prepareStatement("SELECT * FROM usuarios WHERE clave = ? limit 1");
//            if(statement == null){
//                return false;
//            }
            statement.setString(1, clave);
            ResultSet result = statement.executeQuery();
            return result.next();
        }catch(SQLException se){
            System.out.println("Error en validar la clave: " + se);
        }catch(NullPointerException npe){
            System.out.println("Consulta de validar la clave nulla + " + npe);
        }finally{
            try{
                conexion.desconectar();
            }catch(Exception ex){
                System.out.println("Error al cerrar la conexion " + ex);
            }
        }
        return false;
    }

}
