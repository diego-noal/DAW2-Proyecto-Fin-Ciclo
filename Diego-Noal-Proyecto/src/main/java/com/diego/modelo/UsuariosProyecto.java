package com.diego.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "user_projects", uniqueConstraints = @UniqueConstraint(columnNames = { "ref_id_proyecto", "ref_username" }))
public class UsuariosProyecto implements Serializable {
	private static final long serialVersionUID = 8155947548473915979L;

	private int id_usuario_proyecto;
	private int ref_id_proyecto;
	private String ref_nom_proyecto;
	private String ref_username;
	
	@Id
	@Column(name = "id_usuario_proyecto")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId_usuario_proyecto() { return id_usuario_proyecto; }
	public void setId_usuario_proyecto(int id_usuario_proyecto) { this.id_usuario_proyecto = id_usuario_proyecto; }

	@Column(name = "ref_id_proyecto", nullable = false)
	public int getRef_id_proyecto() { return ref_id_proyecto; }
	public void setRef_id_proyecto(int ref_id_proyecto) { this.ref_id_proyecto = ref_id_proyecto; }

	@Column(name = "ref_nom_proyecto", length = 60, nullable = false)
	public String getRef_nom_proyecto() { return ref_nom_proyecto; }
	public void setRef_nom_proyecto(String ref_nom_proyecto) { this.ref_nom_proyecto = ref_nom_proyecto; }
	
	@Column(name = "ref_username", length = 45, nullable = false)
	public String getRef_username() { return ref_username; }
	public void setRef_username(String ref_username) { this.ref_username = ref_username; }

}
