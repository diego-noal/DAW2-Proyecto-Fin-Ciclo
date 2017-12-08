package com.diego.modelo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class Usuarios implements Serializable {
	private static final long serialVersionUID = 6356537940968085469L;
	
	private int iduser;
	private String username;
	private String password;
	private boolean enabled;
	private String ref_role = "ROLE_USER";
	private Set<RolesUsuario> userRole = new HashSet<RolesUsuario>(0);

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="iduser")
	public int getIduser() { return iduser; }
	public void setIduser(int iduser) { this.iduser = iduser; }
	
	@Column(name = "username", unique = true, length = 45, nullable = false)
	public String getUsername() { return this.username; }
	public void setUsername(String username) { this.username = username; }

	@Column(name = "password", length = 60, nullable = false)
	public String getPassword() { return this.password; }
	public void setPassword(String password) { this.password = password; }
	
	@Column(name = "enabled", nullable = false)
	public boolean isEnabled() { return this.enabled; }
	public void setEnabled(boolean enabled) { this.enabled = enabled; }

	@Column(name = "ref_role")
	public String getRef_role() { return ref_role; }
	public void setRef_role(String ref_role) { this.ref_role = ref_role; }
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "user")
	public Set<RolesUsuario> getUserRole() { return this.userRole; }
	public void setUserRole(Set<RolesUsuario> userRole) { this.userRole = userRole; }
	
}
