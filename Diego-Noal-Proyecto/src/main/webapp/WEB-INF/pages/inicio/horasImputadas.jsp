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
<title><spring:message text="Horas Imputadas" /></title>
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
   <div id="wrapL">
      <div id="wheader">
         <h1>
            <spring:message text="Horas Imputadas" />
         </h1>
      </div>
      <div id="wcontent">
         <div id="dbusqueda">
            <c:url var="buscarProyecto" value="/inicio/horasImputadas"></c:url>
            <form id="bIForm" action="${buscarProyecto}">
               <input id="bpro" name="bpro" type="search" placeholder="Proyecto..." />
               <button type="submit">
                  <spring:message text="Buscar" />
               </button>
            </form>
         </div>
         <div class="divtable">
            <table class="divthead">
               <tr>
                  <td>
                     <spring:message text="Fecha" />
                  </td>
                  <td>
                     <spring:message text="Proyecto" />
                  </td>
                  <td>
                     <spring:message text="Tarea" />
                  </td>
                  <td>
                     <spring:message text="Observaciones" />
                  </td>
                  <td>
                     <spring:message text="Horas" />
                  </td>
               </tr>
            </table>
            <div class="divtbody">
               <table>
                  <c:if test="${!empty listaImputaciones}">
                     <c:forEach items="${listaImputaciones}" var="imputacion">
                        <tr>
                           <td>${imputacion.fecha}</td>
                           <td>${imputacion.ref_nom_proyecto}</td>
                           <td>${imputacion.ref_tarea}</td>
                           <td>${imputacion.comentarios}</td>
                           <td>${imputacion.horas}</td>
                        </tr>
                     </c:forEach>
                  </c:if>
                  <c:if test="${empty listaImputaciones}">
                     <p>
                        <spring:message text="No has realizado ninguna imputación." />
                     </p>
                  </c:if>
               </table>
            </div>
            <c:choose>
               <c:when test="${horasEnOrden}">
                  <p style="color: green;">
                     <spring:message text="Has imputado todas tus horas. ${horasComparadas}" />
                  </p>
               </c:when>
               <c:otherwise>
                  <p style="color: red;">
                     <spring:message text="No has imputado todas tus horas. ${horasComparadas}" />
                  </p>
               </c:otherwise>
            </c:choose>
         </div>
      </div>
      <div id="wfooter">
         <p>
            <a href="<c:url value="/inicio" />"> <input type="button" class="submit"
                  value="<spring:message text="Volver" />" />
            </a>
         </p>
      </div>
   </div>
   <div id="footer">
      <p>
         <spring:message text="Bienvenido ${ulogin}" />
      </p>
   </div>
</body>
</html>