package com.diego.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity()
@Table(name = "projects")
public class Proyectos implements Serializable {
	private static final long serialVersionUID = 2583847582828262998L;

	private int id_proyecto;
	private String nom_proyecto;
	private String ref_fase_pro;
	private String descripcion = "";

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id_proyecto")
	public int getId_proyecto() { return id_proyecto; }
	public void setId_proyecto(int id_proyecto) { this.id_proyecto = id_proyecto; }
	
	@Column(name = "nom_proyecto",length = 60, nullable = false)
	public String getNom_proyecto() { return nom_proyecto; }
	public void setNom_proyecto(String nom_proyecto) { this.nom_proyecto = nom_proyecto; }
	
	@Column(name = "ref_fase_pro", length = 60, nullable = false)
	public String getRef_fase_pro() { return ref_fase_pro; }
	public void setRef_fase_pro(String ref_fase_pro) { this.ref_fase_pro = ref_fase_pro; }

	@Column(name = "descripcion", length = 250)
	public String getDescripcion() { return descripcion; }
	public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

}
