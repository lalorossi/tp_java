function addToastMessage(tipo, mensaje){
	var toastBody = $("#toast-" + tipo +  "-body");
	var htmlString = "<span>" + mensaje + "</span><br/>"
	var textoToast = toastBody.html() + htmlString;
	toastBody.html(textoToast)
}

function mostrarToast(tipo){
	$("#toast-" + tipo).toast("show");
}

function resetToast(tipo){
	$("#toast-" + tipo +  "-body").html("");
}

function addSuccessToast(mensaje){
	addToastMessage("success", mensaje);
}

function addWarningToast(mensaje){
	addToastMessage("warning", mensaje);
}

function addDangerToast(mensaje){
	addToastMessage("danger", mensaje);
}

function resetAllToasts(){
	resetToast("success");
	resetToast("warning");
	resetToast("danger");
}

function getDateString(ts){
	var seconds = ts.getSeconds()-5;
	var minutes = ts.getMinutes();
	
	if(seconds < 0){
		seconds = 60 + seconds;
		minutes -= 1;
	}
	var stringDate = ts.getFullYear()+"-"+(ts.getMonth()+1)+"-"+ts.getDate()+" "+ts.getHours()+":"+minutes+":"+seconds;
	return stringDate;
}

// Funcion que consulta al servlet por nuevos eventos y setea los toast necesarios
function eventToaster() {

	var stringDate = getDateString(new Date());

	$.ajax({
		url: 'EventServlet',

		data: { fromDate : stringDate },

		success: function(responseText) {

			if(responseText != "") {
				eventos = JSON.parse(responseText);

				var dangerMessage = "";
				var warningMessage = "";
				var successMessage = "";

				var hasDanger = false;
				var hasWarning = false;
				var hasSuccess = false;

				resetAllToasts();

				for(var index in eventos){

					evt = eventos[index];
					console.log(evt.label + " - " + evt.data);
					if(evt.estado=="success"){
						hasSuccess = true;
						addSuccessToast(evt.label + evt.data);
					}
					if(evt.estado=="warning"){
						hasWarning = true;
						addWarningToast(evt.label + evt.data);
					}
					if(evt.estado=="danger"){
						hasDanger = true;
						addDangerToast(evt.label + evt.data);
					}
				}
				if(hasSuccess){
					mostrarToast("success");
					console.log("success");
				}
				if(hasWarning){
					mostrarToast("warning");
					console.log("warning");
				}
				if(hasDanger){
					mostrarToast("danger");
					console.log("danger");
				}

			}
		},
		complete: function() {
			// schedule the next request *only* when the current one is complete:
			setTimeout(eventToaster, 5000);
		}
	});
}