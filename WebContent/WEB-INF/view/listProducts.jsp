<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<title>Product List</title>

	<!-- Meta/Links/Scripts -->
	<jsp:include page="../partials/headContent.jsp"/>
</head>

<body>

	<!-- Navbar Top of Page -->	
	<jsp:include page="../partials/navbarBS4test.jsp"/>

	<!-- Pricing Chart/Title -->	
	<div class="container">

		<h2 class="text-center title">Product List<a href="${pageContext.request.contextPath}/showProductForm" class="float-right"><button type="button" class="btn btn-primary">Add Product</button></a></h2>

		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Name</th>
					<th>Description</th>
					<th>Price</th>
					<th>Make Changes</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${product_list}">	
				<c:set var="update" value="" />
				<c:if test="${auth eq 'ROLE_ADMIN'}">
				<c:set var="update" value="Update"/>
				</c:if>
				<c:url var="updateLink" value="/showUpdateProductForm">	<!-- assigns this relative url to the variable "updateLink" -->
					<c:param name="productID" value="${product.ID}" /> <!-- ties a request parameter to url -->
				</c:url>
				<tr>
					<td>${product.name}</td>
					<td>${product.description}</td>
					<td><fmt:formatNumber var="price" type="number" maxFractionDigits="0" value="${product.price}"/>$${price}</td>
					<td><a href="${updateLink}"><c:out value="${update}" /></a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

<!-- Bottom Body Scripts -->
<jsp:include page="../partials/bottomBodyScript.jsp"/>

</body>
</html>