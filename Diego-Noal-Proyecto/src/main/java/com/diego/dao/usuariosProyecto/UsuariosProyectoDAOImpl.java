package com.diego.dao.usuariosProyecto;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.diego.dao.GenericoDAOImpl;
import com.diego.modelo.UsuariosProyecto;

@Repository("usuariosProyectoDAOImpl")
public class UsuariosProyectoDAOImpl extends GenericoDAOImpl implements UsuariosProyectoDAO {

	public void asignarUsuarioEnProyeto(UsuariosProyecto usuariosProyecto) {
		this.getSessionFactory().getCurrentSession().persist(usuariosProyecto);
	}

	public void desasignarUsuarioDeProyecto(int id_usuario_proyecto) {
		UsuariosProyecto usuariosProyecto = (UsuariosProyecto) this.getSessionFactory().getCurrentSession()
				.load(UsuariosProyecto.class, new Integer(id_usuario_proyecto));
		if(null != usuariosProyecto) this.getSessionFactory().getCurrentSession().delete(usuariosProyecto);
	}

	@SuppressWarnings("unchecked")
	public List<UsuariosProyecto> getProjectsByUser(String username) {
		return this.getSessionFactory().getCurrentSession()
				.createQuery("FROM UsuariosProyecto WHERE ref_username = :username")
				.setString("username", username)
				.list();
	}

	@SuppressWarnings("unchecked")
	public List<UsuariosProyecto> getUsersByProjectIdWithSQL(int id_proyecto, String sqlfind) {
		return this.getSessionFactory().getCurrentSession()
				.createQuery("FROM UsuariosProyecto WHERE ref_id_proyecto = :id_proyecto AND ref_username LIKE :sqlfind")
				.setInteger("id_proyecto", id_proyecto)
				.setString("sqlfind", "%" + sqlfind + "%")
				.list();
	}

}
