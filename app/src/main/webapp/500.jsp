<%--
    Document   : 500
    Created on : 15-sep-2016, 19:14:13
    Author     : Cleyber
--%>
<%@page import="util.Routes" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="<%=Routes.getUrl("css/materialize.min.css")%>" rel="stylesheet" type="text/css"/>
        <link href="<%=Routes.getUrl("css/errors.css")%>" rel="stylesheet" type="text/css"/>
        <script src="<%=Routes.getUrl("js/jquery-3.0.0.min.js")%>" type="text/javascript"></script>
        <script src="<%=Routes.getUrl("js/materialize.min.js")%>" type="text/javascript"></script>

        <title>500</title>
    </head>
    <body>
        <div id='oopss'>
            <div id='error-text'>
                <span>500</span>
                <p>Error interno del servidor</p>
                <p class='hmpg'><a href='<%=Routes.getUrl("")%>' class="back">Regresar al inicio</a></p>
            </div>
        </div>
    </body>
</html>
