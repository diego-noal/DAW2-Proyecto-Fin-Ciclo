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
<title><spring:message text="Asignar proyectos" /></title>
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
            <spring:message text="Usuarios asignados:" />
         </h1>
      </div>
      <div id="wcontent">
         <div id="dbusqueda">
            <c:url var="buscarUsuario"
               value="/admin/gestionProyectos/asignarProyecto/${id_proyecto}"></c:url>
            <form id="gAPForm" action="${buscarUsuario}">
               <input id="busu" name="busu" type="search" placeholder="Usuario..." />
               <button type="submit">
                  <spring:message text="Buscar" />
               </button>
            </form>
         </div>
         <div class="divtable">
            <table class="divthead">
               <tr>
                  <td class="hide">
                     <input type="hidden" value="ID" />
                  </td>
                  <td class="hide">
                     <input type="hidden" value="IDproyecto" />
                  </td>
                  <td>
                     <spring:message text="Proyecto" />
                  </td>
                  <td>
                     <spring:message text="Usuario" />
                  </td>
                  <security:authorize access="hasRole('MASTER')">
                     <td>
                        <spring:message text="Designar" />
                     </td>
                  </security:authorize>
               </tr>
            </table>
            <div class="divtbody">
               <table>
                  <c:if test="${!empty listaAsignados}">
                     <c:forEach items="${listaAsignados}" var="usuarios_proyecto">
                        <tr>
                           <td class="hide">
                              <input type="hidden" value="${usuarios_proyecto.id_usuario_proyecto}" />
                           </td>
                           <td class="hide">
                              <input type="hidden" value="${usuarios_proyecto.ref_id_proyecto}" />
                           </td>
                           <td>${usuarios_proyecto.ref_nom_proyecto}</td>
                           <td>${usuarios_proyecto.ref_username}</td>
                           <security:authorize access="hasRole('MASTER')">
                              <td>
                                 <a onclick="return confirmarAccion()"
                                    href="<c:url value='${usuarios_proyecto.ref_id_proyecto}/desasignar/${usuarios_proyecto.id_usuario_proyecto}' />">
                                    <img alt="Borrar" src="<c:url value="/resources/img/del.png" />"
                                       width="24" height="24">
                                 </a>
                              </td>
                           </security:authorize>
                        </tr>
                     </c:forEach>
                  </c:if>
                  <c:if test="${empty listaAsignados}">
                     <p>
                        <spring:message text="No existen usuarios asignados para este proyecto." />
                     </p>
                  </c:if>
               </table>
            </div>
         </div>
         <security:authorize access="hasRole('MASTER')">
            <div id="wrapS">
               <h2>
                  <spring:message text="Usuario a asignar:" />
               </h2>
               <c:url var="aP" value="/admin/gestionProyectos/asignarProyecto/${id_proyecto}/DO"></c:url>
               <form:form action="${aP}" commandName="asignarProyecto" method="POST" id="asignForm">
                  <form:hidden path="id_usuario_proyecto" />
                  <input type="hidden" name="ref_id_proyecto" id="ref_id_proyecto"
                     value="${id_proyecto}" />
                  <input type="hidden" name="ref_nom_proyecto" id="ref_nom_proyecto"
                     value="${nombreProyecto}" />
                  <form:select path="ref_username" items="${listaUsers}" />
                  <p>
                     <a href="<c:url value="/admin/gestionProyectos" />">
                        <input type="button" class="submit" value="<spring:message text="Volver" />" /></a>
                     <input type="submit" class="submit"
                        value="<spring:message
							text="Asignar" />" />
                  </p>
               </form:form>
            </div>
         </security:authorize>
      </div>
      <div id="wfooter">
         <security:authorize access="hasRole('ADMIN')">
            <p>
               <a href="<c:url value="/admin/gestionProyectos" />">
                  <input type="button" class="submit" value="<spring:message text="Volver" />" />
               </a>
            </p>
         </security:authorize>
      </div>
   </div>
   <div id="footer">
      <p>
         <spring:message text="Bienvenido ${ulogin}" />
      </p>
   </div>
</body>
</html>