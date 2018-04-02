<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

	<title>Sent</title>
	
	<!-- Meta/Links/Scripts -->
	<jsp:include page="../partials/headContent.jsp"/>
</head>

<body>

	<!-- Navbar Top of Page -->
	<jsp:include page="../partials/navbarBS4test.jsp"/>

	<!-- Content -->
	<div class="container-fluid" id="sent">
		Message Sent to ${email.to}
	</div>

<!-- Bottom Body Scripts -->
<jsp:include page="../partials/bottomBodyScript.jsp"/>

</body>
</html>