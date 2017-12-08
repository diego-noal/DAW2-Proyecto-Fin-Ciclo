package com.diego.servicio.rolesUsuario;

import com.diego.modelo.Usuarios;

public interface RolesUsuarioServicio {
	
	public void setRolesUsuario(Usuarios usuario, boolean isAdmin);
	public void updateRolesUsuario(Usuarios usuario, boolean isAdmin);
	public boolean isRolesAdmin(int idUser);
	
}
