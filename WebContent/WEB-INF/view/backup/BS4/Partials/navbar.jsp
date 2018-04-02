<nav class="navbar">
	<div class="container-fluid">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle navbar-collapsed" data-toggle="collapse" data-target="#navigation-bar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle Navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" id="logo" href="#"><img id="logo" src="${pageContext.request.contextPath}/resources/img/telluride-logo.png" class="img-responsive"/></a>
		</div>

		<div class="collapse navbar-collapse" id="navigation-bar">
			<ul class="nav navbar-nav" id="link-list">
				<li class="dropdown" id="link"><a class="dropdown-toggle" data-toggle="dropdown" href="#" id="admin-back">Request Ride<span class="caret"></span></a>
			        <ul class="dropdown-menu" id="admin">
			            <li id="link2"><a href="/VIPRides/showRideForm" id="admin-list">Round Trip</a></li>
			            <li id="link2"><a href="/VIPRides/showOneWayForm" id="admin-list">One Way</a></li>
			        </ul>
			    </li>
			    <li id="link"><a id="admin-back" href="/VIPRides/showRideList">Ride List</a></li>
				<li id="link"><a id="admin-back" href="/VIPRides/showProductList">Product List</a></li>
				<li id="link"><a id="admin-back" href="/VIPRides/showProductForm">Create Product</a></li>
				<li id="link"><a id="admin-back" href="/VIPRides/showVehicleList">Vehicle List</a></li>
				<li id="link"><a id="admin-back" href="/VIPRides/showVehicleForm">Create Vehicle</a></li>
			</ul>
		</div>

	</div>
</nav>