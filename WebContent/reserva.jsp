<%@include file="./master_header.jsp" %>

	<%@ page import="entities.Reserva" %>

<!-- Archivos del selector de fecha -->
<link rel="stylesheet" type="text/css" href="css/lightpick.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="js/lightpick.js"></script>
<!-- /Archivos del selector de fecha -->

<script src="js/reserva.js"></script>
<script>
	document.title = "Arroz Tower - Reserva";

	$('document').ready(function(){

		// Inicialización del selector de fecha
		var picker = new Lightpick({
			field: document.getElementById('reserva-fecha_desde'),			// Campo de fecha desde
			secondField: document.getElementById('reserva-fecha_hasta'),	// Campo de fecha hasta
			singleDate: false,												// Activa la selección de rango
			numberOfMonths: 2,												// Muestra el calendario de dos meses
			minDate: new Date(),											// Solo permite fechas futuras
			onSelect: function(start, end){									// Función al terminar la selección
				// Setea un string de salida (no usado)
				var str = '';
				str += start ? start.format('Do MMMM YYYY') + ' to ' : '';
				str += end ? end.format('Do MMMM YYYY') : '...';
				checkStep1();	// Comprueba inputs para activar el boton de siguiente
			}
		});

		// Variable para saber qué paso debería estar activado
		// Puede leerse por parámetro de la request
		pasoActual = 1;

		// Funciones para comprobar que se haya completado todo el paso 1 antes de habilitar el siguiente
		$('#reserva-cantidad_personas').change(checkStep1);
		$('#reserva-cantidad_personas').keyup(checkStep1);

		// Funciones para comprobar que se haya completado todo el paso 2 antes de habilitar el siguiente
		$('.step2-input').change(checkStep2);
		$('.step2-input').keyup(checkStep2);

		// Funciones para comprobar que se haya completado todo el paso 3 antes de hacer la reserva
		$('.step3-input').change(checkStep3);

		// Prepara los tooltip de agregar y quitar personas
		$(function () {
			$('[data-toggle="tooltip"]').tooltip()
		})
	});

</script>


<!-- INDICADORES DE FECHA Y PERSONAS -->
	<div class="bg-light my-3">
		<div id="indicadores1-container" style="display: none">
			<div class="d-flex justify-content-around">

				<div class="border border-success rounded p-2">
					<span>
						<i class="far fa-calendar-alt"></i>
					</span>
					<span class="indicador-fecha_desde" id="indicador-fecha_desde"></span>
				</div>

				<div class="border border-success rounded p-2">
					<span>
						<i class="fas fa-calendar-alt"></i>
					</span>
					<span class="indicador-fecha_hasta" id="indicador-fecha_hasta"></span>
				</div>

				<div class="border border-success rounded p-2">
					<span>
						<i class="fas fa-users"></i>
					</span>
					<span class="indicador-cantidad_personas" id="indicador-cantidad_personas"></span>
				</div>

			</div>
		</div>
	</div>
<!-- /INDICADORES DE FECHA Y PERSONAS -->


