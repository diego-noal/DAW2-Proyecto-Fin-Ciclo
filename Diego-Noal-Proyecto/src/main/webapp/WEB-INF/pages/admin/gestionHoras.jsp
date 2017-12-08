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
<title><spring:message text="Gestión de Horas" /></title>
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
   <div id="wrapL">
      <div id="wheader">
         <h1>
            <spring:message text="Gestión de Horas" />
         </h1>
      </div>
      <div id="wcontent">
         <div id="dbusqueda">
            <c:url var="buscarUsuario" value="/admin/gestionHoras"></c:url>
            <form id="gHForm" action="${buscarUsuario}">
               <input id="busu" name="busu" type="search" placeholder="Usuario..." />
               <button type="submit">
                  <spring:message text="Buscar" />
               </button>
            </form>
         </div>
         <div class="divtable">
            <table class="divthead">
               <tr>
                  <td>Usuario</td>
                  <td>Ver</td>
               </tr>
            </table>
            <div class="divtbody">
               <table>
                  <c:if test="${!empty listaNomUsu}">
                     <c:forEach items="${listaNomUsu}" var="username">
                        <tr>
                           <td>${username}</td>
                           <td>
                              <a href="<c:url value='/admin/gestionHoras/${username}' />">
                                 <img alt="Ver" src="<c:url value="/resources/img/see.png" />"
                                    width="24" height="24">
                              </a>
                           </td>
                        </tr>
                     </c:forEach>
                  </c:if>
                  <c:if test="${empty listaNomUsu}">
                     <p>
                        <spring:message text="No existen usuarios que hayan realizado imputaciones." />
                     </p>
                  </c:if>
               </table>
            </div>
         </div>
      </div>
      <div id="wfooter">
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