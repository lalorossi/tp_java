<%@include file=".\master_header.jsp" %>

<script type="text/javascript">

// Activa la opción de la nav bar
$("#nav-item-home").removeClass("active");
$("#nav-item-habitaciones").addClass("active");
$("#nav-item-servicios").removeClass("active");


// Para obterner el parámetro del GET en la url (que dice qué habitación seleccionar)
var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
};


$(document).ready(function(){
	// El parametro se le va a pasar por GET con el nombre "tipoHab"
	var tipoHabitacion = getUrlParameter('tipoHab');

	
	// Busca la descripción para el tipo de habitación
	// Esto probablemente tenga que ser cambiado por un acceso a la DB
	// Y estas funciones que se hacen en jquery probablemente se tengan que hacer en un servlet que pueda entrar al a DB
	// Solo por pruebas, los datos de habitaciones los saca de un .txt escrito en JSON
	var txtUrl = './txt/Habitaciones/' + tipoHabitacion + ".txt";

	// Lee el .txt
	jQuery.get(txtUrl, function(data) {

			objHabitacion = jQuery.parseJSON(data);

			var imgUrl = "./img/Habitaciones/" + tipoHabitacion +".jpg";
			$("#imagenHabitacion").attr("src",imgUrl);
			$("#descripcion_habitacion").text(objHabitacion.descripcion);
			$("#tipo_habitacion").text(objHabitacion.tipoHabitacion);
			var containerHTML = $("#amenities_container").html();

			for(i in objHabitacion.amenities){
				var newDiv = "<div class='', id='amenities" + i + "'>" + objHabitacion.amenities[i] + "</div>";
				containerHTML += newDiv;
			}
			$("#amenities_container").html(containerHTML);

		}, 'text');

});
</script>

<div class="row">
	<div class="col-md-12">
		<h2 id="tipo_habitacion"></h2>
	</div>
</div>

<div class="row">
	<div class="col-md-4">
		<img id="imagenHabitacion" class="img-fluid"></img>
	</div>
	<div class="col-md-4">
		<h5 id="descripcion_habitacion"></h5>
		<h4>Amenities</h4>
		<div id="amenities_container"></div>
	</div>
</div>



<%@include file=".\master_footer.jsp" %>