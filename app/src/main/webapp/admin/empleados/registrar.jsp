<%--
    Document   : registrar
    Created on : 05-jul-2016, 23:43:13
    Author     : Cleyber
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
                        url: Routes.getUrl("RegistrarEmpleadoServlet"),
                        method: "post",
                        data: {
                            nombre: $('#nombre').val(),
                            apellido: $('#apellido').val(),
                            cedula: $('#cedula').val(),
                            correo: $('#correo').val(),
                            clave: $('#clave').val(),
                            confClave: $('#confClave').val()
                        },
                        success: function(response){
                            swal("Registro","¡Usuario registrado correctamente", "success");
                            $("#nombre").val("");
                            $("#apellido").val("");
                            $("#cedula").val("");
                            $('#correo').val("");
                            $('#clave').val("");
                            $('#confClave').val("");
                        },
                        error: function(respuesta){
                            swal("Error",respuesta.responseText, "error");
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
                <h1 class="center-align">Registrar empleado</h1>
                    <div class="row">

                        <form class="col m8 offset-m2 center-align">
                            <div class="input-field">
                                <label for="nombre">Nombre</label>
                                <input type="text" name="nombre" id="nombre" required>
                            </div>
                            <div class="input-field">
                                <label for="apellido">Apellido</label>
                                <input type="text" id="apellido" name="apellido" required>
                            </div>
                             <div class="input-field">
                                <label for="cedula">Cedula</label>
                                <input type="number" id="cedula" name="cedula" required>
                            </div>
                            <div class="input-field">
                                <label for="correo">Correo</label>
                                <input type="email" id="correo" name="correo" required>
                            </div>
                            <div class="input-field">
                                <label for="clave">Clave</label>
                                <input type="password" id="clave" name="clave" required>
                            </div>
                            <div class="input-field">
                                <label for="confClave">Confirmar clave</label>
                                <input type="password" id="confClave" name="confClave" required>
                            </div>
                            <div class="row">
                                <div class="col s6">
                                    <button class="btn waves-effect btn-empl" id="guardar">Guardar</button>
                                </div>
                                <div class="col s6">
                                    <a href="/Servicios/admin" id="cancelar" class="btn red waves-effect btn-empl">Cancelar</a>
                                </div>
                            </div>
                        </form>
                    </div>
            </section>
        </main>
        <%@include file="../footer.jsp" %>
    </body>
</html>
