<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

	<title>VIP Ride List</title>

	<!-- Meta/Links/Scripts -->
	<jsp:include page="../partials/headContent.jsp"/>
</head>

<body>

	<!-- Navbar Top of Page -->
	<jsp:include page="../partials/navbarBS4test.jsp"/>

	<!-- Table/Title -->	
	<div class="container">

		<h2 class="text-center title">Vehicle List<a href="${pageContext.request.contextPath}/showVehicleForm" class="float-right"><button type="button" class="btn btn-primary">Add Vehicle</button></a></h2>

		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Description</th>
					<th>Status</th>
					<th>Schedule</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vehicle" items="${vehicle_list}">
					<c:url var="scheduleLink" value="/showSchedule">
						<c:param name="scheduleID" value="${empty vehicle.schedule.ID ? 0 : vehicle.schedule.ID}"/>
					</c:url>
						<c:url var="deleteLink" value="/deleteVehicle">	<!-- assigns this relative url to the variable "updateLink" -->
						<c:param name="vehicleID" value="${vehicle.ID}" /> <!-- ties a request parameter to url -->
					</c:url>
					<c:url var="updateLink" value="/showUpdateVehicleForm">
						<c:param name="vehicleID" value="${vehicle.ID}" />
					</c:url>

					<tr>
						<td>${vehicle.description}</td>
						<td>${vehicle.status.description}</td>
						<td><a href="${scheduleLink}">Go to Schedule</a></td>
						<td><a href="${updateLink}">Edit Vehicle</a></td>
						<td><a href="${deleteLink}" onclick="if (!(confirm('Confirm DELETE?!'))) return false">Delete Vehicle</a></td>			
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

<!-- Bottom Body Scripts -->
<jsp:include page="../partials/bottomBodyScript.jsp"/>

</body>
</html>