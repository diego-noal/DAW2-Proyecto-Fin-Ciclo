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
<title><spring:message text="Cambiar datos" /></title>
</head>
<body>
   <div id="navbar">
      <c:url value="/j_spring_security_logout" var="logoutUrl" />
      <form action="${logoutUrl}" method='POST' id="logoutForm">
         <ul>
            <li>
               <a href="<c:url value="/inicio" />"> <input type="button" class="submit"
                     value="<spring:message text="Inicio" />" />
               </a>
            </li>
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
            <spring:message text="Cambiar datos" />
         </h1>
         <hr />
      </div>
      <div id="wcontent">
         <c:url var="updateUser" value="/inicio/cambiarDatosDO"></c:url>
         <form:form action="${updateUser}" commandName="userData" id="udataForm">
            <form:label path="ref_username">
               <spring:message text="Usuario: " />
            </form:label>
            <form:input path="ref_username" readonly="true" disabled="true" maxlength="45" />
            <form:hidden path="ref_username" />
            <form:label path="nombre">
               <spring:message text="Nombre: " />
            </form:label>
            <form:input path="nombre" maxlength="45" />
            <form:label path="apellido1">
               <spring:message text="Primer apellido: " />
            </form:label>
            <form:input path="apellido1" maxlength="45" />
            <form:label path="apellido2">
               <spring:message text="Segundo apellido: " />
            </form:label>
            <form:input path="apellido2" maxlength="45" />
            <form:label path="telefono">
               <spring:message text="Teléfono" />
            </form:label>
            <form:input path="telefono" maxlength="45" />
            <form:label path="email">
               <spring:message text="E-mail: " />
            </form:label>
            <form:input path="email" maxlength="45" />
            <form:label path="direccion">
               <spring:message text="Dirección: " />
            </form:label>
            <form:input path="direccion" maxlength="150" />
            <form:label path="cod_postal">
               <spring:message text="Código postal" />
            </form:label>
            <form:input path="cod_postal" maxlength="10" />
            <c:url var="volverHome" value="/inicio"></c:url>
            <p>
               <a href="<c:url value="/inicio" />"> <input type="button" class="submit"
                     value="<spring:message text="Volver" />" /></a>
               <input type="submit" class="submit" value="<spring:message
							text="Editar" />"
                  onclick="return confirmarAccion() " />
            </p>
         </form:form>
      </div>
      <div id="wfooter"></div>
   </div>
   <div id="footer">
      <p>
         <spring:message text="Bienvenido ${ulogin}" />
      </p>
   </div>
</body>
</html>