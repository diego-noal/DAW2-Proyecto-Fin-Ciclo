package com.diego.servicio.datosUsuario;

import com.diego.modelo.DatosUsuario;

public interface DatosUsuarioServicio {

	public DatosUsuario getDatosUsuario(String userName);
	public void setDatosUsuario(DatosUsuario userData);
	
}
