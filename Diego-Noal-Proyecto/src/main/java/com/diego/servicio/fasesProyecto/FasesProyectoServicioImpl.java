package com.diego.servicio.fasesProyecto;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.diego.modelo.FasesProyecto;
import com.diego.servicio.GenericoServicioImpl;

@Service("fasesProyectoServicioImpl")
public class FasesProyectoServicioImpl extends GenericoServicioImpl implements FasesProyectoServicio {

	@Transactional
	public List<FasesProyecto> getFasesProyecto() {
		return this.getFasesProyectoDAO().getFasesProyecto();
	}

}
