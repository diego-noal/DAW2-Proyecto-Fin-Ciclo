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
<title><spring:message text="Login" /></title>
</head>
<body onload='document.loginForm.username.focus();'>
   <div id="wrapS" class="login">
      <div id="wheader" class="login">
         <h1>
            <spring:message text="Login" />
         </h1>
         <hr />
      </div>
      <div id="wcontent" class="login">
         <form id='loginForm' action="<c:url value='/j_spring_security_check' />" method='POST'>
            <p>
               <spring:message text="Usuario:" />
               <input type='text' name='username' id="form-login-user" required />
            </p>
            <p>
               <spring:message text="Contraseña:" />
               <input type='password' name='password' id="form-login-pass" required />
            </p>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <p>
               <input type="submit" class="submit" value="<spring:message text="Entrar" />" />
            </p>
         </form>
      </div>
      <div id="wfooter">
         <c:if test="${not empty error}">
            <div class="error">${error}</div>
         </c:if>
         <c:if test="${not empty msg}">
            <div class="msg">${msg}</div>
         </c:if>
      </div>
   </div>
</body>
</html>