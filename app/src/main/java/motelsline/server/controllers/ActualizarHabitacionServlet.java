/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package motelsline.server.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import motelsline.server.models.Habitaciones;
import motelsline.server.models.dao.DaoHabitaciones;

/**
 *
 * @author MotelsLine
 */
public class ActualizarHabitacionServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DaoHabitaciones dao = new DaoHabitaciones();
        Habitaciones habitacion = new Habitaciones();

        String nombre = request.getParameter("nombre");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        double precio = 0;
        double horaAdicional = 0;
        double personaAdicional = 0;
        if(!request.getParameter("precio").isEmpty()){
            precio = Double.parseDouble(request.getParameter("precio"));
        }
        if(!request.getParameter("horaAdicional").isEmpty()){
            horaAdicional = Double.parseDouble(request.getParameter("horaAdicional"));
        }
        if(!request.getParameter("personaAdicional").isEmpty()){
            personaAdicional = Double.parseDouble(request.getParameter("personaAdicional"));
        }
        String descripcion = request.getParameter("descripcion");
        int cantidadHoras = Integer.parseInt(request.getParameter("cantidadHoras"));
        int id = Integer.parseInt(request.getParameter("id"));

        if(!nombre.isEmpty() && cantidad > 0 && !descripcion.isEmpty() && precio > 0 && cantidadHoras > 0 && horaAdicional > 0 && personaAdicional > 0 && id > 0){
            habitacion.setNombre(nombre);
            habitacion.setCantidad(cantidad);
            habitacion.setDescripcion(descripcion);
            habitacion.setPrecio(precio);
            habitacion.setCantidadHoras(cantidadHoras);
            habitacion.setHoraAdicional(precio);
            habitacion.setPersonaAdicional(personaAdicional);
            habitacion.setId(id);
            int modificado = dao.modificar(habitacion);
            if(modificado == 0){
               response.setStatus(500);
               response.getWriter().println("Error: no se ha podido modificar la habitación");
            }
        }else{
            response.setStatus(400);
            response.getWriter().println("Todos los campos son obligatorios");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
