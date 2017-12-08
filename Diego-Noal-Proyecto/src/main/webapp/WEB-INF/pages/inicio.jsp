<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<c:url value="/resources/js/pdnr.js" />" charset="UTF-8"></script>
<link href="<c:url value="/resources/css/pdnr.css" />" rel="stylesheet">
<link rel="icon" type="image/png" href="<c:url value="/resources/img/favi.png" />" />
<title><spring:message text="Inicio" /></title>
</head>
<body>
   <div id="navbar">
      <c:url value="/j_spring_security_logout" var="logoutUrl" />
      <form action="${logoutUrl}" method='POST' id="logoutForm">
         <ul>
            <security:authorize access="hasAnyRole('ADMIN', 'MASTER')" var="isAdmin">
               <li>
                  <a href="<c:url value="/admin" />"> <input type="button" class="submit"
                        value="<spring:message text="Admin" />" />
                  </a>
               </li>
            </security:authorize>
            <li class="derecha">
               <a> <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <input type="submit" class="submit"
                     value="<spring:message
							text="Salir" />"
                     onclick="return confirmarAccion()" />
               </a>
            </li>
         </ul>
      </form>
   </div>
   <div id="wrapS">
      <div id="wheader">
         <h1>
            <spring:message text="Inicio" />
         </h1>
         <hr />
      </div>
      <div id='wcontent'>
         <p>
            <a class="navlink" href="<c:url value="/inicio/cambiarDatos" />"> <spring:message
                  text="Cambiar datos" />
            </a>
         </p>
         <p>
            <a class="navlink" href="<c:url value="/inicio/cambiarContraseña" />"> <spring:message
                  text="Cambiar contraseña" />
            </a>
         </p>
         <p>
            <a class="navlink" href="<c:url value="/inicio/misProyectos" />"> <spring:message
                  text="Mis Proyectos" />
            </a>
         </p>
         <p>
            <a class="navlink" href="<c:url value="/inicio/horasImputadas" />"> <spring:message
                  text="Horas imputadas" />
            </a>
         </p>
      </div>
      <div id="wfooter">
         <hr />
      </div>
   </div>
   <div id="footer">
      <p>
         <spring:message text="Bienvenido ${ulogin}" />
      </p>
   </div>
</body>
</html>