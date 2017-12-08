package com.diego.control;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.diego.modelo.Proyectos;
import com.diego.modelo.Usuarios;
import com.diego.modelo.UsuariosProyecto;

@Controller
public class AdminController extends UtilidadesControl {

	// ADMIN
	@RequestMapping(value = "/admin")
	public ModelAndView adminPage() {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		this.setNameULogin(authentication.getName());
		this.setIdULogin(this.getUsuariosServicio().getIdUserByName(this.getNameULogin()));
		this.setRoleULogin(this.getUsuariosServicio().findUserByName(this.getNameULogin()).getRef_role());

		ModelAndView model = new ModelAndView("admin");
		model.addObject("ulogin", this.getNameULogin());
		return model;

	}

	// GESTIÓN DE USUARIOS
	@RequestMapping(value = "/admin/gestionUsuarios")
	public ModelAndView viewGestionUsuarios(@RequestParam(value = "busu", required = false) String sqlfind) {

		ModelAndView model = new ModelAndView("admin/gestionUsuarios");
		model.addObject("nuevoUsuario", new Usuarios());
		if(sqlfind == null || sqlfind.equals(""))
			model.addObject("listaUsuarios", this.getUsuariosServicio().getListaUsuariosWithSQL("ROLE_MASTER", ""));
		else
			model.addObject("listaUsuarios", this.getUsuariosServicio().getListaUsuariosWithSQL("ROLE_MASTER", sqlfind));
		model.addObject("ulogin", this.getNameULogin());
		return model;

	}

	@RequestMapping(value = "/admin/gestionUsuarios/crearUsuario")
	public ModelAndView CrearUsuario(Usuarios u, boolean isAdmin, RedirectAttributes redirectAttributes,
			@RequestParam(value = "editUName", required = false) String editUName ) {

		// Añadir:
		if (u.getIduser() == 0 && this.getRoleULogin().equals("ROLE_MASTER")) {
			// Si la validación es negativa:
			if(u.getUsername() == null || u.getUsername().equals("") || u.getPassword() == null || u.getPassword().equals(""))
				redirectAttributes.addFlashAttribute("error", "[SERVER]: Complete los campos (*).");
			else {
				this.getUsuariosServicio().aadUsuario(u, isAdmin);
				this.getRolesUsuarioServicio().setRolesUsuario(u, isAdmin);
			}
		} 
		// Editar (1 = MAESTRO no-editable):
		else if(u.getIduser() > 1 && this.getRoleULogin().equals("ROLE_MASTER")) {
			// Si la validación en negativa:
			if(u.getUsername() == null || u.getUsername().equals("") ||
					u.getPassword() == null || u.getPassword().equals("")) {
				ModelAndView model = new ModelAndView("redirect:/admin/gestionUsuarios/editarUsuario/" + editUName);
				redirectAttributes.addFlashAttribute("error", "[SERVER]: Complete los campos (*).");
				return model;
			} else {
				this.getUsuariosServicio().updateUsuario(u, isAdmin);
				this.getRolesUsuarioServicio().updateRolesUsuario(u, isAdmin);
			}
		}

		ModelAndView model = new ModelAndView("redirect:/admin/gestionUsuarios");
		return model;

	}

	@RequestMapping("/admin/gestionUsuarios/borrarUsuario/{username}")
	public ModelAndView borrarUsuario(@PathVariable("username") String username) {

		ModelAndView model = new ModelAndView("redirect:/admin/gestionUsuarios");
		this.getUsuariosServicio().deleteUsuario(username);
		return model;

	}

	@RequestMapping("/admin/gestionUsuarios/editarUsuario/{username}")
	public ModelAndView editarUsuario(@PathVariable("username") String username) {

		ModelAndView model = new ModelAndView("admin/gestionUsuarios");
		model.addObject("esAdmin", this.getRolesUsuarioServicio().isRolesAdmin(this.getUsuariosServicio().getIdUserByName(username)));
		model.addObject("nuevoUsuario", this.getUsuariosServicio().findUserByName(username));
		model.addObject("listaUsuarios", this.getUsuariosServicio().getListaUsuariosWithSQL("ROLE_MASTER", ""));
		model.addObject("ulogin", this.getNameULogin());
		return model;

	}