<!-- PASO 1 - SELECCIÓN DE FECHA -->
	<div class="col-lg-12" id="step1-container">
		<h3>1: Selección de fecha</h3>

		<form id="reserva1-form" name="reserva1-form" action="" method="POST" onsubmit="stepperNext(event)">

			<!-- https://wakirin.github.io/Lightpick/ -->
			<div class="col-md-8 offset-lg-2">
				<div class="row mb-3">

						<!-- Fecha desde -->
						<div class="col-md-4">
							<div class="input-group mb-3 input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text">
										<i class="far fa-calendar-alt"></i>
									</span>
								</div>
								<input type="text" name="fecha_desde" id="reserva-fecha_desde" id="demo-2_1" class="form-control form-control-sm step1-input" placeholder="Desde" required>
							</div>
						</div>

						<!-- Fecha hasta -->
						<div class="col-md-4">
							<div class="input-group mb-3 input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text">
										<i class="fas fa-calendar-alt"></i>
									</span>
								</div>
								<input type="text" name="fecha_hasta" id="reserva-fecha_hasta" id="demo-2_2" class="form-control form-control-sm step1-input" placeholder="Hasta" required>
							</div>
						</div>

						<!-- Cantidad de personas -->
						<div class="col-md-4">
							<div class="input-group mb-3 input-group-sm">
								<!-- Botón de quitar persona -->
								<div class="input-group-prepend">
									<button class="btn btn-outline-info" type="button" onclick="quitarPersona()" data-toggle="tooltip" title="Quitar persona">
										<i class="fas fa-user-minus"></i>
									</button>
								</div>

								<input type="number" name="cantidad_personas" id="reserva-cantidad_personas" class="form-control form-control-sm step1-input" min="1" placeholder="Personas" required></input>

								<!-- Botón de agregar persina -->
								<div class="input-group-append">
									<button class="btn btn-outline-info" type="button" onclick="agregarPersona()" data-toggle="tooltip" title="Agregar persona">
										<i class="fas fa-user-plus"></i>
									</button>
								</div>

							</div>
						</div>
				</div>

				<!-- Contenedor de selector de fechas -->
				<div class="row">
					<div class="col-md-12" id="date_range_picker-container"></div>
				</div>

			</div>

			<input type="submit" value="submit1" id="reserva1-submit" style="display: none"></input>

		</form>

	</div>
<!-- /PASO 1 - SELECCIÓN DE FECHA -->


