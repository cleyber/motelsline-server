<%--
    Document   : reserva
    Created on : 14-ago-2016, 15:46:32
    Author     : Cleyber
--%>
<%@page import="util.Routes"%>
<%@page import="models.Usuario"%>
<%@page import="models.Reservas"%>
<%@page import="models.dao.DaoUsuarios"%>
<%@page import="models.dao.DaoReservas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.ArrayList"%>
<%@page  import="java.util.List"%>

<%
   /*if(session.getAttribute("usuario") == null) {
      response.sendRedirect(Routes.getUrl("login.jsp"));
   } else {
       Usuario usuario = (Usuario) session.getAttribute("usuario");
       if(!usuario.getRol().equals(Usuario.EMPLEADO)) {
         response.sendRedirect(Routes.getUrl(""));
      }
   }*/

   /* DaoReservas dao = new DaoReservas();
    ArrayList<Reservas> list = new ArrayList();

   list = dao.consultarAll();

    String pagina = request.getParameter("pagina");
    int numero = 1;


    if(pagina != null){
      numero = Integer.parseInt(pagina);
    }


     final int REGISTROS = 11;
    List<Reservas> lista;
    //= list.subList((numero - 1) * 11, numero * 11);
    boolean ultimo = false;

    if(numero * REGISTROS  > list.size()){
       ultimo = true;
       lista = list.subList((numero -1) * REGISTROS, list.size());
   }else{
       lista = list.subList((numero -1)* 11, numero* REGISTROS);

   }*/
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
           <%@include file="../menu.jsp" %>
            <div class="container">
               <h1>Reservas</h1>
                <table class="striped responsive-table">
                     <thead>
                         <tr>
                             <th>Nombre</th>
                             <th>Cedula</th>
                             <th>Fecha</th>
                             <th>Hora inicio</th>
                             <th>Hora termina</th>
                             <th>Habitación</th>
                             <th>Anular</th>
                             <th>Confirmar</th>
                         </tr>
                     </thead>
                     <tbody>

                        <%-- <tr>
                             <td><%=lista.get(i).getNombre()%></td>
                             <td><%=lista.get(i).getApellido()%></td>
                             <td><%=lista.get(i).getCedula()%></td>
                             <td><%=lista.get(i).getCorreo()%></td>
                             <td><%=lista.get(i).getRol()%></td>
                         </tr>--%>

                         <%--<%
                            for(int i = 0; i < lista.size(); i++){
                         %>--%>
                         <tr>
                             <td>Users</td>
                             <td>123221</td>
                             <td>26/09/2016</td>
                             <td>10:00 pm</td>
                             <td>02:00 am</td>
                             <td>Suite precidencial</td>
                             <td><button onclick="anular()" class="btn waves-effect orange"><i class="fa fa-ban"></i></button></td>
                             <td><button onclick="confirmar()" class="btn waves-effect"><i class="fa fa-calendar-check-o"></i></button></td>
                         </tr>
                         <%--<%
                             }
                         %>--%>
                     </tbody>
                 </table>
            </div>
        </main>
        <%@include file="../footer.jsp" %>
    </body>

</html>
