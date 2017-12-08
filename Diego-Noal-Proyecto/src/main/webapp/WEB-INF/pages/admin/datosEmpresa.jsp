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
<title><spring:message text="Datos empresa" /></title>
</head>
<body>
   <div id="navbar">
      <c:url value="/j_spring_security_logout" var="logoutUrl" />
      <form action="${logoutUrl}" method='POST' id="logoutForm">
         <ul>
            <li>
               <a href="<c:url value="/inicio" />">
                  <input type="button" class="submit" value="<spring:message text="Inicio" />" />
               </a>
            </li>
            <security:authorize access="hasAnyRole('ADMIN', 'MASTER')" var="isAdmin">
               <li>
                  <a href="<c:url value="/admin" />">
                     <input type="button" class="submit" value="<spring:message text="Admin" />" />
                  </a>
               </li>
            </security:authorize>
            <li class="derecha">
               <a>
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
            <spring:message text="Datos de empresa" />
         </h1>
         <hr />
      </div>
      <div id="wcontent">
         <p>
            <spring:message text="Número de empleados: ${nemp}" />
         </p>
         <p>
            <spring:message text="Número de proyectos: ${npro}" />
         </p>
         <p>
            <spring:message text="Horas semanales: 40" />
         </p>
      </div>
      <div id="wfooter">
         <hr />
         <p>
            <a href="<c:url value="/admin" />">
               <input type="button" class="submit" value="<spring:message text="Volver" />" />
            </a>
         </p>
      </div>
   </div>
   <div id="footer">
      <p><spring:message text="Bienvenido ${ulogin}" /></p>
   </div>
</body>
</html>