<!-- PASO 2 - SELECCIÓN DE HABITACIÓN -->
	<div class="col-lg-12" id="step2-container" style="display: none">
		<h2>2: Selección de habitaciones</h2>

		<form id="reserva2-form" name="reserva2-form" action="" method="POST" onsubmit="stepperNext(event)">

			<div class="card-deck justify-content-around">
				<div class="col-md-3" id="deluxe-card" style="display: none">
					<div class="card">
						<!-- Imágen de la tarjeta -->
						<img class="card-img-top" src="img/Habitaciones/deluxe.jpg" alt="Card image cap">

						<!-- Cuerpo de la tarjeta -->
						<div class="card-body">
							<div class="d-flex justify-content-between mb-2">
								<h5 class="card-title">Deluxe</h5>
								<span class="border rounded px-2 py-1 text-info">
									<small>
										<i class="fas fa-bed"></i> 2
									</small>
								</span>
							</div>
							<p class="card-text">Nuestras habitaciones Deluxe son ideales para una estadía de negocios.</p>
							<div class="d-flex justify-content-around">
								<span class="border rounded py-1 px-2 text-success">
									<small>
										<i class="far fa-money-bill-alt"></i> ARS <span class="precio-deluxe"></span>
									</small>
								</span>
							</div>
						</div>

						<!-- Footer de la tarjeta -->
						<div class="card-footer">
							<div class="col-md-8 offset-md-2">
								<div class="input-group input-group-sm">
									<!-- Botón de quitar habitación -->
									<div class="input-group-prepend">
										<button class="btn btn-outline-info" type="button" onclick="quitarHabitacion('reserva-cantidad_deluxe')" data-toggle="tooltip" title="Quitar habitación">
											<i class="fas fa-minus"></i>
										</button>
									</div>

									<input type="number" name="cantidad_deluxe" id="reserva-cantidad_deluxe" class="form-control form-control-sm step2-input" min="0" placeholder="0"></input>

									<!-- Botón de agregar habitación -->
									<div class="input-group-append">
										<button class="btn btn-outline-info" type="button" onclick="agregarHabitacion('reserva-cantidad_deluxe')" data-toggle="tooltip" title="Agregar habitación">
											<i class="fas fa-plus"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-md-12 mt-1" style="text-align: center">
								<span class="text-muted" id="disponible-deluxe"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3" id="deluxe_plus-card" style="display: none">
					<div class="card">
						<!-- Imágen de la tarjeta -->
						<img class="card-img-top" src="img/Habitaciones/deluxe_plus.jpg" alt="Card image cap">

						<!-- Cuerpo de la tarjeta -->
						<div class="card-body">
							<div class="d-flex justify-content-between mb-2">
								<h5 class="card-title">Deluxe Plus</h5>
								<span class="border rounded px-2 py-1 text-info">
									<small>
										<i class="fas fa-bed"></i> 2
									</small>
								</span>
							</div>
							<p class="card-text">Combinación ideal para un viaje de negocios o para alojarse en familia.</p>
							<div class="d-flex justify-content-around">
								<span class="border rounded py-1 px-2 text-success">
									<small>
										<i class="far fa-money-bill-alt"></i> ARS <span class="precio-deluxe_plus"></span>
									</small>
								</span>
							</div>
						</div>

						<!-- Footer de la tarjeta -->
						<div class="card-footer">
							<div class="col-md-8 offset-md-2">
								<div class="input-group input-group-sm">
									<!-- Botón de quitar habitación -->
									<div class="input-group-prepend">
										<button class="btn btn-outline-info" type="button" onclick="quitarHabitacion('reserva-cantidad_deluxe_plus')" data-toggle="tooltip" title="Quitar habitación">
											<i class="fas fa-minus"></i>
										</button>
									</div>

									<input type="number" name="cantidad_deluxe_plus" id="reserva-cantidad_deluxe_plus" class="form-control form-control-sm step2-input" min="0" placeholder="0"></input>

									<!-- Botón de agregar habitación -->
									<div class="input-group-append">
										<button class="btn btn-outline-info" type="button" onclick="agregarHabitacion('reserva-cantidad_deluxe_plus')" data-toggle="tooltip" title="Agregar habitación">
											<i class="fas fa-plus"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-md-12 mt-1" style="text-align: center">
								<span class="text-muted" id="disponible-deluxe_plus"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3" id="junior_suite-card" style="display: none">
					<div class="card">
						<!-- Imágen de la tarjeta -->
						<img class="card-img-top" src="img/Habitaciones/junior_suite.jpg" alt="Card image cap">

						<!-- Cuerpo de la tarjeta -->
						<div class="card-body">
							<div class="d-flex justify-content-between mb-2">
								<h5 class="card-title">Junior Suite</h5>
								<span class="border rounded px-2 py-1 text-info">
									<small>
										<i class="fas fa-bed"></i> 4
									</small>
								</span>
							</div>
							<p class="card-text">Su exclusiva antesala brinda servicios adicionales para sumar comodidades a su estadía.</p>
							<div class="d-flex justify-content-around">
								<span class="border rounded py-1 px-2 text-success">
									<small>
										<i class="far fa-money-bill-alt"></i> ARS <span class="precio-junior_suite"></span>
									</small>
								</span>
							</div>
						</div>

						<!-- Footer de la tarjeta -->
						<div class="card-footer">
							<div class="col-md-8 offset-md-2">
								<div class="input-group input-group-sm">
									<!-- Botón de quitar habitación -->
									<div class="input-group-prepend">
										<button class="btn btn-outline-info" type="button" onclick="quitarHabitacion('reserva-cantidad_junior_suite')" data-toggle="tooltip" title="Quitar habitación">
											<i class="fas fa-minus"></i>
										</button>
									</div>

									<input type="number" name="cantidad_junior_suite" id="reserva-cantidad_junior_suite" class="form-control form-control-sm step2-input" min="0" placeholder="0"></input>

									<!-- Botón de agregar habitación -->
									<div class="input-group-append">
										<button class="btn btn-outline-info" type="button" onclick="agregarHabitacion('reserva-cantidad_junior_suite')" data-toggle="tooltip" title="Agregar habitación">
											<i class="fas fa-plus"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-md-12 mt-1" style="text-align: center">
								<span class="text-muted" id="disponible-junior_suite"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3" id="executive_suite-card" style="display: none">
					<div class="card">
						<!-- Imágen de la tarjeta -->
						<img class="card-img-top" src="img/Habitaciones/executive_suite.jpg" alt="Card image cap">

						<!-- Cuerpo de la tarjeta -->
						<div class="card-body">
							<div class="d-flex justify-content-between mb-2">
								<h5 class="card-title">Executive Suite</h5>
								<span class="border rounded px-2 py-1 text-info">
									<small>
										<i class="fas fa-bed"></i> 6
									</small>
								</span>
							</div>
							<p class="card-text">Servicios de última generación, espacio adicional y jacuzzi para dos personas.</p>
							<div class="d-flex justify-content-around">
								<span class="border rounded py-1 px-2 text-success">
									<small>
										<i class="far fa-money-bill-alt"></i> ARS <span class="precio-executive_suite"></span>
									</small>
								</span>
							</div>
						</div>

						<!-- Footer de la tarjeta -->
						<div class="card-footer">
							<div class="col-md-8 offset-md-2">
								<div class="input-group input-group-sm">
									<!-- Botón de quitar habitación -->
									<div class="input-group-prepend">
										<button class="btn btn-outline-info" type="button" onclick="quitarHabitacion('reserva-cantidad_executive_suite')" data-toggle="tooltip" title="Quitar habitación">
											<i class="fas fa-minus"></i>
										</button>
									</div>

									<input type="number" name="cantidad_executive_suite" id="reserva-cantidad_executive_suite" class="form-control form-control-sm step2-input" min="0" placeholder="0"></input>

									<!-- Botón de agregar habitación -->
									<div class="input-group-append">
										<button class="btn btn-outline-info" type="button" onclick="agregarHabitacion('reserva-cantidad_executive_suite')" data-toggle="tooltip" title="Agregar habitación">
											<i class="fas fa-plus"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-md-12 mt-1" style="text-align: center">
								<span class="text-muted" id="disponible-executive_suite"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3" id="suite_presidencial-card" style="display: none">
					<div class="card">
						<!-- Imágen de la tarjeta -->
						<img class="card-img-top" src="img/Habitaciones/suite_presidencial.jpg" alt="Card image cap">

						<!-- Cuerpo de la tarjeta -->
						<div class="card-body">
							<div class="d-flex justify-content-between mb-2">
								<h5 class="card-title">Suite Presidencial</h5>
								<span class="border rounded px-2 py-1 text-info">
									<small>
										<i class="fas fa-bed"></i> 8
									</small>
								</span>
							</div>
							<p class="card-text">Amplia habitación con servicios de categoría y sala de reuniones y equipamiento de última generación.</p>
							<div class="d-flex justify-content-around">
								<span class="border rounded py-1 px-2 text-success">
									<small>
										<i class="far fa-money-bill-alt"></i> ARS <span class="precio-suite_presidencial"></span>
									</small>
								</span>
							</div>
						</div>

						<!-- Footer de la tarjeta -->
						<div class="card-footer">
							<div class="col-md-8 offset-md-2">
								<div class="input-group input-group-sm">
									<!-- Botón de quitar habitación -->
									<div class="input-group-prepend">
										<button class="btn btn-outline-info" type="button" onclick="quitarHabitacion('reserva-cantidad_suite_presidencial')" data-toggle="tooltip" title="Quitar habitación">
											<i class="fas fa-minus"></i>
										</button>
									</div>

									<input type="number" name="cantidad_suite_presidencial" id="reserva-cantidad_suite_presidencial" class="form-control form-control-sm step2-input" min="0" placeholder="0"></input>

									<!-- Botón de agregar habitación -->
									<div class="input-group-append">
										<button class="btn btn-outline-info" type="button" onclick="agregarHabitacion('reserva-cantidad_suite_presidencial')" data-toggle="tooltip" title="Agregar habitación">
											<i class="fas fa-plus"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-md-12 mt-1" style="text-align: center">
								<span class="text-muted" id="disponible-suite_presidencial"></span>
							</div>
						</div>
					</div>
				</div>


			</div>

			<input type="submit" value="submit2" id="reserva2-submit" style="display: none"></input>

		</form>

	</div>
