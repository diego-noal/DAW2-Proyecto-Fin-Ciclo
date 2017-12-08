package com.diego.dao.rolesUsuario;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.diego.dao.GenericoDAOImpl;
import com.diego.modelo.RolesUsuario;
import com.diego.modelo.Usuarios;

@Repository("rolesUsuarioDAOImpl")
public class RolesUsuarioDAOImpl extends GenericoDAOImpl implements RolesUsuarioDAO {

	public void setRolesUsuario(Usuarios usuario, boolean isAdmin) {
		RolesUsuario rol = new RolesUsuario();
		rol.setUser(usuario);
		if (isAdmin) rol.setRole("ROLE_ADMIN");
		else rol.setRole("ROLE_USER");
		this.getSessionFactory().getCurrentSession().persist(rol);
	}

	public void updateRolesUsuario(Usuarios usuario, boolean isAdmin) {
		if(isAdmin) {
			this.getSessionFactory().getCurrentSession()
			.createQuery("UPDATE RolesUsuario SET role = 'ROLE_ADMIN' WHERE ref_iduser = :idUser ")
			.setInteger("idUser", usuario.getIduser()).executeUpdate();  
		} else {
			this.getSessionFactory().getCurrentSession()
			.createQuery("UPDATE RolesUsuario SET role = 'ROLE_USER' WHERE ref_iduser = :idUser ")
			.setInteger("idUser", usuario.getIduser()).executeUpdate();  
		}
	}

	@SuppressWarnings("unchecked")
	public boolean isRolesAdmin(int idUser) {
		
		List<RolesUsuario> roles = this.getSessionFactory().getCurrentSession()
			.createQuery("FROM RolesUsuario WHERE user = :idUser")
			.setInteger("idUser", idUser)
			.list();
		if (roles.size() > 0) 
			if (roles.get(0).getRole().equals("ROLE_ADMIN")) return true;
		return false;
	}

}
