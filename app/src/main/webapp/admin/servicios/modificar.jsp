<%--
    Document   : modificar
    Created on : 02-jul-2016, 18:36:38
    Author     : Cleyber
--%>
<%@page import="util.Routes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Usuario"%>
<%@page import="models.Servicios"%>
<%@page import="models.dao.DaoServicios"%>
<%
   if(session.getAttribute("usuario") == null) {
      response.sendRedirect(Routes.getUrl("login.jsp"));
   } else {
      Usuario usuario = (Usuario) session.getAttribute("usuario");
      if(!usuario.getRol().equals(Usuario.ADMINISTRADOR)) {
        response.sendRedirect(Routes.getUrl(""));
      }
   }

    int id = Integer.parseInt(request.getParameter("servicio"));
    DaoServicios dao = new DaoServicios();
    Servicios servicio =  dao.consultar(id);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
                $(".menu-modificar").addClass("active");
                $(".button-collapse").sideNav();
                $(".dropdown-button").dropdown();

                $('form').submit(function(evento) {
                 evento.preventDefault();
                });


                $("#guardar").click(function(){
                    $.ajax({
                        url: Routes.getUrl("ModificarServicioServlet"),
                        method: "post",
                        data: {
                            nombre: $('#nombre').val(),
                            precio: $('#precio').val(),
                            descripcion: $('#descripcion').val(),
                            id: <%=id%>
                        },
                        success: function(response){
                            swal("Modificado", "Se actualizo!", "success");
                            $("#nombre").val("");
                            $("#precio").val("");
                            $("#descripcion").val("");
                        },
                        error: function(){
                            swal("Error", "No se pudo eliminar el servicio", "error");
                            $("#nombre").val("");
                            $("#precio").val("");
                            $("#descripcion").val("");
                        }
                    });
                });
            });
        </script>
        <title>Modificar Servicio</title>
    </head>
    <body>
        <%@include file="../menu.jsp" %>
        <main>
            <section class="container">
                <h1 class="center-align">Modificar servicio</h1>
                    <div class="row">

                        <form class="col m8 offset-m2 center-align">
                            <div class="input-field">
                                <label for="nombre">Nombre</label>
                                <input type="text" name="nombre" id="nombre" value="<%= servicio.getNombre()%>">
                            </div>
                            <div class="input-field">
                                <label for="precio">Precio</label>
                                <input type="number" id="precio" name="precio" value="<%= servicio.getPrecio()%>">
                            </div>
                            <div class="input-field">
                                <label for="descripcion">Descripción</label>
                                <textarea id="descripcion" class="materialize-textarea"><%= servicio.getNombre()%></textarea>
                            </div>
                            <div class="row">
                                <div class="col m4">
                                    <a href="<%=Routes.getUrl("admin/servicios/imagenes.jsp?imagen=")%><%=id%>" class="btn waves-effect blue">Imágenes</a>
                                </div>
                                <div class="col m4">
                                    <button class="btn waves-effect" id="guardar">Guardar</button>
                                </div>
                                <div class="col m4">
                                    <a href="/MotelsLine/admin" id="cancelar" class="btn red waves-effect">Cancelar</a>
                                </div>
                            </div>


                        </form>
                    </div>
            </section>
        </main>
        <%@include file="../footer.jsp" %>
    </body>
</html>