<!-- /PASO 2 - SELECCIÓN DE HABITACIÓN -->


<!-- PASO 3 - CONFIRMACIÓN DE RESERVA -->
	<div class="col-lg-12" id="step3-container" style="display: none">
		<h2>3: Confirmación de reserva</h2>

		<div class="col-md-6 offset-md-3" id="executive_suite-card">
			<div class="card">

				<!-- Cuerpo de la tarjeta -->
				<div class="card-body">
					<table class="table">
						<tbody>
							<tr>
								<th scope="row">Fecha de entrada</th>
								<td></td>
								<td></td>
								<td>
									<span class="indicador-fecha_desde"></span>
								</td>
							</tr>
							<tr>
								<th scope="row">Fecha de salida</th>
								<td></td>
								<td></td>
								<td>
									<span class="indicador-fecha_hasta"></span>
								</td>
							</tr>
							<tr>
								<th scope="row">Cantidad de personas</th>
								<td></td>
								<td></td>
								<td>
									<span class="indicador-cantidad_personas"></span>
								</td>
							</tr>
							<tr id="indicador-deluxe-container">
								<th scope="row">Deluxe</th>
								<td>
									<span class="border rounded py-1 px-2 text-success">
										<small>
											<i class="far fa-money-bill-alt"></i> ARS <span class="precio-deluxe"></span>
										</small>
									</span>
								</td>
								<td>
									<span class="border rounded px-2 py-1 text-info">
										<small>
											<i class="fas fa-bed"></i> 2
										</small>
									</span>
								</td>
								<td>
									<span id="indicador-cantidad_deluxe"></span>
								</td>
							</tr>
							<tr id="indicador-deluxe_plus-container">
								<th scope="row">Deluxe Plus</th>
								<td>
									<span class="border rounded py-1 px-2 text-success">
										<small>
											<i class="far fa-money-bill-alt"></i> ARS <span class="precio-deluxe_plus"></span>
										</small>
									</span>
								</td>
								<td>
									<span class="border rounded px-2 py-1 text-info">
										<small>
											<i class="fas fa-bed"></i> 2
										</small>
									</span>
								</td>
								<td>
									<span id="indicador-cantidad_deluxe_plus"></span>
								</td>
							</tr>
							<tr id="indicador-junior_suite-container">
								<th scope="row">Junior Suite</th>
								<td>
									<span class="border rounded py-1 px-2 text-success">
										<small>
											<i class="far fa-money-bill-alt"></i> ARS <span class="precio-junior_suite"></span>
										</small>
									</span>
								</td>
								<td>
									<span class="border rounded px-2 py-1 text-info">
										<small>
											<i class="fas fa-bed"></i> 4
										</small>
									</span>
								</td>
								<td>
									<span id="indicador-cantidad_junior_suite"></span>
								</td>
							</tr>
							<tr id="indicador-executive_suite-container">
								<th scope="row">Executive Suite</th>
								<td>
									<span class="border rounded py-1 px-2 text-success">
										<small>
											<i class="far fa-money-bill-alt"></i> ARS <span class="precio-executive_suite"></span>
										</small>
									</span>
								</td>
								<td>
									<span class="border rounded px-2 py-1 text-info">
										<small>
											<i class="fas fa-bed"></i> 6
										</small>
									</span>
								</td>
								<td>
									<span id="indicador-cantidad_executive_suite"></span>
								</td>
							</tr>
							<tr id="indicador-suite_presidencial-container">
								<th scope="row">Suite Presidencial</th>
								<td>
									<span class="border rounded py-1 px-2 text-success">
										<small>
											<i class="far fa-money-bill-alt"></i> ARS <span class="precio-suite_presidencial"></span>
										</small>
									</span>
								</td>
								<td>
									<span class="border rounded px-2 py-1 text-info">
										<small>
											<i class="fas fa-bed"></i> 8
										</small>
									</span>
								</td>
								<td>
									<span id="indicador-cantidad_suite_presidencial"></span>
								</td>
							</tr>
							<tr>
								<th scope="row">Total</th>
								<td></td>
								<th scope="row">
									ARS <span id="indicador-precio_total"></span>
								</th>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- Footer de la tarjeta -->
				<div class="card-footer">
					<div class="col-md-12 mt-1" style="text-align: center">
						<form id="reserva3-form" name="reserva3-form" action="" method="POST" onsubmit="stepperNext(event)">
							<div class="custom-control custom-switch">
								<input type="checkbox" class="custom-control-input step3-input" id="reserva-confirmar" value="reserva-confirmar" required>
								<label class="custom-control-label" for="reserva-confirmar">Confirmo que los datos de la reserva son correctos</label>
							</div>
							<input type="submit" value="submit3" id="reserva3-submit" style="display: none"></input>
						</form>
					</div>
				</div>
			</div>
		</div>


	</div>
