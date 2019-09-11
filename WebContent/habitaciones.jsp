<%@include file="./master_header.jsp" %>

<script type="text/javascript">

// Activa la opción de la nav bar
$("#nav-item-home").removeClass("active");
$("#nav-item-habitaciones").addClass("active");
$("#nav-item-servicios").removeClass("active");

// Cambia el título de la página
document.title = "Arroz Tower - Habitaciones";

$(document).ready(function(){
	$("#mas_info-1, #mas_info-2, #mas_info-3, #mas_info-4, #mas_info-5").click(function(){
		var num = $(this).attr('id');
		num = num.substr(-1);
		var idDetalles = "#detalles-" + num;
		if($(idDetalles).is(":visible")){
			$(this).html("&#9660;");
			$(idDetalles).slideUp();
		}else{
			$(idDetalles).slideDown();
			$(this).html("&#9650;");
		}
	});
});

</script>

<div class="container">
	<div class="row">
		<div class="col-12 col-sm-3 mt-3">
			<div class="card bg-light mb-3">
				<div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categorías</div>
				<ul class="list-group category_block">
					<li class="list-group-item"><a href="#habitacion1">Deluxe</a></li>
					<li class="list-group-item"><a href="#habitacion2">Deluxe Plus</a></li>
					<li class="list-group-item"><a href="#habitacion3">Junior Suite</a></li>
					<li class="list-group-item"><a href="#habitacion4">Executive Suite</a></li>
					<li class="list-group-item"><a href="#habitacion5">Suite Presidencial</a></li>
				</ul>
			</div>
		</div>
		 <div class="col">
			<div class="row">

				<div class="card w-75 mt-3" id="habitacion1">
					<img class="card-img-top" src="img/Habitaciones\deluxe.jpg" alt="Card image cap">
					<div class="card-body">
						<div class="d-flex justify-content-between">
							<h5 class="card-title">Deluxe <span id="mas_info-1" style="cursor: default">&#9660;</span></h5>
							<span class="border rounded p-2"><i class="fas fa-bed"></i> 2</span>
						</div>
						<p class="card-text">Nuestras habitaciones Deluxe son ideales para una estadía de negocios.</p>
						<div class="col-md-12" id="detalles-1" style="display:none">
							<p>Estas habitaciones pueden disponer de cama King Size (2 x 2 mts.) o dos camas de 1.30 x 1.90 mts cada una.</-1p>
							<ul class="row" style="" id="amenities_container">
								<li class="list-group-item col-xs-6">Acceso a Internet por Banda Ancha desde la habitación.</li>
								<li class="list-group-item col-xs-6">Cofre de seguridad digital</li>
								<li class="list-group-item col-xs-6">Doble línea telefónica</li>
								<li class="list-group-item col-xs-6">Escritorio ejecutivo de trabajo</li>
								<li class="list-group-item col-xs-6">Voice mail</li>
								<li class="list-group-item col-xs-6">Libre acceso a nuestro Health Club &amp; Spa, piscina y gimnasio.</li>
								<li class="list-group-item col-xs-6">Pantalla LCD de 32'' con DVD.</li>
								<li class="list-group-item col-xs-6">Sistema de climatización individual</li>
							</ul>
						</div>
						<form action="home" method="post" role="form">
							<button type="submit" name="submit" value="submit-reserva" class="btn btn-sm btn-warning" style="float: right">
								<a href="" style="text-decoration: none; color: #000000b3; "><i class="fas fa-concierge-bell"></i> Reservar</a>
							</button>
						</form>
					</div>
				</div>

				<div class="card w-75 mt-3" id="habitacion2">
					<img class="card-img-top" src="img/Habitaciones\deluxe_plus.jpg" alt="Card image cap">
					<div class="card-body">
						<div class="d-flex justify-content-between">
							<h5 class="card-title">Deluxe Plus <span id="mas_info-2" style="cursor: default">&#9660;</span></h5>
							<span class="border rounded p-2"><i class="fas fa-bed"></i> 2</span>
						</div>
						<p class="card-text">Combinación ideal para un viaje de negocios o para alojarse en familia.</p>
						<div class="row" id="detalles-2" style="display: none">
							<ul class="row" id="amenities_container-2">
								<li class="list-group-item col-xs-6">Acceso a Internet por Banda Ancha desde la habitación.</li>
								<li class="list-group-item col-xs-6">Desayuno Americano Buffet servido en nuestro restaurante.</li>
								<li class="list-group-item col-xs-6">Doble línea telefónica</li>
								<li class="list-group-item col-xs-6">Escritorio ejecutivo de trabajo</li>
								<li class="list-group-item col-xs-6">Libre acceso a nuestro Health Club &amp; Spa, piscina y gimnasio.</li>
								<li class="list-group-item col-xs-6">Pantalla LCD de 32'' con DVD.</li>
								<li class="list-group-item col-xs-6">Sistema de climatización individual</li>
								<li class="list-group-item col-xs-6">Cofre de seguridad digital</li>
							</ul>
						</div>
						<form action="home" method="post" role="form">
							<button type="submit" name="submit" value="submit-reserva" class="btn btn-sm btn-warning" style="float: right">
								<a href="" style="text-decoration: none; color: #000000b3; "><i class="fas fa-concierge-bell"></i> Reservar</a>
							</button>
						</form>
					</div>
				</div>

				<div class="card w-75 mt-3" id="habitacion3">
					<img class="card-img-top" src="img/Habitaciones\junior_suite.jpg" alt="Card image cap">
					<div class="card-body">
						<div class="d-flex justify-content-between">
							<h5 class="card-title">Junior Suite <span id="mas_info-3" style="cursor: default">&#9660;</span></h5>
							<span class="border rounded p-2"><i class="fas fa-bed"></i> 4</span>
						</div>
						<p class="card-text">Su exclusiva antesala brinda servicios adicionales para sumar comodidades a su estadía.</p>
						<div class="row" id="detalles-3" style="display: none">
						<ul class="row" id="amenities_container-3">
							<li class="list-group-item col-xs-6">Acceso a Internet por Banda Ancha desde la habitación.</li>
							<li class="list-group-item col-xs-6">Cofre de seguridad digital</li>
							<li class="list-group-item col-xs-6">Voice mail</li>
							<li class="list-group-item col-xs-6">Desayuno Americano Buffet servido en nuestro restaurante.</li>
							<li class="list-group-item col-xs-6">Doble línea telefónica</li>
							<li class="list-group-item col-xs-6">Escritorio ejecutivo de trabajo</li>
							<li class="list-group-item col-xs-6">Libre acceso a nuestro Health Club &amp; Spa, piscina y gimnasio.</li>
							<li class="list-group-item col-xs-6">Pantalla LCD de 32'' con DVD.</li>
							<li class="list-group-item col-xs-6">Sistema de climatización individual</li>
						</ul>
						</div>
						<form action="home" method="post" role="form">
							<button type="submit" name="submit" value="submit-reserva" class="btn btn-sm btn-warning" style="float: right">
								<a href="" style="text-decoration: none; color: #000000b3; "><i class="fas fa-concierge-bell"></i> Reservar</a>
							</button>
						</form>
					</div>
				</div>

				<div class="card w-75 mt-3" id="habitacion4">
					<img class="card-img-top" src="img/Habitaciones\executive_suite.jpg" alt="Card image cap">
					<div class="card-body">
						<div class="d-flex justify-content-between">
							<h5 class="card-title">Executive Suite <span id="mas_info-4" style="cursor: default">&#9660;</span></h5>
							<span class="border rounded p-2"><i class="fas fa-bed"></i> 6</span>
						</div>
						<p class="card-text">Servicios de última generación, espacio adicional y jacuzzi para dos personas.</p>
						<div class="row" id="detalles-4" style="display: none">
							<ul class="row" id="amenities_container-4">
								<li class="list-group-item col-xs-6">Acceso a Internet por Banda Ancha desde la habitación.</li>
								<li class="list-group-item col-xs-6">Cofre de seguridad digital</li>
								<li class="list-group-item col-xs-6">Voice mail</li>
								<li class="list-group-item col-xs-6">Desayuno Americano Buffet servido en nuestro restaurante.</li>
								<li class="list-group-item col-xs-6">Doble línea telefónica</li>
								<li class="list-group-item col-xs-6">Escritorio ejecutivo de trabajo</li>
								<li class="list-group-item col-xs-6">Estacionamiento con servicio de valet parking</li>
								<li class="list-group-item col-xs-6">Internet inalámbrico (Wi-Fi) en todas las áreas del hotel</li>
								<li class="list-group-item col-xs-6">Libre acceso a nuestro Health Club &amp; Spa, piscina y gimnasio.</li>
								<li class="list-group-item col-xs-6">Pantalla LCD de 32'' con DVD.</li>
								<li class="list-group-item col-xs-6">Room service las 24 hs</li>
								<li class="list-group-item col-xs-6">Sistema de climatización individual</li>
							</ul>
						</div>
						<form action="home" method="post" role="form">
							<button type="submit" name="submit" value="submit-reserva" class="btn btn-sm btn-warning" style="float: right">
								<a href="" style="text-decoration: none; color: #000000b3; "><i class="fas fa-concierge-bell"></i> Reservar</a>
							</button>
						</form>
					</div>
				</div>

				<div class="card w-75 mt-3" id="habitacion5">
					<img class="card-img-top" src="img/Habitaciones\suite_presidencial.jpg" alt="Card image cap">
					<div class="card-body">
						<div class="d-flex justify-content-between">
							<h5 class="card-title">Suite Presidencial <span id="mas_info-5" style="cursor: default">&#9660;</span></h5>
							<span class="border rounded p-2"><i class="fas fa-bed"></i> 8</span>
						</div>
						<p class="card-text">Amplia habitación con servicios de categoría y sala de reuniones y equipamiento de última generación.</p>
						<div class="row" id="detalles-5" style="display: none">
							<ul class="row" id="amenities_container-5">
								<li class="list-group-item col-xs-6">Acceso a Internet por Banda Ancha desde la habitación.</li>
								<li class="list-group-item col-xs-6">Desayuno Americano Buffet servido en nuestro restaurante.</li>
								<li class="list-group-item col-xs-6">Doble línea telefónica</li>
								<li class="list-group-item col-xs-6">Escritorio ejecutivo de trabajo</li>
								<li class="list-group-item col-xs-6">Estacionamiento con servicio de valet parking</li>
								<li class="list-group-item col-xs-6">Internet inalámbrico (Wi-Fi) en todas las áreas del hotel</li>
								<li class="list-group-item col-xs-6">Libre acceso a nuestro Health Club &amp; Spa, piscina y gimnasio.</li>
								<li class="list-group-item col-xs-6">Pantalla LCD de 32'' con DVD.</li>
								<li class="list-group-item col-xs-6">Room service las 24 hs</li>
								<li class="list-group-item col-xs-6">Sistema de climatización individual</li>
								<li class="list-group-item col-xs-6">Voice mail</li>
								<li class="list-group-item col-xs-6">Cofre de seguridad digital</li>
							</ul>
						</div>
						<form action="home" method="post" role="form">
							<button type="submit" name="submit" value="submit-reserva" class="btn btn-sm btn-warning" style="float: right">
								<a href="" style="text-decoration: none; color: #000000b3; "><i class="fas fa-concierge-bell"></i> Reservar</a>
							</button>
						</form>
					</div>
				</div>

			</div>
		</div>

	</div>
</div>

<%@include file="./master_footer.jsp" %>
