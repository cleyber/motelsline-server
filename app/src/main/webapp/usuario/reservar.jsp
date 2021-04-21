<%--
    Document   : reservas
    Created on : 29-ago-2016, 20:39:32
    Author     : Cleyber
--%>
<%@page import="util.Routes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.dao.DaoServicios"%>
<%@page import="models.Servicios"%>
<%@page import="models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   Usuario usuario = new Usuario();
   boolean logged;
   if(session.getAttribute("usuario") == null) {
     logged = false;
    } else {
      logged = true;
      usuario = (Usuario) session.getAttribute("usuario");
   }

      int idHabitacion = 0;
      if(request.getParameter("habitacion") != null) {
        idHabitacion = Integer.parseInt(request.getParameter("habitacion"));
      }

    Servicios servicios = new Servicios();
    DaoServicios dao = new DaoServicios();

    ArrayList<Servicios> array = new ArrayList();
    array = dao.consultarAll();
%>
<!DOCTYPE html>
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <link href="<%=Routes.getUrl("css/materialize.min.css")%>" rel="stylesheet" type="text/css"/>
      <link href="<%=Routes.getUrl("css/style.css")%>" rel="stylesheet" type="text/css"/>
      <script src="<%=Routes.getUrl("js/jquery-3.0.0.min.js")%>" type="text/javascript"></script>
      <script src="<%=Routes.getUrl("js/usuario/reservar.js")%>" type="text/javascript"></script>
      <script src="<%=Routes.getUrl("js/materialize.min.js")%>" type="text/javascript"></script>
      <link href="<%=Routes.getUrl("css/sweetalert.css")%>" rel="stylesheet" type="text/css"/>
      <script src="<%=Routes.getUrl("js/sweetalert.min.js")%>" type="text/javascript"></script>
      <script src="<%=Routes.getUrl("js/Routes.js")%>"></script>
      <script>
            var logged = <%=logged%>;

            if(!sessionStorage.habitacion) {
              sessionStorage.habitacion = <%=idHabitacion%>;
            }

            <% if(logged) { %>
              sessionStorage.usuario = <%=usuario.getId()%>;
            <% } %>
      </script>
      <title>Reservar</title>
    </head>
        <%@include file="menuUser.jsp" %>
    <body>
      <main>
        <section class="container">
            <div>
                <div class="row">
                    <div class="col m3">
                        <h5 class="center-align">Servicios</h5>
                    </div>
                    <div class="col m3">
                        <h5 class="center-align">Fecha</h5>
                    </div>
                    <div class="col m3">
                        <h5 class="center-align">Inicio de sesión</h5>
                    </div>
                    <div class="col m3">
                        <h5 class="center-align">Resumen</h5>
                    </div>
                </div>
                <div class="progress blue lighten-4">
                    <div class="determinate blue" style="width: 25%" id="wizard_progress"></div>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <div class="card">
                        <div class="card-content">
                           <div id="form_servicios" class="hide"><!--Servicios-->
                           <div class="row">
                            <%
                               for(Servicios servicio  : array){
                           %>
                           <div class="col s12 m3">
                               <div>
                                   <input type="checkbox" id="<%=servicio.getId()%>" class="servicio" value="<%=servicio.getId()%>" name="servicio">
                                   <label for="<%=servicio.getId()%>"><%=servicio.getNombre()%></label>
                               </div>
                           </div>
                           <%
                               }
                           %>
                           </div>
                           <div class="right-align">
                               <button  id="siguiente_fecha" class="btn waves-effect blue" type="button">Siguiente</button>
                           </div>
                           </div>

                           <div id="form_fecha" class="hide"> <!--Fecha-->
                           <div class="row">
                               <div class="col m6 s12 ">
                                   <h5>Seleccione la fecha</h5>
                                   <div>
                                       <input type="date" class="datepicker" id="fecha">
                                   </div>
                               </div>
                               <div class="col m6 s12">
                                   <h5>Seleccione la hora</h5>
                                   <div class="row ">
                                       <div class="col m4 ">
                                           <select id="hora">
                                               <option value="01">01</option>
                                               <option value="02">02</option>
                                               <option value="03">03</option>
                                               <option value="04">04</option>
                                               <option value="05">05</option>
                                               <option value="06">06</option>
                                               <option value="07">07</option>
                                               <option value="08">08</option>
                                               <option value="10">10</option>
                                               <option value="11">11</option>
                                               <option value="12">12</option>
                                           </select>
                                       </div>
                                       <div class="col m4" >
                                           <select id="minutos">
                                              <option>00</option>
                                               <option>05</option>
                                               <option>10</option>
                                               <option>15</option>
                                               <option>20</option>
                                               <option>25</option>
                                               <option>30</option>
                                               <option>35</option>
                                               <option>40</option>
                                               <option>45</option>
                                               <option>50</option>
                                               <option>55</option>
                                           </select>
                                       </div>
                                       <div class="col m4">
                                           <select id="meridiano">
                                               <option value="am" selected>AM</option>
                                               <option value="pm">PM</option>
                                           </select>
                                       </div>
                                   </div>
                               </div>
                           </div>
                           <div class="row">
                               <div class="col m6 s12">
                                   <div class="input-field">
                                       <label for="perExtra">Personas Extras</label>
                                       <input type="number" id="per_extra" value="0">
                                   </div>
                               </div>
                               <div class="col m6 s12">
                                   <div class="input-field">
                                       <label for="horaExtra">Horas Extras</label>
                                       <input type="number" id="hora_extra" value="0">
                                   </div>
                               </div>
                           </div>
                           <div class="row">
                               <div class="left-align col s6">
                                  <button id="fecha_atras" class="btn waves-effect blue" type="button">Atras</button>
                               </div>

                               <div class="right-align col s6">
                                  <button id="siguiente_login" class="btn waves-effect blue" type="button">Siguiente</button>
                               </div>

                           </div>
                           </div>

                           <form action="<%=Routes.getUrl("LoginServlet?redirect="+Routes.getUrl("usuario/reservar.jsp"))%>" method="post"><!--Login-->
                           <div id="form_login" class="hide"><!--Login-->
                              <div class="row">
                                 <h4 class="center-align">Iniciar sesión</h4>
                                 <h6 id="pregunta" class="center-align"><a href="<%=Routes.getUrl("registrar.jsp")%>">¿No tienes una cuenta? Registrate</a></h6>
                                 <div class="col s12 col m8 offset-m2">
                                    <div class="input-field">
                                       <label for="correo">Correo</label>
                                       <input type="email" id="correo" name="correo">
                                    </div>
                                    <div class="input-field">
                                       <label for="clave">Clave</label>
                                       <input type="password" id="clave" name="clave">
                                    </div>
                                    <div class="right-align">
                                       <a href="<%=Routes.getUrl("recuperarClave.jsp")%>">¿Olvidaste tu clave?</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="row">
                                 <div class="left-align col s6">
                                    <button id="login_atras" class="btn waves-effect blue" type="button">Atras</button>
                                 </div>
                                 <div class="right-align col s6">
                                    <button class="btn waves-effect blue" type="submit">iniciar sesion</button>
                                 </div>
                              </div>
                           </div>
                           </form>


                           <div id="resumen" class="hide"><!--Resumen-->
                           <div>
                              <h3>Usted ha reservado:</h3>
                              <p><b>Habitación:</b> </p>
                              <p><b>Servicios:</b> </p>
                              <p><b>Día:</b> </p>
                              <p><b>Hora:</b> </p>
                              <p><b>Por un costo de: </b>$ </p><br>
                              <p><b>Gracias por reservas en MotelsLine..</b></p>
                           </div>
                           <div class="row">
                              <div class="left-align col s6">
                                 <button id="resumen_atras" class="btn waves-effect blue" type="button">Atras</button>
                              </div>
                              <div class="right-align col s6">
                                 <button class="btn waves-effect blue" id="guardar" type="button">Terminar</button>
                              </div>
                           </div>
                           </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
     </main>
        <%@include file="../admin/footer.jsp"%>
    </body>
</html>
