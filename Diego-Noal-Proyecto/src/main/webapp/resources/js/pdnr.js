//cambiarContraseña
function validarCambioPass(event) {
	if (document.getElementById('pass1').value.length > 0 
			&& document.getElementById('pass1').value 
			== document.getElementById('pass2').value) {
		return confirmarAccion() ? true : event.preventDefault();
	} else {
		event.preventDefault();
		document.getElementById('error').setAttribute("class", "error");
		document.getElementById('error').innerHTML = "Las contraseñas no coinciden o están vacias.";
	}
}

//imputarHoras
function validarImputacion(event) {
	var patt_horas = /^\d{1}$/;
	var patt_fecha = /^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$/;
	if (patt_fecha.test(document.getElementById('fecha').value) && 
			patt_horas.test(document.getElementById('horas').value)) {
		return confirmarAccion() ? true : event.preventDefault();
	} else {
		event.preventDefault();
		document.getElementById('error').setAttribute("class", "error");
		document.getElementById('error').innerHTML = "Complete los campos (*) correctamente.";
	}
}

//gestionUsuarios
function validarCrearEditarUsuario(event) {
	if (document.getElementById('username').value.length > 0 
			&& document.getElementById('password').value.length > 0) {
		return confirmarAccion() ? true : event.preventDefault();
	} else {
		event.preventDefault();
		document.getElementById('error').setAttribute("class", "error");
		document.getElementById('error').innerHTML = "Complete los campos (*).";
	}
}

//gestionProyectos
function validarCrearEditarProyecto(event) {
	if (document.getElementById('nom_proyecto').value.length > 0) {
		return confirmarAccion() ? true : event.preventDefault();
	} else {
		event.preventDefault();
		document.getElementById('error').setAttribute("class", "error");
		document.getElementById('error').innerHTML = "Complete los campos (*).";
	}
}

//general
function confirmarAccion() {
	return confirm('¿Estás seguro?');
}

//Excepciones
function volverAtras() {
	window.history.back();
}