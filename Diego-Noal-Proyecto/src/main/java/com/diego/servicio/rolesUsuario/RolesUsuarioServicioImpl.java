package com.diego.servicio.rolesUsuario;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.diego.modelo.Usuarios;
import com.diego.servicio.GenericoServicioImpl;

@Service("rolesUsuarioServiceImpl")
public class RolesUsuarioServicioImpl extends GenericoServicioImpl implements RolesUsuarioServicio {

	@Transactional
	public void setRolesUsuario(Usuarios usuario, boolean isAdmin) {
		this.getRolesUsuarioDAO().setRolesUsuario(usuario, isAdmin);
	}

	@Transactional
	public void updateRolesUsuario(Usuarios usuario, boolean isAdmin) {
		this.getRolesUsuarioDAO().updateRolesUsuario(usuario, isAdmin);
	}

	@Transactional
	public boolean isRolesAdmin(int idUser) {
		return this.getRolesUsuarioDAO().isRolesAdmin(idUser);
	}
	
}
