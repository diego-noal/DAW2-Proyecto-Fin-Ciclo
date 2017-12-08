package com.diego.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "imputations")
public class Imputaciones implements Serializable {
	private static final long serialVersionUID = -9123577848062260952L;

	private int id_imputacion;
	private int ref_id_proyecto;
	private String ref_nom_proyecto;
	private String ref_username;
	private String ref_tarea;
	private String comentarios = "";
	private String fecha;
	private String horas;

	@Id
	@Column(name = "id_imputacion")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId_imputacion() { return id_imputacion; }
	public void setId_imputacion(int id_imputacion) { this.id_imputacion = id_imputacion; }

	@Column(name = "ref_id_proyecto", nullable = false)
	public int getRef_id_proyecto() { return ref_id_proyecto; }
	public void setRef_id_proyecto(int ref_id_proyecto) { this.ref_id_proyecto = ref_id_proyecto; }

	@Column(name = "ref_nom_proyecto", length = 60, nullable = false)
	public String getRef_nom_proyecto() { return ref_nom_proyecto; }
	public void setRef_nom_proyecto(String ref_nom_proyecto) { this.ref_nom_proyecto = ref_nom_proyecto; }

	@Column(name = "ref_username", length = 45, nullable = false)
	public String getRef_username() { return ref_username; }
	public void setRef_username(String ref_username) { this.ref_username = ref_username; }

	@Column(name = "ref_tarea", length = 50, nullable = false)
	public String getRef_tarea() { return ref_tarea; }
	public void setRef_tarea(String ref_tarea) { this.ref_tarea = ref_tarea; }

	@Column(name = "comentarios", length = 500)
	public String getComentarios() { return comentarios; }
	public void setComentarios(String comentarios) { this.comentarios = comentarios; }

	@Column(name = "fecha", length = 11, nullable = false)
	public String getFecha() { return fecha; }
	public void setFecha(String fecha) { this.fecha = fecha; }

	@Column(name = "horas", length = 5, nullable = false)
	public String getHoras() { return horas; }
	public void setHoras(String horas) { this.horas = horas; }

}
