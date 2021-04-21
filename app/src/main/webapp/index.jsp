<%--
    Document   : index
    Created on : 14-ago-2016, 2:03:08
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
        <link href="<%=Routes.getUrl("css/materialize.min.css")%>" rel="stylesheet" type="text/css"/>
        <link href="<%=Routes.getUrl("css/font-awesome.min.css")%>" rel="stylesheet" type="text/css"/>
        <link href="<%=Routes.getUrl("css/style.css")%>" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="<%=Routes.getUrl("js/materialize.min.js")%>" type="text/javascript"></script>

        <title>Inicio</title>
        <script>
            $(document).ready(function(){
               $(".button-collapse").sideNav();
               $('.slider').slider({full_width: true});
               $('.parallax').parallax();
            });

        </script>
    </head>
    <body>
        <main>
            <%@include file="usuario/menuUser.jsp" %>
            <div id="index-banner" class="parallax-container">
              <div class="section no-pad-bot">
                <div class="container">
                  <br><br>
                  <h1 class="header teal-text text-lighten-2">MotelsLine</h1>
                  <div class="row">
                    <h5 class="left-align header col s12 light" id="h5-bienvenidos">Bienvenidos a la nueva forma de reservar un motel</h5>
                  </div>
                  <br><br>

                </div>
              </div>
              <div class="parallax"><img src="<%=Routes.getUrl("img/img3.jpg")%>" alt="Unsplashed background img 1"></div>
            </div>

            <%-- iconos --%>
            <div class="container">
              <div class="section">
                <div class="row">
                  <div class="col m6 s12">
                    <div>
                      <a href="<%=Routes.getUrl("contactanos.jsp")%>"><h2 class="center brown-text"><i class="fa fa-phone" aria-hidden="true"></i></h2>
                      <h5 class="center item">Contáctanos</h5></a>
                  </div>
                </div>
                  <div class="col m6 s12">
                    <div>
                      <a href="<%=Routes.getUrl("acercade.jsp")%>"><h2 class="center brown-text"><i class="fa fa-question" aria-hidden="true"></i></h2>
                      <h5 class="center item">Acerca de</h5></a>
                    </div>
                  </div>
                </div>

                </div>
              </div>


            <div class="parallax-container valign-wrapper">
              <div class="section no-pad-bot">
                <div class="container">
                  <div class="row center">
                    <h5 class="header col s12 light"></h5>
                  </div>
                </div>
              </div>
              <div class="parallax"><img src="<%=Routes.getUrl("img/img4.jpg")%>" alt="Unsplashed background img 2"></div>
            </div>

            <div class="container">
              <div class="section">

                <div class="row">
                  <div class="col s12 center">
                    <h3><i class="mdi-content-send brown-text"></i></h3>
                    <h4>MotelsLine</h4>
                    <p class="center-align light">Disfruta en pareja, los diferentes ambientes en los cuales están inspiradas muchas de nuestras habitaciones, están perfectamente diseñados para satisfacer las necesidades y gustos de nuestros clientes, nos esmeramos en brindar el mejor servicio innovando cada vez más en las estructuras y decoración de las habitaciones</p>
                  </div>
                </div>

              </div>
            </div>


            <div class="parallax-container valign-wrapper">
              <div class="section no-pad-bot">
                <div class="container">
                  <div class="row center">
                    <h5 class="header col s12 light"></h5>
                  </div>
                </div>
              </div>
              <div class="parallax"><img src="<%=Routes.getUrl("img/img2.jpg")%>" alt="Unsplashed background img 3"></div>
            </div>
           <%@include file="admin/footer.jsp" %>
        </main>
    </body>
</html>
