package com.diego.dao.usuarios;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import com.diego.dao.GenericoDAOImpl;
import com.diego.dao.usuarios.custom.CustomUserDetails;
import com.diego.modelo.RolesUsuario;
import com.diego.modelo.Usuarios;

@Repository("usuarioDAOImpl")
public class UsuariosDAOImpl extends GenericoDAOImpl implements UsuariosDAO {
	
	@SuppressWarnings("unchecked")
	public Usuarios findUserByName(String userName) {

		List<Usuarios> listaUsuarios = this.getSessionFactory().getCurrentSession()
		.createQuery("FROM Usuarios WHERE username = :userName")
		.setString("userName", userName)
		.list();
		return (listaUsuarios.size() > 0)
				? listaUsuarios.get(0) : null;
	}

	public void aadUsuario(Usuarios usuario, boolean isAdmin) {
		if(isAdmin) usuario.setRef_role("ROLE_ADMIN");
		else usuario.setRef_role("ROLE_USER");
		this.getSessionFactory().getCurrentSession().persist(usuario); 
	}

	public void updateUsuario(Usuarios usuario) {
		this.getSessionFactory().getCurrentSession().update(usuario);
	}

	public void updateUsuario(Usuarios usuario, boolean isAdmin) {
		if(isAdmin) usuario.setRef_role("ROLE_ADMIN");
		else usuario.setRef_role("ROLE_USER");
		this.getSessionFactory().getCurrentSession().update(usuario);
	}

	public void deleteUsuario(String userName) {
		int iduser = this.getIdUserByName(userName);
		Usuarios usuario = (Usuarios) this.getSessionFactory().getCurrentSession()
				.load(Usuarios.class, new Integer(iduser));
		if(null != usuario) this.getSessionFactory().getCurrentSession().delete(usuario);
	}
	
	@SuppressWarnings("unchecked")
	public int getIdUserByName(String userName) {

		List<Usuarios> listaUsuarios = getSessionFactory().getCurrentSession()
		.createQuery("FROM Usuarios WHERE username = :userName")
		.setString("userName", userName)
		.list();
		return (listaUsuarios.size() > 0)
				? listaUsuarios.get(0).getIduser() : null;
	}

	@SuppressWarnings("unchecked")
	public List<Usuarios> getListaUsuariosWithSQL(String userRole, String sqlfind) {

		List<Usuarios> listaUsuarios;
		switch(userRole) {
		case "ROLE_MASTER":
			listaUsuarios = this.getSessionFactory().getCurrentSession()
			.createQuery("FROM Usuarios WHERE username LIKE :sqlfind")
			.setString("sqlfind", "%" + sqlfind + "%")
			.list();
			break;
		case "ROLE_ADMIN":
			listaUsuarios = this.getSessionFactory().getCurrentSession()
			.createQuery("FROM Usuarios WHERE ref_role = 'ROLE_USER' AND username LIKE :sqlfind")
			.setString("sqlfind", "%" + sqlfind + "%")
			.list();
			break;
		default:
			listaUsuarios = null;
			break;
		}
		return ((listaUsuarios != null) && (listaUsuarios.size() > 0))
				? (List<Usuarios>) listaUsuarios : listaUsuarios;
	}

	@SuppressWarnings("unchecked")
	public List<Usuarios> getListaNombreUsuariosWithSQL(String userRole, String sqlfind) {

		List<Usuarios> listaUsuarios;
		switch(userRole) {
		case "ROLE_MASTER":
			listaUsuarios = this.getSessionFactory().getCurrentSession()
			.createQuery("SELECT username FROM Usuarios WHERE username LIKE :sqlfind")
			.setString("sqlfind", "%"+sqlfind+"%")
			.list();
			break;
		case "ROLE_ADMIN":
			listaUsuarios = this.getSessionFactory().getCurrentSession()
			.createQuery("SELECT username FROM Usuarios WHERE ref_role = 'ROLE_USER' AND username LIKE :sqlfind")
			.setString("sqlfind", "%"+sqlfind+"%")
			.list();
			break;
		default:
			listaUsuarios = null;
			break;
		}
		
		return ((listaUsuarios != null) && (listaUsuarios.size() > 0))
				? (List<Usuarios>) listaUsuarios : listaUsuarios;
	}

	/* Esta clase User implementa UserDetails */
	public User buildUserForAuthentication(Usuarios usuario, List<GrantedAuthority> listaPrivilegios) {
		return new User(usuario.getUsername(), usuario.getPassword(), usuario.isEnabled(), true, true, true, listaPrivilegios);
	}

	public List<GrantedAuthority> buildUserAuthority(Set<RolesUsuario> rolesUsuario) {
		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
		for (RolesUsuario userRole : rolesUsuario) 
			setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
		List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);
		return Result;
	}

	public CustomUserDetails loadUserByUsername(final String userName) throws UsernameNotFoundException {
		Usuarios usuario = this.findUserByName(userName);
		List<GrantedAuthority> listaPrivilegios = buildUserAuthority(usuario.getUserRole());

		CustomUserDetails cud = new CustomUserDetails();
		cud.setUser(this.buildUserForAuthentication(usuario, listaPrivilegios));
		cud.setAuthorities(listaPrivilegios);
		cud.setUserId(usuario.getIduser());

		return cud;
	}

}