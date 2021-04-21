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
    <title>contactanos</title>
  </head>
  <body>
<main>
   <%@include file="usuario/menuUser.jsp" %>
    <section class="container">
      <br><br>
    <div class="row">
      <div class="col s12 m8 offset-m2">
        <div class="card-panel white">
            <div class="row">
              <div class="center-align">
                <h4>Contáctenos</h4>
              </div>
              <form class="col s12">
                  <div class="input-field col s12">
                    <input id="nombre" type="text" class="validate">
                    <label for="nombre">Nombre</label>
                  </div>
                  <div class="input-field col s12">
                    <input id="email" type="email" class="validate">
                    <label for="email">Correo</label>
                  </div>
                  <div class="input-field col s12">
                    <input id="assunto" type="text" class="validate">
                    <label for="asunto">Asunto</label>
                  </div>
                  <div class="input-field col s12">
                    <textarea id="mensaje" class="materialize-textarea"></textarea>
                    <label for="mensaje">Mensaje</label>
                  </div>
                <div class="center-align">
                  <button class="btn waves-effect waves-light" type="submit" name="action">Enviar</button>
                </div>
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
