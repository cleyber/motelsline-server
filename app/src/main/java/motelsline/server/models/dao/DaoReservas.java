/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package motelsline.server.models.dao;

import java.sql.*;
import motelsline.server.models.Reservas;
import motelsline.server.models.Servicios;
import java.util.ArrayList;
import java.sql.Date;

import motelsline.server.models.Usuario;

/**
 *
 * @author Cleyber
 */
public class DaoReservas {

    public int insertar(Reservas reserva){
        Conexion conexion = new Conexion();
        int insertado = 0;
        if(conexion.transaccion()){
            PreparedStatement statement = conexion.prepareStatement("INSERT INTO reservas(id_habitacion, id_usuario, fecha, horas_extras, personas_extras) values (?,?,?,?,?)");
            try{
                statement.setInt(1, reserva.getHabitacion().getId());
                statement.setInt(2, reserva.getUsuario().getId());
                statement.setDate(3,reserva.getFecha());
                statement.setInt(4, reserva.getHorasExtras());
                statement.setInt(5, reserva.getPersonasExtras());
                insertado = statement.executeUpdate();
                PreparedStatement statement2 = conexion.prepareStatement("SELECT * FROM reservas ORDER BY id_reserva desc limit 1");
                ResultSet result = statement2.executeQuery();
                result.next();
                reserva.setId(result.getInt("id_reserva"));
                for(Servicios servicio : reserva.getServicios()){
                    PreparedStatement statement3 = conexion.prepareStatement("INSERT INTO reservas_x_servicios (id_servicio, id_reserva) values (?,?)");
                    statement3.setInt(1, servicio.getId());
                    statement3.setInt(2, reserva.getId());
                    statement3.executeUpdate();
                }
                conexion.guardarTrans();
            }catch(SQLException se){
                System.out.println("Error al insertar reserva: " + se);
                conexion.cancelarTrans();
            }
        }
        return insertado;
    }

    public ArrayList<Reservas> reservasUsuario(Usuario usuario) {
      Conexion conexion = new Conexion();
      DaoHabitaciones daoHabitacion = new DaoHabitaciones();
      ArrayList<Reservas> reservas = new ArrayList<Reservas>();
      try {
        PreparedStatement statement = conexion.prepareStatement("SELECT *FROM reservas WHERE id_usuario=?");
        statement.setInt(1, usuario.getId());
        ResultSet result = statement.executeQuery();
        while(result.next()) {
          Reservas reserva = new Reservas();
          reserva.setFecha(result.getDate("fecha"));
          reserva.setHorasExtras(result.getInt("horas_extras"));
          reserva.setPersonasExtras(result.getInt("personas_extras"));
          reserva.setHabitacion(daoHabitacion.consultar(result.getInt("id_habitacion")));
          reservas.add(reserva);
        }
      } catch(SQLException e) {
        System.out.println("Error en consultarAll reservas: " + e.toString());
      }
      return reservas;
    }

   /*public ArrayList<Reservas> consultarAll(){
      Conexion conexion = new Conexion();
      try{
         PreparedStatement statement = conexion.prepareStatement("SELECT * FROM reservas");
         ArrayList<Reservas> list = new ArrayList();
         ResultSet result = statement.executeQuery();
         while(result.next()){
            Reservas reserva = new Reservas();
            reserva.setFecha(result.getDate("fecha"));
            reserva.setHorasExtras(result.getInt("horas_extras"));
            reserva.setPersonasExtras(result.getInt("personas_extras"));
            list.add(reserva);
         }
         return list;
      }catch(SQLException se){
         System.out.println("Error consultado todas las reservas: " + se.toString());
         return null;
      }finally{
         try{
            conexion.desconectar();
         }catch(Exception ex){
            System.out.println("Error al desconectar la conexion: " + ex.toString());
         }
      }
   }*/

}
