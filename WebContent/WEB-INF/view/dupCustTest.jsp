<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Ride Form</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bree+Serif">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datetimepicker.min.css" />

	<!-- Tab Icon Links -->
	<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/img/favicon-16x16.png">
	<link rel="manifest" href="${pageContext.request.contextPath}/resources/js/manifest.json">

	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/moment.min.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/showRideForm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/transition.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/collapse.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script>

	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
	
	<script type="text/javascript">
		$(function () {
			$('#datetimepicker1').datetimepicker({format: 'YYYY-MM-DD hh:mm A', ignoreReadonly: true});
		});
		$(function () {
			$('#datetimepicker2').datetimepicker({format: 'YYYY-MM-DD hh:mm A', ignoreReadonly: true});
		});
		$(function () {
			$('#datetimepicker3').datetimepicker({format: 'YYYY-MM-DD'});
		});
	</script>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>


<body>

	<!--	Navbar	-->

	<jsp:include page="../partials/navbar.jsp"/>

	<!--	Ride Information	-->

	<form:form action="checkCustomer" modelAttribute="ride" method="POST">
		<form:hidden path="ID" />	<!-- without this we'd lose the id when this is called via update --> 
		<form:hidden path="userID" />

		<div class="container-fluid">

			<div class="col-sm-4"></div>

			<div class="col-sm-4">
				<h2 id="title">Duplicate Customer Test</h2>
			</div>


			<div class="col-sm-6 form-area section">
				<h3 id="formTitle">Personal Information</h3>
				<div class="form-group col-sm-3">
					<label class="form-control-label">Title:</label>
					<div>
						<form:input class="form-control" path="person.title"/>
					</div>
				</div>
				<div class="form-group col-sm-9">
					<label class="form-control-label">First Name:</label>
					<div>
						<form:input class="form-control" path="person.firstName" required="required"/>
					</div>
				</div>
				<div class="form-group col-sm-9">
					<label class="form-control-label">Last Name:</label>
					<div>
						<form:input class="form-control" path="person.lastName" required="required"/>
					</div>
				</div>
				<div class="form-group col-sm-3">
					<label class="form-control-label">Suffix:</label>
					<div>
						<form:input class="form-control" path="person.suffix"/>
					</div>
				</div>
				<div class="form-group col-sm-2">
					<label class="form-control-label">Gender:</label>
					<div>
						<form:select class="form-control" path="person.gender" required="required">
							<form:options items="${genders}"/>
						</form:select>
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label class="form-control-label">Phone:</label>
					<div>
						<div class="col-sm-4 row">
							<form:input class="form-control" path="phoneParts.areaCode" placeholder="970" maxlength="3"/>
						</div>
						<div class="col-sm-4">
							<form:input class="form-control" path="phoneParts.prefix" placeholder="555" maxlength="3"/>
						</div>
						<div class="col-sm-4 row">
							<form:input class="form-control" path="phoneParts.lineNumber" placeholder="1234" maxlength="4"/>
						</div>
					</div>
				</div>
				<div class="form-group col-sm-4">
					<label class="form-control-label">Email:</label>
					<div>
						<form:input class="form-control" path="person.primaryEmail" required="required" type="email"/>
					</div> 
				</div>
			</div>

