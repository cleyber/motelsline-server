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
import motelsline.server.models.Servicios;
import motelsline.server.models.dao.DaoServicios;


/**
 *
 * @author MotelsLine
 */
public class RegistrarServicioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        double precio = 0;
        Servicios servicio = new Servicios();
        DaoServicios dao = new DaoServicios();
        String nombre = request.getParameter("nombre");
        if(!request.getParameter("precio").isEmpty()){
            precio = Double.parseDouble(request.getParameter("precio"));
        }
        String descripcion = request.getParameter("descripcion");

        if(!nombre.isEmpty() && precio > 0 && !descripcion.isEmpty()){
            servicio.setNombre(nombre);
            servicio.setPrecio(precio);
            servicio.setDescripcion(descripcion);
            int id = dao.insertar(servicio);
            if(id == 0){
                response.setStatus(500);
                response.getWriter().println("No se registro el servicio");
            }else{
                response.getWriter().print(id);
            }
        }else{
            response.setStatus(400);
            response.getWriter().println("Todos los campos son obligatorios");
        }



    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
