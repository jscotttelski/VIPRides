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

	<!-- Request List -->

	<div class="container-fluid">

		<div class="col-sm-4">
			<h2 id="title">Customer List</h2>
		</div>


		<table class="table table-bordered" id="requests">
			<thead>
				<tr>
					<th>Last Name</th>
					<th>First Name</th>
					<th>Email</th>
					<th>More Details</th>
					<th>Select this<br>Customer</th>
					<th>Update/Select</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="person" items="${person_list}">
				
					<c:url var="detailLink" value="/showPersonDetailForm">	<!-- assigns this relative url to the variable "updateLink" -->
						<c:param name="personID" value="${ID}" /> <!-- ties a request parameter to url -->
					</c:url>
					
					<c:url var="selectLink" value="/showUpdatePersonForm">
						<c:param name="personID" value="${ID}"></c:param>
					</c:url>
					
					<c:url var="updateLink" value="/showUpdatePersonForm">
						<c:param name="personID" value="${ID}"></c:param>
					</c:url>
		
					<tr>	
						<td>${person.lastName}</td>
						<td>${person.firstName}</td>
						<td>${person.primaryEmail}</td>
						<td><a href="${detailLink}">Detail</a></td>
						<td><a href="${selectLink}">Select</a></td>
						<td><a href="${updateLink}">Update</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	

<script type="text/javascript" src="<c:url value="/resources/js/script.js" />"></script>

</body>
</html>