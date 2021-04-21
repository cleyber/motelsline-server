<%--
    Document   : index
    Created on : 15-jul-2016, 20:43:14
    Author     : Anderson Vélez
--%>
<%@page import="util.Routes"%>
<%@page import="models.Usuario"%>
<%@page import="models.dao.DaoHabitaciones"%>
<%@page import="models.Habitaciones"%>
<%@page import="models.Imagen"%>
<%@page import="models.Servicios"%>
<%@page import="models.dao.DaoServicios"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.dao.Conexion" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

   if(session.getAttribute("usuario") == null) {
     response.sendRedirect(Routes.getUrl("login.jsp"));
   } else {
     Usuario usuario = (Usuario) session.getAttribute("usuario");
     if(!usuario.getRol().equals(Usuario.ADMINISTRADOR)) {
       response.sendRedirect(Routes.getUrl(""));
     }
   }

    int id = Integer.parseInt(request.getParameter("id"));
    DaoHabitaciones dao = new DaoHabitaciones();
    Habitaciones habitacion = new Habitaciones();

    habitacion = dao.consultar(id);
%>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="<%=Routes.getUrl("css/materialize.min.css")%>" rel="stylesheet" type="text/css"/>
        <link href="<%=Routes.getUrl("css/style.css")%>" rel="stylesheet" type="text/css"/>
        <link href="<%=Routes.getUrl("css/font-awesome.min.css")%>" rel="stylesheet" type="text/css"/>
        <script src="<%=Routes.getUrl("js/jquery-3.0.0.min.js")%>" type="text/javascript"></script>
        <script src="<%=Routes.getUrl("js/materialize.min.js")%>" type="text/javascript"></script>
        <script src="<%=Routes.getUrl("js/sweetalert.min.js")%>" type="text/javascript"></script>
        <link href="<%=Routes.getUrl("css/sweetalert.css")%>" rel="stylesheet" type="text/css"/>
        <script src="<%=Routes.getUrl("js/Routes.js")%>" type="text/javascript"></script>

        <script>
            $(document).ready(function(){
                $(".button-collapse").sideNav();
                $(".dropdown-button").dropdown();
            });

            function eliminarImg(id){
                $.ajax({
                    url: Routes.getUrl("EliminarImagenHabitacionServlet"),
                    method: "post",
                    data: {
                        id: id
                    },
                    success: function(){
                       $("#" + id).remove();
                    }
                });
            }
        </script>
        <title>Subir Imagenes</title>
        <style>
            .imagenes img{
                display: inline-block;
                max-height: 150px;
            }

        </style>
    </head>
    <body>
        <%@include file="../menu.jsp" %>
        <main>
            <section class="container">
                <h1> Habitación: <%= habitacion.getNombre()%></h1>
                <form enctype="MULTIPART/FORM-DATA" method="post" action="<%=Routes.getUrl("subirImgHabitacion.jsp?id=")%><%=id%>">
                <div class="file-field input-field">
                <div class="btn">
                 <span>Imagén</span>
                 <input type="file" name="imagen" accept="image/*" multiple>
                </div>
                <div class="file-path-wrapper">
                 <input class="file-path validate" type="text">
                </div>
             </div>
                    <br>
                    <div class="btn waves-effect">
                        <input type="submit" value="guardar">
                    </div>
                </form>

                <div class="row">
                    <%
                        if(habitacion.getImagenes().size() > 0){
                            for(Imagen imagen : habitacion.getImagenes()){
                    %>
                    <div class="col s12 m4">
                        <div class="card" id="<%= imagen.getId()%>">
                            <div class="card-image">
                                <img src="<%=Routes.getUrl("imgServidor/")%><%=imagen.getNombre()%>">
                            </div>
                            <div class="card-action center-align">
                                <a href="#" class="red-text " onclick="eliminarImg(<%=imagen.getId()%>)"><i class="fa fa-trash fa-3x "></i></a>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }else{
                    %>
                    <div>
                        <img src="<%=Routes.getUrl("img/notImg.png")%>">
                    </div>
                    <%
                        }
                    %>
                </div>
            </section>
        </main>
    </body>
</html>
