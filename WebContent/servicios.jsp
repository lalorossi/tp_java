<%@include file="./master_header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="entities.Reserva"%>
<%@ page import="entities.TipoServicio"%>
<%@ page import="entities.Habitacion"%>
<%@ page import="java.text.SimpleDateFormat"%>

<script>
	document.title = "Arroz Tower - Servicios";	
</script>

<%
	int resId = (int) request.getAttribute("resId");
	ArrayList<Habitacion> habitaciones = (ArrayList<Habitacion>) request.getAttribute("habitaciones");
	ArrayList<TipoServicio> tipoServicios = (ArrayList<TipoServicio>) request.getAttribute("tipoServicios");
	if (habitaciones.isEmpty()) {
%>
<h2 class="h1-responsive font-weight-bold text-center my-4">No hay
	ninguna reserva para mostrar</h2>
<div class="d-flex justify-content-around my-3">
	<form action="home" method="post" role="form">
		<button type="submit" name="submit" value="submit-reserva"
			class="btn btn-warning" style="float: right">
			<a href="" style="text-decoration: none; color: #000000b3;"><i
				class="fas fa-concierge-bell"></i> Hacer reserva</a>
		</button>
	</form>
</div>
<%
	} else {
%>
<form method="POST" action="servicios">
	<input type="hidden" name="idReserva" value="<%= resId %>"/>
	<div class="row mt-3">
		<div class="col-md-10 offset-md-1">
			<table class="table">
				<thead>
					<tr>
						<th>Num. Hab.</th>
						<%
							// Selector de cantidad por cada servicio
							for (int s = 0; s < tipoServicios.size(); s++) {
						%>
							<th><%=tipoServicios.get(s).getNombre()%></th>
						<%
							}
						%>
					</tr>
				</thead>
				<tbody>
					<%
						for (int h = 0; h < habitaciones.size(); h++) {
								Habitacion hab = habitaciones.get(h);
					%>
					<tr>
						<td><%= hab.getNumero() %></td>
						<%
							for (int s = 0; s < tipoServicios.size(); s++) {
										// Selector de cantidad por cada servicio
										TipoServicio ts = tipoServicios.get(s);
						%>
						<td>
							<div class="input-group input-group-sm">
								<!-- Botón de quitar habitación -->
								<div class="input-group-prepend">
									<button class="btn btn-outline-info remove-service"
										id="<%=hab.getId() + "-" + ts.getId()%>" type="button"
										data-toggle="tooltip" title="Quitar servicio">
										<i class="fas fa-minus"></i>
									</button>
								</div>
	
								<input type="number"
									name="cant_serv_<%=hab.getId() + "-" + ts.getId()%>"
									id="cant-<%=hab.getId() + "-" + ts.getId()%>"
									class="form-control form-control-sm input-cant-servicio" min="0" placeholder="0"></input>
	
								<!-- Botón de agregar habitación -->
								<div class="input-group-append">
									<button class="btn btn-outline-info add-service"
										id="<%=hab.getId() + "-" + ts.getId()%>" type="button"
										data-toggle="tooltip" title="Agregar servicio">
										<i class="fas fa-plus"></i>
									</button>
								</div>
							</div>
						</td>
						<%
							}
						%>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="col-lg-12 mt-4" id="step_buttons-container">
		<div class="d-flex justify-content-around">
			<button class="btn btn-primary" id="btn-submit" type="submit" disabled>
				<span id="btn-next-text">Pedir servicios</span>
				<i class="fas fa-chevron-right" id="btn-next-icon-next"></i>
				<i class="fas fa-check" id="btn-next-icon-confirm" style="display: none"></i>
				<span class="spinner-border spinner-border-sm" id="btn-next-spinner" role="status" aria-hidden="true" style="display: none"></span>
			</button>
		</div>
	</div>
</form>

<%
	}
%>


<script>
function checkSubmit() {
	var $button = $("#btn-submit");
	$button.prop("disabled", true)
	$(".input-cant-servicio").each((idx, elem) => {
		if($(elem).val() != "" && $(elem).val() > 0){
			$button.prop("disabled", false)
		}
	})
}

function agregarServicio() {
	var name = $(this).attr("id");
	console.log(name);
	var current = $("input[name='cant_serv_" + name + "']").val() * 1;
	$("input[name='cant_serv_" + name + "']").val(current + 1);
	checkSubmit();
}

function quitarServicio() {
	var name = $(this).attr("id");
	console.log(name);
	var current = $("input[name='cant_serv_" + name + "']").val() * 1;
	if(current > 0)
	$("input[name='cant_serv_" + name + "']").val(current - 1);
	checkSubmit();
}

jQuery("document").ready(() => {
	$(".add-service").click(agregarServicio);
	$(".remove-service").click(quitarServicio);
});
</script>



<%@include file="./master_footer.jsp"%>
