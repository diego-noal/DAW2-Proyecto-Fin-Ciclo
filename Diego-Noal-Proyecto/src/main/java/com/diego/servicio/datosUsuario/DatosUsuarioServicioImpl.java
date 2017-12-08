package com.diego.servicio.datosUsuario;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.diego.modelo.DatosUsuario;
import com.diego.servicio.GenericoServicioImpl;

@Service("datosUsuarioServicioImpl")
public class DatosUsuarioServicioImpl extends GenericoServicioImpl implements DatosUsuarioServicio{
	
	@Transactional
	public DatosUsuario getDatosUsuario(String userName) {
		return this.getDatosUsuarioDAO().getDatosUsuario(userName);
	}

	@Transactional
	public void setDatosUsuario(DatosUsuario userData) {
		this.getDatosUsuarioDAO().setDatosUsuario(userData);
	}

}
