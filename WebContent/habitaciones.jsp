<%@include file=".\master_header.jsp" %>

<script type="text/javascript">

// Activa la opción de la nav bar
$("#nav-item-home").removeClass("active");
$("#nav-item-habitaciones").addClass("active");
$("#nav-item-servicios").removeClass("active");

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
						<h5 class="card-title">Deluxe</h5>
						<p class="card-text">Nuestras habitaciones Deluxe son ideales para una estadía de negocios.</p>
						<a href="habitacion_tipo.jsp?tipoHab=deluxe" class="btn btn-primary">Ver más</a>
					</div>
				</div>

				<div class="card w-75 mt-3" id="habitacion2">
					<img class="card-img-top" src="img/Habitaciones\deluxe_plus.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Deluxe Plus</h5>
						<p class="card-text">Combinación ideal para un viaje de negocios o para alojarse en familia.</p>
						<a href="habitacion_tipo.jsp?tipoHab=deluxe_plus" class="btn btn-primary">Ver más</a>
					</div>
				</div>

				<div class="card w-75 mt-3" id="habitacion3">
					<img class="card-img-top" src="img/Habitaciones\junior_suite.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Junior Suite</h5>
						<p class="card-text">Su exclusiva antesala brinda servicios adicionales para sumar comodidades a su estadía.</p>
						<a href="habitacion_tipo.jsp?tipoHab=junior_suite" class="btn btn-primary">Ver más</a>
					</div>
				</div>
				
				<div class="card w-75 mt-3" id="habitacion4">
					<img class="card-img-top" src="img/Habitaciones\executive_suite.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Executive Suite</h5>
						<p class="card-text">Servicios de última generación, espacio adicional y jacuzzi para dos personas.</p>
						<a href="habitacion_tipo.jsp?tipoHab=executive_suite" class="btn btn-primary">Ver más</a>
					</div>
				</div>

				<div class="card w-75 mt-3" id="habitacion5">
					<img class="card-img-top" src="img/Habitaciones\suite_presidencial.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Suite Presidencial</h5>
						<p class="card-text">Amplia habitación con servicios de categoría y sala de reuniones y equipamiento de última generación.</p>
						<a href="habitacion_tipo.jsp?tipoHab=suite_presidencial" class="btn btn-primary">Ver más</a>
					</div>
				</div>

			</div>
		</div>

	</div>
</div>

<%@include file=".\master_footer.jsp" %>