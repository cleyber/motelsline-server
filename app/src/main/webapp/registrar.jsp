<%--
    Document   : RegistrarU
    Created on : 14-ago-2016, 2:23:11
    Author     : Cleyber
--%>
<%@page import="util.Routes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
             $('form').submit(function(evento) {
               evento.preventDefault();
             });

             $("#guardar").click(function(){
                  $.ajax({
                     url: "RegistrarUsuarioServlet",
                     method: "post",
                     data: {
                         nombre: $("#nombre").val(),
                         apellido: $("#apellido").val(),
                         cedula: $("#cedula").val(),
                         correo: $("#correo").val(),
                         clave: $("#clave").val(),
                         confirmar: $("#cclave").val()
                     },
                     success: function(response){
                         swal("Registro","Usuario registrado correctamente","success");
                         $("#nombre").val("");
                          $("#apellido").val("");
                          $("#cedula").val("");
                          $('#correo').val("");
                          $('#clave').val("");
                          $('#cclave').val("");
                     },
                     error: function(respuesta) {
                         swal("Error", respuesta.responseText, "error");
                     }
                  });
             });
          });
      </script>
      <title>Registrarse</title>
   </head>
   <body>
      <main>
         <%@include file="usuario/menuUser.jsp" %>
         <section class="container">
            <div class="row">
               <div class="col s12 col m8 offset-m2">
                  <div class="card" id="targeta_registrar">
                     <div class="card-content">
                        <div class="center-align">
                            <h4>Regístrate</h4>
                        </div>
                        <form>
                            <div class="input-field">
                                <label for="nombre">Nombre</label>
                                <input type="text" id="nombre">
                            </div>
                            <div class="input-field">
                                <label for="apellido">Apellido</label>
                                <input type="text" id="apellido">
                            </div>
                            <div class="input-field">
                                <label for="cedula">Cedula</label>
                                <input type="number" id="cedula">
                            </div>
                            <div class="input-field">
                                <label for="correo">Correo</label>
                                <input type="email" id="correo">
                            </div>
                            <div class="input-field">
                                <label for="clave">Clave</label>
                                <input type="password" id="clave">
                            </div>
                            <div class="input-field">
                                <label for="cclave">Confirmar clave</label>
                                <input type="password" id="cclave">
                            </div>
                            <div class="center-align">
                                <button class="btn waves-effect waves-light" id="guardar">Registrarse</button>
                            </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </section>
      </main>
      <%@include file="admin/footer.jsp" %>
   </body>
</html>
