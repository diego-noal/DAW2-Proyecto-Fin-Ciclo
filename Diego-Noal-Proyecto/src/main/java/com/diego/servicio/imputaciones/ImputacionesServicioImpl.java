package com.diego.servicio.imputaciones;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.diego.modelo.Imputaciones;
import com.diego.servicio.GenericoServicioImpl;

@Service("imputacionesServicioImpl")
public class ImputacionesServicioImpl extends GenericoServicioImpl implements ImputacionesServicio {

	@Transactional
	public void crearImputacion(Imputaciones imputacion) {
		this.getImputacionesDAO().crearImputacion(imputacion);
	}

	@Transactional
	public void editarImputacion(Imputaciones imputacion) {
		this.getImputacionesDAO().editarImputacion(imputacion);
	}

	@Transactional
	public void borrarImputacion(int id_imputacion) {
		this.getImputacionesDAO().borrarImputacion(id_imputacion);
	}

	@Transactional
	public List<Imputaciones> getListaImputaciones() {
		return this.getImputacionesDAO().getListaImputaciones();
	}

	@Transactional
	public List<Imputaciones> getImputacionesByNameWithSQL(String nameUSER, String sqlfind) {
		return this.getImputacionesDAO().getImputacionesByNameWithSQL(nameUSER, sqlfind);
	}

	@Transactional
	public float getHorasImputadasByName(String nameUSER) {
		return this.getImputacionesDAO().getHorasImputadasByName(nameUSER);
	}

	@Transactional
	public float getHorasTotalesAImputarByName(String nameUSER) {
		return this.getImputacionesDAO().getHorasTotalesAImputarByName(nameUSER);
	}

	@Transactional
	public Boolean getHorasEnReglaByName(String nameUSER) {
		return this.getImputacionesDAO().getHorasEnReglaByName(nameUSER);
	}

}
