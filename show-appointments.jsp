<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Show Users</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Style -->
<link href="css/style.css" rel="stylesheet">

<link href="css/responsive.css" rel="stylesheet">

<!--  Light Bootstrap Table core CSS    -->
<link href="css/light-bootstrap-dashboard.css" rel="stylesheet" />

<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300'
	rel='stylesheet' type='text/css'>
<link href="css/pe-icon-7-stroke.css" rel="stylesheet" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->

<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>

<script src="js/light-bootstrap-dashboard.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
</head>
<body>

	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%@ page import="java.sql.DriverManager.*"%>
	<%@ page import="java.sql.Connection.*"%>
	
	

	<div class="wrapper">
		<div class="sidebar" data-color="blue"
			data-image="images/slider/2.jpg">

			<!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="" class="simple-text"> UniMed </a>
				</div>
				<ul class="nav">
					<li><a href="appointmentDO.jsp"> <i class="pe-7s-user"></i>
							<p>Make An Appointment</p>
					</a></li>
					<li class="active"><a href="show-appointments.jsp"> <i
							class="pe-7s-note2"></i>
							<p>Show Appointments</p>
					</a></li>
				</ul>
			</div>
		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default navbar-fixed">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">Show Users</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">

							<li><a href="index.html"> Log out </a></li>
						</ul>
					</div>
				</div>
			</nav>


			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">Appointments</h4>
									<p class="category">Table with all the Appointments</p>
								</div>
								<div class="content table-responsive table-full-width">
									<table class="table table-hover table-striped">
										<thead>
											<th>Speciality</th>
											<th>Region</th>
											<th>Date</th>
											<th>Time</th>
											<th>AMKA</th>
										</thead>
										<tbody>
											<%								
											if ((session.getAttribute("luser") == null) || (session.getAttribute("luser") == ""));
												 String amka=(String)session.getAttribute("luser"); 
												Class.forName("org.postgresql.Driver").newInstance();
												String URL = "jdbc:postgresql://localhost:5432/HospitalDatabase";
												String USER = "postgres";
												String PASS = "mypass";
										  	    Connection conn = DriverManager.getConnection(URL,USER,PASS);
												Statement st = conn.createStatement();
												ResultSet rs = st.executeQuery("SELECT * FROM appointment WHERE '"+amka+"'");
													while (rs.next()) {
											%>
											<tr>
												<td><%=rs.getString("speciality")%></td>
												<td><%=rs.getString("region")%></td>
												<td><%=rs.getString("date")%></td>
												<td><%=rs.getString("time")%></td>
												<td><%=rs.getString("id")%></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
									
								</div>
							</div>
						</div>


						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">Sellers</h4>
									<p class="category">Table with all the sellers</p>
								</div>
								<div class="content table-responsive table-full-width">
									
							

								</div>
							</div>
						</div>


					</div>
				</div>
			</div>

			<footer class="footer">
				<div class="container-fluid">
					<nav class="pull-left">
						<ul>
							<li><a href="#"> Home </a></li>
							<li><a href="#"> Company </a></li>
							<li><a href="#"> Portfolio </a></li>
							<li><a href="#"> Blog </a></li>
						</ul>
					</nav>
					<p class="copyright pull-right">
						&copy; 2016 <a href="http://www.cs.unipi.gr/">UniMed Team</a>
					</p>
				</div>
			</footer>


		</div>
	</div>


</body>

<!--   Core JS Files   -->
<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="assets/js/bootstrap-checkbox-radio-switch.js"></script>

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="assets/js/light-bootstrap-dashboard.js"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>


</html>
