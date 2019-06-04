function setModalText(mensaje){
	$("#modal-text").text(mensaje);
}

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

// Estilización del modal según la ocasión
function setModalMode(idModal, mode){

	// Por defecto usa el modal de mensaje normal
	if(idModal == undefined)
		idModal = "modalMensaje";

	$("#"+idModal).find(".modal-header").addClass("bg-"+mode);
	$("#modalMensajeLabel").addClass("text-white");
	$("#btn-close_modal").addClass("btn-"+mode);

}

function modalDanger(mensaje, idModal){
	setModalMode(idModal, "danger");
	setModalText(mensaje);
	showModal(idModal);
}
function modalSuccess(mensaje, idModal){
	setModalMode(idModal, "success");
	setModalText(mensaje);
	showModal(idModal);
}
function modalWarning(mensaje, idModal){
	setModalMode(idModal, "warning");
	setModalText(mensaje);
	showModal(idModal);
}

/* --Funciones para manipulación del modal-- */