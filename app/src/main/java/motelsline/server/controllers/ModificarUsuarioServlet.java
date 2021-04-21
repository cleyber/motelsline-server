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
import motelsline.server.models.Usuario;
import motelsline.server.models.dao.DaoUsuarios;

/**
 *
 * @author MotelsLine
 */
public class ModificarUsuarioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {


        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String cedula = request.getParameter("cedula");
        String correo = request.getParameter("correo");
        int id = Integer.parseInt(request.getParameter("id"));


        DaoUsuarios dao = new DaoUsuarios();
        Usuario usuario = dao.consultar(id);

        usuario.setNombre(nombre);
        usuario.setApellido(apellido);
        usuario.setCedula(cedula);
        usuario.setCorreo(correo);

        int modificado = dao.modificar(usuario);
        if(modificado == 0){
            response.setStatus(500);
            response.getWriter().println("Error en el servidor!");
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
