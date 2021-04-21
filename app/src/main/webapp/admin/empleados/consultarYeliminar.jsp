<%--
    Document   : eliminarYactualizar
    Created on : 30-ago-2016, 15:57:31
    Author     : Cleyber
--%>
<%@page import="util.Routes"%>
<%@page import="models.Usuario"%>
<%@page import="models.dao.DaoUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
    if(session.getAttribute("usuario") == null) {
        response.sendRedirect(Routes.getUrl("login.jsp"));
    } else {
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if(!usuario.getRol().equals(Usuario.ADMINISTRADOR)) {
          response.sendRedirect(Routes.getUrl(""));
        }
    }

    ArrayList<Usuario> list = new ArrayList();
    DaoUsuarios dao = new DaoUsuarios();

    list = dao.consultarAllEmpleados();
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
        <title>Empleados</title>
        <script>
            $(document).ready(function(){
                $(".button-collapse").sideNav();
                $(".dropdown-button").dropdown();
            });
            function eliminar(id){
                swal({
                   title: "Eliminar",
                   text: "¿Esta seguro que desea eliminar el usuario?",
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
                        url: Routes.getUrl("EliminarUsuarioServlet"),
                        method: "post",
                        data:{
                            id: id
                        },
                        success: function(){
                            swal("Eliminado","Usuario eliminado correcatamente", "success");
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
               <h1>Eliminar empleados</h1>
                <table class="striped responsive-table">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Appellido</th>
                            <th>Cedula</th>
                            <th>Correo</th>
                            <th>Rol</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for(int i = 0; i < list.size(); i++){
                        %>
                        <tr id="<%= list.get(i).getId()%>">
                            <td><%= list.get(i).getNombre()%></td>
                            <td><%= list.get(i).getApellido()%></td>
                            <td><%= list.get(i).getCedula()%></td>
                            <td><%= list.get(i).getCorreo()%></td>
                            <td><%= list.get(i).getRol()%></td>
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
