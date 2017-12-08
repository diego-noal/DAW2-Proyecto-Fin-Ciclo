package com.diego.modelo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
 
@Entity
@Table(name = "user_roles")
public class RolesUsuario implements Serializable {
	private static final long serialVersionUID = -835141741855569985L;
	
	private Integer userRoleId;
	private Usuarios user;
	private String role;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "user_role_id", unique = true)
	public Integer getUserRoleId() { return this.userRoleId; }
	public void setUserRoleId(Integer userRoleId) {	this.userRoleId = userRoleId; }

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ref_iduser", nullable = false)
	public Usuarios getUser() {	return this.user; }
	public void setUser(Usuarios user) { this.user = user; }

	@Column(name = "role", length = 45, nullable = false)
	public String getRole() { return this.role; }
	public void setRole(String role) { this.role = role; }

}
