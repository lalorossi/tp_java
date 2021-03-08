<%@include file="./master_header.jsp" %>
	<%@ page import="entities.Cliente" %>
	<%@ page import="entities.Usuario" %>
	<!-- Scripts del login (bootstrap) -->
	<!-- https://bootsnipp.com/snippets/z1Bpy -->
	<link href=".\bootstrap_login\bootstrap_login.css" rel="stylesheet">
	<script src=".\bootstrap_login\bootstrap_login.js"></script>
	<!-- /Scripts del login (bootstrap) -->

	<!-- Scripts del login (propios) -->
	<script type="text/javascript">

		$(document).ready(function () {

			// Cambia el t�tulo de la p�gina
			document.title = "Arroz Tower - Ingreso";
		});
	</script>
	<!-- /Scripts del login (propios) -->

	<%
		Cliente user = (Cliente)request.getAttribute("usuario");
	%>

	<!-- https://startbootstrap.com/snippets/registration-page/ -->

	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-xl-5 mx-auto">
				<div class="card card-signin flex-row my-5">
					<div class="card-body">

						<hr class="my-4">

						<!-- Formulario de registro -->
						<div id="register-form" class="cool-form">

							<!-- Datos Personales -->
							<h4>Datos personales</h4>

							<!-- Nombre -->
							<div class="form-label-group">
								<h6><%= user.getNombre() %></h6>
							</div>
							<!-- /Nombre -->

							<!-- Apellido -->
							<div class="form-label-group">
								<h6><%= user.getApellido() %></h6>
							</div>
							<!-- /Apellido -->

							<!-- Email -->
							<div class="form-label-group">
								<h6><%= user.getEmail() %></h6>
							</div>
							<!-- /Email -->

							<!-- Documento -->
							<div class="form-label-group">
								<h6><%= user.getDni() %></h6>
							</div>
							<!-- /Documento -->

							<!-- Telefono -->
							<div class="form-label-group">
								<h6><%= user.getTelefono() %></h6>
							</div>
							<!-- /Telefono -->

							<!-- /Datos Personales -->

							<hr class="my-4">

							<!-- Datos de residencia -->
							<h4>Datos de residencia</h4>

							<!-- Pa�s -->
							<div class="form-label-group">
								<h6><%= user.getPais() %></h6>
							</div>
							<!-- /Pa�s -->

							<!-- Ciudad -->
							<div class="form-label-group">
								<h6><%= user.getCiudad() %></h6>
							</div>
							<!-- /Ciudad -->

							<!-- C�digo postal -->
							<div class="form-label-group">
								<h6><%= user.getCodigo_postal() %></h6>
							</div>
							<!-- /C�digo postal -->

							<!-- Direcci�n -->
							<div class="form-label-group">
								<h6><%= user.getDireccion() %></h6>
							</div>
							<!-- /Direcci�n -->

							<!-- /Datos de residencia -->

						</div>
						<!-- Formulario de registro -->
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="./master_footer.jsp" %>