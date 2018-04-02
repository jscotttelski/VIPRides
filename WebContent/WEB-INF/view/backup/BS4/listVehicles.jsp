<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>VIP Ride List</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" >
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bree+Serif">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">

	<!-- Needed tags for Tab icon -->
	<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/img/favicon-16x16.png">
	<link rel="manifest" href="${pageContext.request.contextPath}/resources/js/manifest.json">

	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js" />"></script>
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>


<body>
	
	<!-- Navbar Top of Page -->

	<jsp:include page="../partials/navbar.jsp"/>
	
	<!-- Table -->	

	<div class="container">
		<h2 id="title">Vehicle List</h2>
		<table class="table table-bordered" id="requests">
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
						<c:param name="scheduleID" value="${empty vehicle.schedule.ID ? 0 : vehicle.schedule.ID}" />
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

<script type="text/javascript" src="<c:url value="/resources/js/script.js" />"></script>

</body>
</html>