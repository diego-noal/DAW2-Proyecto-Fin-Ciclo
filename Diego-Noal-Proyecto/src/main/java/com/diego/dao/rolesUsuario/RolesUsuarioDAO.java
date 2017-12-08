package com.diego.dao.rolesUsuario;

import com.diego.modelo.Usuarios;

public interface RolesUsuarioDAO {
	
	public void setRolesUsuario(Usuarios usuario, boolean isAdmin);
	public void updateRolesUsuario(Usuarios usuario, boolean isAdmin);
	public boolean isRolesAdmin(int idUser);
	
}
