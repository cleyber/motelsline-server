<%@page import="util.Routes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <link href="<%=Routes.getUrl("css/materialize.min.css")%>" rel="stylesheet" type="text/css"/>
      <link href="<%=Routes.getUrl("css/style.css")%>" rel="stylesheet" type="text/css"/>
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <script src="<%=Routes.getUrl("js/jquery-3.0.0.min.js")%>" type="text/javascript"></script>
      <script src="<%=Routes.getUrl("js/materialize.min.js")%>" type="text/javascript"></script>
      <script>
          $(document).ready(function(){
             $(".button-collapse").sideNav();
             $(".dropdown-button").dropdown();
          });
      </script>
      <title>Ingresar</title>
   </head>
   <body >
      <main>
         <%@include file="usuario/menuUser.jsp" %>
         <section class="container">
            <div class="row">
               <div class="col s12 col m8 offset-m2">
                  <div class="card" id="targeta">
                     <div class="card-content">
                        <%-- <div class="row"> --%>
                           <%-- <div class="col m12 s12"> --%>
                              <div class="center-align">
                                 <h4>Ingresar a MotelsLine</h4>
                              </div>
                              <h6 id="pregunta" class="center-align"><a href="<%=Routes.getUrl("registrar.jsp")%>">¿No tienes una cuenta? Registrate</a></h6>
                              <form action="LoginServlet" method="post">
                                 <div class="input-field">
                                    <label for="correo">Correo</label>
                                    <input type="email" id="correo" name="correo">
                                    </div>
                                 <div class="input-field">
                                    <label for="clave">Clave</label>
                                    <input type="password" id="clave" name="clave">
                                 </div>
                                 <div class="right-align" id="claveOlvidada">
                                    <a href="<%=Routes.getUrl("recuperarClave.jsp")%>">¿Olvidaste tu clave?</a>
                                 </div>
                                 <div class="center-align">
                                    <button class="btn waves-effect waves-light" id="guaradar" type="submit" name="action">iniciar sesion</button>
                                 </div>
                                 </form>
                              <%-- </div> --%>
                           <%-- </div> --%>
                     </div>
                  </div>
               </div>
            </div>
         </section>
      </main>
      <%@include file="admin/footer.jsp" %>
   </body>
</html>
