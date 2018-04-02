<nav class="navbar navbar-expand-md bg-dark navbar-dark">
	<!-- Brand -->
	<a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/resources/img/telluride-logo.png"/></a>

	<!-- Toggler/collapsibe Button -->
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>

	<!-- Navbar links -->
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">Request Ride</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="/VIPRides/showRideForm">Round Trip</a>
					<a class="dropdown-item" href="/VIPRides/showOneWayForm">One Way</a>
				</div>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/VIPRides/showRideList">Ride List</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/VIPRides/showProductList">Products</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/VIPRides/showVehicleList">Vehicles</a>
			</li>
		</ul>
	</div> 
</nav>