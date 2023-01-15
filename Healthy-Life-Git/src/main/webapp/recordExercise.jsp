<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Record exercise</title>
<link rel="stylesheet" href="style.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript --> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function setWorkoutType() { 
		var type = document.getElementById("type").value
		if(type == "Cardio") {
			document.getElementById("penis").style.visibility = "visible";
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
        			<li class="dropdown">
        				<a class="dropdown-toggle" data-toggle="dropdown" href="#">Food
        				<span class="caret"></span></a>
       	 				<ul class="dropdown-menu">
          					<li><a href="foodSettings.jsp">Food Settings</a></li>
          					<li><a href="recordMeal.jsp">Record a Meal</a></li>
          					<li><a href="mealHistory.jsp">Meal History</a></li>
        				</ul>
     				</li>
     				<li class="active" class="dropdown">
        				<a class="dropdown-toggle" data-toggle="dropdown" href="#">Exercise
        				<span class="caret"></span></a>
       	 				<ul class="dropdown-menu">
          					<li><a href="exerciseSettings.jsp">Exercise Settings</a></li>
          					<li class="active"><a href="recordExercise.jsp">Record Exercise</a></li>
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
	<div class="row">
	<h1>Record a Workout</h1>
	<br>
  		<div class="row">
  			<div class="col-sm-4">
  				<h3>Add Workout</h3>
  				<form name="workout" action = "RecordWorkoutServlet" onsubmit="return validateWorkout()" method = "post">
  					<table>
  						<tbody>
							<tr class="loginRow">
								<td>Workout Date</td>
								<td><input type="date" id="mealDate" name="mealDate" required>
							</tr>
							<tr class="loginRow">
								<td>Time of day</td>
								<td><input type="time" id="mealTime" name="mealTime" required></td>
							</tr>
							<tr class="loginRow">
								<td>Weight (g)</td>
								<td><input type="number" id="mealWeight" name="mealWeight" required></td>
							</tr>
							<tr class="loginRow">
								<td>Calories</td>
								<td><input type="number" id="mealCal" name="mealCal" required></td>
							</tr>
							
						</tbody>
  					</table>
  					<br>
  					<p><input type="submit" value="Add"/></p>
  				</form>
  			</div>
  			<div class="col-sm-4">
  				<h3>Add Exercise</h3>
  				<form name="workout" action = "RecordExerciseServlet" onsubmit="return validateWorkout()" method = "post">
  					<table>
  						<tbody>
  							<tr class = "loginRow" >
  								<td>Workout</td>
								<td><select id="workout" name="workout">
									<!-- This will be populated with workouts when the database has been implemented -->
									<option>Select</option>
									<option>Workout 1</option>
									<option>Workout 2</option>
								</select></td>
  							</tr>
  							<tr class = "loginRow">
  								<td>Type</td>
  								<td><select id="type" name="type">
  									<option>Cardio</option>
  									<option>Muscle</option>
  								</select></td>
  							</tr>
  							<tr class = "loginRow">
  								<td>Sets</td>
								<td><input type="number" id="sets" name="sets"></td>
  							</tr>
  							<tr class = "loginRow">
  								<td>Reps</td>
								<td><input type="number" id="reps" name="reps"></td>
  							</tr>
  							<tr class = "loginRow">
  								<td>Weight - Kg</td>
								<td><input type="number" id="weight" name="weight"></td>
  							</tr>
  							<tr class = "loginRow">
  								<td>Distance - Mi</td>
								<td><input type="number" id="distance" name="distance"></td>
  							</tr>
  							<tr class = "loginRow">
  								<td>Time Taken - Min</td>
								<td><input type="number" id="time" name="time"></td>
  							</tr>
  							<tr class = "loginRow">
  								<td>Chalories Burnt</td>
								<td><input type="number" id="chalorie" name="chalore"></td>
  							</tr>
  							<tr class = "loginRow">
  								<td>Feeling After</td>
  								<td><select id="after" name="after">
  									<option>Select</option>
  									<option>Energized</option>
  									<option>Fine</option>
  									<option>Tired</option>
  									<option>Exhausted</option>
  								</select></td>
  							</tr>					
  						</tbody>
  					</table>
  					<p><input type="submit" value="Add"/></p>
  				</form>
  			</div>
  			</div>	
  		</div>
  	</div>
	
</body>
</html>