package com.diego.dao.imputaciones;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.diego.dao.GenericoDAOImpl;
import com.diego.modelo.Imputaciones;

@Repository("imputacionesDAOImpl")
public class ImputacionesDAOImpl extends GenericoDAOImpl implements ImputacionesDAO {

	public void crearImputacion(Imputaciones imputacion) {
		this.getSessionFactory().getCurrentSession().persist(imputacion);
	}

	public void editarImputacion(Imputaciones imputacion) {
		this.getSessionFactory().getCurrentSession().update(imputacion);
	}

	public void borrarImputacion(int id_imputacion) {
		Imputaciones imputacion = (Imputaciones) this.getSessionFactory().getCurrentSession()
				.load(Imputaciones.class, new Integer(id_imputacion));
		if(null != imputacion) this.getSessionFactory().getCurrentSession().delete(imputacion);
	}
	
	@SuppressWarnings("unchecked")
	public List<Imputaciones> getListaImputaciones() {

		List<Imputaciones> listaImputaciones = this.getSessionFactory().getCurrentSession()
		.createQuery("FROM Imputaciones ORDER BY fecha DESC")
		.list();
		return ((listaImputaciones != null) && (listaImputaciones.size() > 0))
				? (List<Imputaciones>) listaImputaciones : listaImputaciones;
	}

	public List<Imputaciones> getImputacionesByNameWithSQL(String nameUSER, String sqlfind) {
		@SuppressWarnings("unchecked")
		List<Imputaciones> listaImputaciones = this.getSessionFactory().getCurrentSession()
		.createQuery("FROM Imputaciones WHERE ref_username = :username "
				+ "AND ref_nom_proyecto LIKE :sqlfind "
				+ "ORDER BY fecha DESC")
		.setString("username", nameUSER)
		.setString("sqlfind", "%" + sqlfind + "%").list();
		return ((listaImputaciones != null) && (listaImputaciones.size() > 0))
				? (List<Imputaciones>) listaImputaciones : listaImputaciones;
	}

	public float getHorasImputadasByName(String nameUSER) {
		
		@SuppressWarnings("unchecked")
		List<String> horas = this.getSessionFactory().getCurrentSession()
				.createQuery("SELECT SUM(horas) FROM Imputaciones WHERE ref_username = :ref_username")
				.setString("ref_username", nameUSER)
				.list();
		return (horas.get(0) != null)
				? Float.parseFloat(horas.get(0)) : 0F;
		
	}

	public float getHorasTotalesAImputarByName(String nameUSER) {
		
		@SuppressWarnings("unchecked")
		List<Integer> horas = this.getSessionFactory().getCurrentSession()
				.createSQLQuery("SELECT func_dias_laborales_totales(fecha_alta, CURDATE()) "
						+ "from user_starts WHERE ref_username = :ref_username")
				.setString("ref_username", nameUSER)
				.list();
		return (horas.get(0) != null)
				? (float) horas.get(0)*8 : 0F;
		
	}
	
	public Boolean getHorasEnReglaByName(String nameUSER) {
		return (this.getHorasImputadasByName(nameUSER) >= this.getHorasTotalesAImputarByName(nameUSER))
				? true : false;
	}

}
