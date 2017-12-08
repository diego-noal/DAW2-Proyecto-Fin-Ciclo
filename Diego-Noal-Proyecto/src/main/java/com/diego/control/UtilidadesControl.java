package com.diego.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.diego.servicio.datosUsuario.DatosUsuarioServicio;
import com.diego.servicio.fasesProyecto.FasesProyectoServicio;
import com.diego.servicio.imputaciones.ImputacionesServicio;
import com.diego.servicio.proyectos.ProyectosServicio;
import com.diego.servicio.rolesUsuario.RolesUsuarioServicio;
import com.diego.servicio.tareas.TareasServicio;
import com.diego.servicio.usuarios.UsuariosServicio;
import com.diego.servicio.usuariosProyecto.UsuariosProyectoServicio;

@Controller
public class UtilidadesControl {

	private int idULogin;
	public int getIdULogin() { return idULogin; }
	public void setIdULogin(int idULogin) { this.idULogin = idULogin; }
	
	private String nameULogin;
	public String getNameULogin() { return nameULogin; }
	public void setNameULogin(String nameULogin) { this.nameULogin = nameULogin; }
	
	private String roleULogin;
	public String getRoleULogin() { return roleULogin; }
	public void setRoleULogin(String roleULogin) { this.roleULogin = roleULogin; }
	
	@Autowired
	private DatosUsuarioServicio datosUsuarioServicio;
	public DatosUsuarioServicio getDatosUsuarioServicio() { return datosUsuarioServicio; }
	public void setDatosUsuarioServicio(DatosUsuarioServicio datosUsuarioServicio) {
		this.datosUsuarioServicio = datosUsuarioServicio;
	}

	@Autowired
	private UsuariosServicio usuariosServicio;
	public UsuariosServicio getUsuariosServicio() { return usuariosServicio; }
	public void setUsuariosServicio(UsuariosServicio uS) { this.usuariosServicio = uS; }

	@Autowired
	private RolesUsuarioServicio rolesUsuarioServicio;
	public RolesUsuarioServicio getRolesUsuarioServicio() { return rolesUsuarioServicio; }
	public void setRolesUsuarioServicio(RolesUsuarioServicio rUS) { this.rolesUsuarioServicio = rUS; }

	@Autowired
	private ProyectosServicio proyectosServicio;
	public ProyectosServicio getProyectosServicio() { return proyectosServicio; }
	public void setProyectosServicio(ProyectosServicio proyectosServicio) { this.proyectosServicio = proyectosServicio; }

	@Autowired
	private FasesProyectoServicio fasesProyectoServicio;
	public FasesProyectoServicio getFasesProyectoServicio() { return fasesProyectoServicio; }
	public void setFasesProyectoServicio(FasesProyectoServicio fasesProyectoServicio) {
		this.fasesProyectoServicio = fasesProyectoServicio;
	}

	@Autowired
	private UsuariosProyectoServicio usuariosProyectoServicio;
	public UsuariosProyectoServicio getUsuariosProyectoServicio() { return usuariosProyectoServicio;}
	public void setUsuariosProyectoServicio(UsuariosProyectoServicio usuariosProyectoServicio) { 
		this.usuariosProyectoServicio = usuariosProyectoServicio;
	}

	@Autowired
	private TareasServicio tareasServicio;
	public TareasServicio getTareasServicio() { return tareasServicio; }
	public void setTareasServicio(TareasServicio tareasServicio) { this.tareasServicio = tareasServicio; }

	@Autowired
	private ImputacionesServicio imputacionesServicio;
	public ImputacionesServicio getImputacionesServicio() { return imputacionesServicio; }
	public void setImputacionesServicio(ImputacionesServicio imputacionesServicio) { 
		this.imputacionesServicio = imputacionesServicio;
	}

	// Tratamiento de excepciones.
	@ExceptionHandler(Exception.class)
	public ModelAndView handleAllException(Exception ex) {

		ModelAndView model = new ModelAndView("/exception");
		model.addObject("exception", ex);
		return model;

	}
	
}
