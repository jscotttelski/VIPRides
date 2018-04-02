<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

	<title>Ride Details</title>

	<!-- Meta/Links/Scripts -->
	<jsp:include page="../partials/headContent.jsp"/>
</head>

<body>

	<!-- Navbar Top of Page -->
	<jsp:include page="../partials/navbarBS4test.jsp"/>

	<!-- Ride Detail List -->
	<form:form action="saveRideDetail" modelAttribute="ride" method="POST">
		<form:hidden path="ID" />					<!-- losing all other data because they are not in form fields, but all we need is ID to save confirm field -->
		<div class="container">

			<h2 class="text-center title">Ride Details</h2>
			
			<table class="table table-bordered col-sm-12">
				<tr>
					<th width="25%">First Name:</th>
					<td width="75%">${ride.person.firstName}</td>
				</tr>
				<tr>
					<th>Last Name:</th>
					<td>${ride.person.lastName}</td>
				</tr>
				<tr>
					<th>Flight Pickup:</th>
					<td>${ride.flightPickup}</td>
				</tr>
				<tr>
					<th>Pickup Time:</th>
					<td><fmt:formatDate pattern="MM/dd/yy - hh:mm a" value="${ride.pickupTime}"/></td>
				</tr>
				<tr>
					<th>Dropoff Time:</th>
					<td><fmt:formatDate pattern="MM/dd/yy - hh:mm a" value="${ride.dropoffTime}"/></td>
				</tr>
				<tr>
					<th>Airport:</th>
					<td>${ride.flight.airport.airportCode}</td>
				</tr>
				<tr>
					<th>Airline Code:</th>
					<td>${ride.flight.airline.airlineCode}</td>
				</tr>
				<tr>
					<th>Flight/Tail Code:</th>
					<td>${ride.flight.flightOrTail}</td>
				</tr>
				<tr>
					<th>Address Line 1:</th>
					<td>${ride.address.line1}</td>
				</tr>
				<tr>
					<th>Address Line 2:</th>
					<td>${ride.address.line2}</td>
				</tr>
				<tr>
					<th>City:</th>
					<td>${ride.address.city}</td>
				</tr>
				<tr>
					<th>State:</th>
					<td>${ride.address.state}</td>
				</tr>
				<tr>
					<th>Zip:</th>
					<td>${ride.address.postalCode}</td>
				</tr>
				<tr>
					<th>Guest Count:</th>
					<td>${ride.guestCount}</td>
				</tr>
				<tr>
					<th>Infant Count:</th>
					<td>${ride.infantCount}</td>
				</tr>
				<tr>
					<th>Toddler Count:</th>
					<td>${ride.toddlerCount}</td>
				</tr>
				<tr>
					<th>Luggage Count:</th>
					<td>${ride.luggageCount}</td>
				</tr>	
				<tr>
					<th>Ski Bag Count:</th>
					<td>${ride.skiBagCount}</td>
				</tr>
				<tr>
					<th>Special Needs:</th>
					<td>${ride.specialNeeds}</td>
				</tr>
				<tr>
					<th>Product Price:</th>
					<td>${ride.product.price}</td>
				</tr>
				<tr>
					<th>Charge GL:</th>
					<td>${ride.chargeGL}</td>
				</tr>
				<tr>
					<th>Confirmation Code:</th>
					<td>${ride.toCode()}</td>
				</tr>
				<tr>
					<th>Confirmed:</th>
					<td>${ride.confirmed ? 'Yes' : 'No'}</td>
				</tr>
			</table>
		</div>

		<!-- Confirm & Submit Buttons -->
		<div class="text-center btn-btm">
			<c:if test="${auth eq 'ROLE_ADMIN' && ride.confirmed == false}">
				<form:checkbox path="confirmed" id="rideConfirmCheckbox" />
				<input type="submit" value="Confirm" class="btn btn-primary submit">
				<a href="/VIPRides/deny?rideID=${ride.ID}"><button type="button" class="btn btn-primary submit">Deny</button></a>
			</c:if>
			<a href="/VIPRides/showRideList"><button type="button" class="btn btn-primary submit">Return to List without changes</button></a>
			<c:if test="${auth eq 'ROLE_ADMIN' && ride.confirmed}">
				<a href="/VIPRides/showConfirmationForm?rideID=${ride.ID}"><button type="button" class="btn btn-primary submit">Resend Confirmation</button></a>
			</c:if>
		</div>
	</form:form>

<!-- Bottom Body Scripts -->
<jsp:include page="../partials/bottomBodyScript.jsp"/>

</body>
</html>