<%@page import="util.Routes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
     <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     <link href="<%=Routes.getUrl("css/materialize.min.css")%>" rel="stylesheet" type="text/css"/>
     <link href="<%=Routes.getUrl("css/font-awesome.min.css")%>" rel="stylesheet" type="text/css"/>
     <link href="<%=Routes.getUrl("css/style.css")%>" rel="stylesheet" type="text/css"/>
     <script src="<%=Routes.getUrl("js/jquery-3.0.0.min.js")%>" type="text/javascript"></script>
     <script src="<%=Routes.getUrl("js/materialize.min.js")%>" type="text/javascript"></script>
     <script>
         $(document).ready(function(){
            $(".button-collapse").sideNav();
            $(".dropdown-button").dropdown();
         });
     </script>

    <title>Acerca de</title>
  </head>
  <body>
     <main>
        <%@include file="usuario/menuUser.jsp" %>
        <section class="container">
           <h1>Acerca de MotelsLine</h1>
           <div class="row">
             <div class="col m6 s12">
                <div class="card">
                   <div class="card-content">
                      <h5>¿Quiénes somos?</h5>
                      <p>
                        Somos Una empresa joven y dinámica que entiende la creación de contenidos de calidad como el fundamento del futuro de Internet.
                      </p>
                   </div>
                </div>
             </div>
             <div class="col m6 s12">
                <div class="card">
                   <div class="card-content">
                      <h5>¿Dónde estamos?</h5>
                      <p>
                        Nos encontramos en el municipio de Antioquia, ciudad de Medellín.
                      </p>
                   </div>
                </div>
             </div>
          </div>
          <div class="row">
             <div class="col m6 s12">
                <div class="card">
                   <div class="card-content">
                      <h5>¿Qué hacemos?</h5>
                      <p>
                        Nos encargamos de brindarle una información clara y confiable a nuestros usuarios, para que asi se sientan seguros y ahorren elmayor tiempo posible.
                      </p>
                   </div>
                </div>
             </div>
             <div class="col m6 s12">
                <div class="card">
                   <div class="card-content">
                      <h5>¿Desde cuando lo hacemos?</h5>
                      <p>
                        El proyecto se inició a medidados del mes de abril de 2015. Con una terminación en el mes de octubre de 2016.
                      </p>
                   </div>
                </div>
             </div>
          </div>
       </section>
     </main>
     <%@include file="admin/footer.jsp" %>
  </body>
</html>
