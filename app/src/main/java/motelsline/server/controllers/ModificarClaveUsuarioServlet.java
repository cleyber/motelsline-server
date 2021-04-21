/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package motelsline.server.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import motelsline.server.models.Usuario;
import motelsline.server.models.dao.DaoUsuarios;
import motelsline.server.util.Hash;

/**
 *
 * @author MotelsLine
 */
public class ModificarClaveUsuarioServlet extends HttpServlet {

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

        String claveActual = request.getParameter("claveActual");
        String claveNueva = request.getParameter("claveNueva");
        String confirmar = request.getParameter("confirmar");
        int id = Integer.parseInt(request.getParameter("id"));

        DaoUsuarios dao = new DaoUsuarios();
        Usuario usuario = dao.consultar(id);
        if(!claveActual.isEmpty() && !claveNueva.isEmpty() && !confirmar.isEmpty()){
            try {
                if(usuario.getClave().equals(Hash.sha256(claveActual))){
                    if(claveNueva.equals(confirmar)){
                        usuario.setClave(Hash.sha256(claveNueva));

                        int modificado = dao.modificar(usuario);
                        if(modificado == 0){
                            response.setStatus(500);
                            response.getWriter().println("¡Error en el servidor!");
                        }
                    }else{
                        response.setStatus(400);
                        response.getWriter().println("Las claves deben coincidir");
                    }
                }else{
                    response.setStatus(400);
                    response.getWriter().println("La clave actual es incorrecta");
                }
            } catch (NoSuchAlgorithmException ex) {
                System.out.println("Error en sha-256: " + ex);
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
