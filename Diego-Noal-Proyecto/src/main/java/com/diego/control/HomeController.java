package com.diego.control;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.diego.modelo.DatosUsuario;
import com.diego.modelo.Imputaciones;
import com.diego.modelo.Usuarios;

@Controller
public class HomeController extends UtilidadesControl {

	// inicio
	@RequestMapping(value = "/inicio")
	public ModelAndView defaultPage() {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		this.setNameULogin(authentication.getName());
		this.setIdULogin(this.getUsuariosServicio().getIdUserByName(this.getNameULogin()));
		this.setRoleULogin(this.getUsuariosServicio().findUserByName(this.getNameULogin()).getRef_role());

		ModelAndView model = new ModelAndView("inicio");
		model.addObject("ulogin", this.getNameULogin());
		return model;

	}

	@RequestMapping(value = "/inicio/cambiarDatos")
	public ModelAndView writeUserData() {

		ModelAndView model = new ModelAndView("inicio/cambiarDatos");
		model.addObject("userData", this.getDatosUsuarioServicio().getDatosUsuario(this.getNameULogin()));
		model.addObject("ulogin", this.getNameULogin());
		return model;

	}

	@RequestMapping(value = "/inicio/cambiarDatosDO")
	public ModelAndView updateUserData(DatosUsuario ud) {

		ModelAndView model = new ModelAndView("redirect:/inicio");
		ud.setRef_username(this.getNameULogin());
		this.getDatosUsuarioServicio().setDatosUsuario(ud);
		return model;

	}

	// cambiar contraseña
	@RequestMapping(value = "/inicio/cambiarContraseña")
	public ModelAndView newUserPass(@RequestParam(value = "error", required = false) String error) {

		ModelAndView model = new ModelAndView("inicio/cambiarContraseña");
		model.addObject("usuario", this.getUsuariosServicio().findUserByName(this.getNameULogin()));
		model.addObject("ulogin", this.getNameULogin());
		return model;

	}

	@RequestMapping(value = "/inicio/cambiarContraseñaDO")
	public ModelAndView saveNewUserPass(Usuarios u, String pass2, RedirectAttributes redirectAttributes) throws UnsupportedEncodingException {

		if ( u.getPassword() == null || u.getPassword().equals("") || !u.getPassword().equals(pass2)) {
			String urlEncodedUTF8 = URLEncoder.encode("cambiarContraseña", "UTF-8");
			ModelAndView model = new ModelAndView("redirect:/inicio/" + urlEncodedUTF8);
			redirectAttributes.addFlashAttribute("error", "[SERVER]: Las contraseñas no coinciden o están vacias.");
			return model;
		}

		ModelAndView model = new ModelAndView("redirect:/inicio");
		u.setIduser(this.getIdULogin());
		u.setUsername(this.getNameULogin());
		u.setRef_role(this.getRoleULogin());
		this.getUsuariosServicio().updateUsuario(u);
		return model;

	}

	// mis proyectos
	@RequestMapping(value = "/inicio/misProyectos")
	public ModelAndView viewMisProyectos() {

		ModelAndView model = new ModelAndView("inicio/misProyectos");
		model.addObject("listaProyectos", this.getUsuariosProyectoServicio().getProjectsByUser(this.getNameULogin()));
		model.addObject("ulogin", this.getNameULogin());
		return model;

	}

	@RequestMapping(value = "/inicio/misProyectos/{id_proyecto}/imputarHoras")
	public ModelAndView viewImputarHoras(@PathVariable("id_proyecto") int id_proyecto) {

		ModelAndView model = new ModelAndView("inicio/imputarHoras");
		model.addObject("id_proyecto", id_proyecto);
		model.addObject("nom_proyecto", this.getProyectosServicio().getProyectoById(id_proyecto).getNom_proyecto());
		model.addObject("ref_username", this.getNameULogin());
		model.addObject("nuevaImputacion", new Imputaciones());
		model.addObject("listaTareas", this.getTareasServicio().getListaTareas());
		model.addObject("ulogin", this.getNameULogin());
		return model;

	}

	@RequestMapping(value = "/inicio/misProyectos/{id_proyecto}/imputarHorasDO")
	public ModelAndView imputarHorasDO(@PathVariable("id_proyecto") int id_proyecto,
			Imputaciones imputacion, RedirectAttributes redirectAttributes) {

		if(!imputacion.getFecha().matches("^\\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$")
				|| !imputacion.getHoras().matches("^\\d{1}$")) {
			ModelAndView model = new ModelAndView("redirect:/inicio/misProyectos/"+ id_proyecto + "/imputarHoras");
			redirectAttributes.addFlashAttribute("error", "[SERVER]: Complete los campos (*) correctamente.");
			return model;
		}

		ModelAndView model = new ModelAndView("redirect:/inicio/horasImputadas");
		imputacion.setRef_id_proyecto(id_proyecto);
		imputacion.setRef_nom_proyecto(this.getProyectosServicio().getProyectoById(id_proyecto).getNom_proyecto());
		imputacion.setRef_username(this.getNameULogin());
		this.getImputacionesServicio().crearImputacion(imputacion);
		return model;

	}

	@RequestMapping(value = "/inicio/horasImputadas")
	public ModelAndView viewHorasImputadas(@RequestParam(value = "bpro", required = false) String sqlfind) {

		ModelAndView model = new ModelAndView("inicio/horasImputadas");
		if(sqlfind == null || sqlfind.equals(""))
			model.addObject("listaImputaciones", this.getImputacionesServicio().getImputacionesByNameWithSQL(this.getNameULogin(), ""));
		else
			model.addObject("listaImputaciones", this.getImputacionesServicio().getImputacionesByNameWithSQL(this.getNameULogin(), sqlfind));
		model.addObject("horasEnOrden", this.getImputacionesServicio().getHorasEnReglaByName(this.getNameULogin()));
		model.addObject("horasComparadas", this.getImputacionesServicio().getHorasImputadasByName(this.getNameULogin())
				+ " / " + this.getImputacionesServicio().getHorasTotalesAImputarByName(this.getNameULogin()));
		model.addObject("ulogin", this.getNameULogin());
		return model;

	}

	// 403
	@RequestMapping(value = "/403error")
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView("403error");
		return model;

	}

	// 404
	@RequestMapping(value = "/404error")
	public ModelAndView pageNotFound() {

		ModelAndView model = new ModelAndView("404error");
		return model;

	}

}