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

function setModalHTML(htmlElement){
	$("#modal-text").append(htmlElement);
}

/*
function modalDanger(mensaje, titulo, htmlElement){
	setModalMode("danger");
	setModalText(mensaje);

	if(titulo == undefined){
		// Título por defecto si no se le manda ningún título
		titulo = "Error...";
	}

	if(htmlElement != undefined){
		setModalHTML(htmlElement);
	}

	setModalTitle(titulo);
	showModal(idModal);
}
function modalSuccess(mensaje, titulo, htmlElement){
	setModalMode("success");
	setModalText(mensaje);

	if(titulo == undefined){
		// Título por defecto si no se le manda ningún título
		titulo = "OK!";
	}

	if(htmlElement != undefined){
		setModalHTML(htmlElement);
	}

	setModalTitle(titulo);
	showModal(idModal);
}
function modalWarning(mensaje, titulo, htmlElement){
	setModalMode("warning");
	setModalText(mensaje);

	if(titulo == undefined){
		// Título por defecto si no se le manda ningún título
		titulo = "Atención";
	}

	if(htmlElement != undefined){
		setModalHTML(htmlElement);
	}

	setModalTitle(titulo);
	showModal(idModal);
}
*/

function ActivateModal(mensaje, titulo, tipo, htmlElement){

	/*
	if(tipo == "danger"){
		modalDanger(mensaje, titulo, htmlElement);
	}
	else if(tipo == "warning"){
		modalWarning(mensaje, titulo, htmlElement);
	}
	else if(tipo == "success"){
		modalSuccess(mensaje, titulo, htmlElement);
	}
	else{
		modalDanger(mensaje, titulo, htmlElement);
	}
	*/


	setModalMode(tipo);
	setModalText(mensaje);

	if(titulo == undefined){
		// Título por defecto si no se le manda ningún título
		if(tipo == "danger"){
			titulo = "Error...";
		}
		else if(tipo == "warning"){
			titulo = "Atención";
		}
		else if(tipo == "success"){
			titulo = "OK";
		}
	}

	if(htmlElement != undefined){
		setModalHTML(htmlElement);
	}

	setModalTitle(titulo);
	showModal(idModal);
}

/* --Funciones para manipulación del modal-- */