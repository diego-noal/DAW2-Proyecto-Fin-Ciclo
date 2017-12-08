package com.diego.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@RequestMapping(value = {"/", "/login"})
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {

		ModelAndView model = new ModelAndView("login");
		if (error != null) 
			model.addObject("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
		if (logout != null) 
			model.addObject("msg", "Te has desconectado con éxito.");
		return model;

	}
	
	private String getErrorMessage(HttpServletRequest request, String key) {

		Exception exception = (Exception) request.getSession().getAttribute(key);
		if (exception instanceof BadCredentialsException) 
			return "¡Credenciales inválidas!";
		else if (exception instanceof LockedException) 
			return exception.getMessage();
		else 
			return "¡Credenciales inválidas!";
		
	}
	
}
