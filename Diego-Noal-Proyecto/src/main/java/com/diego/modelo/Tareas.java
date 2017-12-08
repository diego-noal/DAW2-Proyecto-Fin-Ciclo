package com.diego.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tasks")
public class Tareas implements Serializable {
	private static final long serialVersionUID = 8416053048484268023L;

	private int id_tarea;
	private String cod_tarea;
	private String tarea;
	
	@Id
	@Column(name = "id_tarea")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId_tarea() { return id_tarea; }
	public void setId_tarea(int id_tarea) { this.id_tarea = id_tarea; }
	
	@Column(name = "cod_tarea", length = 3, nullable = false)
	public String getCod_tarea() { return cod_tarea; }
	public void setCod_tarea(String cod_tarea) { this.cod_tarea = cod_tarea; }
	
	@Column(name = "tarea", length = 70, nullable = false)
	public String getTarea() { return tarea; }
	public void setTarea(String tarea) { this.tarea = tarea; }
	
}
