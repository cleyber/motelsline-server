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
import motelsline.server.models.Servicios;
import motelsline.server.models.dao.DaoServicios;

/**
 *
 * @author MotelsLine
 */
public class ModificarServicioServlet extends HttpServlet {





    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DaoServicios dao = new DaoServicios();
        Servicios servicio = new Servicios();

        String nombre = request.getParameter("nombre");
        double precio = 0;
        if(!request.getParameter("precio").isEmpty()){
            precio = Double.parseDouble(request.getParameter("precio"));
        }
        String descripcion = request.getParameter("descripcion");
        int id = Integer.parseInt(request.getParameter("id"));

        if(!nombre.isEmpty() && precio > 0 && !descripcion.isEmpty() && id > 0){
            servicio.setNombre(nombre);
            servicio.setPrecio(precio);
            servicio.setDescripcion(descripcion);
            servicio.setId(id);
            int modificado = dao.modificar(servicio);
        }else{

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
