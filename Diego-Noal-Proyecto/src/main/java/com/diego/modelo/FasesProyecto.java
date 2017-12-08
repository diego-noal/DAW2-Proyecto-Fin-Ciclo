package com.diego.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "project_phases")
public class FasesProyecto implements Serializable {
	private static final long serialVersionUID = -3135909567470766436L;
	
	private int id_fase_pro;
	private String fase_pro;
	private String des_fase_pro = "";

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id_fase_pro")
	public int getId_fase_pro() { return id_fase_pro; }
	public void setId_fase_pro(int id_fase_pro) { this.id_fase_pro = id_fase_pro; }

	@Column(name = "fase_pro", length = 60, nullable = false)
	public String getFase_pro() { return fase_pro; }
	public void setFase_pro(String fase_pro) { this.fase_pro = fase_pro; }

	@Column(name = "des_fase_pro", length = 250)
	public String getDes_fase_pro() { return des_fase_pro; }
	public void setDes_fase_pro(String des_fase_pro) { this.des_fase_pro = des_fase_pro; }

}
