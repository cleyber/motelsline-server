<%--
    Document   : index
    Created on : 15-jun-2016, 22:16:06
    Author     : Cleyber
--%>
<%@page import="util.Routes"%>
<%@page import="models.Imagen"%>
<%@page import="models.dao.DaoServicios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Servicios"%>
<%
    ArrayList<Servicios> list = new ArrayList();
    DaoServicios dao = new DaoServicios();

    list = dao.consultarAll();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
          <link href="<%=Routes.getUrl("css/materialize.min.css")%>" rel="stylesheet" type="text/css"/>
          <link href="<%=Routes.getUrl("css/style.css")%>" rel="stylesheet" type="text/css"/>
      <style>
           ul li{
               float: left;
               margin: 3px;
           }

      </style>
      <script src="<%=Routes.getUrl("js/jquery-3.0.0.min.js")%>" type="text/javascript"></script>
      <script src="<%=Routes.getUrl("js/materialize.min.js")%>" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
               $(".button-collapse").sideNav();
               $('.slider').slider({full_width: true});
            });

        </script>
        <title>Servicios</title>
    </head>
    <body>
        <main>
        <%@include file="menuUser.jsp" %>

            <section class="container">

                <h1>Servicios especiales</h1>
                <div class="row">
                <%
                    for(Servicios servicio  : list){
                %>
                    <div class=" col s12 m4">
                        <div class="card">
                            <div class="card-image">
                                <%
                                   if(servicio.getImagenes().size() >= 1){
                                %>
                                    <%

                                            for(Imagen imagen : servicio.getImagenes()){

                                     %>

                                    <img src="<%=Routes.getUrl("imgServidor/")%><%=imagen.getNombre()%>">

                                  <%
                                        }
                                    %>
                                 <%
                                     }else{
                                 %>
                                 <div>
                                     <img src="<%=Routes.getUrl("img/notImg.png")%>">
                                 </div>
                                 <%
                                     }
                                 %>

                            </div>
                            <div class="card-content">
                                <span><%= servicio.getNombre()%></span>
                                <p><%= servicio.getPrecio()%></p>
                                <p><%= servicio.getDescripcion()%></p>
                            </div>
                        </div>
                    </div>
                <% } %>
                </div>
            </section>
        </main>
        <%@include file="../admin/footer.jsp"%>
    </body>
</html>
