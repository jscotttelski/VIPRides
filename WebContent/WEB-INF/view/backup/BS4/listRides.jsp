<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

	<title>Ride List</title>

	<!-- Meta/Links/Scripts -->
	<jsp:include page="../partials/headContent.jsp"/>
</head>

<body>

	<!-- Navbar Top of Page -->
	<jsp:include page="../partials/navbarBS4test.jsp"/>

	<!-- Request List -->
	<div class="container-fluid">
		<!-- <div class="col-sm-4" id="user">
			Here: <c:out value="${user}"/><br>
			Auth: <c:out value="${auth}"/>
		</div> -->

		<h2 class="text-center title">Ride List</h2>		

		<div class="float-right">
			<form:form class="form-inline mb-2" action="searchRides" method="POST">	
				<input class="form-control" size="65" type="text" name="searchString" placeholder="Search by last name or confirmation code:"/>
				<input class="btn btn-primary" type="submit" value="Search"/>
			</form:form>
		</div>

		<table class="table table-bordered">
			<thead>
				<tr>
					<th onclick="sortTable(0)">Last Name</th>
					<th>First Name</th>
					<th>Guests</th>
					<th>Airport</th>
					<th>Flight/Tail ID</th>
					<th>Pickup Location</th>
					<th onclick="sortTable(1)">Ride Pickup Date/Time</th>
					<th>Ride Dropoff Date/Time</th>
					<th>Grocery<br>Stop?</th>
					<th>Confirmation<br>Code</th>
					<th>More Details</th>
					<!-- <th>Resend<br>Confirmation</th> -->
					<th>Update</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="ride" items="${ride_list}">
				
					<c:set var="update" value="" />
					<c:if test="${!ride.confirmed}">
						<c:set var="update" value="Update"/>
					</c:if>
					<c:if test="${auth eq 'ROLE_ADMIN'}">
						<c:set var="update" value="Update"/>
					</c:if>
					
					<c:url var="detailLink" value="/showRideDetailForm">	<!-- assigns this relative url to the variable "updateLink" -->
						<c:param name="rideID" value="${ride.ID}" /> <!-- ties a request parameter to url -->
					</c:url>

					<!-- <c:url var="emailLink" value="/showConfirmationForm?from=rszigeti@tellurideskiresort.com">
						<c:param name="rideID" value="${ride.ID}"></c:param>
					</c:url> -->
					
					<c:url var="updateLink" value="/showUpdateRideForm">
						<c:param name="rideID" value="${ride.ID}"></c:param>
					</c:url>
		
					<tr>	
						<td>${ride.person.lastName}</td>
						<td>${ride.person.firstName}</td>
						<td>${ride.guestCount}</td>
						<td>${ride.flight.airport.airportCode}</td>
						<td>${ride.flight.flightOrTail}</td>
						<td><c:out value="${ride.flightPickup ? 'Airport Pickup' : 'Lodging Pickup' }"/></td>
						<td><fmt:formatDate pattern="MM/dd/yy - hh:mm a" value="${ride.pickupTime}"/></td>
						<td><fmt:formatDate pattern="MM/dd/yy - hh:mm a" value="${ride.dropoffTime}"/></td>
						<td><c:out value="${ride.groceryStop ? 'Yes' : 'No' }"/></td>
						<td><c:out value="${ride.confirmed ? ride.toCode() : ''}" /></td>
						<td><a href="${detailLink}">Detail</a></td>
						<!-- <td><a href="${emailLink}">Send</a></td> -->
						<td><a href="${updateLink}"><c:out value="${update}" /></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- History/New Buttons -->

	<div class="text-center">
		<a href="/VIPRides/showRideList?recent=0"><button type="button" class="btn btn-primary btn-btm">Show History/All</button></a>
		<a href="/VIPRides/showRideList?recent=1"><button type="button" class="btn btn-primary btn-btm">Show New</button></a>
	</div>
	

<!-- Bottom Body Scripts -->
<jsp:include page="../partials/bottomBodyScript.jsp"/>

<script>
function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("requests");
  switching = true;
  //Set the sorting direction to ascending:
  dir = "asc"; 
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.getElementsByTagName("TR");
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /*check if the two rows should switch place,
      based on the direction, asc or desc:*/
      if (dir == "asc") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch= true;
          break;
        }
      } else if (dir == "desc") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch= true;
          break;
        }
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      //Each time a switch is done, increase this count by 1:
      switchcount ++;      
    } else {
      /*If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again.*/
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
</script>

</body>
</html>