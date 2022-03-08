function stepperNext(event){

	// Esto es para prevenir el submit del formulario
	event.preventDefault();

	if (pasoActual == 1){
		// El botón de siguiente pasa al paso 2 (habitaciones)

		activarNext(false);	// Desactiva el botón de siguiente mientras se procesa en el servlet
		activarPrevious(false);			// Desactiva el botón de atrás mientras se procesa en el servlet

		$('#btn-next-spinner').show();	// Muestra el spinner de carga

		// Pasa las fechas al formato YYYY-MM-DD
		strFechaDesde = getDateString( $('#reserva-fecha_desde').val() );
		strFechaHasta = getDateString( $('#reserva-fecha_hasta').val() );
		strCantidadPersonas = $('#reserva-cantidad_personas').val();

		console.log("haciendo AJAX del paso 1");
		$.ajax({
			type: 'POST',

			url: 'reserva',	// RESERVA

			data: {
				paso: 1,
				fechaDesde: strFechaDesde,
				fechaHasta: strFechaHasta,
				cantidadPersonas: strCantidadPersonas,
			},

			success: function(resp){
				success1(resp);
			},

			error: function(){
				console.log("error en AJAX del paso 1");
				ActivateModal("Hubo un error procesando tu reserva. Reintentá más tarde o comunicate con nosotros", "UPS...", "danger");
				$('#btn-next-spinner').hide();
				activarPrevious(false);
				checkStep1();
			}
		});
	}

	else if (pasoActual == 2){
		// El botón de siguiente pasa al paso 3 (confirmación de reserva)

		activarNext(false);	// Desactiva el botón de siguiente mientras se procesa en el servlet
		activarPrevious(false);			// Desactiva el botón de atrás mientras se procesa en el servlet

		$('#btn-next-spinner').show();	// Muestra el spinner de carga

		// Busca las cantidades de habitaciones pedidas
		strCantidadDeluxe = $('#reserva-cantidad_deluxe').val() != "" ? $('#reserva-cantidad_deluxe').val() : "0";
		strCantidadDeluxePlus = $('#reserva-cantidad_deluxe_plus').val() != "" ? $('#reserva-cantidad_deluxe_plus').val() : "0";
		strCantidadJuniorSuite = $('#reserva-cantidad_junior_suite').val() != "" ? $('#reserva-cantidad_junior_suite').val() : "0";
		strCantidadExecutiveSuite = $('#reserva-cantidad_executive_suite').val() != "" ? $('#reserva-cantidad_executive_suite').val() : "0";
		strCantidadSuitePresidencial = $('#reserva-cantidad_suite_presidencial').val() != "" ? $('#reserva-cantidad_suite_presidencial').val() : "0";

		console.log("haciendo AJAX del paso 2");
		$.ajax({
			type: 'POST',

			url: 'reserva',	// RESERVA

			data: {
				paso: 2,
				cantidadDeluxe : strCantidadDeluxe,
				cantidadDeluxePlus : strCantidadDeluxePlus,
				cantidadJuniorSuite : strCantidadJuniorSuite,
				cantidadExecutiveSuite : strCantidadExecutiveSuite,
				cantidadSuitePresidencial : strCantidadSuitePresidencial
			},

			success: function(resp){
				success2(resp);
			},

			error: function(){
				console.log("error en AJAX del paso 2");
				ActivateModal("Hubo un error procesando tu reserva. Reintentá más tarde o comunicate con nosotros", "UPS...", "danger");
				$('#btn-next-spinner').hide();
				activarPrevious(false);
				checkStep2();
			}
		});
	}

	else if (pasoActual == 3) {
		// El botón de siguiente (con texto confirmar) pasa al paso 4 (resumen)

		activarPrevious(false);
		$('#btn-next-spinner').show();

		console.log("Haciendo AJAX del paso 3")
		$.ajax({
				type: 'POST',

				url: 'reserva',	// RESERVA

				data: {
					paso: 3,
					precio_total: $('#indicador-precio_total').text()
				},

				success: function(resp){
					success3(resp);
				},

				error: function(){
					console.log("error en AJAX del paso 3");
					ActivateModal("Hubo un error procesando tu reserva. Reintentá más tarde o comunicate con nosotros", "UPS...", "danger");
					$('#btn-next-spinner').hide();
					activarPrevious(false);
					checkStep3();
				}
			});
	}
}


