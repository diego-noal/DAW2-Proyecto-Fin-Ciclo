package com.diego.dao.datosUsuario;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.diego.dao.GenericoDAOImpl;
import com.diego.modelo.DatosUsuario;


@Repository("datosUsuarioDAOImpl")
public class DatosUsuarioDAOImpl extends GenericoDAOImpl implements DatosUsuarioDAO {

	public DatosUsuario getDatosUsuario(String userName) {

		@SuppressWarnings("unchecked")
		List<DatosUsuario> userData = this.getSessionFactory().getCurrentSession()
		.createQuery("FROM DatosUsuario WHERE ref_username = :ref_username")
		.setString("ref_username", userName)
		.list();
		return (userData.size() > 0)
				? userData.get(0) : null;
	}

	public void setDatosUsuario(DatosUsuario userData) {
		this.getSessionFactory().getCurrentSession().update(userData);
	}

}
