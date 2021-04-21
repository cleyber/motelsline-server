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
import motelsline.server.models.dao.DaoHabitaciones;

/**
 *
 * @author MotelsLine
 */
public class EliminarHabitacionServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       DaoHabitaciones dao = new DaoHabitaciones();

        int id = Integer.parseInt(request.getParameter("id"));
        int eliminado = dao.eliminar(id);
        if(eliminado == 0){
            response.setStatus(500);
            response.getWriter().println("No se ha podido eliminar la habitacion");
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