<!-- /PASO 3 - CONFIRMACIÓN DE RESERVA -->


<!-- PASO 4 - MENSAJE DE ÉXITO -->
	<div class="col-lg-12" id="step4-container" style="display: none">
		<h2>Reserva completada!</h2>
		<div class="col-md-4 offset-4 border rounded p-3">
			<h5 class="col-md-12">Te esperamos el <span class="indicador-fecha_desde"></span> en nuestras instalaciones!</h5>
			<h6 class="col-md-12 mt-2">También te enviamos un mail a tu dirección de correo para que guardes los detalles de la reserva</h6>
			<div align="center">
				<a class="btn btn-info rounded mt-3" href="home">
					<i class="fab fa-galactic-senate fa-lg"></i> Página Principal
				</a>
			</div>
		</div>
		<!-- No sé qué poner acá. Capaz mostrar de nuevo los datos de la reserva y un botón fancy para ir al home a "mis reservas" -->
	</div>
<!-- /PASO 4 - MENSAJE DE ÉXITO -->


<!-- BOTONES DE NAVEGACIÓN -->
<div class="col-lg-12 mt-4" id="step_buttons-container">
	<div class="d-flex justify-content-around">
		<button class="btn btn-primary" id="btn-prev" onClick="stepperPrevious()" disabled>
			<i class="fas fa-chevron-left"></i>
			<span>Anterior</span>
		</button>

		<form id="cancelar_reserva-form" name="cancelar_reserva-form" action="reserva" method="POST">
			<div class="btn-group" role="group" aria-label="Basic example">
				<button type="submit" name="cancelar_reserva" value="cancelar" class="btn-cancelar btn btn-outline-danger" style="display: none">Sí</button>
				<button type="button" class="btn-cancelar btn btn-danger rounded" onclick="cancelarReserva()">Cancelar Reserva</button>
				<button type="button" class="btn-cancelar btn btn-outline-danger" disabled style="display: none">Seguro?</button>
				<button type="button" class="btn-cancelar btn btn-outline-danger" style="display: none" onclick="cancelarReserva()">No</button>
			</div>
		</form>

		<button class="btn btn-primary" id="btn-next" onClick="submitNextForm()" disabled>
			<span id="btn-next-text">Siguiente</span>
			<i class="fas fa-chevron-right" id="btn-next-icon-next"></i>
			<i class="fas fa-check" id="btn-next-icon-confirm" style="display: none"></i>
			<span class="spinner-border spinner-border-sm" id="btn-next-spinner" role="status" aria-hidden="true" style="display: none"></span>
		</button>
	</div>
</div>
<!-- /BOTONES DE NAVEGACIÓN -->

<!-- BARRA DE PROGRESO -->
<div class="col-lg-12 my-2">
	<div class="progress">
		<!-- La barra se mueve de a 25% -->
	  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="1" aria-valuemin="0" aria-valuemax="3"></div>
	</div>
</div>
<!-- /BARRA DE PROGRESO -->







<%@include file="./master_footer.jsp" %>
