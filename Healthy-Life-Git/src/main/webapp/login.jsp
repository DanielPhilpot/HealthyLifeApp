<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="style.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<script type="text/javascript">
	function validateForm() {
		let username = document.getElementById("username").value;
		let password = document.getElementById("password").value;
		if (username == "") {
			UMessage = "Username is Required; ";
		}
		if (password == "") {
			PMessage = "Password is Required; ";
		}
		if (UMessage != "" || PMessage != ""){
			alert(UMessage + PMessage);
			UMessage = "";
			PMessage = "";
			return false;
		}
	}
</script>

</head>
<body>
	<jsp:include page="nav-top.jsp"/>
	
	<div style="text-align: center;">
		<h1>Login to Healthy Life</h1>
		<br>
		<form method="POST" action="http://localhost:8080/Healthy-Life-Git/controller/login" onsubmit="return validateForm()">
		<table class="center">
			<tbody>
				<tr class="loginRow">
					<td>Username</td>
					<td><input type="text" id="username" name="username"></td>
				</tr>
				<tr class="loginRow">
					<td>Password</td>
					<td><input type="password" id="password" name="password"></td>
				</tr>
			</tbody>
		</table>
		<br>
		<p><input type="submit" value="Login"/></p>
		</form>
	</div>
</body>
</html>