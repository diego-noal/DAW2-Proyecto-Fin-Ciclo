package com.diego.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_starts")
public class AltaUsuarios implements Serializable {
	private static final long serialVersionUID = -4912650227782274127L;

	private String ref_username;
	private String fecha_alta;

	@Id
	@Column(name = "ref_username", length = 45, nullable = false)
	public String getRef_username() { return ref_username; }
	public void setRef_username(String ref_username) { this.ref_username = ref_username; }

	@Column(name = "fecha_alta", nullable = false)
	public String getFecha_alta() { return fecha_alta; }
	public void setFecha_alta(String fecha_alta) { this.fecha_alta = fecha_alta; }

}
