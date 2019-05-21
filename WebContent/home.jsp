<%@include file="./master_header.jsp" %>

<script type="text/javascript">

// Activa la opción de la nav bar
$("#nav-item-home").addClass("active");
$("#nav-item-habitaciones").removeClass("active");
$("#nav-item-servicios").removeClass("active");

//Cambia el título de la página
document.title = "Arroz Tower";

</script>

<!--  CAROUSEL  -->
<h1><%= ((String)request.getAttribute("username")) %></h1>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
		<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<!-- First image -->
			<div class="carousel-item active">
				<img class="d-block w-100" src="img/Carousel\torre.jpg" alt="First slide">
				<div class="carousel-caption d-none d-md-block">
				<h5>Visitá nuestras instalaciones</h5>
				<p>Ubicados en el centro de Rosario, lobby y bar abiertos al público</p>
			</div>
			</div>
			<!-- /First image -->
			
			<!-- Second image -->
			<div class="carousel-item">
				<img class="d-block w-100" src="img/Carousel\cama.jpg" alt="Second slide">
				<div class="carousel-caption d-none d-md-block">
				<h5>Conocé nuestras habitaciones</h5>
				<p>Recorré nuestras habitaciones con un tour online para decidir a la hora de la reserva</p>
			</div>
			</div>
			<!-- /Second image -->
			
			<!-- Third image -->
			<div class="carousel-item">
				<img class="d-block w-100" src="img/Carousel\jacuzzi.jpg" alt="Third slide">
				<div class="carousel-caption d-none d-md-block">
				<h5>Asombrate con nuestros servicios</h5>
				<p>Disfrutá de nuestros servicios premium para huéspedes del hotel</p>
			</div>
			</div>
			<!-- /Third image -->
		</div>

	<!--  Carousel controls  -->

	<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
	
	<!--  Carousel controls  -->

</div>

<!--  /CAROUSEL  -->


<!-- CONTACT FORM -->
<!-- https://mdbootstrap.com/docs/jquery/forms/contact/ -->
<!-- Section: Contact v.2-->
<div class="col-md-6 offset-md-3">
	<section class="mb-4">
			<form id="contact-form" name="contact-form" action="home" method="POST">

				<!-- Título del formulario de consulta-->
				<h2 class="h1-responsive font-weight-bold text-center my-4">Contactanos</h2>
				<!-- Subtítulo del formulario de contacto-->
				<p class="text-center w-responsive mx-auto mb-5">¿Aún tenés alguna consulta sobre nuestros servicios? Contactate con nuestra mesa de ayuda
				y nos pondremos en contacto lo antes posible para poder ayudarte</p>
				
				<!-- Contenedor de formulario -->
				<div class="row">
					<h6>Completá el formulario</h6>

					<div class="col-md-12 mb-md-0 mb-5">
			
						<!-- Primer fila-->
						<div class="row my-3">
						
							<!-- NOMBRE-->
							<div class="col-md-6">
								<div class="md-form mb-0">
									<input type="text" id="contacto-nombre" name="nombre" class="form-control" placeholder="Nombre" required>
								</div>
							</div>
							<!-- /NOMBRE-->
						
							<!-- EMAIL-->
							<div class="col-md-6">
								<div class="md-form mb-0">
									<!-- Tiene que haber un js para checkear el mail -->
									<input type="email" id="contacto-email" name="email" class="form-control" placeholder="E-mail" required>
								</div>
							</div>
							<!-- /EMAIL-->
						
						</div>
						<!-- /Primer fila -->
						
						<!-- /Segunda fila-->
						<div class="row my-3">
						
							<!-- ASUNTO -->
							<div class="col-md-12">
								<div class="md-form mb-0">
									<input type="text" id="contacto-asunto" name="asunto" class="form-control" placeholder="Asunto" required>
								</div>
							</div>
							<!-- /ASUNTO -->

						</div>
						<!-- /Segunda fila-->
						
						<!-- Tercer fila -->
						<div class="row my-3">

							<!-- CONSULTA-->
							<div class="col-md-12">
						
								<div class="md-form">
									<textarea type="text" id="contacto-consulta" name="consulta" rows="2" class="form-control md-textarea" placeholder="Tu consulta" required></textarea>
								</div>
						
							</div>
							<!-- /CONSULTA -->

						</div>
						<!-- /Tercer fila -->
					</div>
				</div>
				<!-- /Contenedor de formulario -->

				<!-- Contenedor de iconos de contacto -->
				<div class="row">
					<h6>O consultanos personalemente</h6>
					<div class="col-lg-12" align="center">
						<div class="row justify-content-around my-3">

							<!-- MAPITA -->
							<div class="col-sm-4" id="addr-container" align="center">
								<a href="https://goo.gl/maps/KNkbxxKYwB22" target="_blank" style="text-decoration: none">
									<span>
										<i class="fas fa-map-marked-alt fa-lg" style="color: darkcyan"></i>
										<br/>
										<span id="addr-detail" style="display: none">Rosario, CP 2000, ARG</span>
									</span>
								</a>
							</div>
							<!-- /MAPITA -->

							<!-- TELÉFONO -->
							<div class="col-sm-4" id="phone-container" align="center">
								<a href="https://web.whatsapp.com/send?phone=5493416572511" target="_blank" style="text-decoration: none">
									<span>
										<i class="fas fa-phone fa-lg" id="phone-icon" style="color: darkcyan"></i>
										<br/>
										<span id="phone-detail" style="display: none">+54 341 1234567</span>
									</span>
								</a>
							</div>
							<!-- /TELÉFONO -->

							<!-- CORREO -->
							<div class="col-sm-4" id="email-container" align="center">
								<a href="mailto:contacto@arroztower.com" target="_blank" style="text-decoration: none">
									<span>
										<i class="fas fa-envelope fa-lg" id="email-icon" style="color: darkcyan"></i>
										<br/>
										<span id="email-detail" style="display: none">contacto@arroztower.com</span>
									</span>
								</a>
							</div>
							<!-- /CORREO -->

						</div>
					</div>
				</div>
				<!-- /Contenedor de iconos de contacto -->

				<!-- Contenedor de botón de envío -->
				<div class="row justify-content-center">
					<div class="text-center text-md-left">
						<button class="btn btn-outline-primary" id="contacto-submit" type="submit" value="submit-consulta" name="submit">
							Enviar <i class="far fa-paper-plane"></i>
						</button>
					</div>
					<div class="status"></div>
				</div>
				<!-- /Contenedor de botón de envío -->
		
		
			</form>
	</section>
</div>
<!-- /Section: Contact v.2-->

<!-- /CONTACT FORM -->


<!-- SCRIPTS -->

<script type="text/javascript">
	$(document).ready(function(){

		// Hover de los íconos del formulario de contacto
		$('#addr-container').hover(function(){
			$("#addr-detail").fadeToggle();
		});

		$('#phone-container').hover(function(){
			$("#phone-detail").fadeToggle();
		});

		$('#email-container').hover(function(){
			$("#email-detail").fadeToggle();
		});

	});

</script>

<!-- /SCRIPTS -->

<%@include file="./master_footer.jsp" %>