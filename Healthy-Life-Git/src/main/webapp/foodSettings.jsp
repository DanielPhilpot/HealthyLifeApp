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
	<jsp:include page="nav-top.jsp"/>
	
	<div class="container">
	
	<h1>Food Settings</h1>
	<br>
	
  		<div class="row">
  			<div class="col-sm-4">
  				<h3 >Add a meal to schedule</h3>
  				<br>
  				<form form method="POST" action="http://localhost:8080/Healthy-Life-Git/controller/addScheduleItem" onsubmit="return validateAddActivity()">
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
  				<form method="POST" action="http://localhost:8080/Healthy-Life-Git/controller/setDietReq" onsubmit="return validateForm()">
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
  				<form method="POST" action="http://localhost:8080/Healthy-Life-Git/controller/addTarget" onsubmit="return validateForm()">
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