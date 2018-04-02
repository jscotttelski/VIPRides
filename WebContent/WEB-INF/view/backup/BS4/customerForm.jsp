<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Customer Form</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" >

	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js" />"></script>

</head>


<body>

	<!-- Modal for login -->

	<div id="loginModal" class="modal bs-example-modal-sm" role="dialog">
		<div class="modal-content">
			<div class="modal-header">
				<i class="close fa fa-times fa-spin"></i>
				<h4 class="modal-title">Login</h4>
			</div>
			<div class="modal-body">
				<input class="col" type="text" placeholder="username">
				<input class="col" type="password" placeholder="password">
			</div>
			<div class="modal-footer">
				<button  class="btn btn-info btn-sm col">Submit</button>
			</div>
		</div>
	</div>

	<!-- Header NavBar -->
	
	<jsp:include page="../partials/navbar.jsp"/>

	<!-- Content -->

	
<div class="container" id="info">	
	<label><strong id="title">Customer Information:</strong></label>	
	<br>
	<br>
	<form:form action="saveCustomer" modelAttribute="customer" method="POST">
		<form:hidden path="ID" />	<!-- without this we'd lose the id when this is called via update --> 
		<c:set var="phone" value="phones[0].phoneNumber" />
	<div class="form-group row col-sm-offset-3">
		<label class="col-sm-2 form-control-label">Title:</label>
		<div class="col-sm-5">		
			<form:input class="form-control" path="title"/>
		</div>
	</div>
	<div class="form-group row col-sm-offset-3">
		<label class="col-sm-2 form-control-label">First Name:</label>
		<div class="col-sm-5">
			<form:input class="form-control" path="firstName"/>
			<form:errors path="firstName" cssClass="error"/>
		</div>
	</div>
	<div class="form-group row col-sm-offset-3">
		<label class="col-sm-2 form-control-label">Last Name:</label>
		<div class="col-sm-5">
			<form:input class="form-control" path="lastName"/>
			<form:errors path="lastName" cssClass="error"/>
		</div>
	</div>
	<div class="form-group row col-sm-offset-3">
		<label class="col-sm-2 form-control-label">Suffix:</label>
		<div class="col-sm-5">
			<form:input class="form-control" path="suffix"/>
		</div>
	</div>
	<div class="form-group row col-sm-offset-3">
		<label class="col-sm-2 form-control-label">Date of Birth:</label>
		<div class="col-sm-5">
			<form:input class="form-control" path="birthDate"/>
			<form:errors path="birthDate" cssClass="error"/>
		</div>
	</div>
	<div class="form-group row col-sm-offset-3">
		<label class="col-sm-2 form-control-label">Gender:</label>
		<div class="col-sm-5">
			<form:input class="form-control" path="gender" placeholder="How dare you assume my gender"/>
		</div>
	</div>
	<div class="form-group row col-sm-offset-3">
		<label class="col-sm-2 form-control-label">Email:</label>
		<div class="col-sm-5">
			<form:input class="form-control" path="primaryEmail"/>
			<form:errors path="primaryEmail" cssClass="error"/>
		</div> 
	</div>
	<div class="form-group row col-sm-offset-3">
		<label class="col-sm-2 form-control-label">Phone:</label>
		<div class="col-sm-5">
			<!-- Do we need to have the "form:" before the input below? -->
			<input class="form-control" name="phones[0].phoneNumber" placeholder="999-999-9999" />
			<!-- <form:input class="form-control" path="phones[0].phoneNumber"/> -->
		</div>
	</div>


	<input type="submit" value="Submit" class="btn btn-primary">
</form:form>
</div>
<script type="text/javascript" src="<c:url value="/resources/js/script.js" />"></script>
</body>
</html>