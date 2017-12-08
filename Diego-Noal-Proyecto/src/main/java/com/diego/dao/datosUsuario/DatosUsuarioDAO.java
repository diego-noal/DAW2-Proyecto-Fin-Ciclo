package com.diego.dao.datosUsuario;

import com.diego.modelo.DatosUsuario;

public interface DatosUsuarioDAO {
	
	public DatosUsuario getDatosUsuario(String userName);
	public void setDatosUsuario(DatosUsuario userData);
	
}
