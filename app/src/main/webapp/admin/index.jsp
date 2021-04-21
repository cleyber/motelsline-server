<%--
    Document   : registrar
    Created on : 20-ago-2016, 20:57:48
    Author     : Cleyber
--%>
<%@page import="util.Routes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.dao.DaoMotel"%>
<%
    if(DaoMotel.getMotel() != null){
        response.sendRedirect(Routes.getUrl("login.jsp"));
    }
%>

<!DOCTYPE html>
<html lang="es">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <link href="<%=Routes.getUrl("css/materialize.min.css")%>" rel="stylesheet" type="text/css"/>
      <script src="<%=Routes.getUrl("js/jquery-3.0.0.min.js")%>" type="text/javascript"></script>
      <script src="<%=Routes.getUrl("js/materialize.min.js")%>" type="text/javascript"></script>
      <script src="<%=Routes.getUrl("js/Routes.js")%>" type="text/javascript"></script>
      <script src="<%=Routes.getUrl("js/admin/registrar.js")%>" type="text/javascript"></script>

      <title>Registro</title>
   </head>
   <body>
      <section class="container">
        <div>
           <div class="row">
              <div class="col s4">
                 <h5 class="center-align">Motel</h5>
              </div>
              <div class="col s4">
                 <h5 class="center-align">Administrador</h5>
              </div>
              <div class="col s4">
                 <h5 class="center-align">Finalizar</h5>
              </div>
           </div>
           <div class="progress blue lighten-4">
              <div class="determinate blue" style="width: 33.33%" id="wizard_progress"></div>
           </div>
        </div>
          <div class="row">
              <div class="col s12">
                  <div class="card">
                      <div class="card-content">
                        <form action="">
                            <div id="form_motel"><!-- Motel -->
                              <div class="row">
                                 <div class="input-field col s6">
                                    <label for="motel_nombre">Nombre</label>
                                    <input type="text" id="motel_nombre" class="validate">
                                 </div>

                                 <div class="input-field col s6">
                                    <label for="motel_direccion">Dirección</label>
                                    <input type="text" id="motel_direccion" class="validate">
                                 </div>
                              </div>
                              <div class="row">
                                 <div class="input-field col s6">
                                    <label for="motel_tel">Teléfono</label>
                                    <input type="tel" id="motel_tel" class="validate">
                                 </div>

                                 <div class="input-field col s6">
                                    <label for="motel_correo">Correo</label>
                                    <input type="email" id="motel_correo" class="validate">
                                 </div>
                              </div>
                              <div class="right-align">
                                 <button  id="sgnte_motel" class="btn waves-effect blue">Siguiente</button>
                              </div>
                           </div>



                           <div id="form_admin" class="hide"><!-- Administrador -->
                              <div class="row">
                                 <div class="input-field col s6">
                                    <label for="admin_nombre">Nombre</label>
                                    <input type="text" id="admin_nombre" class="validate">
                                 </div>

                                 <div class="input-field col s6">
                                    <label for="admin_apellido">Apellido</label>
                                    <input type="text" id="admin_apellido" class="validate">
                                 </div>
                              </div>

                              <div class="row">
                                 <div class="input-field col s6">
                                    <label for="admin_cedula">Cedula</label>
                                    <input type="number" id="admin_cedula"  class="validate">
                                 </div>

                                 <div class="input-field col s6">
                                    <label for="admin_correo">Correo</label>
                                    <input type="email" id="admin_correo" class="validate">
                                 </div>
                              </div>

                              <div class="row">
                                 <div class="input-field col s6">
                                    <label for="admin_clave">Clave</label>
                                    <input type="password" id="admin_clave" class="validate">
                                 </div>

                                 <div class="input-field col s6">
                                    <label for="admin_confirmar">Confirmar Clave</label>
                                    <input type="password" id="admin_confirmar" class="validate">
                                 </div>
                              </div>
                              <div class="row">
                                 <div class="left-align col s6">
                                    <button id="admin_atras" class="btn waves-effect blue">Atras</button>
                                 </div>
                                 <div class="right-align col s6">
                                    <button id="guardar" class="btn waves-effect blue">Guardar</button>
                                 </div>
                              </div>
                           </div>

                           <div id="form_finalizar" class="hide">
                              <div  id="ok" class="hide">
                                 <div class="row">
                                    <div class="valign-wrapper">
                                       <div class="col s6 valign center">
                                          <img src="/MotelsLine/img/check.png"  alt="OK"/>
                                       </div>
                                       <div class="col s6">
                                          <h2>Datos guardados correctamente</h2>
                                          <p>
                                             Los datos han sido guardados correctamente, ahora puede iniciar sesión <a href="/MotelsLine/login.jsp">aquí</a>
                                          </p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="hide" id="error">
                                 <div class="row">
                                    <div class="valign-wrapper">
                                       <div class="col s6 valign center">
                                          <img src="/MotelsLine/img/error.png"  alt="ERROR" />
                                       </div>
                                       <div class="col s6">
                                          <h2>Error guardando datos</h2>
                                          <h4 id="mensaje"></h4>
                                       </div>
                                       </div>
                                 </div>
                                  <div class="row">
                                       <div class="left-align" style="margin-top: 20px;">
                                           <button class="btn waves-effect blue" id="atras_error">atras</button>
                                       </div>
                                   </div>
                              </div>
                           </div>
                           <div id="preloader" class="center-align hide">
                              <div class="preloader-wrapper big active">
                                 <div class="spinner-layer spinner-blue-only">
                                    <div class="circle-clipper left">
                                      <div class="circle"></div>
                                    </div><div class="gap-patch">
                                      <div class="circle"></div>
                                    </div><div class="circle-clipper right">
                                      <div class="circle"></div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div> <!--card-content-->
                    </div> <!--  card-->
                </div> <!-- col s12 card-->
            </div> <!-- row card-->
        </section>
   </body>
</html>
