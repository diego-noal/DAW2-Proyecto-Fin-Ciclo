package com.diego.dao.fasesProyecto;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.diego.dao.GenericoDAOImpl;
import com.diego.modelo.FasesProyecto;

@Repository("fasesProyectoDAOImpl")
public class FasesProyectoDAOImpl extends GenericoDAOImpl implements FasesProyectoDAO {

	public List<FasesProyecto> getFasesProyecto() {
		@SuppressWarnings("unchecked")
		List<FasesProyecto> listaFasesProyecto = this.getSessionFactory().getCurrentSession()
		.createQuery("SELECT fase_pro FROM FasesProyecto")
		.list();
		return ((listaFasesProyecto != null) && (listaFasesProyecto.size() > 0)) 
				? (List<FasesProyecto>) listaFasesProyecto : listaFasesProyecto;
	}

}
