/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package motelsline.server.controllers;

import java.io.IOException;
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
public class RegistrarHabitacionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double precio = 0;
        double horaAdicional = 0;
        double personaAdicional = 0;
        Habitaciones habitacion = new Habitaciones();
        DaoHabitaciones dao = new DaoHabitaciones();

        String nombre = request.getParameter("nombre");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));

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
        if(!dao.validarNHabitacion(cantidad)){
        if(!nombre.isEmpty() && cantidad > 0 && !descripcion.isEmpty() && precio > 0 && cantidadHoras > 0 && horaAdicional > 0 && personaAdicional > 0){
            habitacion.setNombre(nombre);
            habitacion.setCantidad(cantidad);
            habitacion.setDescripcion(descripcion);
            habitacion.setPrecio(precio);
            habitacion.setCantidadHoras(cantidadHoras);
            habitacion.setHoraAdicional(horaAdicional);
            habitacion.setPersonaAdicional(personaAdicional);

            int id = dao.insertar(habitacion);
            if(id == 0){
                response.setStatus(500);
                response.getWriter().println("No se registro la habitacion");
            }else{
                response.getWriter().print(id);
            }
        }else{
            response.setStatus(400);
            response.getWriter().println("Todos los campos son obligatorios");
        }
        }else{
            response.setStatus(400);
            response.getWriter().println("Este número ya cuenta con una habitación");
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
