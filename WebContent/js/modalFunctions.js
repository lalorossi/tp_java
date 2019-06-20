function showModal(idModal){
	// Por defecto muestra el modal de mensaje normal
	if(idModal == undefined)
		idModal = "modalMensaje";

	$('#'+idModal).modal('show');

	// Pone el focus en el boton de cerrar, para apretar enter y cerrarlo sin problema
	$('#'+idModal).on('shown.bs.modal', function () {
		  $('#btn-close_modal').trigger('focus')
		})
}

function setModalText(mensaje){
	$("#modal-text").text(mensaje);
}


// Estilización del modal según la ocasión
function setModalMode(mode){

	idModal = "modalMensaje";

	$("#"+idModal).find(".modal-header").addClass("bg-"+mode);
	$("#modalMensajeLabel").addClass("text-white");
	$("#btn-close_modal").addClass("btn-"+mode);

}

function setModalTitle(titulo){
	$("#modalMensajeLabel").text(titulo);
}

function modalDanger(mensaje, titulo){
	setModalMode("danger");
	setModalText(mensaje);

	if(titulo == undefined){
		// Título por defecto si no se le manda ningún título
		titulo = "Error...";
	}

	setModalTitle(titulo);
	showModal(idModal);
}
function modalSuccess(mensaje, titulo){
	setModalMode("success");
	setModalText(mensaje);

	if(titulo == undefined){
		// Título por defecto si no se le manda ningún título
		titulo = "Atención";
	}

	setModalTitle(titulo);
	showModal(idModal);
}
function modalWarning(mensaje, titulo){
	setModalMode("warning");
	setModalText(mensaje);

	if(titulo == undefined){
		// Título por defecto si no se le manda ningún título
		titulo = "OK!";
	}

	setModalTitle(titulo);
	showModal(idModal);
}

function ActivateModal(mensaje, titulo, tipo){
	if(tipo == "danger"){
		modalDanger(mensaje, titulo);
	}
	else if(tipo == "warning"){
		modalWarning(mensaje, titulo);
	}
	else if(tipo == "success"){
		modalSuccess(mensaje, titulo);
	}
	else{
		modalDanger(mensaje, titulo);
	}
}

/* --Funciones para manipulación del modal-- */