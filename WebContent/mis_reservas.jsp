<%@include file="./master_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="entities.Reserva" %>
<%@ page import="entities.TipoHabitacion" %>
<%@ page import="java.text.SimpleDateFormat" %>

<script>
document.title = "Arroz Tower - Mis Reservas";


function cancelarReserva(idReserva){
	// Muestra los botones de confirmación
	$('.btn-cancelar-' + idReserva).toggle();
}

function detalleHabitaciones(idReserva){
	$("#detalleReserva-" + idReserva).toggle();
	$(".iconoDetalle-" + idReserva).toggle();
}
 </script>
<div class="row mt-3">
	<div class="col-md-10 offset-md-1">
	<%
		ArrayList<Reserva> reservas = (ArrayList<Reserva>)request.getAttribute("reservasDeUsuario");
			if(reservas.isEmpty()){
	%>
		<h2 class="h1-responsive font-weight-bold text-center my-4">No hay ninguna reserva para mostrar</h2>
		<div class="d-flex justify-content-around my-3">
			<form action="home" method="post" role="form">
				<button type="submit" name="submit" value="submit-reserva" class="btn btn-warning" style="float: right">
					<a href="" style="text-decoration: none; color: #000000b3; "><i class="fas fa-concierge-bell"></i> Hacer reserva</a>
				</button>
			</form>
		</div>
	<%
			} else{
	%>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Entrada</th>
					<th scope="col">Salida</th>
					<th scope="col">Camas</th>
					<th scope="col">Habitaciones</th>
					<th scope="col">Precio</th>
					<th scope="col">Estado</th>
					<th scope="col">Acciones</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(int i = 0; i < reservas.size(); i++){
						Reserva reserva = reservas.get(i);
						int precioReserva = 0;
						int camasReservadas = 0;
						int cantidadHabitaciones = 0;
						int cantidadTipoHabitacion = reserva.getHabitacionesReservadas().size();
						boolean retenida = reserva.getRetenida();
						for(int h = 0; h < cantidadTipoHabitacion; h++){
							precioReserva += reserva.getHabitacionesReservadas().get(h).getPrecio();
							cantidadHabitaciones += reserva.getHabitacionesReservadas().get(h).getCantidadReservada();
							camasReservadas += reserva.getHabitacionesReservadas().get(h).getCapacidad() * reserva.getHabitacionesReservadas().get(h).getCantidadReservada();
						}
						String estado = reserva.getEstadoActual().toString();
						String clase = "";
						if(estado.equals("activa")){
							clase = "table-primary";
						}
						if(estado.equals("cancelada")){
							clase = "table-danger";
						}
						if(estado.equals("espera")){
							clase = "table-info";
							if(retenida)
								clase = "table-warning";
						}
						if(estado.equals("terminada")){
							clase = "table-success";
						}
						%>
							<tr class="<%= clase %>">
								<td class="cell-entrada"><%= reserva.getFechaInicio() %></td>
								<td class="cell-salida"><%= reserva.getFechaFin() %></td>
								<td class="cell-camas"><%= camasReservadas %></td>
								<td class="cell-habitaciones">
									<div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
										<button type="button" class="btn btn-info" disabled><%= cantidadHabitaciones  %></button>
										<button type="button" class="btn btn-info" onclick="detalleHabitaciones(<%= reserva.getId() %>)">
											<i class="fas fa-plus iconoDetalle-<%= reserva.getId() %>"></i>
											<i class="fas fa-minus iconoDetalle-<%= reserva.getId() %>" style="display: none"></i>
										</button>
									</div>
								</td>
								<td class="cell-precio">ARS <%= precioReserva %></td>
								<td class="cell-estado">
									<% if(estado.equals("espera") && retenida) { %>
										<p class="text-warning"><strong>Retenida</strong></p>
									<% }
									if(estado.equals("espera") && !retenida) { %>
										<p class="text-info"><strong>En espera</strong></p>
									<% }
									if(estado.equals("cancelada")) { %>
										<p class="text-danger"><strong>Cancelada</strong></p>
									<% }
									if(estado.equals("terminada")) { %>
									<p class="text-success"><strong>Terminada</strong></p>
									<% }
									if(estado.equals("activa")) { %>
									<p class="text-primary"><strong>En Curso</strong></p>
									<% } %>
								</td>
								<td class="cell-acciones">
									<% if(estado.equals("espera")) { %>
										<form id="cancelar_reserva-form" name="cancelar_reserva-form" action="misreservas" method="POST">
											<div class="btn-group btn-group-sm" role="group">
												<button type="submit" name="id_reserva" value="<%= reserva.getId() %>" class="btn-cancelar-<%= reserva.getId() %> btn btn-outline-danger" style="display: none">Sí</button>
												<button type="button" class="btn-cancelar-<%= reserva.getId() %> btn btn-danger rounded" onclick="cancelarReserva(<%= reserva.getId() %>)">Cancelar</button>
												<button type="button" class="btn-cancelar-<%= reserva.getId() %> btn btn-outline-danger" disabled style="display: none">Seguro?</button>
												<button type="button" class="btn-cancelar-<%= reserva.getId() %> btn btn-outline-danger" style="display: none" onclick="cancelarReserva(<%= reserva.getId() %>)">No</button>
											</div>
										</form>
									<% }
									if(estado.equals("cancelada")) { %>
										<p class="text-danger"><strong>-</strong></p>
									<% }
									if(estado.equals("terminada")) { %>
											<form id="detalles_reserva-form" name="detalles_reserva-form" action="detalles" method="GET">
												<button type="button" name="id_reserva" value="<%= reserva.getId() %>" class="btn-detalles-<%= reserva.getId() %> btn btn-outline-success">Ver detalles</button>
											</form>
									<% }
									if(estado.equals("activa")) { %>
										<a class="btn-asginar-<%= reserva.getId() %> btn btn-outline-info" href="/tp_java/servicios?resId=<%= reserva.getId() %>">Pedir servicio</button>
									<% } %>
								</td>
							</tr>
							<tr id="detalleReserva-<%= reserva.getId() %>"  class="<%= clase %>" style="display: none">
								<%
									for(int h = 0; h < cantidadTipoHabitacion; h++){
										String tipoHab = "";
										int cantidadReservada = reserva.getHabitacionesReservadas().get(h).getCantidadReservada();
										// El switch no funciona
										if(reserva.getHabitacionesReservadas().get(h).getId()==  1){
											tipoHab = "Deluxe";
										}
										if(reserva.getHabitacionesReservadas().get(h).getId()==  2){
											tipoHab = "Deluxe Plus";
										}
										if(reserva.getHabitacionesReservadas().get(h).getId()==  3){
											tipoHab = "Junior Suite";
										}
										if(reserva.getHabitacionesReservadas().get(h).getId()==  4){
											tipoHab = "Executive Suite";
										}
										if(reserva.getHabitacionesReservadas().get(h).getId()==  5){
											tipoHab = "Suite Presidencial";
										}

										%>
										<td>
											<div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
												<button type="button" class="btn btn-info" disabled><%= tipoHab %></button>
												<button type="button" class="btn btn-info" disabled><%= cantidadReservada  %></button>
											</div>
										</td>
										<%
									}
									for(int h = 0; h < 7-cantidadTipoHabitacion; h++){
										%><td></td><%
									}
								%>
							</tr>
						<%
					}
				}
				%>
			</tbody>
		</table>
	</div>
</div>



<%@include file="./master_footer.jsp" %>
