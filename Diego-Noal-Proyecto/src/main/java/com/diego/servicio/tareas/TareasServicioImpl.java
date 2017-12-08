package com.diego.servicio.tareas;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.diego.servicio.GenericoServicioImpl;

@Service("tareasServicioImpl")
public class TareasServicioImpl extends GenericoServicioImpl implements TareasServicio {

	@Transactional
	public List<String> getListaTareas() {
		return this.getTareasDAO().getListaTareas();
	}

}
