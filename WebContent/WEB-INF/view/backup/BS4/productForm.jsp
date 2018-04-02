<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

	<title>Product Form</title>

	<!-- Meta/Links/Scripts -->
	<jsp:include page="../partials/headContent.jsp"/>
</head>

<body>

	<!-- Navbar Top of Page -->
	<jsp:include page="../partials/navbarBS4test.jsp"/>

	<!-- Product Form -->
	<div class="text-center new">
		<form:form action="saveProduct" modelAttribute="product" method="POST">
			<form:hidden path="ID" />	<!-- without this we'd lose the id when this is called via update -->
			<form:hidden path="userID" />
			<!-- See spring "form" tags for field syntax -->

			<label class="col-sm-2 form-control-label">Product name:</label>
			<form:input class="form-control-sm" path="name"/>
			<br>
			<br>

			<label class="col-sm-2 form-control-label">Description:</label>
			<form:input class="form-control-sm" path="description"/>
			<br>
			<br>

			<label class="col-sm-2 form-control-label">Price:</label>
			<span class="input-group-addon">$</span>
			<form:input class="form-control-sm money" path="price"/>
			<br>
			<br>

			<form:select path="group.ID">
				<form:options items="${groups}"/>
			</form:select>
			<br>
			<br>	

			<div>  
				<input class="btn btn-primary" type="submit" value="Submit">
			</div>
		</form:form>	
	</div>	

<!-- Bottom Body Scripts -->
<jsp:include page="../partials/bottomBodyScript.jsp"/>

</body>
</html>