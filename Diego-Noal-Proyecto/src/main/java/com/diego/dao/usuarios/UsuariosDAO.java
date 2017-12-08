package com.diego.dao.usuarios;

import java.util.List;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.diego.modelo.RolesUsuario;
import com.diego.modelo.Usuarios;

public interface UsuariosDAO extends UserDetailsService {

	public Usuarios findUserByName(String userName);
	
	public void aadUsuario(Usuarios usuario, boolean isAdmin);
	public void updateUsuario(Usuarios usuario);
	public void updateUsuario(Usuarios usuario, boolean isAdmin);
	public void deleteUsuario(String userName);
	
	public int getIdUserByName(String userName);

	public List<Usuarios> getListaUsuariosWithSQL(String userRole, String sqlfind);
	public List<Usuarios> getListaNombreUsuariosWithSQL(String userRole, String sqlfind);
	
	/* login spring-security */
	public User buildUserForAuthentication(Usuarios usuario, List<GrantedAuthority> listaPrivilegios);
	public List<GrantedAuthority> buildUserAuthority(Set<RolesUsuario> rolesUsuario);

}