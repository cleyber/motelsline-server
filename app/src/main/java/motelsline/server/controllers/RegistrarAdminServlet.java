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
import motelsline.server.models.Motel;
import motelsline.server.models.Usuario;
import motelsline.server.models.dao.DaoMotel;
import motelsline.server.models.dao.DaoUsuarios;
import org.json.*;
import motelsline.server.util.Hash;

/**
 *
 * @author MotelsLine
 */
public class RegistrarAdminServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

           JSONObject adminJson = new JSONObject(request.getParameter("admin"));
           JSONObject motelJson = new JSONObject(request.getParameter("motel"));

           Usuario admin = new Usuario();
           Motel motel = new Motel();

           motel.setNombre(motelJson.getString("nombre"));
           motel.setDireccion(motelJson.getString("direccion"));
           motel.setCorreo(motelJson.getString("correo"));
           motel.setTelefono(motelJson.getString("telefono"));

            String clave = adminJson.getString("clave");
            String confirmar = adminJson.getString("confirmar");
            admin.setNombre(adminJson.getString("nombre"));
            admin.setApellido(adminJson.getString("apellido"));
            admin.setCedula(adminJson.getString("cedula"));
            admin.setCorreo(adminJson.getString("correo"));
            admin.setRol(Usuario.ADMINISTRADOR);
           System.out.println("asfsadasf" + motelJson.toString());

           if(!clave.isEmpty() && !confirmar.isEmpty() && !admin.getNombre().isEmpty() && !admin.getApellido().isEmpty() &&
                   !admin.getCedula().isEmpty() && !admin.getCorreo().isEmpty() && !motel.getNombre().isEmpty() && !motel.getDireccion().isEmpty() &&
                   !motel.getCorreo().isEmpty() && !motel.getTelefono().isEmpty()){

                DaoMotel daoMotel = new DaoMotel();
                int guardado = daoMotel.registrar(motel);
                if(guardado == 00){
                    response.setStatus(500);
                    response.getWriter().println("Error en el servidor");
                }else{
                    if(clave.equals(confirmar)){
                        try {
                            admin.setClave(Hash.sha256(clave));
                        } catch (NoSuchAlgorithmException ex) {
                            System.out.println("Error en Hash");
                        }
                        DaoUsuarios daoUser = new DaoUsuarios();
                        int insertado = daoUser.insertar(admin);
                        if(insertado == 0){
                            response.setStatus(500);
                            response.getWriter().println("Error en el servidor");
                        }
                   }else{
                       response.setStatus(400);
                       response.getWriter().println("Error en clave");
                   }

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
