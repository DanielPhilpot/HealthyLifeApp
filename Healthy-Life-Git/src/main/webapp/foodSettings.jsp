<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Food Settings</title>
<link rel="stylesheet" href="style.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript --> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function validateAddActivity() {
		let day = document.getElementById("day").value;
		let type = document.getElementById("type").value;
		if (day == "Select") {
			DMessage = "A day is Required; ";
		}
		if (type == "Select") {
			TyMessage = "A meal type is Required; ";
		}
		if (DMessage != "" || TyMessage != ""){
			alert(DMessage + TyMessage);
			DMessage = "";
			TyMessage = "";
			return false;
		}
	}
</script>

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
        			<li><a href="welcome.jsp">Home</a></li>
        			<li class="active" class="dropdown">
        				<a class="dropdown-toggle" data-toggle="dropdown" href="#">Food
        				<span class="caret"></span></a>
       	 				<ul class="dropdown-menu">
          					<li class="active"><a href="foodSettings.jsp">Food Settings</a></li>
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
	
	<h1>Food Settings</h1>
	<br>
	
  		<div class="row">
  			<div class="col-sm-4">
  				<h3 >Add a meal to schedule</h3>
  				<br>
  				<form name="mealSch" action = "AddScheduleItemServlet" onsubmit="return validateAddActivity()" method = "post">
  					<table>
  						<tbody>
  							<tr class="loginRow">
								<td>Day of the Week</td>
								<td>
									<select id="day" name="day">
										<option>Select</option>
										<option>Monday</option>
										<option>Tuesday</option>
										<option>Wednesday</option>
										<option>Thursday</option>
										<option>Friday</option>
										<option>Saturday</option>
										<option>Sunday</option>
									</select>
								</td>
							</tr>
							<tr class="loginRow">
								<td>Time - HR:Min</td>
								<td><input type ="time" id="time" name="time" required></td>
							</tr>
							<tr class="loginRow">
								<td>Meal Type</td>
								<td>
									<select id="type" name="type">
										<option>Select</option>
										<option>Meal</option>
										<option>Snack</option>
									</select>
								</td>
							</tr>
							<tr class="loginRow">
								<td>Duration - HR:Min</td>
								<td><input type ="time" id="dur" name="dur" required></td>
							</tr>
						</tbody>
  					</table>
  					<br>
  					<p><input type="submit" value="Add"/></p>
  				</form>
  			</div>
  			
  			<div class="col-sm-8">
  				<h3>Meal Schedule</h3>
  				<p>When complete this section will display the users set meal schedule</p>
  			</div>
  		</div>
  	</div>
  	<br>
  	<div class="container">
  		<div class="row">
  			<div class="col-sm-6">
  				<h3>Dietary Requirements</h3>
  				<br>
  				<form name="dietReq" action = "SetDietReqServlet" onsubmit="return validateForm()" method = "post">
  					<table>
  						<tbody>
  							<tr class="loginRow">	
  								<td>Vegetarian</td>
  								<td><input type="checkbox" id="Vegetarian" name="Vegetarian" value="Vegetarian"></td>
  							</tr>
  							<tr class="loginRow">	
  								<td>Vegan</td>
  								<td><input type="checkbox" id="Vegan" name="Vegan" value="Vegan"></td>
  							</tr>
  							<tr class="loginRow">	
  								<td>Lactose Intolerance</td>
  								<td><input type="checkbox" id="LacInt" name="LacInt" value="LacInt"></td>
  							</tr>
  							<tr class="loginRow">	
  								<td>Gluten Intolerance</td>
  								<td><input type="checkbox" id="GlucInt" name="GlucInt" value="GlucInt"></td>
  							</tr>
  							<tr class="loginRow">	
  								<td>Nut Allergy</td>
  								<td><input type="checkbox" id="NutAlg" name="NutAlg" value="NutAlg"></td>
  							</tr>
  							<tr class="loginRow">	
  								<td>Kosher</td>
  								<td><input type="checkbox" id="Kosher" name="Kosher" value="Kosher"></td>
  							</tr>
  							<tr class="loginRow">	
  								<td>Halal</td>
  								<td><input type="checkbox" id="Halal" name="Halal" value="Halal"></td>
  							</tr>
  						</tbody>
  					</table>
  					<p><input type="submit" value="Set"/></p>
  				</form>
  			</div>
  			<div class="col-sm-6">
  				<h3>Targets</h3>
  				<form name="foodTargets" action = "AddTargetServlet" onsubmit="return validateForm()" method = "post">
  					<table>
  						<tbody>
  							<tr class="loginRow">	
								<td>TBD</td>
  							</tr>
  						</tbody>
  					</table>
  				<p><input type="submit" value="Set"/></p>
  				</form>
  			</div>
  		</div>
  	</div>
	
</body>
</html>