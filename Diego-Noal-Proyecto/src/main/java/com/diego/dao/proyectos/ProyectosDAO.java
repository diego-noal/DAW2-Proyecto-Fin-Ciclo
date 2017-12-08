package com.diego.dao.proyectos;

import java.util.List;

import com.diego.modelo.Proyectos;

public interface ProyectosDAO {

	public void crearProyecto(Proyectos proyecto);
	public void editarProyecto(Proyectos proyecto);
	public void borrarProyecto(int id_proyecto);
	public Proyectos getProyectoById(int id_proyecto);
	public List<Proyectos> getListaProyectos();
	public List<Proyectos> getListaProyectosWithSQL(String sqlfind);

}
