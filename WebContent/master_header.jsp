<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<title>Arroz Tower</title>

	<!-- Favicon -->
	<link rel="icon" href="img/favicon.ico" type="image/ico" sizes="16x16">
	<!-- /Favicon -->


	<!-- BOOTSTRAP SOURCES -->
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<!-- JQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

	<!-- Bootrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<!-- /BOOTSTRAP SOURCES -->


	<!-- FONT AWESOME -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<!-- /FONT AWESOME -->


	<script type="text/javascript">

	/* Funciones para manipulación del modal */

	function setModalText(mensaje){
		$("#modal-text").text(mensaje);
	}

	function showModal(idModal){
		// Por defecto muestra el modal de mensaje normal
		if(idModal == undefined)
			idModal = "modalMensaje";

		$('#'+idModal).modal('show');

		// Pone el focus en el boton de cerrar, para apretar enter y cerrarlo sin problema
		$('#'+idModal).on('shown.bs.modal', function () {
			  $('#btn-close_modal').trigger('focus')
			})
	}

	// Estilización del modal según la ocasión
	function setModalMode(idModal, mode){

		// Por defecto usa el modal de mensaje normal
		if(idModal == undefined)
			idModal = "modalMensaje";

		$("#"+idModal).find(".modal-header").addClass("bg-"+mode);
		$("#modalMensajeLabel").addClass("text-white");
		$("#btn-close_modal").addClass("btn-"+mode);

	}

	function modalDanger(mensaje, idModal){
		setModalMode(idModal, "danger");
		setModalText(mensaje);
		showModal(idModal);
	}
	function modalSuccess(mensaje, idModal){
		setModalMode(idModal, "success");
		setModalText(mensaje);
		showModal(idModal);
	}
	function modalWarning(mensaje, idModal){
		setModalMode(idModal, "warning");
		setModalText(mensaje);
		showModal(idModal);
	}

	/* --Funciones para manipulación del modal-- */

	$(document).ready(function(){

		// Hover del boton de reserva
		$("#navbar-btn-reserva").hover(function(){
			$("#navbar-btn-text").toggle(150);
		});

		// Muestra el dropdown del navbar si hay un usuario loggeado
		<%-- if( <%= (Object) request.getSession().getAttribute("usuarioActual") == null %> ){ --%>
		if( <%= (String) request.getAttribute("username") %> != "admin@admin.com"){
			$("#dropdown-logged_user").hide();
		}
		else{
			$("#dropdown-logged_user").show();
		}
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

		<!-- Botón de reserva -->
		<button id="navbar-btn-reserva" class="btn btn-sm btn-outline-warning navbar-btn" type="button">
			<a href="/reserva" style="text-decoration: none; color: #000000b3; "><span id="navbar-btn-text" style="display: none">Reserva  </span> <i class="fas fa-concierge-bell"></i></a>
		</button>
		<!-- /Botón de reserva -->

		<!-- Botón de usuario -->
		<div class="btn-group ml-2" id="dropdown-logged_user">
			<button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fas fa-user-alt"></i>
			</button>
			<div class="dropdown-menu dropdown-menu-right">
				<a class="dropdown-item" href="#">Mi usuario</a>
				<a class="dropdown-item" href="#">Mis reservas</a>
				<!-- <a class="dropdown-item" href="#">Something else here</a> -->
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#">Cerrar Sesión</a>
			</div>
		</div>
		<!-- /Botón de usuario -->
	</div>
</nav>

<!--  /NAV BAR  -->


<!-- MODAL -->

<div class="modal fade" id="modalMensaje" tabindex="-1" role="dialog" aria-labelledby="modalMensajeLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalMensajeLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <span id="modal-text"></span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="btn-close_modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- /MODAL -->