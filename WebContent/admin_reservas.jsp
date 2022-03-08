<%@include file="./master_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.Map" %>
<%@ page import="entities.Reserva" %>
<%@ page import="entities.Usuario" %>
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
	Map<Usuario, ArrayList<Reserva>> reservasPorUsuario = (Map<Usuario, ArrayList<Reserva>>)request.getAttribute("reservasPorUsuario");
			if(reservasPorUsuario.isEmpty()){
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
					<th scope="col">Cliente</th>
					<th scope="col">Entrada</th>
					<th scope="col">Salida</th>
					<th scope="col">Camas</th>
					<th scope="col">Habitaciones</th>
					<th scope="col">Estado</th>
					<th scope="col">Acciones</th>
				</tr>
			</thead>
			<tbody>
				<%
				 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				 for (Map.Entry<Usuario,ArrayList<Reserva>> entry : reservasPorUsuario.entrySet()) {
					 	Usuario user = entry.getKey();
						ArrayList<Reserva> reservas = entry.getValue();
				%>
					<tr>
						<td colspan="7"><%= user.getEmail() %></td>
					</tr>
					<%
						for(int i = 0; i < reservas.size(); i++){
							Reserva reserva = reservas.get(i);
							int camasReservadas = 0;
							int cantidadHabitaciones = 0;
							int cantidadTipoHabitacion = reserva.getHabitacionesReservadas().size();
							boolean retenida = reserva.getRetenida();
							for(int h = 0; h < cantidadTipoHabitacion; h++){
								cantidadHabitaciones += reserva.getHabitacionesReservadas().get(h).getCantidadReservada();
								camasReservadas += reserva.getHabitacionesReservadas().get(h).getCapacidad() * reserva.getHabitacionesReservadas().get(h).getCantidadReservada();
							}
							String estado = reserva.getEstadoActual().toString();
							int userId = reserva.getIdCliente();
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
									<td class="cell-cliente">
										<form id="cliente_form_<%= reserva.getId() %>" name="cliente_form_<%= reserva.getId() %>" action="usuario" method="POST">
											<div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
												<input type="hidden" name="user_id" value="<%= userId %>" />
												<button type="submit" class="btn-usuario-<%= reserva.getId() %> btn btn-info rounded"><i class="fas fa-lg fa-user-alt"></i></button>
											</div>
										</form>
									</td>
									<td class="cell-entrada"><%= formatter.format(reserva.getFechaInicio()) %></td>
									<td class="cell-salida"><%= formatter.format(reserva.getFechaFin()) %></td>
									<td class="cell-camas"><%= camasReservadas %></td>
									<td class="cell-habitaciones">
										<div class="btn-group btn-group-sm" role="group">
											<button type="button" class="btn btn-info" disabled><%= cantidadHabitaciones  %></button>
											<button type="button" class="btn btn-info" onclick="detalleHabitaciones(<%= reserva.getId() %>)">
												<i class="fas fa-plus iconoDetalle-<%= reserva.getId() %>"></i>
												<i class="fas fa-minus iconoDetalle-<%= reserva.getId() %>" style="display: none"></i>
											</button>
										</div>
									</td>
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
											<div class="form-inline">
												 <div class="input-group mb-2 mr-sm-2">
													<form id="cancelar_reserva-form" name="cancelar_reserva-form" action="adminreservas" method="POST">
														<div class="btn-group btn-group-sm" role="group">
															<input type="hidden" name="action" value="cancelar" />
															<button type="submit" name="id_reserva" value="<%= reserva.getId() %>" class="btn-cancelar-<%= reserva.getId() %> btn btn-outline-danger" style="display: none">Sí</button>
															<button type="button" class="btn-cancelar-<%= reserva.getId() %> btn btn-danger rounded" onclick="cancelarReserva(<%= reserva.getId() %>)">Cancelar</button>
															<button type="button" class="btn-cancelar-<%= reserva.getId() %> btn btn-outline-danger" disabled style="display: none">Seguro?</button>
															<button type="button" class="btn-cancelar-<%= reserva.getId() %> btn btn-outline-danger" style="display: none" onclick="cancelarReserva(<%= reserva.getId() %>)">No</button>
														</div>
													</form>
												</div>
												 <div class="input-group mb-2 mr-sm-2">
													<form id="check_in-form" name="check_in-form" action="adminreservas" method="POST">
														<input type="hidden" name="action" value="check_in" />
														<button type="submit" name="id_reserva" value="<%= reserva.getId() %>" class="btn-iniciar-<%= reserva.getId() %> btn btn-success btn-sm">Check In</button>
													</form>
												</div>
											</div>
										<% }
										if(estado.equals("cancelada")) { %>
										<p class="text-danger"><strong>-</strong></p>
										<% }
										if(estado.equals("terminada") ||  estado.equals("activa")) { %>
											<form id="detalles_reserva-form" name="detalles_reserva-form" action="detalles" method="GET">
												<button type="submit" name="id_reserva" value="<%= reserva.getId() %>" class="btn-detalles-<%= reserva.getId() %> btn btn-outline-success">Ver detalles</button>
											</form>
										<% }
										if(estado.equals("activa")) { %>
											<form id="checkout-form" name="checkout-form" action="adminreservas" method="POST">
												<input type="hidden" name="action" value="check_out" />
												<button type="submit" name="id_reserva" value="<%= reserva.getId() %>" class="btn-terminar-<%= reserva.getId() %> btn btn-outline-info">Checkout</button>
											</form>
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
										for(int h = 0; h < 8-cantidadTipoHabitacion; h++){
											%><td></td><%
										}
									%>
								</tr>
							<%
						}
				}
				}
				%>
			</tbody>
		</table>
	</div>
</div>



<%@include file="./master_footer.jsp" %>
