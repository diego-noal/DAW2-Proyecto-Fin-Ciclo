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
<title><spring:message text="Gestión de usuarios" /></title>
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
            <spring:message text="Lista de usuarios" />
         </h1>
      </div>
      <div id="wcontent">
         <div id="dbusqueda">
            <c:url var="buscarUsuario" value="/admin/gestionUsuarios"></c:url>
            <form id="gUForm" action="${buscarUsuario}">
               <input id="busu" name="busu" type="search" placeholder="Usuario..." />
               <button type="submit">
                  <spring:message text="buscar" />
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
                     <spring:message text="Usuario" />
                  </td>
                  <security:authorize access="hasRole('MASTER')">
                     <td>
                        <spring:message text="Contraseña" />
                     </td>
                  </security:authorize>
                  <td>
                     <spring:message text="¿Activo?" />
                  </td>
                  <td>
                     <spring:message text="Rol" />
                  </td>
                  <security:authorize access="hasRole('MASTER')">
                     <td>
                        <spring:message text="Editar" />
                     </td>
                     <td>
                        <spring:message text="Borrar" />
                     </td>
                  </security:authorize>
                  <td>
                     <spring:message text="Ver" />
                  </td>
               </tr>
            </table>
            <div class="divtbody">
               <table>
                  <c:if test="${!empty listaUsuarios}">
                     <c:forEach items="${listaUsuarios}" var="usuario">
                        <tr>
                           <security:authorize access="hasRole('MASTER')">
                              <td class="hide">
                                 <input type="hidden" value="${usuario.iduser}" />
                              </td>
                           </security:authorize>
                           <td>${usuario.username}</td>
                           <security:authorize access="hasRole('MASTER')">
                              <td>${usuario.password}</td>
                           </security:authorize>
                           <c:choose>
                              <c:when test="${usuario.enabled == true}">
                                 <td>
                                    <spring:message text="Si" />
                                 </td>
                              </c:when>
                              <c:when test="${usuario.enabled == false}">
                                 <td>
                                    <spring:message text="No" />
                                 </td>
                              </c:when>
                           </c:choose>
                           <c:choose>
                              <c:when test="${usuario.ref_role == 'ROLE_MASTER'}">
                                 <td>
                                    <spring:message text="Maestro" />
                                 </td>
                              </c:when>
                              <c:when test="${usuario.ref_role == 'ROLE_ADMIN'}">
                                 <td>
                                    <spring:message text="Administrador" />
                                 </td>
                              </c:when>
                              <c:when test="${usuario.ref_role == 'ROLE_USER'}">
                                 <td>
                                    <spring:message text="Usuario" />
                                 </td>
                              </c:when>
                           </c:choose>
                           <security:authorize access="hasRole('MASTER')">
                              <td>
                                 <a
                                    href="<c:url value='/admin/gestionUsuarios/editarUsuario/${usuario.username}' />">
                                    <c:choose>
                                       <c:when test="${usuario.ref_role == 'ROLE_MASTER'}">
                                          <img alt="Editar"
                                             src="<c:url value="/resources/img/deny.png" />"
                                             width="24" height="24">
                                       </c:when>
                                       <c:otherwise>
                                          <img alt="Editar"
                                             src="<c:url value="/resources/img/edi.png" />"
                                             width="24" height="24">
                                       </c:otherwise>
                                    </c:choose>
                                 </a>
                              </td>
                              <td>
                                 <a onclick="return confirmarAccion()"
                                    href="<c:url value='/admin/gestionUsuarios/borrarUsuario/${usuario.username}' />">
                                    <c:choose>
                                       <c:when test="${usuario.ref_role == 'ROLE_MASTER'}">
                                          <img alt="Borrar"
                                             src="<c:url value="/resources/img/deny.png" />"
                                             width="24" height="24">
                                       </c:when>
                                       <c:otherwise>
                                          <img alt="Borrar"
                                             src="<c:url value="/resources/img/del.png" />"
                                             width="24" height="24">
                                       </c:otherwise>
                                    </c:choose>
                                 </a>
                              </td>
                           </security:authorize>
                           <td>
                              <a
                                 href="<c:url value='/admin/gestionUsuarios/verUsuario/${usuario.username}' />">
                                 <img alt="Ver" src="<c:url value="/resources/img/see.png" />"
                                    width="24" height="24">
                              </a>
                           </td>
                        </tr>
                     </c:forEach>
                  </c:if>
                  <c:if test="${empty listaUsuarios}">
                     <p>
                        <spring:message text="No existen Usuarios." />
                     </p>
                  </c:if>
               </table>
            </div>
         </div>
         <security:authorize access="hasRole('MASTER')">
            <div id="wrapS">
               <h2>
                  <spring:message text="Añadir usuario" />
               </h2>
               <c:url var="crearUsuario" value="/admin/gestionUsuarios/crearUsuario"></c:url>
               <form:form action="${crearUsuario}" commandName="nuevoUsuario" method="POST"
                  id="gUForm">
                  <form:hidden path="iduser" />
                  <c:if test="${!empty nuevoUsuario.username}">
                     <input type="hidden" value="${nuevoUsuario.username}" id="editUName"
                        name="editUName" />
                  </c:if>
                  <form:label path="username">
                     <spring:message text="(*) Usuario: " />
                  </form:label>
                  <form:input path="username" required="required" />
                  <form:label path="password">
                     <spring:message text="(*) Contraseña: " />
                  </form:label>
                  <form:password path="password" required="required" />
                  <form:label path="enabled">
                     <spring:message text="¿Activar la cuenta?" />
                  </form:label>
                  <form:checkbox path="enabled" />
                  <label for="isAdmin">
                     <spring:message text="¿Hacer admin?" />
                  </label>
                  <input type="checkbox" id="isAdmin" name="isAdmin"
                     <c:if test="${esAdmin}">checked</c:if> />
                  <p>
                     <a href="<c:url value="/admin" />">
                        <input type="button" class="submit" value="<spring:message text="Volver" />" /></a>
                     <c:if test="${!empty nuevoUsuario.username}">
                        <input type="submit" class="submit"
                           value="<spring:message
							text="Editar" />"
                           onclick="validarCrearEditarUsuario(event)" />
                     </c:if>
                     <c:if test="${empty nuevoUsuario.username}">
                        <input type="submit" class="submit"
                           value="<spring:message
							text="Crear" />"
                           onclick="validarCrearEditarUsuario(event)" />
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