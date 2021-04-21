<%--
    Document   : serviciosAdmin
    Created on : 16-jun-2016, 7:53:03
    Author     : APRENDIZ
--%>
<%@page import="util.Routes"%>
<%@page import="models.Usuario"%>
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
%>
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
                $(".button-collapse").sideNav();
                $(".dropdown-button").dropdown();

                $('form').submit(function(evento) {
                 evento.preventDefault();
                });

                $("#guardar").click(function(){
                    $.ajax({
                        url: Routes.getUrl("RegistrarServicioServlet"),
                        method: "post",
                        data: {
                            nombre: $('#nombre').val(),
                            precio: $('#precio').val(),
                            descripcion: $('#descripcion').val()
                        },
                        success: function(id){
                            swal({
                               title: "Registro",
                               text: "El servicio se ha registrado correctamente",
                               type: "success"
                            },
                                function(){
                                    window.location = Routes.getUrl("admin/servicios/imagenes.jsp?imagen=" + id);
                                }
                            );

                        },
                        error: function(respuesta){
                            sweetAlert("Error", respuesta.responseText, "error");
                        }
                    });
                });
            });
        </script>
        <title>Registrar Servicio</title>
    </head>
    <body>
        <%@include file="../menu.jsp" %>
        <main>
            <section class="container">
                <h1 class="center-align">Registrar servicio</h1>
                    <div class="row">

                        <form class="col m8 offset-m2 center-align">
                            <div class="input-field">
                                <label for="nombre">Nombre</label>
                                <input type="text" name="nombre" id="nombre">
                            </div>
                            <div class="input-field">
                                <label for="precio">Precio</label>
                                <input type="number" id="precio" name="precio">
                            </div>
                            <div class="input-field">
                                <label for="descripcion">Descripción</label>
                                <textarea id="descripcion" class="materialize-textarea"></textarea>
                            </div>
                            <div class="row">
                                <div class="col s6">
                                    <button class="btn waves-effect" id="guardar">Guardar</button>
                                </div>
                                <div class="col s6">
                                    <a href="/MotelsLineV1/admin" id="cancelar" class="btn red waves-effect">Cancelar</a>
                                </div>
                            </div>
                        </form>
                    </div>
            </section>
        </main>
        <%@include file="../footer.jsp" %>
    </body>
</html>
