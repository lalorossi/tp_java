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


<div class="container">
    <div class="row">
        <div class="col-12 col-sm-3">
            <div class="card bg-light mb-3">
                <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categorías</div>
                <ul class="list-group category_block">
                    <li class="list-group-item"><a href="category.html">Deluxe</a></li>
                    <li class="list-group-item"><a href="category.html">Deluxe Plus</a></li>
                    <li class="list-group-item"><a href="category.html">Junior Suite</a></li>
                    <li class="list-group-item"><a href="category.html">Executive Suite</a></li>
                    <li class="list-group-item"><a href="category.html">Suite Presidencial</a></li>
                </ul>
            </div>            
        </div>
        <div class="col">
            <div class="row">
            
            	<div class="card w-75" >
  					<img class="card-img-top" src="img/deluxe.jpg" alt="Card image cap">
  					<div class="card-body">
    					<h5 class="card-title">Deluxe</h5>
    					<p class="card-text">Nuestras habitaciones Deluxe son ideales para una estadía de negocios.</p>
    					<a href="#" class="btn btn-primary">Ver más</a>
  					</div>
				</div>    
                
                <div class="card w-75">
  					<img class="card-img-top" src="img/deluxe_plus.jpg" alt="Card image cap">
  					<div class="card-body">
    					<h5 class="card-title">Deluxe Plus</h5>
    					<p class="card-text">Combinación ideal para un viaje de negocios o para alojarse en familia.</p>
    					<a href="#" class="btn btn-primary">Ver más</a>
  					</div>
				</div>  
				
				<div class="card w-75">
  					<img class="card-img-top" src="img/junior_suite.jpg" alt="Card image cap">
  					<div class="card-body">
    					<h5 class="card-title">Junior Suite</h5>
    					<p class="card-text">Su exclusiva antesala brinda servicios adicionales para sumar comodidades a su estadía.</p>
    					<a href="#" class="btn btn-primary">Ver más</a>
  					</div>
				</div>  
				
				<div class="card w-75">
  					<img class="card-img-top" src="img/executive_suite.jpg" alt="Card image cap">
  					<div class="card-body">
    					<h5 class="card-title">Executive Suite</h5>
    					<p class="card-text">Servicios de última generación, espacio adicional y jacuzzi para dos personas.</p>
    					<a href="#" class="btn btn-primary">Ver más</a>
  					</div>
				</div>  
				
				<div class="card w-75">
  					<img class="card-img-top" src="img/suite_presidencial.jpg" alt="Card image cap">
  					<div class="card-body">
    					<h5 class="card-title">Suite Presidencial</h5>
    					<p class="card-text">Amplia habitación con servicios de categoría y sala de reuniones y equipamiento de última generación.</p>
    					<a href="#" class="btn btn-primary">Ver más</a>
  					</div>
				</div>  
                                
            </div>
        </div>

    </div>
</div>

<%@include file=".\master_footer.jsp" %>