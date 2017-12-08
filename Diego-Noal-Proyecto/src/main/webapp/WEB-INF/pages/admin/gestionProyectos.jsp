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
<title><spring:message text="Gestión de proyectos" /></title>
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
            <spring:message text="Lista de proyectos" />
         </h1>
      </div>
      <div id="wcontent">
         <div id="dbusqueda">
            <c:url var="buscarProyecto" value="/admin/gestionProyectos"></c:url>
            <form id="bPForm" action="${buscarProyecto}">
               <input id="bpro" name="bpro" type="search" placeholder="Proyecto..." />
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
                  <td>
                     <spring:message text="Nombre" />
                  </td>
                  <td>
                     <spring:message text="Fase" />
                  </td>
                  <td>
                     <spring:message text="Descripción" />
                  </td>
                  <security:authorize access="hasRole('MASTER')">
                     <td>
                        <spring:message text="Editar" />
                     </td>
                     <td>
                        <spring:message text="Borrar" />
                     </td>
                  </security:authorize>
                  <c:choose>
                     <c:when test="${uloginrole == 'ROLE_MASTER'}">
                        <td>
                           <spring:message text="Asignar" />
                        </td>
                     </c:when>
                     <c:when test="${uloginrole == 'ROLE_ADMIN'}">
                        <td>
                           <spring:message text="Ver asignados" />
                        </td>
                     </c:when>
                  </c:choose>
               </tr>
            </table>
            <div class="divtbody">
               <table>
                  <c:if test="${!empty listaProyectos}">
                     <c:forEach items="${listaProyectos}" var="proyecto">
                        <tr>
                           <td class="hide">
                              <input type="hidden" value="${proyecto.id_proyecto}" />
                           </td>
                           <td>${proyecto.nom_proyecto}</td>
                           <td>${proyecto.ref_fase_pro}</td>
                           <td>${proyecto.descripcion}</td>
                           <security:authorize access="hasRole('MASTER')">
                              <td>
                                 <a
                                    href="<c:url value='/admin/gestionProyectos/editarProyecto/${proyecto.id_proyecto}' />">
                                    <img alt="Editar" src="<c:url value="/resources/img/edi.png" />"
                                       width="24" height="24">
                                 </a>
                              </td>
                              <td>
                                 <a onclick="return confirmarAccion()"
                                    href="<c:url value='/admin/gestionProyectos/borrarProyecto/${proyecto.id_proyecto}' />">
                                    <img alt="Borrar" src="<c:url value="/resources/img/del.png" />"
                                       width="24" height="24">
                                 </a>
                              </td>
                           </security:authorize>
                           <td>
                              <a
                                 href="<c:url value='/admin/gestionProyectos/asignarProyecto/${proyecto.id_proyecto}' />">
                                 <img alt="Asignar" src="<c:url value="/resources/img/assi.png" />"
                                    width="24" height="24">
                              </a>
                           </td>
                        </tr>
                     </c:forEach>
                  </c:if>
                  <c:if test="${empty listaProyectos}">
                     <p>
                        <spring:message text="No existen proyectos." />
                     </p>
                  </c:if>
               </table>
            </div>
         </div>
         <security:authorize access="hasRole('MASTER')">
            <div id="wrapS">
               <h2>
                  <spring:message text="Añadir proyecto" />
               </h2>
               <c:url var="crearProyecto" value="/admin/gestionProyectos/crearProyecto"></c:url>
               <form:form action="${crearProyecto}" commandName="nuevoProyecto" method="POST"
                  id="gPForm">
                  <form:hidden path="id_proyecto" />
                  <form:label path="nom_proyecto">
                     <spring:message text="(*) Nombre: " />
                  </form:label>
                  <form:input path="nom_proyecto" required="required" />
                  <form:label path="ref_fase_pro">
                     <spring:message text="Fase: " />
                  </form:label>
                  <form:select path="ref_fase_pro" items="${listaFases}" />
                  <form:label path="descripcion">
                     <spring:message text="Descripción: " />
                  </form:label>
                  <form:input path="descripcion" />
                  <p>
                     <a href="<c:url value="/admin" />">
                        <input type="button" class="submit" value="<spring:message text="Volver" />" /></a>
                     <c:if test="${!empty nuevoProyecto.nom_proyecto}">
                        <input type="submit" class="submit"
                           value="<spring:message
							text="Editar" />"
                           onclick="validarCrearEditarProyecto(event)" />
                     </c:if>
                     <c:if test="${empty nuevoProyecto.nom_proyecto}">
                        <input type="submit" class="submit"
                           value="<spring:message
							text="Crear" />"
                           onclick="validarCrearEditarProyecto(event)" />
                     </c:if>
                  </p>
               </form:form>
            </div>
         </security:authorize>
      </div>
      <div id="wfooter">
         <security:authorize access="hasRole('MASTER')">
            <div id="error" <c:if test="${not empty error}"> class="error"</c:if>>
               <c:if test="${not empty error}">${error}</c:if>
            </div>
         </security:authorize>
         <security:authorize access="hasRole('ADMIN')">
            <p>
               <a href="<c:url value="/admin" />">
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