function stepperPrevious(){

	// Comprueba que estén todos los campos completos y pasa al siguiente paso
	if (pasoActual == 2){
		// El botón de siguiente pasa al paso 2 (habitaciones)

		checkStep1();
		mostrarPaso(1);
		$(".progress-bar").css("width", "0%");
		pasoActual = 1;
		activarPrevious(false);
	}
	else if (pasoActual == 3) {
		// El botón de siguiente (con texto confirmar) pasa al paso 4 (resumen)

		checkStep2();
		mostrarPaso(2);
		$(".progress-bar").css("width", "33%");

		$('#btn-next-text').text("Siguiente");
		$('#btn-next-icon-next').toggle();
		$('#btn-next-icon-confirm').toggle();
		$('#btn-next').toggleClass("btn-primary btn-success");

		pasoActual = 2;
	}
}



/* ___________________________ FUNCIONES DE CHECKEO DE PASOS ___________________________ */

function checkStep1(){
	activarNext(true);
	$('.step1-input').each(function(){
		if($(this).val() == "" || $(this).val() == undefined || $(this).val() == 0 || $(this).val() < 1)
			activarNext(false);
	});
}

function checkStep2(){
	// Las reglas de negocio (que alcancen las camas para la cantidad de personas) se checkea en servlet
	activarNext(false);
	$('.step2-input').each(function(){
		if($(this).val() >= 1)
			activarNext(true);
	});
}

function checkStep3(){
	activarNext(false);
	if($('#reserva-confirmar').prop('checked'))
		activarNext(true);
}

/* --------------------------- FUNCIONES DE CHECKEO DE PASOS --------------------------- -- */



/* ___________________________ FUNCIONES DE AGREGAR O QUITAR PERSONAS/HABITACIONES ___________________________ */

function agregarPersona(){
	var valor = $('#reserva-cantidad_personas').val() == "" ? 1 : parseInt($('#reserva-cantidad_personas').val()) + 1;
	$('#reserva-cantidad_personas').val(valor).change();
}

function quitarPersona(){
	var valor = $('#reserva-cantidad_personas').val() == "" ? 0 : parseInt($('#reserva-cantidad_personas').val()) - 1;
	if( valor >= 0 )
		$('#reserva-cantidad_personas').val(valor).change();
}

function agregarHabitacion(idInput){
	var valor = $('#' + idInput).val() == "" ? 1 : parseInt($('#' + idInput).val()) + 1;
	var maxValue = parseInt($('#' + idInput).attr('max'));
	if (valor <= maxValue){
		$('#' + idInput).val(valor).change();
	}
}

function quitarHabitacion(idInput){
	var valor = $('#' + idInput).val() == "" ? 0 : parseInt($('#' + idInput).val()) - 1;
	if( valor >= 0 )
		$('#' + idInput).val(valor).change();
}

/* --------------------------- FUNCIONES DE AGREGAR O QUITAR PERSONAS/HABITACIONES --------------------------- */



/* ___________________________ ÚTILES ___________________________ */

function activarNext(estado){
	$('#btn-next').prop("disabled", !estado);
}

function activarPrevious(estado){
	$('#btn-prev').prop("disabled", !estado);
}

function getDateString(fecha){
	// pasa de DD/MM/AAAA a YYYY-MM-DD
	nuevaFecha = fecha.substr(6, 4) + "-" + fecha.substr(3, 2) + "-" + fecha.substr(0, 2);
	return nuevaFecha
}

function cancelarReserva(){
	// Muestra los botones de confirmación
	$('.btn-cancelar').toggle();
}

function mostrarPaso(paso){
	console.log(pasoActual + " --> " + paso);

	toggleWithSilde('#step' + pasoActual + '-container');
	toggleWithSilde('#step' + paso + '-container');

	if(paso == 2 || pasoActual == 2){
		toggleWithSilde('#indicadores1-container');
	}
}

function toggleWithSilde(selector){
	if($(selector).is(":visible")){
		$(selector).slideUp();
	}else{
		$(selector).slideDown();
	}
}

function submitNextForm(){
	// Triggerea el submit del formulario solo por la vaildación HTML. Después desactiva la acción de submit en stepperNext()
	$('#reserva' + pasoActual + '-submit').click();
}

/* --------------------------- ÚTILES --------------------------- */



/* ___________________________ MANEJO DE RESPUESTAS DEL SERVLET ___________________________ */


