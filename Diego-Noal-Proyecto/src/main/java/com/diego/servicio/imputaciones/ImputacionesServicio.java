package com.diego.servicio.imputaciones;

import java.util.List;

import com.diego.modelo.Imputaciones;

public interface ImputacionesServicio {

	public void crearImputacion(Imputaciones imputacion);
	public void editarImputacion(Imputaciones imputacion);
	public void borrarImputacion(int id_imputacion);
	public List<Imputaciones> getListaImputaciones();
	public List<Imputaciones> getImputacionesByNameWithSQL(String nameUSER, String sqlfind);
	public float getHorasImputadasByName(String nameUSER);
	public float getHorasTotalesAImputarByName(String nameUSER);
	public Boolean getHorasEnReglaByName(String nameUSER);
	
}
