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
<title><spring:message text="Imputar horas" /></title>
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
            <spring:message text="Imputar horas" />
         </h1>
         <hr />
      </div>
      <div id="wcontent">
         <c:url value="/inicio/misProyectos/${id_proyecto}/imputarHorasDO" var="iH" />
         <form:form action="${iH}" commandName="nuevaImputacion" method="POST" id="imputarForm">
            <form:hidden path="id_imputacion" />
            <input type="hidden" name="ref_id_proyecto" value="${id_proyecto}" />
            <input type="hidden" name="ref_nom_proyecto" value="${nom_proyecto}" />
            <input type="hidden" name="ref_username" value="${ref_username}" />
            <form:label path="ref_tarea">
               <spring:message text="Tarea realizada: " />
            </form:label>
            <form:select path="ref_tarea" items="${listaTareas}" required="required" />
            <form:label path="comentarios">
               <spring:message text="Comentarios: " />
            </form:label>
            <form:textarea path="comentarios" maxlength="500" />
            <form:label path="fecha">
               <spring:message text="(*) Fecha: [yyyy-mm-dd]" />
            </form:label>
            <form:input path="fecha" maxlength="10" required="required"
               pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])" />
            <form:label path="horas">
               <spring:message text="(*) Número de horas: [n]" />
            </form:label>
            <form:input path="horas" maxlength="1" required="required" pattern="\d" />
            <p>
               <a href="<c:url value="/inicio/misProyectos" />"> <input type="button"
                     class="submit" value="<spring:message text="Volver" />" /></a>
               <input type="submit" class="submit" value="<spring:message
							text="Imputar" />"
                  onclick="validarImputacion(event)" />
            </p>
         </form:form>
      </div>
      <div id="wooter">
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