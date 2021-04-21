$(document).ready(function(){

    $('form').submit(function(evento){
       evento.preventDefault();
    });

   var formAdmin = $("#form_admin");
   var formMotel = $("#form_motel");
   var formFinalizar = $("#form_finalizar");
   var wizardProgress = $("#wizard_progress");
   var ok = $("#ok");
   var error = $("#error");
   var mensaje = $("#mensaje");
   var preloader = $("#preloader");

   $("#sgnte_motel").click(function(){
      formMotel.addClass("hide");
      formAdmin.removeClass("hide");
      wizardProgress.css({
         width: "66.66%"
      });
   });

   $("#admin_siguiente").click(function(){
      formAdmin.addClass("hide");
      formFinalizar.removeClass("hide");
      wizardProgress.css({
         width: "100%"
      });
   });

   $("#admin_atras").click(function(){
      formMotel.removeClass("hide");
      formAdmin.addClass("hide");
      wizardProgress.css({
         width: "33.33%"
      });
   });

   $("#atras_error").click(function(){
      formAdmin.removeClass("hide");
      formFinalizar.addClass("hide");
      error.addClass("hide");
      wizardProgress.css({
         width: "66.66%"
      }).removeClass("red").addClass("blue");
   });

   $("#guardar").click(function(){

      formAdmin.addClass("hide");
      preloader.removeClass("hide");

      $.ajax({
         url: Routes.getUrl("RegistrarAdminServlet"),
         method: "post",
         data:{
            motel: JSON.stringify({
               nombre: $("#motel_nombre").val(),
               direccion: $("#motel_direccion").val(),
               telefono: $("#motel_tel").val(),
               correo: $("#motel_correo").val()
            }),
            admin: JSON.stringify({
               nombre: $("#admin_nombre").val(),
               apellido: $("#admin_apellido").val(),
               cedula: $("#admin_cedula").val(),
               correo: $("#admin_correo").val(),
               clave: $("#admin_clave").val(),
               confirmar: $("#admin_confirmar").val()
            })
         },
         success: function(){
            ok.removeClass("hide");
            wizardProgress.css({
                width: "100%"
            }).addClass("green");
         },
         error: function(respuesta){
             error.removeClass("hide");
             wizardProgress.css({
                width: "100%"
            }).addClass("red").removeClass("blue");
             mensaje.text(respuesta.responseText);
         },
         complete: function(){
            formFinalizar.removeClass("hide");
            preloader.addClass("hide");
         }
      });
   });
});
