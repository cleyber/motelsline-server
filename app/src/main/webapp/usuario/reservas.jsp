<%--
    Document   : reserva
    Created on : 14-ago-2016, 15:46:32
    Author     : Cleyber
--%>
<%@page import="util.Routes"%>
<%@page import="models.Usuario"%>
<%@page import="models.Reservas"%>
<%@page import="models.Habitaciones"%>
<%@page import="models.dao.DaoUsuarios"%>
<%@page import="models.dao.DaoReservas"%>
<%@page  import="java.util.ArrayList"%>
<%@page  import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
DaoReservas dao = new DaoReservas();
ArrayList<Reservas> reservas = new ArrayList<Reservas>();

if(session.getAttribute("usuario") != null) {
  Usuario usuario = (Usuario)session.getAttribute("usuario");
  reservas = dao.reservasUsuario(usuario);
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
        <title>Reservas</title>
    </head>
    <body>
        <main>
           <%@include file="menuUser.jsp" %>
            <div class="container">
               <h1>Reservas</h1>
                <table class="striped responsive-table">
                     <thead>
                         <tr>
                             <th>Habitacion</th>
                             <th>Fecha</th>
                             <th>Horas extras</th>
                             <th>Personas Extras</th>
                             <th>Estado</th>
                         </tr>
                     </thead>
                     <tbody>
                       <% for(Reservas reserva : reservas) { %>
                       <tr>
                         <td><%= reserva.getHabitacion().getNombre() %></td>
                         <td><%= reserva.getFecha() %></td>
                         <td><%= reserva.getHorasExtras() %></td>
                         <td><%= reserva.getPersonasExtras() %></td>
                         <td>Pendiente</td>
                       </tr>
                       <% } %>
                     </tbody>
                 </table>
            </div>
        </main>
        <%@include file="../admin/footer.jsp"%>
    </body>

</html>