function success1(resp){

	$('#btn-next-spinner').hide();

	// También actualiza los indicadores de fechas y cantidad de personas
	$('.indicador-fecha_desde').text( $('#reserva-fecha_desde').val() );
	$('.indicador-fecha_hasta').text( $('#reserva-fecha_hasta').val() );
	$('.indicador-cantidad_personas').text( $('#reserva-cantidad_personas').val() );

	if(resp != "" && resp != "[]"){
		// Se va a tomar como que si me pasan un arreglo, es de habitaciones, y si no me mandan un arrgelo, hubo un error

		respuesta = JSON.parse(resp);
		// console.log(respuesta);

		if(respuesta.length != undefined){
			// La respuesta es el arreglo de habitaciones
			cargarHabitaciones(respuesta);
			activarPrevious(true);
			checkStep2();
			mostrarPaso(2);
			$(".progress-bar").css("width", "33%");
			pasoActual = 2;
			return;
		}
		// Si no entró al otro if es porque el servlet mandó error. Muestro la alerta
		msjModal = respuesta.mensaje == undefined ? "Hubo un error procesando tu reserva Reintentá más tarde o comunicate con nosotros" : respuesta.mensaje;
		ttlModal = respuesta.titulo == undefined ? "UPS..." : respuesta.titulo;
		tipoModal = respuesta.tipo == undefined ? "danger" : respuesta.tipo;
		ActivateModal(msjModal, ttlModal, tipoModal);

	}
	else{
		// La respuesta vino vacía. Muestra la alerta y vuelve a activar el paso actual
		console.log("El servlet no devolvió nada en el paso 1") // No debería pasar
		ActivateModal("Hubo un error procesando tu reserva. Reintentá más tarde o comunicate con nosotros", "UPS...", "danger");
	}
	$('#btn-next-spinner').hide();
	activarPrevious(false);
	checkStep1();
}


function success2(resp){

	console.log("exito en AJAX del paso 2");

	$('#btn-next-spinner').hide();

	if (resp != "" && resp != "{}"){
		respuesta = JSON.parse(resp);
		// console.log(respuesta);
		// Acá nada más me van a devolver un objeto con o sin error
		if(respuesta.alert == true){
			// Si la alert es true, muestra el mensaje que trae, o los valores por defecto
			msjModal = respuesta.mensaje == undefined ? "Hubo un error procesando tu reserva Reintentá más tarde o comunicate con nosotros" : respuesta.mensaje;
			ttlModal = respuesta.titulo == undefined ? "UPS..." : respuesta.titulo;
			tipoModal = respuesta.tipo == undefined ? "danger" : respuesta.tipo;
			ActivateModal(msjModal, ttlModal, tipoModal);
		}
		else{
			// También actualiza los indicadores de cantidad de habitaciones
			$('#indicador-cantidad_deluxe').text( strCantidadDeluxe );
			$('#indicador-cantidad_deluxe_plus').text( strCantidadDeluxePlus );
			$('#indicador-cantidad_junior_suite').text( strCantidadJuniorSuite );
			$('#indicador-cantidad_executive_suite').text( strCantidadExecutiveSuite );
			$('#indicador-cantidad_suite_presidencial').text( strCantidadSuitePresidencial );

			// Muestra solo los indicadores necesarios
			$('#indicador-deluxe-container').hide();
			if( strCantidadDeluxe != "" ) $('#indicador-deluxe-container').show();

			$('#indicador-deluxe_plus-container').hide();
			if( strCantidadDeluxePlus != "" ) $('#indicador-deluxe_plus-container').show();

			$('#indicador-junior_suite-container').hide();
			if( strCantidadJuniorSuite != "" ) $('#indicador-junior_suite-container').show();

			$('#indicador-executive_suite-container').hide();
			if( strCantidadExecutiveSuite != "" ) $('#indicador-executive_suite-container').show();

			$('#indicador-suite_presidencial-container').hide();
			if( strCantidadSuitePresidencial != "" ) $('#indicador-suite_presidencial-container').show();

			precioTotal = strCantidadDeluxe * precioDeluxe;
			precioTotal += strCantidadDeluxePlus * precioDeluxePlus;
			precioTotal += strCantidadJuniorSuite * precioJuniorSuite;
			precioTotal += strCantidadExecutiveSuite * precioExecutiveSuite;
			precioTotal += strCantidadSuitePresidencial * precioSuitePresidencial;

			precioTotal *= respuesta.cantidadDias;
			console.log(respuesta.cantidadDias);

			$('#indicador-precio_total').text(precioTotal);

			activarPrevious(true);
			checkStep3();
			mostrarPaso(3);
			$(".progress-bar").css("width", "67%");
			$('#btn-next-text').text("Hacer reserva");
			$('#btn-next-icon-next').toggle();
			$('#btn-next-icon-confirm').toggle();
			$('#btn-next').toggleClass("btn-primary btn-success");
			pasoActual = 3;

			return;
		}
	}
	else{
		// La respuesta vino vacía. Muestra la alerta y vuelve a activar el paso actual
		console.log("El servlet no devolvió nada en el paso 2") // No debería pasar
		ActivateModal("Hubo un error procesando tu reserva. Reintentá más tarde o comunicate con nosotros", "UPS...", "danger");
	}
	$('#btn-next-spinner').hide();
	activarPrevious(true);
	checkStep2();

}


