package com.diego.servicio.usuariosProyecto;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.diego.modelo.UsuariosProyecto;
import com.diego.servicio.GenericoServicioImpl;

@Service("usuariosProyectoServicioImpl")
public class UsuariosProyectoServicioImpl extends GenericoServicioImpl implements UsuariosProyectoServicio {

	@Transactional
	public void asignarUsuarioEnProyeto(UsuariosProyecto usuariosProyecto) {
		this.getUsuariosProyectoDAO().asignarUsuarioEnProyeto(usuariosProyecto);
	}

	@Transactional
	public void desasignarUsuarioDeProyecto(int id_usuario_proyecto) {
		this.getUsuariosProyectoDAO().desasignarUsuarioDeProyecto(id_usuario_proyecto);
	}

	@Transactional
	public List<UsuariosProyecto> getProjectsByUser(String username) {
		return this.getUsuariosProyectoDAO().getProjectsByUser(username);
	}

	@Transactional
	public List<UsuariosProyecto> getUsersByProjectIdWithSQL(int id_proyecto, String sqlfind) {
		return this.getUsuariosProyectoDAO().getUsersByProjectIdWithSQL(id_proyecto, sqlfind);
	}

}
