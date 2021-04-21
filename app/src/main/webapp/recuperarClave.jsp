<%--
    Document   : recuperarClave
    Created on : 30-ago-2016, 22:20:25
    Author     : Cleyber
--%>
<%@page import="util.Routes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="<%=Routes.getUrl("css/style.css")%>" rel="stylesheet" type="text/css"/>
        <link href="<%=Routes.getUrl("css/materialize.min.css")%>" rel="stylesheet" type="text/css"/>
        <script src="<%=Routes.getUrl("js/jquery-3.0.0.min.js")%>" type="text/javascript"></script>
        <script src="<%=Routes.getUrl("js/materialize.min.js")%>" type="text/javascript"></script>
        <script src="<%=Routes.getUrl("js/sweetalert.min.js")%>" type="text/javascript"></script>
        <link href="<%=Routes.getUrl("css/sweetalert.css")%>" rel="stylesheet" type="text/css"/>
        <link href="<%=Routes.getUrl("css/font-awesome.min.css")%>" rel="stylesheet" type="text/css"/>
        <script src="<%=Routes.getUrl("js/Routes.js")%>" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
               $(".button-collapse").sideNav();
               
               $('#aceptar').click(function(){
                  $.ajax({
                     url: Routes.getUrl("RecuperarClaveServlet"),
                     method: 'post',
                     data: {
                        correo : $('#correo').val()
                     },
                     success: function(){
                        swal('Recuperación',' Mensaje de lo que sea', 'success');
                     },
                     error: function(respuesta) {
                        swal('Error', respuesta.responseText, 'error');
                     }
                  });
               });
            });

        </script>
        <title>Recuprar clave</title>
    </head>
    <body>
        <main>
           <%@include file="usuario/menuUser.jsp" %>
           <section class="container">
             <div class="center-align" id="fa-key">
                <i class="fa fa-key fa-5x"></i>
             </div>
             <div class="">
                <h5 class="center-align" id="olvidado">Si usted a olvidado su clave, por favor ingrese su correo</h5>
             </div>
             <form class="">
                <div class="row">
                   <div class="col s12 col m8 offset-m2">
                      <div class="center-align">
                        <div class="input-field">
                           <label for="correo">Correo</label>
                           <input type="email" id="correo" name="correo">
                        </div>
                      </div>
                   </div>
                </div>
                <div class="center-align" id="olvidado">
                   <button type="button" id="aceptar" class="btn waves-effect blue">Aceptar</button>
                </div>
            </form>
            <div class="center-align" id="olvidado2">
               <h6>En breve resivirá un correo para su postura recuperación</h6>
            </div>
           </section>
        </main>
        <%@include file="admin/footer.jsp" %>
    </body>
</html>
