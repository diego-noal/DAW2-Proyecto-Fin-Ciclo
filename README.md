# DAW2-Proyecto-Fin-Ciclo

TAREAS ACTUALES
===============

Vista USER
----------

+ Debugging.

Vista ADMIN
-----------

+ Debugging.


Estructura del Proyecto
=======================

http://localhost:8080/NombreProyecto

	/login (vista) 
	/403error (vista) 
	/404error (vista) 
	/Excepcion (vista) 
	/inicio (vista) 
		/cambiarDatos (vista) 
		/cambiarDatosDO 
		/cambiarContraseña (vista) 
		/cambiarContraseñaDO 
		/misProyectos (vista) 
			/{id_proyecto}/imputarHoras (vista) 
			/{id_proyecto}/imputarHorasDO 
		/horasImputadas (vista) 
	/admin (vista) 
		/gestionUsuarios (vista) 
			/crearUsuario 
			/borrarUsuario/{username} 
			/editarUsuario/{username} 
			/verUsuario/{username} (vista)
		/gestionProyectos (vista)
			/crearProyecto 
			/borrarProyecto/{id_proyecto} 
			/editarProyecto/{id_proyecto} 
			/asignarProyecto/{id_proyecto} (vista) 
				/DO
				/asignarUsuario
				/designarUsuario/{id_usuario_proyecto} 
		/gestionHoras (vista) 
			/{username} (vista) 
				/alerta
		/datosEmpresa (vista) 

AMPLIACIONES
============

+ ROLE_MASTER, enviar correo autogenerado, al usuario para informar de que no tiene sus imputaciones en regla.
+ Inclusión de gráficas para una versión detallada de los datos de los proyectos, etc. En "Datos de Empresa".
+ Conexion REST para conectarse desde el móvil.
+ Uso de Ajax.
