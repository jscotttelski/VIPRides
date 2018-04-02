<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Add Availability</title>

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

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/transition.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/collapse.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script>
	
	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

	<script type="text/javascript">
		$(function () {
			$('#startDatePicker').datetimepicker({format: 'YYYY-MM-DD'});
		});
		$(function () {
			$('#endDatePicker').datetimepicker({format: 'YYYY-MM-DD'});
		});
		$(function () {
			$('#startTimePicker').datetimepicker({format: 'hh:mm A'});
		});
		$(function () {
			$('#endTimePicker').datetimepicker({format: 'hh:mm A'});
		});
	</script>
</head>


<body>
	
	<!-- Navbar Top of Page -->

	<jsp:include page="../partials/navbar.jsp"/>

	<!-- Content -->

	<div class="col-sm-2"></div>
	<div class="container-fluid form-area col-sm-8">

		<form:form action="saveAvailable" modelAttribute="scheduleAvailable" method="POST">
			<form:hidden path="scheduleID" />	<!-- without this we'd lose the id -->
			<form:hidden path="userID" />

			<h3 id="formTitle">Availability</h3>
		
			<!-- Based on this choice, different parts of this page gray out or disappear -->
			<label>Specify Type:</label><br>
			<form:radiobutton id="typeRange" path="type" value="dateRange" />Date range<br>
			<form:radiobutton id="typeDetailed" path="type" value="detailed" />Detailed by time/days<br>
			<br>
			<div id="clockTimes">
				<label class="form-control-label">Start Time</label>
				<div class="input-group date" id="startTimePicker">
					<form:input path="startClock" id="startTimePicker" class="form-control" placeholder="use the clock button ->"/>
					<span class="input-group-addon" id="info">
						<span class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
				
				<label class="form-control-label">End Time</label>
				<div class="input-group date" id="endTimePicker">
					<form:input path="endClock" id="endTimePicker" class="form-control" placeholder="use the clock button ->"/>
					<span class="input-group-addon" id="info">
						<span class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
			</div>
			
			<div id="recurrence">
				<label>Recurrence Pattern</label>
				<form:radiobutton id="patternDay" path="pattern" value="day" />Day<br>
				<form:radiobutton id="patternWeek" path="pattern" value="week" />Week<br>
				<!-- <form:radiobutton id="patternMonth" path="pattern" value="month" />Month<br> -->
				<br>
				<div id="dayPattern">
					<form:radiobutton path="dayRepeat" value="all" />Every Day<br>
					<form:radiobutton path="dayRepeat" value="weekday" />Weekdays<br>
				</div>
				<br>
				<div id="weekPattern">
					Every<form:input path="weekRepeat"/> week(s) On:<br>
					<form:checkboxes items="${weekdayList}" path="weekdays"/>
				</div>
			</div>
			<br>
			<div id="dateRange">
				<label class="form-control-label">Start Date</label>
				<div class="input-group date" id="startDatePicker">
					<form:input path="startDateTime" id="startDatePicker" class="form-control startDatePicker" placeholder="use the calendar button ->" readonly="false"/>
					<span class="input-group-addon" id="info">
						<span class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
				
				<label class="form-control-label">End Date</label>
				<div class="input-group date" id="endDatePicker">
					<form:input path="endDateTime" id="endDatePicker" class="form-control endDatePicker" placeholder="use the calendar button ->" readonly="false"/>
					<span class="input-group-addon" id="info">
						<span class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
			</div>
			<br>
		<div class="row" id="info">
			<input type="submit" class="btn btn-primary" id="submit" value="Save">
		</div>
		<br>
		</form:form>

	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/availableForm.js"></script>

</body>
</html>