<%--
    Document   : consulta
    Created on : 30-jun-2016, 0:08:01
    Author     : Cleyber
--%>
<%@page import="util.Routes"%>
<%@page import="models.Usuario"%>
<%@page import="models.dao.DaoServicios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="models.Servicios"%>
<%@page  import="java.util.ArrayList"%>
<%@page  import="java.util.List"%>

<%

   if(session.getAttribute("usuario") == null) {
      response.sendRedirect(Routes.getUrl("login.jsp"));
   } else {
      Usuario usuario = (Usuario) session.getAttribute("usuario");
      if(!usuario.getRol().equals(Usuario.ADMINISTRADOR)) {
        response.sendRedirect(Routes.getUrl(""));
      }
   }

    DaoServicios dao = new DaoServicios();
    ArrayList<Servicios> list = new ArrayList();

    list = dao.consultarAll();

    String pagina = request.getParameter("pagina");
    int numero = 1;


    if(pagina != null){
      numero = Integer.parseInt(pagina);
    }


     final int REGISTROS = 11;
    List<Servicios> lista;
    //= list.subList((numero - 1) * 11, numero * 11);
    boolean ultimo = false;

    if(numero * REGISTROS  > list.size()){
       ultimo = true;
       lista = list.subList((numero -1) * REGISTROS, list.size());
   }else{
       lista = list.subList((numero -1)* 11, numero* REGISTROS);

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
        <link href="<%=Routes.getUrl("css/font-awesome.min.css")%>" rel="stylesheet" type="text/css"/>
        <script src="<%=Routes.getUrl("js/jquery-3.0.0.min.js")%>" type="text/javascript"></script>
        <script src="<%=Routes.getUrl("js/materialize.min.js")%>" type="text/javascript"></script>
        <title>Servicios</title>
        <script>
            $(document).ready(function(){
                $(".button-collapse").sideNav();
                $(".dropdown-button").dropdown();
            });
        </script>
    </head>
    <body>
        <%@include file="../menu.jsp" %>
        <main>
            <div class="container">
                <h1>Servicios</h1>
            </div>
            <div class="container">
                <table class="centered">
                     <thead>
                         <tr>
                             <th>Nombre</th>
                             <th>Precio</th>
                             <th>Descripcion</th>
                         </tr>
                     </thead>
                     <tbody>
                         <%
                            for(int i = 0; i < lista.size(); i++){
                         %>
                         <tr>
                             <!-- <%= lista.get(i).getImagenes().toString()%>-->
                             <td><%=lista.get(i).getNombre()%></td>
                             <td><%=lista.get(i).getPrecio()%></td>
                             <td><%=lista.get(i).getDescripcion()%></td>
                         </tr>
                         <%
                             }
                         %>
                     </tbody>

                 </table>

                     <%
                         if(numero > 1){
                     %>
                     <a href="index.jsp?pagina=<%= numero - 1%>" class="btn red"><i class="material-icons">skip_previous</i></a>
                     <%
                         }
                     %>
                     <a href="#" class="btn white black-text"><%=numero%></a>
                     <%
                        if (!ultimo){
                     %>
                     <a href="index.jsp?pagina=<%=numero + 1%>" class="btn"><i class="material-icons">skip_next</i></a>
                     <%
                         }
                     %>
            </div>
        </main>
    </body>
    <%@include file="../footer.jsp" %>
</html>
