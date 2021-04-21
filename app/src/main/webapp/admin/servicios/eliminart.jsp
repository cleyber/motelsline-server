<%--
    Document   : eliminart
    Created on : 04-jul-2016, 14:23:02
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



    ArrayList<Servicios> list = new ArrayList();
    DaoServicios dao = new DaoServicios();

    list = dao.consultarAll();
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
        <title>Eliminar Servicio</title>
        <script>
            $(document).ready(function(){
                $(".button-collapse").sideNav();
                $(".dropdown-button").dropdown();
            });
            function eliminar(id){
                swal({
                   title: "Eliminar",
                   text: "¿Esta seguro que desea eliminar el servicio?",
                   type: "warning",
                   allowOutsideClick: true,
                   showCancelButton: true,
                   confirmButtonText: "Eliminar",
                   confirmButtonColor: "#f44336",
                   cancelButtonText: "Cancelar",
                   closeOnConfirm: false,
                   showLoaderOnConfirm: true
                }, function(){
                    $.ajax({
                        url: Routes.getUrl("EliminarServicioServlet"),
                        method: "post",
                        data:{
                            id: id
                        },
                        success: function(){
                            swal("Eliminado","Servicio eliminado correcatamente", "success");
                            $("#" + id).remove();
                        },
                        error: function(respuesta){
                            swal("Error", respuesta.responseText, "error");
                        }
                   });
                });
            }

        </script>
    </head>
    <body>
        <%@include file="../menu.jsp" %>
        <main>
            <section class="container">
               <h1>Eliminar servicios</h1>
                <table class="striped responsive-table">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Descripción</th>
                            <th>Editar</th>
                            <th>Eliminar</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for(int i = 0; i < list.size(); i++){
                        %>
                        <tr id="<%= list.get(i).getId()%>">
                            <td><%= list.get(i).getNombre()%></td>
                            <td><%= list.get(i).getPrecio()%></td>
                            <td><%= list.get(i).getDescripcion()%></td>
                            <td><a href="modificar.jsp?servicio=<%= list.get(i).getId()%>" class="btn teal lighten-1"><i class="fa fa-pencil-square-o"></i></a></td>
                            <td><button onclick="eliminar(<%= list.get(i).getId()%>)" class="btn waves-effect red"><i class="fa fa-trash-o"></i></button></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </section>
        </main>
    </body>
    <%@include file="../footer.jsp" %>
</html>
