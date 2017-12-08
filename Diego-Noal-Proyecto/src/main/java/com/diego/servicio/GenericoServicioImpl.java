package com.diego.servicio;

import org.springframework.beans.factory.annotation.Autowired;

import com.diego.dao.datosUsuario.DatosUsuarioDAO;
import com.diego.dao.fasesProyecto.FasesProyectoDAO;
import com.diego.dao.imputaciones.ImputacionesDAO;
import com.diego.dao.proyectos.ProyectosDAO;
import com.diego.dao.rolesUsuario.RolesUsuarioDAO;
import com.diego.dao.tareas.TareasDAO;
import com.diego.dao.usuarios.UsuariosDAO;
import com.diego.dao.usuariosProyecto.UsuariosProyectoDAO;

public class GenericoServicioImpl {

	@Autowired
	private DatosUsuarioDAO datosUsuarioDAO;
	public DatosUsuarioDAO getDatosUsuarioDAO() { return datosUsuarioDAO; }
	public void setDatosUsuarioDAO(DatosUsuarioDAO datosUsuarioDAO) { this.datosUsuarioDAO = datosUsuarioDAO; }

	@Autowired
	RolesUsuarioDAO rolesUsuarioDAO;
	public RolesUsuarioDAO getRolesUsuarioDAO() { return rolesUsuarioDAO; }
	public void setRolesUsuarioDAO(RolesUsuarioDAO rolesUsuarioDAO) { this.rolesUsuarioDAO = rolesUsuarioDAO; }

	@Autowired
	private UsuariosDAO usuarioDAO;
	public UsuariosDAO getUsuarioDAO() { return usuarioDAO; }
	public void setUsuarioDAO(UsuariosDAO usuarioDAO) { this.usuarioDAO = usuarioDAO; }

	@Autowired
	private FasesProyectoDAO fasesProyectoDAO;
	public FasesProyectoDAO getFasesProyectoDAO() { return fasesProyectoDAO; }
	public void setFasesProyectoDAO(FasesProyectoDAO fasesProyectoDAO) { this.fasesProyectoDAO = fasesProyectoDAO; }
	
	@Autowired
	private ProyectosDAO proyectosDAO;
	public ProyectosDAO getProyectosDAO() { return proyectosDAO; }
	public void setProyectosDAO(ProyectosDAO proyectosDAO) { this.proyectosDAO = proyectosDAO; }

	@Autowired
	private UsuariosProyectoDAO usuariosProyectoDAO;
	public UsuariosProyectoDAO getUsuariosProyectoDAO() { return usuariosProyectoDAO; }
	public void setUsuariosProyectoDAO(UsuariosProyectoDAO usuariosProyectoDAO) { this.usuariosProyectoDAO = usuariosProyectoDAO; }

	@Autowired
	private TareasDAO tareasDAO;
	public TareasDAO getTareasDAO() { return tareasDAO; }
	public void setTareasDAO(TareasDAO tareasDAO) { this.tareasDAO = tareasDAO; }

	@Autowired
	private ImputacionesDAO imputacionesDAO;
	public ImputacionesDAO getImputacionesDAO() { return imputacionesDAO; }
	public void setImputacionesDAO(ImputacionesDAO imputacionesDAO) { this.imputacionesDAO = imputacionesDAO; }

}
