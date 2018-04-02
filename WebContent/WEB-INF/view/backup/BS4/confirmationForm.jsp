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
		Confirmation Email for ${ride.person.firstName} ${ride.person.lastName}
	</div>
	
	<div id="confirmation">
		<form:form action="sendConfirmation" modelAttribute="email" method="POST">
			<form:hidden path="rideID"/>
			
			<label id="send">To:</label>
			<form:input path="to"/>
			<br>
			<label id="send">From:</label>
			<form:input path="from"/>
			<br>
			<label id="send">Subject:</label>
			<form:input path="subject"/>
			<br>
			<div id="info">
				<input class="btn btn-primary" id="submit3" type="submit" value="Send">
			</div>
			<div id="info">
				<a href="/VIPRides/showRideList" class="button btn btn-primary" id="submit3">Don't Send</a>
			</div>
		</form:form>
	</div>	

<!-- Bottom Body Scripts -->
<jsp:include page="../partials/bottomBodyScript.jsp"/>

</body>
</html>