	@RequestMapping("/admin/gestionUsuarios/verUsuario/{username}")
	public ModelAndView verUsuario(@PathVariable("username") String username) {

		ModelAndView model = new ModelAndView("admin/verUsuarios");
		model.addObject("dusuario", this.getDatosUsuarioServicio().getDatosUsuario(username));
		model.addObject("ulogin", this.getNameULogin());
		return model;

	}

	// GESTIÓN DE PROYECTOS
	@RequestMapping(value = "/admin/gestionProyectos")
	public ModelAndView viewGestionProyectos(@RequestParam(value = "bpro", required = false) String sqlfind) {

		ModelAndView model = new ModelAndView("admin/gestionProyectos");
		model.addObject("nuevoProyecto", new Proyectos());
		if(sqlfind == null || sqlfind.equals(""))
			model.addObject("listaProyectos", this.getProyectosServicio().getListaProyectos());
		else
			model.addObject("listaProyectos", this.getProyectosServicio().getListaProyectosWithSQL(sqlfind));
		model.addObject("listaFases", this.getFasesProyectoServicio().getFasesProyecto());
		model.addObject("ulogin", this.getNameULogin());
		model.addObject("uloginrole", this.getRoleULogin());
		return model;

	}

	@RequestMapping(value = "/admin/gestionProyectos/crearProyecto")
	public ModelAndView crearProyecto(Proyectos p, RedirectAttributes redirectAttributes) {

		// Añadir.
		if (p.getId_proyecto() == 0 && this.getRoleULogin().equals("ROLE_MASTER")) {
			// Si la validación es negativa:
			if(p.getNom_proyecto() == null || p.getNom_proyecto().equals(""))
				redirectAttributes.addFlashAttribute("error", "[SERVER]: Complete los campos (*).");
			else 	
				this.getProyectosServicio().crearProyecto(p);
		}
		// Editar.
		else if(p.getId_proyecto() > 0 && this.getRoleULogin().equals("ROLE_MASTER")) { 
			// Si la validación es negativa: 
			if(p.getNom_proyecto() == null || p.getNom_proyecto().equals("")) {
				ModelAndView model = new ModelAndView("redirect:/admin/gestionProyectos/editarProyecto/" + p.getId_proyecto());
				redirectAttributes.addFlashAttribute("error", "[SERVER]: Complete los campos (*).");
				return model;
			}
			else 
				this.getProyectosServicio().editarProyecto(p);
		}

		ModelAndView model = new ModelAndView("redirect:/admin/gestionProyectos");
		return model;

	}

	@RequestMapping("/admin/gestionProyectos/borrarProyecto/{id_proyecto}")
	public ModelAndView borrarProyecto(@PathVariable("id_proyecto") int id_proyecto) {

		ModelAndView model = new ModelAndView("redirect:/admin/gestionProyectos");
		this.getProyectosServicio().borrarProyecto(id_proyecto);
		return model;

	}

	@RequestMapping("/admin/gestionProyectos/editarProyecto/{id_proyecto}")
	public ModelAndView editarProyecto(@PathVariable("id_proyecto") int id_proyecto) {

		ModelAndView model = new ModelAndView("admin/gestionProyectos");
		model.addObject("nuevoProyecto", this.getProyectosServicio().getProyectoById(id_proyecto));
		model.addObject("listaProyectos", this.getProyectosServicio().getListaProyectos());
		model.addObject("listaFases", this.getFasesProyectoServicio().getFasesProyecto());
		model.addObject("ulogin", this.getNameULogin());
		model.addObject("uloginrole", this.getRoleULogin());
		return model;

	}

	@RequestMapping("/admin/gestionProyectos/asignarProyecto/{id_proyecto}")
	public ModelAndView asignarProyecto(@PathVariable("id_proyecto") int id_proyecto, 
			@RequestParam(value = "busu", required = false) String sqlfind) {

		ModelAndView model = new ModelAndView("admin/asignarProyectos");
		if(sqlfind == null || sqlfind.equals(""))
			model.addObject("listaAsignados", this.getUsuariosProyectoServicio().getUsersByProjectIdWithSQL(id_proyecto, ""));
		else
			model.addObject("listaAsignados", this.getUsuariosProyectoServicio().getUsersByProjectIdWithSQL(id_proyecto, sqlfind));
		model.addObject("id_proyecto", id_proyecto);
		model.addObject("nombreProyecto", this.getProyectosServicio().getProyectoById(id_proyecto).getNom_proyecto());
		model.addObject("listaUsers", this.getUsuariosServicio().getListaNombreUsuariosWithSQL(this.getRoleULogin(), ""));
		model.addObject("asignarProyecto", new UsuariosProyecto());
		model.addObject("ulogin", this.getNameULogin());
		return model;

	}

