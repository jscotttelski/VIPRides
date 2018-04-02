<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

	<title>Vehicle Form</title>

	<!-- Meta/Links/Scripts -->
	<jsp:include page="../partials/headContent.jsp"/>
</head>

<body>

	<!-- Navbar Top of Page -->
	<jsp:include page="../partials/navbarBS4test.jsp"/>

	<!-- Vehicle Form -->
	<div class="text-center new">
		<form:form action="saveVehicle" modelAttribute="vehicle" method="POST">
			<form:hidden path="ID" />	<!-- without this we'd lose the id when this is called via update -->
			<form:hidden path="userID" />

			<label class="form-control-label">Description:</label>
			<form:input class="form-control-sm" size="25" path="description" />
			<br>
			<br>

			<label class="form-control-label">Status:</label>
			<form:select class="form-control-sm" path="status.ID">
				<form:options class="form-control-sm" items="${statuses}"/>
			</form:select>
			<br>
			<br>

			<input class="btn btn-primary" type="submit" value="Save">
		</form:form>
	</div>


<!-- Bottom Body Scripts -->
<jsp:include page="../partials/bottomBodyScript.jsp"/>

</body>
</html>