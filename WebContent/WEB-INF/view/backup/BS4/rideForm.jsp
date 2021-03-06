<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>

	<title>Ride Form</title>

	<!-- Meta/Links/Scripts -->
	<jsp:include page="../partials/headContent.jsp"/>


	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/test/bootstrap-datetimepicker.css"> -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0-alpha14/css/tempusdominus-bootstrap-4.min.css" />
	<script src="${pageContext.request.contextPath}/resources/js/moment.2.21.0.min.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/showRideForm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/transition.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/collapse.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script> -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0-alpha14/js/tempusdominus-bootstrap-4.min.js"></script>

	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
	
	
	<!-- <script type="text/javascript">
		$(function () {
			$('#datetimepicker1').datetimepicker({format: 'YYYY-MM-DD hh:mm A', ignoreReadonly: true});
		});
		$(function () {
			$('#datetimepicker2').datetimepicker({format: 'YYYY-MM-DD hh:mm A', ignoreReadonly: true});
		});
		$(function () {
			$('#datetimepicker3').datetimepicker({format: 'YYYY-MM-DD'});
		});
	</script> -->

</head>


<body>

	<!--	Navbar	-->

	<jsp:include page="../partials/navbarBS4test.jsp"/>

	<!--	Ride Information	-->

	<form:form action="saveRide" modelAttribute="ride" method="POST">
		<form:hidden path="ID" />	<!-- without this we'd lose the id when this is called via update --> 
		<form:hidden path="userID" />

		<div class="container-fluid">

			<h2 class="text-center title">Round Trip Ride<a href="${pageContext.request.contextPath}/showOneWayForm" class="float-right"><button type="button" class="btn btn-primary">One Way</button></a></h2>

			<div class="row">
				<div class="border col-sm-6">
					<h3 class="text-center">Personal Information</h3>
					<div class="form-row">
						<div class="col-sm-3">
							<label>Title</label>
							<form:input class="form-control" path="person.title"/>
						</div>
						<div class="col-sm-9">
							<label>First Name</label>
							<form:input class="form-control" path="person.firstName" required="required"/>
						</div>
						<div class="col-sm-9">
							<label>Last Name</label>
							<form:input class="form-control" path="person.lastName" required="required"/>
						</div>
						<div class="col-sm-3">
							<label>Suffix</label>
							<form:input class="form-control" path="person.suffix"/>
						</div>
						<div class="col-sm-2">
							<label>Gender</label>
							<form:select class="form-control" path="person.gender" required="required">
								<form:options items="${genders}"/>
							</form:select>
						</div>
						<!-- <div class="col-sm-5">
							<label>Phone</label>
							<input class="form-control" name="person.phones[0].phoneNumber" placeholder="AAAXXXZZZZ" required="required" type="number" min="2012000000" max="9999999999" />
						</div> -->
						
							<div class="col-sm-2">
								<label>Phone</label>
								<form:input class="form-control" path="phoneParts.areaCode" placeholder="970" maxlength="3" />
							</div>
							<div class="col-sm-2">
								<form:input class="form-control mt-4" path="phoneParts.prefix" placeholder="555" maxlength="3" />
							</div>
							<div class="col-sm-2">
								<form:input class="form-control mt-4" path="phoneParts.lineNumber" placeholder="1234" maxlength="4" />
							</div>
						
						<div class="col-sm-4">
							<label>Email</label>
							<form:input class="form-control" path="person.primaryEmail" required="required" type="email"/> 
						</div>
					</div>
				</div>
				<div class="border col-sm-6">
					<h3 class="text-center">Lodging Information</h3>
					<div class="form-row">
						<div class="col-sm-12">
							<label>Line 1</label>
							<form:input class="form-control" path="address.line1" required="required"/>
						</div>
						<div class="col-sm-12">
							<label>Line 2</label>
							<form:input class="form-control" path="address.line2"/>
						</div>
						<div class="col-sm-6">
							<label>City</label>
							<form:input class="form-control" path="address.city" required="required"/>
						</div>
						<div class="col-sm-3">
							<label>State</label> 
							<form:input class="form-control" path="address.state" required="required"/>
						</div>
						<div class="col-sm-3">
							<label>Zip</label>
							<form:input class="form-control" path="address.postalCode" required="required"/>
						</div>
					</div>
				</div>

				<div class="border col-sm-4">
					<h3 class="text-center">Arrival Flight</h3>
					<div class="form-row">
						<script type="text/javascript">
							$(function () {
								$('#datetimepicker1').datetimepicker({format: 'YYYY-MM-DD hh:mm A', ignoreReadonly: true});
							});
						</script>
						<div class="col-sm-12">
							<div class="form-group">
								<label>Flight Arrival Date/Time</label>
								<!--<div class="input-group date" id="datetimepicker1"> -->
								<div class="input-group date" id="datetimepicker1" data-target-input="nearest">
									<!-- <form:input path="arrivalTime" id="datetimepicker1" class="form-control" placeholder="use the calendar button ->" required="required" readonly="true"/> -->
									<form:input path="arrivalTime" class="form-control datetimepicker-input" data-target="#datetimepicker1" placeholder="use the calendar button ->" required="required" />
									<!-- <span class="input-group-addon" id="info">
										<span class="fa fa-calendar"></span>
									</span> -->
									<div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
	                        			<div class="input-group-text"><i class="fa fa-calendar"></i></div>
	                    			</div>
								</div>
							</div>
						</div>
						
						<div class="col-sm-12">
							<label>Flight/Tail ID</label>
							<form:input class="form-control" path="flight.flightOrTail" required="required"/>
						</div>
						<div class="col-sm-6">
							<label>Airline</label>
							<form:select class="form-control" path="flight.airline.ID">
								<form:options items="${airlines}"/>
							</form:select>
						</div>
						<div class="col-sm-6">
							<label>Airport</label>
							<form:select class="form-control" path="flight.airport.ID">
								<form:options items="${airports}"/>
							</form:select>
						</div>
					</div>
				</div>
				<div class="border col-sm-4">
					<h3 class="text-center">Rider Information</h3>
					<div class="form-row">
						<div class="col-sm-12">
							<label>Number of Passengers (include car seat spots)</label>
							<form:input class="form-control" path="guestCount" required="required"/>
						</div>
						<div class="col-sm-6">
							<label>Infant Car Seats</label>
							<form:input class="form-control" path="infantCount" required="required"/>
						</div>
						<div class="col-sm-6">
							<label>Toddler Car Seats</label>
							<form:input class="form-control" path="toddlerCount" required="required"/>
						</div>
						<div class="col-sm-6">
							<label>Luggage Bags (exclude skis)</label>
							<form:input class="form-control" path="luggageCount" required="required"/>
						</div>
						<div class="col-sm-6">
							<label>Ski Bag Count</label>
							<form:input class="form-control" path="skiBagCount" required="required"/>
						</div>
					</div>
				</div>
				<div class="border col-sm-4">
					<h3 class="text-center">Departure Flight</h3>
					<div class="form-row">
						<div class="col-sm-12">
							<label>Flight Arrival Date/Time</label>
							<div class="input-group date" id="datetimepicker2" data-target-input="nearest">
								<form:input path="departureTime" class="form-control datetimepicker-input" data-target="#datetimepicker2" placeholder="use the calendar button ->" required="required" />
								<div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
	                        		<div class="input-group-text"><i class="fa fa-calendar"></i></div>
	                    		</div>
							</div>
						</div>
						<script type="text/javascript">
							$(function () {
								$('#datetimepicker2').datetimepicker({format: 'YYYY-MM-DD hh:mm A', ignoreReadonly: true});
							});
						</script>
						<div class="col-sm-12">
							<label>Flight/Tail ID</label>
							<form:input class="form-control" path="departureFlight.flightOrTail" required="required"/>
						</div>
						<div class="col-sm-6">
							<label>Airline</label>
							<form:select class="form-control" path="departureFlight.airline.ID">
								<form:options items="${airlines}"/>
							</form:select>
						</div>
						<div class="col-sm-6">
							<label>Airport</label>
							<form:select class="form-control" path="departureFlight.airport.ID">
								<form:options items="${airports}"/>
							</form:select>
						</div>
					</div>
				</div>

				<div class="col-sm-4"></div>

				<div class="border col-sm-4">
					<h3 class="text-center">Final Information</h3>
					<div class="form-row">
						<div class="col-sm-12">
							<label>Special Needs<br>(Include counts for beer, wine, champagne, juice.)</label>
							<form:input class="form-control" path="specialNeeds" size="250"/>
						</div>
						<div class="col-sm-12 text-center">
							<label>Grocery Stop</label><form:checkbox path="groceryStop"/>
						</div>
						<div class="col-sm-8">
							<label>Product</label>
							<form:select class="form-control" path="product.ID">
								<form:options items="${products}"/> 
							</form:select>
						</div>
						<div class="col-sm-4">
							<label>Charge GL</label>
							<form:input class="form-control" path="chargeGL" placeholder="xxxx.xxxx"/>
						</div>
					</div>
				</div>

			</div>
		</div>
		
		<div class="text-center">
			<input class="btn btn-primary btn-btm" type="submit" value="Save">
		</div>
		
	</form:form>

<!-- Bottom Body Scripts -->
<jsp:include page="../partials/bottomBodyScript.jsp"/>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/test/bootstrap-datetimepicker.js"></script>

</body>
</html>