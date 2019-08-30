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
	$(".iconoDetalle").toggle();
}
 </script>
<div class="row mt-3">
	<div class="col-md-10 offset-md-1">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Entrada</th>
					<th scope="col">Salida</th>
					<th scope="col">Camas</th>
					<th scope="col">Habitaciones</th>
					<th scope="col">Precio</th>
					<th scope="col">Acciones</th>
				</tr>
			</thead>
			<tbody>
				<%
				ArrayList<Reserva> reservas = (ArrayList<Reserva>)request.getAttribute("reservasDeUsuario");
				if(reservas != null){
					for(int i = 0; i < reservas.size(); i++){
						Reserva reserva = reservas.get(i);
						int precioReserva = 0;
						int camasReservadas = 0;
						int cantidadHabitaciones = 0;
						int cantidadTipoHabitacion = reserva.getHabitacionesReservadas().size();
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
							clase = "";
						}
						if(estado.equals("terminada")){
							clase = "table-success";
						}
						%>
							<tr class="<%= clase %>">
								<td><%= reserva.getFechaInicio() %></td>
								<td><%= reserva.getFechaFin() %></td>
								<td><%= camasReservadas %></td>
								<td>
									<div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
										<button type="button" class="btn btn-info" disabled><%= cantidadHabitaciones  %></button>
										<button type="button" class="btn btn-info" onclick="detalleHabitaciones(<%= reserva.getId() %>)">
											<i class="fas fa-plus iconoDetalle"></i>
											<i class="fas fa-minus iconoDetalle" style="display: none"></i>
										</button>
									</div>
								</td>
								<td>ARS <%= precioReserva %></td>
								<td>
									<% if(estado.equals("espera")) { %>
										<form id="cancelar_reserva-form" name="cancelar_reserva-form" action="misreservas" method="POST">
											<div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
												<button type="submit" name="id_reserva" value="<%= reserva.getId() %>" class="btn-cancelar-<%= reserva.getId() %> btn btn-outline-danger" style="display: none">Sí</button>
												<button type="button" class="btn-cancelar-<%= reserva.getId() %> btn btn-danger rounded" onclick="cancelarReserva(<%= reserva.getId() %>)">Cancelar Reserva</button>
												<button type="button" class="btn-cancelar-<%= reserva.getId() %> btn btn-outline-danger" disabled style="display: none">Seguro?</button>
												<button type="button" class="btn-cancelar-<%= reserva.getId() %> btn btn-outline-danger" style="display: none" onclick="cancelarReserva(<%= reserva.getId() %>)">No</button>
											</div>
										</form>
									<% }
									if(estado.equals("cancelada")) { %>
										<p class="text-danger"><strong>Reserva Cancelada</strong></p>
									<% }
									if(estado.equals("terminada")) { %>
									<p class="text-success"><strong>Reserva Terminada</strong></p>
									<% }
									if(estado.equals("activa")) { %>
									<p class="text-primary"><strong>Reserva En Curso</strong></p>
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
									for(int h = 0; h < 6-cantidadTipoHabitacion; h++){
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