	@RequestMapping("/admin/gestionProyectos/asignarProyecto/{id_proyecto}/DO")
	public ModelAndView asignarProyectoDO(@PathVariable("id_proyecto") int id_proyecto, UsuariosProyecto usuariosProyecto) {

		ModelAndView model = new ModelAndView("redirect:/admin/gestionProyectos/asignarProyecto/" + id_proyecto);
		this.getUsuariosProyectoServicio().asignarUsuarioEnProyeto(usuariosProyecto);
		return model;

	}


	@RequestMapping("/admin/gestionProyectos/asignarProyecto/{id_proyecto}/desasignar/{id_usuario_proyecto}")
	public ModelAndView esasignarDeProyecto(@PathVariable("id_proyecto") int id_proyecto,
			@PathVariable("id_usuario_proyecto") int id_usuario_proyecto) {

		ModelAndView model = new ModelAndView("redirect:/admin/gestionProyectos/asignarProyecto/" + id_proyecto);
		this.getUsuariosProyectoServicio().desasignarUsuarioDeProyecto(id_usuario_proyecto);
		return model;

	}

	// GESTIÓN HORAS
	@RequestMapping("/admin/gestionHoras")
	public ModelAndView gestionarHoras(@RequestParam(value = "busu", required = false) String sqlfind) {

		ModelAndView model = new ModelAndView("admin/gestionHoras");
		if(sqlfind == null || sqlfind.equals(""))
			model.addObject("listaNomUsu", this.getUsuariosServicio().getListaNombreUsuariosWithSQL("ROLE_MASTER", ""));
		else
			model.addObject("listaNomUsu", this.getUsuariosServicio().getListaNombreUsuariosWithSQL("ROLE_MASTER", sqlfind));
		model.addObject("ulogin", this.getNameULogin());
		return model;

	}

	@RequestMapping("/admin/gestionHoras/{username}")
	public ModelAndView gestionarHorasXUsuario(@PathVariable("username") String username, 
			@RequestParam(value = "bpro", required = false) String sqlfind) {

		ModelAndView model = new ModelAndView("admin/gestionHorasXUsuario");
		model.addObject("usuario", username);
		if(sqlfind == null || sqlfind.equals(""))
			model.addObject("listaImputaciones", this.getImputacionesServicio().getImputacionesByNameWithSQL(username, ""));
		else
			model.addObject("listaImputaciones", this.getImputacionesServicio().getImputacionesByNameWithSQL(username, sqlfind));
		model.addObject("horasEnOrden", this.getImputacionesServicio().getHorasEnReglaByName(username));
		model.addObject("horasComparadas", this.getImputacionesServicio().getHorasImputadasByName(username)
				+ " / " + this.getImputacionesServicio().getHorasTotalesAImputarByName(username));
		model.addObject("ulogin", this.getNameULogin());
		return model;

	}

	@RequestMapping("/admin/gestionHoras/{username}/alerta")
	public ModelAndView correoAlertaXUsuario(@PathVariable("username") String username, 
			@RequestParam(value = "bpro", required = false) String sqlfind) {

		ModelAndView model = new ModelAndView("redirect:/admin/gestionHoras/" + username);
		System.out.println("Email enviado [Ampliación (Pendiente)]");
		return model;

	}

	// DATOS EMPRESA
	@RequestMapping("/admin/datosEmpresa")
	public ModelAndView datosEmpresa() {

		ModelAndView model = new ModelAndView("admin/datosEmpresa");
		model.addObject("nemp", this.getUsuariosServicio().getListaNombreUsuariosWithSQL("ROLE_MASTER", "").size());
		model.addObject("npro", this.getProyectosServicio().getListaProyectos().size());
		model.addObject("ulogin", this.getNameULogin());
		return model;

	}

}
