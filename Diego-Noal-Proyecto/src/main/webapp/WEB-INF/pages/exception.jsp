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
<title><spring:message text="Excepción" /></title>
</head>
<body>
   <div id="wrapL">
      <div id="wheader">
         <h1>
            <spring:message text="Ha ocurrido un error" />
         </h1>
         <hr />
      </div>
      <div id="pcontent">
         <p>
            <spring:message text="${exception}" />
         </p>
      </div>
      <br />
      <div id="wfooter">
         <p>
            <a href="javascript:void(0)"> <input type="button" class="submit"
                  value="<spring:message text="Volver" />" onclick="volverAtras()" />
            </a>
         </p>
      </div>
   </div>
</body>
</html>
