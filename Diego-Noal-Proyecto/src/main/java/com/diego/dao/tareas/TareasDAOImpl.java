package com.diego.dao.tareas;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.diego.dao.GenericoDAOImpl;

@Repository("tareasDAOImpl")
public class TareasDAOImpl extends GenericoDAOImpl implements TareasDAO {

	public List<String> getListaTareas() {
		@SuppressWarnings("unchecked")
		List<String> listaTareas = this.getSessionFactory().getCurrentSession()
		.createQuery("SELECT tarea FROM Tareas")
		.list();
		return ((listaTareas != null) && (listaTareas.size() > 0))
				? (List<String>) listaTareas : listaTareas;
	}

}