function cargarHabitaciones(habitaciones){
	// Carga las habitaciones obtenidas en el request

	// Resetea los precios
	precioDeluxe = 0;
	precioDeluxePlus = 0;
	precioJuniorSuite = 0;
	precioExecutiveSuite = 0;
	precioSuitePresidencial = 0;

	$('#deluxe-card').hide();
	$('#deluxe_plus-card').hide();
	$('#junior_suite-card').hide();
	$('#executive_suite-card').hide();
	$('#suite_presidencial-card').hide();

	for(var index in habitaciones){
		habitacion = habitaciones[index];

		txtDisponibles = habitacion.cantidad > 1 ? " Habitaciones disponibles" : " Habitación disponible";

		switch(habitacion.tipo){
			case "deluxe":
				$('#deluxe-card').show();
				$('#reserva-cantidad_deluxe').attr({"max" : habitacion.cantidad});
				$('#disponible-deluxe').text(habitacion.cantidad + txtDisponibles);
				$('.precio-deluxe').text(habitacion.precio);
				precioDeluxe = habitacion.precio;
				break;

			case "deluxeplus":
				$('#deluxe_plus-card').show();
				$('#reserva-cantidad_deluxe_plus').attr({"max" : habitacion.cantidad});
				$('#disponible-deluxe_plus').text(habitacion.cantidad + txtDisponibles);
				$('.precio-deluxe_plus').text(habitacion.precio);
				precioDeluxePlus = habitacion.precio;
				break;

			case "juniorsuite":
				$('#junior_suite-card').show();
				$('#reserva-cantidad_junior_suite').attr({"max" : habitacion.cantidad});
				$('#disponible-junior_suite').text(habitacion.cantidad + txtDisponibles);
				$('.precio-junior_suite').text(habitacion.precio);
				precioJuniorSuite = habitacion.precio;
				break;

			case "executivesuite":
				$('#executive_suite-card').show();
				$('#reserva-cantidad_executive_suite').attr({"max" : habitacion.cantidad});
				$('#disponible-executive_suite').text(habitacion.cantidad + txtDisponibles);
				$('.precio-executive_suite').text(habitacion.precio);
				precioExecutiveSuite = habitacion.precio;
				break;

			case "suitepresidencial":
				$('#suite_presidencial-card').show();
				$('#reserva-cantidad_suite_presidencial').attr({"max" : habitacion.cantidad});
				$('#disponible-suite_presidencial').text(habitacion.cantidad + txtDisponibles);
				$('.precio-suite_presidencial').text(habitacion.precio);
				precioSuitePresidencial = habitacion.precio;
				break;
		}
	}
}


function success3(resp){

	console.log("exito en AJAX del paso 3");

	// Acá nada más me van a devolver un objeto con o sin error
	if (resp != "" && resp != "{}"){
		respuesta = JSON.parse(resp);
		// console.log(respuesta);
		if(respuesta.alert == true){
			// Si la alert es true, muestra el mensaje que trae, o los valores por defecto
			msjModal = respuesta.mensaje == undefined ? "Hubo un error procesando tu reserva Reintentá más tarde o comunicate con nosotros" : respuesta.mensaje;
			ttlModal = respuesta.titulo == undefined ? "UPS..." : respuesta.titulo;
			tipoModal = respuesta.tipo == undefined ? "danger" : respuesta.tipo;
			ActivateModal(msjModal, ttlModal, tipoModal);
		}
	}
	else{
		// Salió todo como debía
		mostrarPaso(4);
		$('#btn-next-spinner').hide();
		$(".progress-bar").css("width", "100%");
		$(".progress-bar").toggleClass("bg-success");
		$("#step_buttons-container").remove();	// Elimina los botones de anterios, siguiente y cancelar
		pasoActual = 4;
		return
	}
	$('#btn-next-spinner').hide();
	activarPrevious(true);
	checkStep3();
}


/* --------------------------- MANEJO DE RESPUESTAS DEL SERVLET --------------------------- */