<!--		<div class="col-sm-6 form-area section">
				<h3 id="formTitle">Lodging Information</h3>
				<div class="form-group col-sm-12">
					<label class="form-control-label">Line 1</label>
					<div>
						<form:input class="form-control" path="address.line1" required="required"/>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="form-control-label">Line 2</label>
					<div>
						<form:input class="form-control" path="address.line2"/>
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label class="form-control-label">City</label>
					<div>
						<form:input class="form-control" path="address.city" required="required"/>
					</div>
				</div>
				<div class="form-group col-sm-3">
					<label class="form-control-label">State</label> 
					<div>
						<form:input class="form-control" path="address.state" required="required"/>
					</div>
				</div>
				<div class="form-group col-sm-3">
					<label class="form-control-label">Zip</label>
					<div>
						<form:input class="form-control" path="address.postalCode" required="required"/>
					</div>
				</div>
			</div>
		</div>

	<!--     Flight Information     

		<div class="container-fluid">
			<div class="col-sm-4 form-area section">
				<h3 id="formTitle">Arrival Flight</h3>
				<div class="form-group col-sm-12">
				<label class="form-control-label">Flight Arrival Date/Time:</label>
					<div class="input-group date" id="datetimepicker1">
						<form:input path="arrivalTime" id="datetimepicker1" class="form-control" placeholder="use the calendar button ->" required="required" readonly="true"/>
						<span class="input-group-addon" id="info">
							<span class="glyphicon glyphicon-calendar"></span>
						</span>
					</div>
				</div>
				<div class="form-group col-sm-12">
				<label class="form-control-label">Flight/Tail ID:</label>
					<div>
						<form:input class="form-control" path="flight.flightOrTail" required="required"/>
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label class="form-control-label">Airline:</label>
					<div>
						<form:select class="form-control" path="flight.airline.ID">
							<form:options items="${airlines}"/>
						</form:select>
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label class="form-control-label">Airport:</label>
					<div>
						<form:select class="form-control" path="flight.airport.ID">
							<form:options items="${airports}"/>
						</form:select>
					</div>
				</div>
			</div>

			<div class="col-sm-4 form-area section">
				<h3 id="formTitle">Rider Information</h3>
				<div class="form-group col-sm-12">
					<label class="form-control-label">Number of Passengers (include car seat spots)</label>
					<div>
						<form:input class="form-control" path="guestCount" required="required"/>
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label class="form-control-label">Infant Car Seats:</label>
					<div>
						<form:input class="form-control" path="infantCount" required="required"/>
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label class="form-control-label">Toddler Car Seats:</label>
					<div>
						<form:input class="form-control" path="toddlerCount" required="required"/>
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label class="form-control-label">Luggage Bags (exclude skis)</label>
					<div>
						<form:input class="form-control" path="luggageCount" required="required"/>
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label class="form-control-label">Ski Bag Count:</label>
					<div>
						<form:input class="form-control" path="skiBagCount" required="required"/>
					</div>
				</div>
			</div>

			<div class="col-sm-4 form-area section">
				<h3 id="formTitle">Departure Flight</h3>
				<div class="form-group col-sm-12">
				<label class="form-control-label">Flight Arrival Date/Time:</label>
					<div class="input-group date" id="datetimepicker2">
						<form:input path="departureTime" id="datetimepicker2" class="form-control" placeholder="use the calendar button ->" required="required" readonly="true"/>
						<span class="input-group-addon" id="info">
							<span class="glyphicon glyphicon-calendar"></span>
						</span>
					</div>
				</div>
				<div class="form-group col-sm-12">
				<label class="form-control-label">Flight/Tail ID:</label>
					<div>
						<form:input class="form-control" path="departureFlight.flightOrTail" required="required"/>
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label class="form-control-label">Airline:</label>
					<div>
						<form:select class="form-control" path="departureFlight.airline.ID">
							<form:options items="${airlines}"/>
						</form:select>
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label class="form-control-label">Airport:</label>
					<div>
						<form:select class="form-control" path="departureFlight.airport.ID">
							<form:options items="${airports}"/>
						</form:select>
					</div>
				</div>
			</div>
		</div>

		<!--     Final Info & Save    
		
		<div class="container-fluid">

			<div class="col-sm-4"></div>

			<div class="col-sm-4 form-area section">
				<div class="form-group col-sm-12" id="foot">
					<label class="form-control-label" id="special">Special Needs:<br>(Include counts for beer, wine, champagne, juice.)</label>
					<div>
						<form:input class="form-control" path="specialNeeds" size="250"/>
					</div>
				</div>
					
				<div id="info" class="col-sm-12">
					<label>Grocery Stop</label><form:checkbox path="groceryStop" id="checkbox"/>
				</div>
			
				<div>
					<div class="form-group col-sm-8">
						<label class="form-control-label">Product:</label>
						<div>
							<form:select class="form-control" path="product.ID">
								<form:options items="${products}"/> 
							</form:select>
						</div>
					</div>
				
					<div class="form-group col-sm-4">
						<label class="form-control-label">Charge GL:</label>
						<div>
							<form:input class="form-control" path="chargeGL" placeholder="xxxx.xxxx"/>
						</div>
					</div>
				</div>
			</div> -->

			<div class="col-sm-4"></div>

		</div>

		<br>
		<div class="row col-sm-12" id="info">
			<input class="btn btn-primary" id="submit" type="submit" value="Save">
		</div>
		

	</form:form>

	<script type="text/javascript" src="<c:url value="/resources/js/script.js" />"></script>

</body>
</html>