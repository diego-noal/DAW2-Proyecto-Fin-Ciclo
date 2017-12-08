package com.diego.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_data")
public class DatosUsuario implements Serializable {
	private static final long serialVersionUID = 340147416496919294L;
	
	private String ref_username;
	private String nombre = "";
	private String apellido1 = "";
	private String apellido2 = "";
	private String telefono = "";
	private String email = "";
	private String direccion = "";
	private String cod_postal = "";
	
	@Id
	@Column(name = "ref_username", length = 45, nullable = false)
	public String getRef_username() { return ref_username; }
	public void setRef_username(String ref_username) { this.ref_username = ref_username; }
	
	@Column(name = "nombre", length = 45)
	public String getNombre() { return nombre; }
	public void setNombre(String nombre) { this.nombre = nombre; }

	@Column(name = "apellido1", length = 45)
	public String getApellido1() { return apellido1; }
	public void setApellido1(String apellido1) { this.apellido1 = apellido1; }

	@Column(name = "apellido2", length = 45)
	public String getApellido2() { return apellido2; }
	public void setApellido2(String apellido2) { this.apellido2 = apellido2; }

	@Column(name = "telefono", length = 45)
	public String getTelefono() { return telefono; }
	public void setTelefono(String telefono) { this.telefono = telefono; }

	@Column(name = "email", length = 45)
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }

	@Column(name = "direccion", length = 150)
	public String getDireccion() { return direccion; }
	public void setDireccion(String direccion) { this.direccion = direccion; }

	@Column(name = "cod_postal", length = 45)
	public String getCod_postal() { return cod_postal; }
	public void setCod_postal(String cod_postal) { this.cod_postal = cod_postal; }

}
