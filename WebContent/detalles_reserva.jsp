<%@include file="./master_header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="entities.Reserva"%>
<%@ page import="entities.TipoServicio"%>
<%@ page import="entities.Servicio"%>
<%@ page import="entities.Habitacion"%>
<%@ page import="java.text.SimpleDateFormat"%>

<script>
	document.title = "Arroz Tower - Detalles de reserva";	
</script>

<%
	int resId = (int) request.getAttribute("resId");
	Reserva reserva = (Reserva) request.getAttribute("reserva");
	ArrayList<Habitacion> habitaciones = (ArrayList<Habitacion>) request.getAttribute("habitaciones");
	ArrayList<TipoServicio> tipoServicios = (ArrayList<TipoServicio>) request.getAttribute("tipoServicios");
	ArrayList<Servicio> servicios = (ArrayList<Servicio>) request.getAttribute("servicios_pedidos");
	if (habitaciones == null || habitaciones.isEmpty()) {
%>
<h2 class="h1-responsive font-weight-bold text-center my-4">La reserva no tiene servicios adicionales</h2>
<div class="d-flex justify-content-around my-3">
		<button type="button" class="btn btn-warning" style="float: right" onclick="history.back();">
			<a href="" style="text-decoration: none; color: #000000b3;"><i
				class="fas fa-concierge-bell"></i> Volver</a>
		</button>
</div>
<%
	} else if(servicios == null || servicios.isEmpty()){
%>
<h2 class="h1-responsive font-weight-bold text-center my-4">No hay
	ninguna servicios para esta reserva</h2>
<%
	} else{
%>
<div class="row mt-3">
	<div class="col-md-4 offset-md-4 text-center">
		<span>Estado de la reserva: </span>
		<span class="cell-estado">
			<% 
				String estado = reserva.getEstadoActual().toString();
				boolean retenida = reserva.getRetenida();
			%>
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
		</span>
	</div>
</div>
<div class="row mt-3">
	<div class="col-md-10 offset-md-1">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Num. hab.</th>
					<th scope="col">Servicio</th>
					<th scope="col">Cantidad</th>
					<th scope="col">Total</th>
				</tr>
			</thead>
			<tbody>
				<% for (int habCounter = 0; habCounter < habitaciones.size(); habCounter ++) {
					Habitacion habitacion = habitaciones.get(habCounter);
					int cantServicios = 0;
					float precioTotal = 0;
					for (int servCounter = 0; servCounter < servicios.size(); servCounter ++) {
						Servicio servicio = servicios.get(servCounter);
						if(servicio.getIdHabitacion() == habitacion.getId()) {
							for (int tipoServCounter = 0; tipoServCounter < tipoServicios.size(); tipoServCounter ++) {
								TipoServicio tipoServ = tipoServicios.get(tipoServCounter);
								if(tipoServ.getId() == servicio.getIdTipoServicio()) {
									%>
										<tr>
											<td colspan>
												<%= habitacion.getNumero() %>
											</td>
											<td colspan>
												<%= tipoServ.getNombre() %>
											</td>
											<td colspan>
												<%= servicio.getCantidad() %>
											</td>
											<td colspan>
												<%= servicio.getCantidad() * tipoServ.getPrecio() %>
											</td>
										</tr>
									<%
									break;
								}
							}
						}
					}
				 } %>
				 <tr>
					<th scope="col"></th>
					<th scope="col">Extra</th>
					<th scope="col">Cantidad</th>
					<th scope="col">Total</th>
				</tr>
				 <tr>
					<td scope="col"></th>
					<td scope="col">Dias extra</th>
					<td scope="col">3</th>
					<td scope="col">100</th>
				</tr>
				 <tr>
					<td scope="col"></th>
					<td scope="col">Checkin tardio</th>
					<td scope="col">1</th>
					<td scope="col">100</th>
				</tr>
				 <tr>
					<td scope="col"></th>
					<td scope="col"></th>
					<th scope="col">Monto total</th>
					<th scope="col">100</th>
				</tr>
			</tbody>
		</table>
	</div>
</div>


<%
	}
%>




<%@include file="./master_footer.jsp"%>
