package com.diego.servicio.usuarios;

import java.util.List;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.diego.dao.usuarios.custom.CustomUserDetails;
import com.diego.modelo.RolesUsuario;
import com.diego.modelo.Usuarios;
import com.diego.servicio.GenericoServicioImpl;

@Service("usuariosServicioImpl")
public class UsuariosServicioImpl extends GenericoServicioImpl implements UsuariosServicio {

	@Transactional
	public Usuarios findUserByName(String userName) {
		return this.getUsuarioDAO().findUserByName(userName);
	}

	@Transactional
	public void aadUsuario(Usuarios usuario, boolean isAdmin) {
		this.getUsuarioDAO().aadUsuario(usuario, isAdmin);
	}

	@Transactional
	public void updateUsuario(Usuarios usuario) {
		this.getUsuarioDAO().updateUsuario(usuario);
	}

	@Transactional
	public void updateUsuario(Usuarios usuario, boolean isAdmin) {
		this.getUsuarioDAO().updateUsuario(usuario, isAdmin);
	}

	@Transactional
	public void deleteUsuario(String usuario) {
		this.getUsuarioDAO().deleteUsuario(usuario);
	}

	@Transactional
	public int getIdUserByName(String userName) {
		return this.getUsuarioDAO().getIdUserByName(userName);
	}

	@Transactional
	public List<Usuarios> getListaUsuariosWithSQL(String userRole, String sqlfind) {
		return this.getUsuarioDAO().getListaUsuariosWithSQL(userRole, sqlfind);
	}
	
	@Transactional
	public List<Usuarios> getListaNombreUsuariosWithSQL(String userRole, String sqlfind) {
		return this.getUsuarioDAO().getListaNombreUsuariosWithSQL(userRole, sqlfind);
	}
	
	/* sec:login */
	@Transactional
	public User buildUserForAuthentication(Usuarios u, List<GrantedAuthority> listaPrivilegios) {
		return this.getUsuarioDAO().buildUserForAuthentication(u, listaPrivilegios);
	}

	@Transactional
	public List<GrantedAuthority> buildUserAuthority(Set<RolesUsuario> rolesUsuario) {
		return this.getUsuarioDAO().buildUserAuthority(rolesUsuario);
	}

	@Transactional
	public CustomUserDetails loadUserByUsername(final String userName) throws UsernameNotFoundException {
		return (CustomUserDetails) this.getUsuarioDAO().loadUserByUsername(userName);
	}

}