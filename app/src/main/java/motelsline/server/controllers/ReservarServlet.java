/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package motelsline.server.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.*;

import motelsline.server.models.Reservas;
import motelsline.server.models.dao.DaoReservas;
import motelsline.server.models.dao.DaoServicios;
import motelsline.server.models.dao.DaoUsuarios;
import motelsline.server.models.dao.DaoHabitaciones;

/**
 *
 * @author MotelsLine
 */
public class ReservarServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      DaoServicios daoServicios = new DaoServicios();
      DaoReservas daoReservas = new DaoReservas();
      DaoUsuarios daoUsuarios = new DaoUsuarios();
      DaoHabitaciones daoHabitaciones = new DaoHabitaciones();

      Reservas reserva = new Reservas();

      int idHabitacion = Integer.parseInt(request.getParameter("habitacion"));
      String fecha = request.getParameter("fecha");
      String minutos = request.getParameter("minutos");
      int horasExtras = Integer.parseInt(request.getParameter("horasExtras"));
      int personas = Integer.parseInt(request.getParameter("personas"));
      String hora = request.getParameter("hora");
      String meridiano = request.getParameter("meridiano");
      int idUsuario = Integer.parseInt(request.getParameter("usuario"));
      JSONArray idServicios = new JSONArray(request.getParameter("servicios"));

      reserva.setPersonasExtras(personas);
      reserva.setHorasExtras(horasExtras);
      reserva.setUsuario(daoUsuarios.consultar(idUsuario));
      reserva.setFecha(parseDate(fecha));
      reserva.setHabitacion(daoHabitaciones.consultar(idHabitacion));
      for(Object idServicio : idServicios) {
        int id = Integer.parseInt(idServicio.toString());
        reserva.addServicios(daoServicios.consultar(id));
      }

      int insertados = daoReservas.insertar(reserva);

      if(insertados > 0) {
        response.getWriter().println("Se ha generado la reserva correctamenre");
      } else {
        response.getWriter().println("Error al generar la reserva");
      }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private Date parseDate(String fecha) {
      try {
        SimpleDateFormat format = new SimpleDateFormat("yyy-MM-dd");
        java.util.Date date = format.parse(fecha);

        return new Date(date.getTime());
      } catch(Exception e) {
        return null;
      }
    }

}
