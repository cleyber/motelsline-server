/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package motelsline.server.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
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
public class ModificarEmpleadoServlet extends HttpServlet {

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

        Usuario usuario = new Usuario();
        DaoUsuarios dao = new DaoUsuarios();

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String cedula = request.getParameter("cedula");
        String correo = request.getParameter("correo");
        String clave = request.getParameter("clave");
        String confClave = request.getParameter("confClave");

        if(!nombre.isEmpty() && !apellido.isEmpty() && !cedula.isEmpty() && !correo.isEmpty() && !clave.isEmpty() && !confClave.isEmpty()){
            if(dao.validarCorreo(correo)){
               if(clave.equals(confClave)){
                    usuario.setNombre(nombre);
                    usuario.setApellido(apellido);
                    usuario.setCedula(cedula);
                    usuario.setCorreo(correo);
                    try {
                        usuario.setClave(Hash.sha256(clave));
                    } catch (NoSuchAlgorithmException ex) {
                        System.out.println("Error en el hasheo: " + ex);
                    }
                    usuario.setRol(Usuario.EMPLEADO);
                    int modificar = dao.modificar(usuario);
                    if(modificar == 0){
                        response.setStatus(500);
                        response.getWriter().println("Error al modificar el usuario");
                    }
                }else{
                   response.setStatus(400);
                   response.getWriter().println("Las claves deben coincidir");
                }
            }else{
                response.setStatus(400);
                response.getWriter().println("El correo no existe");
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
