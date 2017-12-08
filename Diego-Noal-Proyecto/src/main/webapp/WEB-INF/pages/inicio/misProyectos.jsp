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
<title><spring:message text="Mis Proyectos" /></title>
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
            <spring:message text="Mis Proyectos" />
         </h1>
      </div>
      <div id="wcontent">
         <div class="divtable">
            <table class="divthead">
               <tr>
                  <td class="hide">
                     <input type="hidden" value="ID" />
                  </td>
                  <td>
                     <spring:message text="Nombre del proyecto" />
                  </td>
                  <td>
                     <spring:message text="Imputar" />
                  </td>
               </tr>
            </table>
            <div class="divtbody">
               <table>
                  <c:if test="${!empty listaProyectos}">
                     <c:forEach items="${listaProyectos}" var="uProyecto">
                        <tr>
                           <td class="hide">
                              <input type="hidden" value="${uProyecto.ref_id_proyecto}" />
                           </td>
                           <td>${uProyecto.ref_nom_proyecto}</td>
                           <td>
                              <a
                                 href="<c:url value='/inicio/misProyectos/${uProyecto.ref_id_proyecto}/imputarHoras' />">
                                 <img alt="Imputar" src="<c:url value="/resources/img/add.png" />"
                                    width="24" height="24">
                              </a>
                           </td>
                        </tr>
                     </c:forEach>
                  </c:if>
                  <c:if test="${empty listaProyectos}">
                     <p>
                        <spring:message text="No estás asignado a ningún proyecto." />
                     </p>
                  </c:if>
               </table>
            </div>
         </div>
      </div>
      <div id="wfooter">
         <a href="<c:url value="/inicio" />"> <input type="button" class="submit"
               value="<spring:message text="Volver" />" />
         </a>
      </div>
   </div>
   <div id="footer">
      <p>
         <spring:message text="Bienvenido ${ulogin}" />
      </p>
   </div>
</body>
</html>