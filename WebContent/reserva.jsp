<%@include file="./master_header.jsp" %>

 <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
 <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
 
<div class="container">
	Inicio de la estadía: <input id="startDate" width="25%" />
	Fin de la estadía: <input id="endDate" width="25%" />
</div>


 <script>
 
	var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
	
	$('#startDate').datepicker({
		uiLibrary: 'bootstrap4',
		iconsLibrary: 'fontawesome',
		minDate: today,
		maxDate: function () {
			return $('#endDate').val();
		}
	});
	$('#endDate').datepicker({
		uiLibrary: 'bootstrap4',
		iconsLibrary: 'fontawesome',
		minDate: function () {
			return $('#startDate').val();
		}
	});
	
</script>


<%@include file="./master_footer.jsp" %>
