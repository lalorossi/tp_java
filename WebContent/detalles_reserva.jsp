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
	ArrayList<TipoServicio> tipoServicios = (ArrayList<TipoServicio>) request.getAttribute("tipoServicios");
	ArrayList<Servicio> servicios = (ArrayList<Servicio>) request.getAttribute("servicios_pedidos");
	Date fechaSalidaReal = reserva.getFechaSalidaReal();
	Date fechaIngresoReal = reserva.getFechaIngresoReal();
	if(fechaSalidaReal == null) fechaSalidaReal = new Date();
	long diasBase = (reserva.getFechaFin().getTime() - reserva.getFechaInicio().getTime()) / (1000*3600*24);
	long diasExtra = (fechaSalidaReal.getTime() - reserva.getFechaFin().getTime()) / (1000*3600*24);
	long diasDescuento = (fechaIngresoReal.getTime() - reserva.getFechaInicio().getTime()) / (1000*3600*24);
	boolean checkoutTardio = diasExtra > 0;
	boolean ingresoRetenido = diasDescuento > 0 && reserva.getRetenida();
	float costoDia = (float) request.getAttribute("costo_dia");
	SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");
	float costoRetenido = costoDia * diasDescuento;
	costoRetenido = costoRetenido < 0 ? 0 : costoRetenido;
	float costoExtra = costoDia * diasExtra;
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
	<div class="col-md-4 offset-md-4 text-center">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Fecha de inicio</th>
					<th scope="col">Fecha de fin</th>
					<th scope="col">Fecha de ingreso real</th>
					<th scope="col">Fecha de salida real</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%= dateFormatter.format(reserva.getFechaInicio()) %></td>
					<td><%= dateFormatter.format(reserva.getFechaFin()) %></td>
					<td><% if(reserva.getFechaIngresoReal() != null) { %> <%= dateFormatter.format(reserva.getFechaIngresoReal()) %> <% } else { %> - <% } %></td>
					<td><% if(reserva.getFechaSalidaReal() != null) { %> <%= dateFormatter.format(reserva.getFechaSalidaReal()) %> <% } else { %> - <% } %></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<%
	double montoTotal = reserva.getPrecioBase();
	if(servicios == null || servicios.isEmpty()){
%>
<h2 class="h1-responsive font-weight-bold text-center my-4">No hay
	ningún servicios para esta reserva</h2>
<%
	} else{
%>
<div class="row mt-3">
	<div class="col-md-10 offset-md-1">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Num. hab.</th>
					<th scope="col">Servicio</th>
					<th scope="col">Cantidad</th>
					<th scope="col">Precio unitario</th>
					<th scope="col">Precio</th>
				</tr>
			</thead>
			<tbody>
				<% 
					int cantServicios = 0;
					float precioTotal = 0;
					for (int servCounter = 0; servCounter < servicios.size(); servCounter ++) {
						Servicio servicio = servicios.get(servCounter);
						for (int tipoServCounter = 0; tipoServCounter < tipoServicios.size(); tipoServCounter ++) {
							TipoServicio tipoServ = tipoServicios.get(tipoServCounter);
							if(tipoServ.getId() == servicio.getIdTipoServicio()) {
								%>
									<tr>
										<td colspan>
											<%= servicio.getIdHabitacion() %>
										</td>
										<td colspan>
											<%= tipoServ.getNombre() %>
										</td>
										<td colspan>
											<%= servicio.getCantidad() %>
										</td>
										<td colspan>
											<%= tipoServ.getPrecio() %>
										</td>
										<td colspan>
											<%= servicio.getCantidad() * tipoServ.getPrecio() %>
										</td>
									</tr>
								<%
								montoTotal += servicio.getCantidad() * tipoServ.getPrecio();
								break;
							}
						}
				 } %>
				 </table>

				
				<table class="table">
				 	<tr>
						<th scope="col"></th>
						<th scope="col">Días</th>
						<th scope="col">Cantidad</th>
						<th scope="col">Precio unitario</th>
						<th scope="col">Precio</th>
					</tr>
					<tr>
						<td scope="col"></th>
						<td scope="col">Dias reservados</th>
						<td scope="col"><%= diasBase %></th>
						<td scope="col"><%= costoDia %></th>
						<td scope="col"><%= reserva.getPrecioBase() %></th>
					</tr>
<%
	} if(diasExtra > 0 || diasDescuento > 0) {
%>
				 <%if(checkoutTardio) { %>
					<tr>
						<td scope="col"></th>
						<td scope="col">Dias extra</th>
						<td scope="col"><%= diasExtra %></th>
						<td scope="col"><%= costoDia %></th>
						<td scope="col"><%= costoExtra %></th>
					</tr>
				 <% 
				 montoTotal += costoExtra;
				 } if(ingresoRetenido) { %>
					<tr>
						<td scope="col"></th>
						<td scope="col">Ingreso retenido</th>
						<td scope="col"><%= diasDescuento %></th>
						<td scope="col">-<%= costoDia %></th>
						<td scope="col">-<%= costoRetenido %></th>
					</tr>
				 <% 
				 montoTotal -= costoRetenido;
				 } %>
			</tbody>
		</table>
<%
	}
%>
				<table class="table">
				 <tr>
					<td scope="col"></th>
					<td scope="col"></th>
					<td scope="col"></th>
					<th scope="col">Monto total</th>
					<th scope="col"><%= montoTotal %></th>
				</tr>
				</table>
	</div>
</div>



<%@include file="./master_footer.jsp"%>
