<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Healthy Life</title>
<link rel="stylesheet" href="style.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-inverse" style="border-radius: 0px">
  		<div class="container-fluid">
    		<div class="navbar-header">
      			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
      			</button>
      			<a class="navbar-brand" href="#">Healthy Life</a>
    		</div>
    		<div class="collapse navbar-collapse" id="myNavbar">
      			<ul class="nav navbar-nav">
        			<li class="active"><a href="welcome.jsp">Home</a></li>
        			<li class="dropdown">
        				<a class="dropdown-toggle" data-toggle="dropdown" href="#">Food
        				<span class="caret"></span></a>
       	 				<ul class="dropdown-menu">
          					<li><a href="foodSettings.jsp">Food Settings</a></li>
          					<li><a href="recordMeal.jsp">Record a Meal</a></li>
          					<li><a href="mealHistory.jsp">Meal History</a></li>
        				</ul>
     				</li>
     				<li class="dropdown">
        				<a class="dropdown-toggle" data-toggle="dropdown" href="#">Exercise
        				<span class="caret"></span></a>
       	 				<ul class="dropdown-menu">
          					<li><a href="exerciseSettings.jsp">Exercise Settings</a></li>
          					<li><a href="recordExercise.jsp">Record Exercise</a></li>
          					<li><a href="exerciseHistory.jsp">Exercise History</a></li>
        				</ul>
     				</li>
     				<li class="dropdown">
        				<a class="dropdown-toggle" data-toggle="dropdown" href="#">Work & Sleep
        				<span class="caret"></span></a>
       	 				<ul class="dropdown-menu">
          					<li><a href="w&sSettings.jsp">Work & Sleep Settings</a></li>
          					<li><a href="recordW&s.jsp">Record Work & Sleep</a></li>
          					<li><a href="w&sHistory.jsp">Work & Sleep History</a></li>
        				</ul>
     				</li>
     				<li>
     					<%
     					if(session.getAttribute("sex") != null){
     						if(session.getAttribute("sex").equals("Female")){
     							out.println("<a href='menstrualCycle.jsp'>Menstrual Cycle</a>");
     						}}
     					%>
     				</li>
        			<li><a href="scheduleBuilder.jsp">Schedule Builder</a></li>
       				<li><a href="charts&Progress.jsp">Charts & Progress</a></li>
        			<li><a href="recommended.jsp">Recommended</a></li>
      			</ul>
      			<ul class="nav navbar-nav navbar-right">
        			<li>
        				<% 
        					if(session.getAttribute("username") != null){
        						out.println("<a href='#'>" + session.getAttribute("username") + "</a>");
        					} else {
        						out.println("<a href='signUp.jsp'><span class='glyphicon glyphicon-user'></span> Sign Up</a>");
        					}
        				%>
        			</li>
        			<li>
        				<%
        					if(session.getAttribute("username") != null){
        						out.println("<form action = 'LogoutServlet' method = 'post'><input type='submit' value='Log Out'/></form>");
    						} else {
    							out.println("<a href='login.jsp'><span class='glyphicon glyphicon-log-in'></span> Login</a></li>");
    						}
        				%>
      			</ul>
    		</div>
  		</div>
	</nav>
	
	<div class="container">
		<h1>The Healthy Life Portal</h1>
	
		<%
			if(session.getAttribute("username") != null){
				out.println("<h3>Welcome Back " + session.getAttribute("username") + "!</h3>");
			} else{
				out.println("<h3>Welcome to the Healthy Life Portal</h3>");
			}
		%>
	</div>
</body>
</html>