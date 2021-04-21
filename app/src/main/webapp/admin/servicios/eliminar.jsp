<%--
    Document   : eliminar
    Created on : 03-jul-2016, 20:22:57
    Author     : Cleyber
--%>
<%@page import="util.Routes"%>
<%@page import="models.Usuario"%>
<%
   if(session.getAttribute("usuario") == null) {
      response.sendRedirect(Routes.getUrl("login.jsp"));
   } else {
      Usuario usuario = (Usuario) session.getAttribute("usuario");
      if(!usuario.getRol().equals(Usuario.ADMINISTRADOR)) {
        response.sendRedirect(Routes.getUrl(""));
      }
   }
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
        <script src="<%=Routes.getUrl("js/Routes.js")%>" type="text/javascript"></script>
        <title>Eliminar Servicio</title>
        <script>
            $(document).ready(function(){
                $(".button-collapse").sideNav();
                $(".dropdown-button").dropdown();

                $('form').submit(function(evento) {
                 evento.preventDefault();
                });

                $("#aceptar").click(function(){
                    $.ajax({
                        url: Routes.getUrl("EliminarServicioServlet"),
                        method: "post",
                        data: {
                            nombre: $('#nombre').val()
                        },
                        success: function(response){
                            alert("Servicio eliminado");
                            $("#nombre").val("");
                        },
                        error: function(){
                            alert("¡Problema en el servidor!");
                            $("#nombre").val("");
                        }
                    });
                });
            });
        </script>
    </head>
    <body>
        <%@include file="../menu.jsp" %>
        <main>
            <section class="container">
                <h1 class="center-align">Eliminar servicio</h1>
                <article>
                    <h4 class="center-align">Para eliminar un servicio debe ingresar su nombre exacto.</h4>
                </article>
                <div class="row">
                    <form class="col m8 offset-m2 center-align" id="form-eliminar">
                        <div class="input-field">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="validate" name="nombre" id="nombre">
                        </div>
                        <div class="row">
                            <div class="col s6">
                                <button class="btn waves-effect btn-style" id="aceptar">Aceptar</button>
                            </div>
                            <div class="col s6">
                                <a href="/Servicios/admin" id="cancelar" class="btn red waves-effect btn-style">Cancelar</a>
                            </div>
                       </div>
                    </form>
                </div>
            </section>
        </main>
        <%@include file="../footer.jsp" %>
    </body>
</html>
