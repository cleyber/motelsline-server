<header>
    <%
        boolean logueado = false;

        if(session.getAttribute("usuario") != null) {
        logueado = true;
    }

    %>
    <nav>
        <div class="nav-wrapper blue-grey darken-3">
            <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
            <a href="<%=Routes.getUrl("")%>" class="brand-logo"><img src="<%=Routes.getUrl("img/img.png")%>"></a>
            <div class="container">
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                   <li><a href="<%=Routes.getUrl("")%>">Inicio</a></li>
                   <li><a href="<%=Routes.getUrl("usuario/servicios.jsp")%>">Servicios</a></li>
                   <li><a href="<%=Routes.getUrl("usuario/habitaciones.jsp")%>">Habitaciones</a></li>
                   <%if(!logueado){%>
                        <li><a href="<%=Routes.getUrl("login.jsp")%>">Ingresar</a></li>
                   <%}%>
                   <%if(logueado){%>
                      <li><a href="<%= Routes.getUrl("usuario/reservas.jsp") %>">Reservas</a></li>
                      <li><a href="<%=Routes.getUrl("modifPerfil.jsp")%>">Perfil</a></li>
                      <li><a href="<%=Routes.getUrl("LogoutServlet")%>">Salir</a></li>
                   <%}%>

                </ul>
                <ul id="mobile-demo" class="side-nav">
                   <li><a href="<%=Routes.getUrl("")%>">Inicio</a></li>
                   <li><a href="<%=Routes.getUrl("usuario/servicios.jsp")%>">Servicios</a></li>
                   <li><a href="<%=Routes.getUrl("usuario/habitaciones.jsp")%>">Habitaciones</a></li>
                   <%if(!logueado){%>
                        <li><a href="<%=Routes.getUrl("login.jsp")%>">Ingresar</a></li>
                   <%}%>
                   <%if(logueado){%>
                   <li><a href="<%= Routes.getUrl("usuario/reservas.jsp") %>">Reservas</a></li>
                   <li><a href="<%=Routes.getUrl("modifPerfil.jsp")%>">Perfil</a></li>
                   <li><a href="<%=Routes.getUrl("LogoutServlet")%>">Salir</a></li>
                   <%}%>
                </ul>
            </div>
        </div>
    </nav>
</header>
