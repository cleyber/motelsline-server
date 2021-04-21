<%--
    Document   : index
    Created on : 05-sep-2016, 21:51:28
    Author     : Cleyber
--%>
<%@page import="util.Routes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   if(session.getAttribute("usuario") == null) {
      response.sendRedirect(Routes.getUrl("login.jsp"));
   } else {
      Usuario usuario = (Usuario) session.getAttribute("usuario");
      if(!usuario.getRol().equals(Usuario.EMPLEADO)) {
        response.sendRedirect(Routes.getUrl(""));
      }
   }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
