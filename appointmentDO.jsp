<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="description" content="">
<meta name="author" content="">

<title>UnipiMed</title>

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
<!--/head-->

<body>
	<div class="wrapper">
		<div class="sidebar" data-color="blue"
			data-image="images/slider/2.jpg">
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="#" class="simple-text"> UnipiMed </a>
				</div>

				<ul class="nav">
					<li class="active"><a href="appointmentDO.jsp"> <i class="pe-7s-news-paper"></i>
							<p>Make An Appointment</p>
					</a></li>
					<li><a href="appointmentVIEW.jsp"> <i class="pe-7s-science"></i>
							<p>Show Appointments</p>
					</a></li>
				</ul>
			</div>
		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default navbar-fixed">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Patient</a>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li><%
				    if ((session.getAttribute("luser") == null) || (session.getAttribute("luser") == "")) {
				%>
				You are not logged in<br/>
				<a href="index.jsp">Please Login</a>
				<%} else {
				%>
				Welcome <%=session.getAttribute("luser")%>
				<a href='logout.jsp'>Log out</a>
				<%
				    }
				%></li>
				</ul>
			</div>
			</nav>

			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-8">
							<div class="card">
								<div class="header">
									<h4 class="title">Appointment</h4>
								</div>
								<div class="content">
									<form method="post" action="appointmentDO.jsp">
										<div class="row">
										<div class="col-md-2">
												<div class="form-group">
													<label>Speciality</label> 
													<select name= "speciality_">
														<option value="1">Orthopedic</option>
														<option value="2">Dentist</option>
														<option value="3">Pathologist</option>
														<option value="4">Opthalmologist</option>
														<option value="5">Otolaryngologist</option>
													</select>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<label>Region</label> 
													<select name= "region_">
														<option value="1">Athens</option>
														<option value="2">Patra</option>
														<option value="3">Thessaloniki</option>
														<option value="4">Lamia</option>
														<option value="5">Irakleio</option>
													</select>
												</div>
											</div>
											<div class="col-md-2>
												<div class="form-group">
													<label>Day</label> 
													<select name= "date_">
														<option value="1">Monday</option>
														<option value="2">Tuesday</option>
														<option value="3">Wendesday</option>
														<option value="4">Thursday</option>
														<option value="5">Friday</option>
													</select>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<label>Hour</label> 
													<select name= "time_">
														<option value="1">08:00</option>
														<option value="2">09:00</option>
														<option value="3">10:00</option>
														<option value="4">11:00</option>
														<option value="5">12:00</option>
													</select>
												</div>
											</div>
										</div>
										<button name="okbutt" type="submit" class="btn btn-info btn-fill pull-right">Proceed</button>
										<div class="clearfix"></div>
									</form>


								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    
                </nav>
                <p class="copyright pull-right">
                    &copy; 2018 <a href="http://www.cs.unipi.gr/">UniMed Team</a>
                </p>
            </div>
        </footer>
			
		</div>

	</div>

	
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="mainPackage.*" %>
<%

    String speciality = request.getParameter("speciality_");    
    String region = request.getParameter("region_");
    String date = request.getParameter("date_");
    String time = request.getParameter("time_");
    String amka=(String)session.getAttribute("luser"); 


	
    
    
    if(speciality != null || region != null ){ 
        DatabaseConnection db = new DatabaseConnection();
        db.open();
        db.createAppointment(speciality, region, date, time, amka);
        response.sendRedirect("welcome.jsp");
    }
    
%>
	
	
	
</body>

</html>