<%--
    Document   : modifPerfil
    Created on : 30-ago-2016, 22:18:32
    Author     : Cleyber
--%>
<%@page import="util.Routes"%>
<%@page import="models.dao.DaoUsuarios"%>
<%@page import="models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario usuario = new Usuario();

    if(session.getAttribute("usuario") == null) {
        response.sendRedirect(Routes.getUrl("login.jsp"));
    } else {
        usuario = (Usuario) session.getAttribute("usuario");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="<%=Routes.getUrl("css/materialize.min.css")%>" rel="stylesheet" type="text/css"/>
        <link href="<%=Routes.getUrl("css/style.css")%>" rel="stylesheet" type="text/css"/>
        <script src="<%=Routes.getUrl("js/jquery-3.0.0.min.js")%>" type="text/javascript"></script>
        <script src="<%=Routes.getUrl("js/materialize.min.js")%>" type="text/javascript"></script>
        <link href="<%=Routes.getUrl("css/sweetalert.css")%>" rel="stylesheet" type="text/css"/>
        <script src="<%=Routes.getUrl("js/sweetalert.min.js")%>" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                $(".button-collapse").sideNav();
                $('ul.tabs').tabs();
                $('form').submit(function(evento) {
                    evento.preventDefault();
                });

                $("#guardarDatos").click(function(){
                    $.ajax({
                       url: "ModificarUsuarioServlet",
                       method: "post",
                       data: {
                           nombre: $("#nombre").val(),
                           apellido: $("#apellido").val(),
                           cedula: $("#cedula").val(),
                           correo: $("#correo").val(),
                           id: <%=usuario.getId()%>
                       },
                       success: function(response){
                           swal("Registro","Datos de usuario modificados correctamente","success");
                           $("#nombre").val("");
                            $("#apellido").val("");
                            $("#cedula").val("");
                            $('#correo').val("");
                       },
                       error: function(respuesta) {
                           swal("Error", respuesta.responseText, "error");
                       }
                    });
                });

                $("#guardarClave").click(function(){
                    $.ajax({
                       url: "ModificarClaveUsuarioServlet",
                       method: "post",
                       data: {
                           claveActual: $("#claveActual").val(),
                           claveNueva: $("#claveNueva").val(),
                           confirmar: $("#confirmar").val(),
                           id: <%=usuario.getId()%>
                       },
                        success: function(){
                            swal("Modificado", "Clave modificada correctamente", "success");
                            $("#claveActual").val("");
                            $("#claveNueva").val("");
                            $("#confirmar").val("");
                        },
                        error: function(respuesta){
                            swal("Error", respuesta.responseText, "error");
                        }
                    });
                });

                $("#eliminarCuenta").click(function(){
                    swal({
                        title: "Eliminar",
                        text: "¿Esta seguro que desea eliminar la cuenta?",
                        type: "warning",
                        allowOutsideClick: true,
                        showCancelButton: true,
                        confirmButtonText: "Eliminar",
                        confirmButtonColor: "#f44336",
                        cancelButtonText: "Cancelar",
                        closeOnConfirm: false,
                        showLoaderOnConfirm: true
                   }, function(){
                       $.ajax({
                            url: "EliminarUsuarioServlet",
                            method: "post",
                            data: {
                                id: <%=usuario.getId()%>
                            },
                            success: function(){
                                swal("Eliminado", "Usuario eliminado", "success");
                                window.location = "/MotelsLine/index.jsp";
                            },
                            error: function(respuesta){
                                swal("Error", respuesta.responseText, "error");
                            }
                       });

                    });
                });
            });
        </script>
        <title>Modificar Perfil</title>
    </head>
    <body>
        <%@include file="usuario/menuUser.jsp" %>
        <main>
            <section class="container">
                <div class="row">
                    <h1 class="center-align">Modificar Perfil</h1>
                    <div class="col s12">
                        <ul class="tabs">
                            <li class="tab col s4"><a href="#datos">Datos Personales</a></li>
                            <li class="tab col s4"><a href="#claves">Clave</a></li>
                            <li class="tab col s4"><a href="#cuenta">Eliminar cuenta</a></li>
                        </ul>
                    </div>
                    <div id="datos" class="col m8 offset-m2 center-align">
                        <form>
                            <div class="input-field">
                                <label for="nombre">Nombre</label>
                                <input type="text" name="nombre" id="nombre" value="<%=usuario.getNombre()%>">
                            </div>
                            <div class="input-field">
                                <label for="apellido">Apellido</label>
                                <input type="text" name="apellido" id="apellido" value="<%=usuario.getApellido()%>">
                            </div>
                            <div class="input-field">
                                <label for="cedula">Cedula</label>
                                <input type="number" name="cedula" id="cedula" value="<%=usuario.getCedula()%>">
                            </div>
                            <div class="input-field">
                                <label for="correo">Correo</label>
                                <input type="email" name="correo" id="correo" value="<%=usuario.getCorreo()%>">
                            </div>
                        </form>
                        <div class="row">
                            <div class="col s6">
                                <button class="btn waves-effect btn-empl" id="guardarDatos">Guardar</button>
                            </div>
                            <div class="col s6">
                                <a href="index.jsp" id="cancelar" class="btn red waves-effect btn-empl">Cancelar</a>
                            </div>
                        </div>
                    </div>
                    <div id="claves" class="col m8 offset-m2 center-align">
                        <form>
                            <div class="input-field">
                                <label for="claveActual">Clave Actual</label>
                                <input type="password" id="claveActual" required class="validate">
                            </div>
                            <div class="input-field">
                                <label for="claveNueva">Clave Nueva</label>
                                <input type="password" id="claveNueva" class="validate" required>
                            </div>
                            <div class="input-field">
                                <label for="confirmar">Confirmar Clave</label>
                                <input type="password" id="confirmar" class="validate" required>
                            </div>
                        </form>
                        <div class="row">
                            <div class="col s6">
                                <button class="btn waves-effect btn-empl" id="guardarClave" type="button">Guardar</button>
                            </div>
                            <div class="col s6">
                                <a href="index.jsp" id="cancelar" class="btn red waves-effect btn-empl">Cancelar</a>
                            </div>
                        </div>
                    </div>
                    <div id="cuenta">
                        <div class="row">
                           <h3 class="center-align">Eliminar cuenta</h3><br>
                           <h5>Se eliminará su perfil, registro de reservas, reservar en curso</h5>
                        </div>
                        <div class="row">
                            <div class="center-align">
                                <div style="margin-top: 10%">
                                    <button class="btn large red darken-2 waves-effect btn-empl" id="eliminarCuenta" type="button">Eliminar cuenta</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </body>
</html>
