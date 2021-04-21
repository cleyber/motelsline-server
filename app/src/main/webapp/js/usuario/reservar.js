$(document).ready(function(){
    $(".button-collapse").sideNav();
    $('.datepicker').pickadate({
      format: 'yyyy-mm-dd',
      min: new Date,
        selectMonths: true,
        selectYears: 15,
       monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
      monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
      weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
      weekdaysShort: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'vi', 'Sa'],
      today: 'Hoy',
      clear: 'Limpiar',
      close: 'Cerrar'
    });
    $('select').material_select();


    var formServicios = $("#form_servicios");
    var formLogin = $("#form_login");
    var formFecha = $("#form_fecha");
    var wizardProgress = $("#wizard_progress");
    var resumen = $("#resumen");
    var guardar = $("#guardar_reserva");

    if(logged && sessionStorage.servicios){
      showResumen();
   }else{
      showServicios();
   }


   function showServicios(){
      formServicios.removeClass("hide");
      wizardProgress.css({
          width: "25%"
      });
   }

   function hideServicios(){
      formServicios.addClass("hide");
   }

   function showFecha(){
      formFecha.removeClass("hide");
      wizardProgress.css({
          width: "50%"
      });
   }

   function hideFecha(){
      formFecha.addClass("hide");
   }

   function showLogin(){
      initSession();
      if(!logged){
         formLogin.removeClass("hide");
         wizardProgress.css({
             width: "75%"
         });
      }else{
         showResumen();
      }
   }

   function hideLogin(){
      formLogin.addClass("hide");
   }

   function showResumen(){
      resumen.removeClass("hide");
      wizardProgress.css({
          width: "100%"
      });
   }

   function hideResumen(){
      resumen.addClass("hide");
   }

   function save(){
      $.ajax({
         url: Routes.getUrl('ReservarServlet'),
         method: "post",
         data:{
            habitacion: sessionStorage.habitacion,
           fecha: sessionStorage.fecha,
           minutos: sessionStorage.minutos,
           horasExtras: sessionStorage.horasExtras,
           servicios: sessionStorage.servicios,
           personas: sessionStorage.personas,
           hora: sessionStorage.hora,
           meridiano: sessionStorage.meridiano,
           usuario: sessionStorage.usuario
         },
         success: function(){
            sessionStorage.clear();
           swal({
             title: 'Reserva',
             text: 'Se ha realizado la reserva correctamente',
             type: 'success'
           }, function() {
             window.location = Routes.getUrl("usuario/reservas.jsp");
           });
             ok.removeClass("hide");
             wizardProgress.css({
             width: "100%"
             }).addClass("green");
         },
         error: function(respuesta){
           swal('Error', 'Error al realizar la reserva', 'error'); 
             error.removeClass("hide");
             wizardProgress.css({
                width: "100%"
            }).addClass("red").removeClass("blue");
             mensaje.text(respuesta.responseText);
         }
     });
   }

   function initSession(){
      sessionStorage.fecha = $('#fecha').val();
      sessionStorage.hora = $('#hora').val();
      sessionStorage.minutos = $('#minutos').val();
      sessionStorage.meridiano = $('#meridiano').val();
      sessionStorage.personas = $('#per_extra').val();
      sessionStorage.horasExtras = $('#hora_extra').val();

      var servicios = $.map($('.servicio:checked').serializeArray(), function(servicio) {
        return parseInt(servicio.value);
      });
      sessionStorage.servicios = JSON.stringify(servicios);
   }

   //Events

   $("#siguiente_fecha").click(function(){
      hideServicios();
      showFecha();
   });

   $("#fecha_atras").click(function(){
      hideFecha();
      showServicios();
   });

   $("#siguiente_login").click(function(){
      hideFecha();
      showLogin();
   });

   $("#login_atras").click(function(){
      hideLogin();
      showFecha();
   });

   $("#guardar").click(function(){
      save();
   });

   $("#resumen_atras").click(function(){
      hideResumen();
      showFecha();
   });



});
