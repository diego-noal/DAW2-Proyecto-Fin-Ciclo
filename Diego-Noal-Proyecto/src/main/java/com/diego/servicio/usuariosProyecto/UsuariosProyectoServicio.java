package com.diego.servicio.usuariosProyecto;

import java.util.List;

import com.diego.modelo.UsuariosProyecto;

public interface UsuariosProyectoServicio {

	public void asignarUsuarioEnProyeto(UsuariosProyecto usuariosProyecto);
	public void desasignarUsuarioDeProyecto(int id_usuario_proyecto);
	public List<UsuariosProyecto> getProjectsByUser(String username);
	public List<UsuariosProyecto> getUsersByProjectIdWithSQL(int id_proyecto, String sqlfind);

}
