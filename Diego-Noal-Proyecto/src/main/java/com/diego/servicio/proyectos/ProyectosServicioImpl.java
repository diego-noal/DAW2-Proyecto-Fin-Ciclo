package com.diego.servicio.proyectos;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.diego.modelo.Proyectos;
import com.diego.servicio.GenericoServicioImpl;

@Service("proyectosServicioImpl")
public class ProyectosServicioImpl extends GenericoServicioImpl implements ProyectosServicio{

	@Transactional
	public void crearProyecto(Proyectos proyecto) {
		this.getProyectosDAO().crearProyecto(proyecto);
	}

	@Transactional
	public void editarProyecto(Proyectos proyecto) {
		this.getProyectosDAO().editarProyecto(proyecto);
	}

	@Transactional
	public void borrarProyecto(int id_proyecto) {
		this.getProyectosDAO().borrarProyecto(id_proyecto);
	}

	@Transactional
	public Proyectos getProyectoById(int id_proyecto) {
		return this.getProyectosDAO().getProyectoById(id_proyecto);
	}

	@Transactional
	public List<Proyectos> getListaProyectos() {
		return this.getProyectosDAO().getListaProyectos();
	}

	@Transactional
	public List<Proyectos> getListaProyectosWithSQL(String sqlfind) {
		return this.getProyectosDAO().getListaProyectosWithSQL(sqlfind);
	}

}
