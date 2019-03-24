<%@include file=".\master_header.jsp" %>

<!--  NAV BAR  -->

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  	<a class="navbar-brand" href="#">Arroz Tower</a>
  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
  	</button>
  	<div class="collapse navbar-collapse" id="navbarNav">
    	<ul class="navbar-nav">
	      	<li class="nav-item active">
	        	<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
	     	</li>
	      	<li class="nav-item">
	        	<a class="nav-link" href="#">Habitaciones </a>
	      	</li>
	      	<li class="nav-item">
	        	<a class="nav-link" href="#">Servicios </a>
	      	</li>
	      	<li class="nav-item">
	      		<button class="btn btn-sm btn-outline-danger p-0" type="submit">
	      			<a class="nav-link" href="#">Reserva <i class="fas fa-concierge-bell"></i></a>
	      		</button>
	      	</li>
    	</ul>
  	</div>
</nav>

<!--  /NAV BAR  -->

<!--  CAROUSEL  -->

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
 		<ol class="carousel-indicators">
	    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
 		</ol>
 		<div class="carousel-inner">
 			<!-- First image -->
   		<div class="carousel-item active">
     			<img class="d-block w-100" src="img/torre.jpg" alt="First slide">
 				<div class="carousel-caption d-none d-md-block">
	    		<h5>Visitá nuestras instalaciones</h5>
	    		<p>Ubicados en el centro de Rosario, lobby y bar abiertos al público</p>
    		</div>
  			</div>
 			<!-- /First image -->
 			
 			<!-- Second image -->
   		<div class="carousel-item">
     			<img class="d-block w-100" src="img/cama.jpg" alt="Second slide">
 				<div class="carousel-caption d-none d-md-block">
	    		<h5>Conocé nuestras habitaciones</h5>
	    		<p>Recorré nuestras habitaciones con un tour online para decidir a la hora de la reserva</p>
    		</div>
  			</div>
 			<!-- /Second image -->
 			
 			<!-- Third image -->
   		<div class="carousel-item">
     			<img class="d-block w-100" src="img/jacuzzi.jpg" alt="Third slide">
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
<!--Section: Contact v.2-->
<div class="col-md-6 offset-md-3">
	<section class="mb-4">
           <form id="contact-form" name="contact-form" action="<!-- mail.php -->" method="POST">
		
		    <!--Título del formulario de consulta-->
		    <h2 class="h1-responsive font-weight-bold text-center my-4">Contactanos</h2>
		    <!--Subtítulo del formulario de contacto-->
		    <p class="text-center w-responsive mx-auto mb-5">¿Aún tenés alguna consulta sobre nuestros servicios? Contactate con nuestra mesa de ayuda
		    y nos pondremos en contacto lo antes posible para poder ayudarte</p>
		    
			<!-- Contenedor de formulario -->
		    <div class="row">
	        	<h6>Completá el formulario</h6>

		        <div class="col-md-12 mb-md-0 mb-5">
		
	                <!--Primer fila-->
	                <div class="row my-3">
	
	                    <!--NOMBRE-->
	                    <div class="col-md-6">
	                        <div class="md-form mb-0">
	                            <input type="text" id="contacto-nombre" name="nombre" class="form-control" placeholder="Nombre">
	                        </div>
	                    </div>
	                    <!--/NOMBRE-->
	
	                    <!--EMAIL-->
	                    <div class="col-md-6">
	                        <div class="md-form mb-0">
	            				<!-- Tiene que haber un js para checkear el mail -->
	                            <input type="email" id="contacto-email" name="email" class="form-control" placeholder="E-mail">
	                        </div>
	                    </div>
	                    <!--EAIL-->
	
	                </div>
	                <!--/Primer fila ->
	
	                <!--/Segunda fila-->
	                <div class="row my-3">
	                
	                	<!-- ASUNTO -->
	                    <div class="col-md-12">
	                        <div class="md-form mb-0">
	                            <input type="text" id="contacto-asunto" name="asunto" class="form-control" placeholder="Asunto">
	                        </div>
	                    </div>
	                    <!-- /ASUNTO -->
	                    
	                </div>
	                <!--/Segunda fila-->
	
	                <!--Tercer fila -->
	                <div class="row my-3">
	
	                    <!--CONSULTA-->
	                    <div class="col-md-12">
	
	                        <div class="md-form">
	                            <textarea type="text" id="contacto-consulta" name="consulta" rows="2" class="form-control md-textarea" placeholder="Tu consulta"></textarea>
	                        </div>
	
	                    </div>
	                    <!-- CONSULTA -->
	                    
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
		        		<!-- Los botones pueden llevarte a maps, mandar un mail o hablar por whatsapp -->
		        		
		        		<!-- MAPITA -->
		                <div class="col-sm-4" id="addr-container" align="center">
		                	<span>
			                	<i class="fas fa-map-marked-alt fa-lg" style="color: darkcyan"></i>
			                	<br/>
			                    <span id="addr-detail" style="display: none">Rosario, CP 2000, ARG</span>
		                    </span>
		                </div>
		                <!-- /MAPITA -->
		                
		                <!-- TELÉFONO -->
		                <div class="col-sm-4" id="phone-container" align="center">
		                	<span>
			                	<i class="fas fa-phone fa-lg" id="phone-icon" style="color: darkcyan"></i>
			                	<br/>
			                    <span id="phone-detail" style="display: none">+54 341 1234567</span>
		                    </span>
		                </div>
		                <!-- /TELÉFONO -->
		                
		                <!-- CORREO -->
		                <div class="col-sm-4" id="email-container" align="center">
		                	<span>
			                	<i class="fas fa-envelope fa-lg" id="email-icon" style="color: darkcyan"></i>
			                	<br/>
			                    <span id="email-detail" style="display: none">contacto@arroztower.com</span>
		                    </span>
		                </div>
		                <!-- /CORREO -->
		                
			        </div>
			    </div>
			</div>
			<!-- Contenedor de iconos de contacto -->
			
			<!-- Contenedor de botón de envío -->
			<div class="row justify-content-center">
		        <!--Grid column-->
	            <div class="text-center text-md-left">
	            	<!-- Se activa cuando se llenan los campos (JS) -->
	                <button class="btn btn-outline-primary" id="contacto-submit" type="submit">
	                	Enviar <i class="far fa-paper-plane"></i>
	                </button>
	            </div>
	            <div class="status"></div>
	        	<!--Grid column-->
	        </div>
			<!-- /Contenedor de botón de envío -->
		
		
           </form>
	</section>
</div>
<!--Section: Contact v.2-->

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
	    
	    // Para habilitar o deshabilitar el submit del form de contacto
   	  	validarFormContacto();
   	  	$("contacto-nombre, #contacto-email, #contacto-asunto, #contacto-consulta").on('keyup', validarFormContacto);

	});

	// Valida que el formulario de contacto esté completo para habilitar el botón de submit
	function validarFormContacto() {
   	  var inputsLlenos = 0;
   	  
   	  var formInputs = $("contacto-nombre, #contacto-email, #contacto-asunto, #contacto-consulta")

   	  formInputs.each(function(e) {
   	    if ($(this).val()) {
   	    	inputsLlenos += 1;
   	    }
   	  });

   	  if (inputsLlenos == formInputs.length) {
   	    $("#contacto-submit").prop("disabled", false);
   	  } else {
   	    $("#contacto-submit").prop("disabled", true);
   	  }
   	}
</script>

<!-- /SCRIPTS -->

<%@include file=".\master_footer.jsp" %>