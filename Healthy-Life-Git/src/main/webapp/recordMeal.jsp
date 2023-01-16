<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Record a Meal</title>
<link rel="stylesheet" href="style.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript --> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function validateMeal() { 
		var fv = parseInt(document.getElementById("f&v").value) || 0;
		var carb = parseInt(document.getElementById("carb").value) || 0;
		var protein = parseInt(document.getElementById("protein").value) || 0;
		var dairy = parseInt(document.getElementById("dairy").value) || 0;
		var os = parseInt(document.getElementById("o&s").value) || 0;
		var jf = parseInt(document.getElementById("jF").value) || 0;
		var mT = document.getElementById("type").value;
		
		if (mT == "Select") {
			a1 = "Please select a meal type; "
		}
		
		if (fv + carb + protein + dairy + os + jf != 100) {
			a2 = "Percentages must total 100; ";
		}
		
		if (a1 != "" || a2 != "") {
			alert(a1 + a2);
			a1 = "";
			a2 = "";
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
          					<li><a href="foodSettings.jsp">Food Settings</a></li>
          					<li class="active"><a href="recordMeal.jsp">Record a Meal</a></li>
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
	<h1>Record a Meal</h1>
	<br>
  		<div class="row">
  			<div class="col-sm-4">
  				<form method="POST" action="http://localhost:8080/Healthy-Life-Git/controller/recordMeal" onsubmit="return validateMeal()">
  					<table>
  						<tbody>
  							<tr class="loginRow">
								<td>Meal Title</td>
								<td><input type="text" id="mealTitle" name="mealTitle" required></td>
							</tr>
							<tr class="loginRow">
								<td>Meal Description</td>
								<td><textarea id="mealDesc" name="mealDesc" required></textarea></td>
							</tr>
							<tr class="loginRow">
								<td>Meal Date</td>
								<td><input type="date" id="mealDate" name="mealDate" required>
							</tr>
							<tr class="loginRow">
								<td>Time of day</td>
								<td><input type="time" id="mealTime" name="mealTime" required></td>
							</tr>
							<tr class="loginRow">
								<td>Location</td>
								<td><input type="text" id="mealLoc" name="mealLoc" required></td>
							</tr>
							<tr class="loginRow">
								<td>Meal Type</td>
								<td>
									<select id="type" name="type" required>
										<option>Select</option>
										<option>Meal</option>
										<option>Snack</option>
									</select>
								</td>
							</tr>
							<tr class="loginRow">
								<td>Weight (g)</td>
								<td><input type="number" id="mealWeight" name="mealWeight" required></td>
							</tr>
							<tr class="loginRow">
								<td>Calories</td>
								<td><input type="number" id="mealCal" name="mealCal" required></td>
							</tr>
							<tr><td>----------------------------------------</td></tr>
							<tr>
								<td>Food Group Percentages</td>
							</tr>
							<tr>
								<td>Fruit & Veg %</td>
								<td><input type="number" id="f&v" name="f&v"></td>
							</tr>
							<tr>
								<td>Starchy Carbohydrates %</td>
								<td><input type="number" id="carb" name="carb"></td>
							</tr>
							<tr>
								<td>Protien %</td>
								<td><input type="number" id="protein" name="protein"></td>
							</tr>
							<tr>
								<td>Dairy & Alternatives %</td>
								<td><input type="number" id="dairy" name="dairy"></td>
							</tr>
							<tr>
								<td>Oils & Spreads %</td>
								<td><input type="number" id="o&s" name="o&s"></td>
							</tr>
							<tr>
								<td>Junk Food %</td>
								<td><input type="number" id="jF" name="jF"></td>
							</tr>
						</tbody>
  					</table>
  					<br>
  					<p><input type="submit" value="Add"/></p>
  				</form>
  			</div>
  			
  		</div>
  	</div>
	
</body>
</html>