package com.diego.dao.proyectos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.diego.dao.GenericoDAOImpl;
import com.diego.modelo.Proyectos;

@Repository("proyectosDAOImpl")
public class ProyectosDAOImpl extends GenericoDAOImpl implements ProyectosDAO {

	public void crearProyecto(Proyectos proyecto) {
		this.getSessionFactory().getCurrentSession().persist(proyecto);
	}

	public void editarProyecto(Proyectos proyecto) {
		this.getSessionFactory().getCurrentSession().update(proyecto);
	}

	public void borrarProyecto(int id_proyecto) {
		Proyectos proyecto = (Proyectos) this.getSessionFactory().getCurrentSession()
				.load(Proyectos.class, new Integer(id_proyecto));
		if(null != proyecto) this.getSessionFactory().getCurrentSession().delete(proyecto);
	}
	
	@SuppressWarnings("unchecked")
	public Proyectos getProyectoById(int id_proyecto) {
		
		List<Proyectos> listaProyectos = this.getSessionFactory().getCurrentSession()
		.createQuery("FROM Proyectos WHERE id_proyecto = :id_proyecto")
		.setInteger("id_proyecto", id_proyecto)
		.list();
		
		return (listaProyectos.size() > 0)
				? listaProyectos.get(0) : null;
	}

	public List<Proyectos> getListaProyectos() {
		@SuppressWarnings("unchecked")
		List<Proyectos> listaProyectos = this.getSessionFactory().getCurrentSession()
		.createQuery("from Proyectos").list();
		return ((listaProyectos != null) && (listaProyectos.size() > 0))? (List<Proyectos>) listaProyectos : listaProyectos;
	}

	public List<Proyectos> getListaProyectosWithSQL(String sqlfind) {
		@SuppressWarnings("unchecked")
		List<Proyectos> listaProyectos = this.getSessionFactory().getCurrentSession()
		.createQuery("FROM Proyectos WHERE nom_proyecto LIKE :sqlfind").setString("sqlfind", "%" + sqlfind + "%").list();
		return ((listaProyectos != null) && (listaProyectos.size() > 0)) ? (List<Proyectos>) listaProyectos : listaProyectos;
	}

}
