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
<title><spring:message text="Editar contraseña" /></title>
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
            <spring:message text="Cambiar contraseña" />
         </h1>
         <hr />
      </div>
      <div id="wcontent">
         <c:url var="updatePass" value="/inicio/cambiarContraseñaDO"></c:url>
         <form:form action="${updatePass}" modelAttribute="usuario" id="passForm">
            <form:label path="username">
               <spring:message text="Usuario: " />
            </form:label>
            <form:input path="username" readonly="true" disabled="true" maxlength="45" />
            <form:hidden path="username" />
            <form:label path="password">
               <spring:message text="(*) Contraseña nueva: " />
            </form:label>
            <form:password path="password" id="pass1" required="required" maxlength="60" />
            <label for="password2">
               <spring:message text="(*) Repite contraseña: " />
            </label>
            <input type="password" id="pass2" name="pass2" required="required" maxlength="60" />
            <input type="hidden" name="enabled" value="1">
            <p>
               <a href="<c:url value="/inicio" />"> <input type="button" class="submit"
                     value="<spring:message text="Volver" />" /></a>
               <input type="submit" class="submit" value="<spring:message
							text="Editar" />"
                  onclick="validarCambioPass(event)" />
            </p>
         </form:form>
      </div>
      <div id="wfooter">
         <div id="error" <c:if test="${not empty error}"> class="error"</c:if>>
            <c:if test="${not empty error}">${error}</c:if>
         </div>
      </div>
   </div>
   <div id="footer">
      <p>
         <spring:message text="Bienvenido ${ulogin}" />
      </p>
   </div>
</body>
</html>