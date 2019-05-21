<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<title>Arroz Tower</title>

	<!-- BOOTSTRAP SOURCES -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<!--
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<!-- /BOOTSTRAP SOURCES -->

	<!-- FONT AWESOME -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<!-- /FONT AWESOME -->
	
	<!-- NavBar Script -->
	<script type="text/javascript">

	$(document).ready(function(){

			// Hover del boton de reserva
			$("#navbar-btn-reserva").hover(function(){
				$("#navbar-btn-text").toggle(150);
			});
		});

	</script>
	<!-- /NavBar Script -->

</head>
<body>

<!--  NAV BAR  -->

<nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-between">
	<a class="navbar-brand" href="home.jsp"><i class="fab fa-galactic-senate fa-lg"></i> Arroz Tower</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<!-- OJO: los links en la barra no deberían ir al .jsp -->
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
			<li class="nav-item active" id="nav-item-home">
				<a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item" id="nav-item-habitaciones">
				<a class="nav-link" href="habitaciones.jsp">Habitaciones </a>
			</li>
			<li class="nav-item" id="nav-item-servicios">
				<a class="nav-link" href="#">Servicios </a>
			</li>
		</ul>
		<form action="/tp_java/home" method="post" role="form">
			<button id="navbar-btn-reserva" type="submit" name="submit" value="submit-reserva" class="btn btn-sm btn-outline-warning navbar-btn">
				<a href="/reserva" style="text-decoration: none; color: #000000b3; "><span id="navbar-btn-text" style="display: none">Reserva  </span> <i class="fas fa-concierge-bell"></i></a>
			</button>
		</form>
	</div>
</nav>

<!--  /NAV BAR  -->
