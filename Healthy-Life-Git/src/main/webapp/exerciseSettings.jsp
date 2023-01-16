<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exercise Settings</title>
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
		let timeHr = document.getElementById("timeHR").value;
		let timeMi = document.getElementById("timeMi").value;
		let location = document.getElementById("location").value;
		let durHr = document.getElementById("durHR").value;
		let durMi = document.getElementById("durMi").value;
		if (day == "Select") {
			DMessage = "A day is Required; ";
		}
		if (timeHr == "--" || timeMi == "--") {
			TMessage = "Enter a valid time; ";
		}
		if (location == "Select") {
			LMessage = "A location is Required; ";
		}
		if (durHr == "--" || durMi == "--") {
			DrMessage = "Enter a valid duration; ";
		}
		if (DMessage != "" || TMessage != "" || LMessage != "" || DrMessage != ""){
			alert(DMessage + TMessage + LMessage + DrMessage);
			DMessage = "";
			TMessage = "";
			LMessage = "";
			DrMessage = "";
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
          					<li class="active"><a href="exerciseSettings.jsp">Exercise Settings</a></li>
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
	
	<h1>Exercise Settings</h1>
	<br>
	<div class="container">
  		<div class="row">
  			<div class="col-sm-4">
  				<h3 >Add a exercise to schedule</h3>
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
								<td>
									<select id="timeHR" name="timeHR">
										<option>--</option>
										<option>00</option>
										<option>01</option>
										<option>02</option>
										<option>03</option>
										<option>04</option>
										<option>05</option>
										<option>06</option>
										<option>07</option>
										<option>08</option>
										<option>09</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
										<option>13</option>
										<option>14</option>
										<option>15</option>
										<option>16</option>
										<option>17</option>
										<option>18</option>
										<option>19</option>
										<option>20</option>
										<option>21</option>
										<option>22</option>
										<option>23</option>
									</select>
								</td>
								<td>
									<select id="timeMi" name="timeMi">
										<option>--</option>
										<option>00</option>
										<option>01</option>
										<option>02</option>
										<option>03</option>
										<option>04</option>
										<option>05</option>
										<option>06</option>
										<option>07</option>
										<option>08</option>
										<option>09</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
										<option>13</option>
										<option>14</option>
										<option>15</option>
										<option>16</option>
										<option>17</option>
										<option>18</option>
										<option>19</option>
										<option>20</option>
										<option>21</option>
										<option>22</option>
										<option>23</option>
										<option>24</option>
										<option>25</option>
										<option>26</option>
										<option>27</option>
										<option>28</option>
										<option>29</option>
										<option>30</option>
										<option>31</option>
										<option>32</option>
										<option>33</option>
										<option>34</option>
										<option>35</option>
										<option>36</option>
										<option>37</option>
										<option>38</option>
										<option>39</option>
										<option>40</option>
										<option>41</option>
										<option>42</option>
										<option>43</option>
										<option>44</option>
										<option>45</option>
										<option>46</option>
										<option>47</option>
										<option>48</option>
										<option>49</option>
										<option>50</option>
										<option>51</option>
										<option>52</option>
										<option>53</option>
										<option>54</option>
										<option>55</option>
										<option>56</option>
										<option>57</option>
										<option>58</option>
										<option>59</option>
									</select>
								</td>
							</tr>
							<tr class="loginRow">
								<td>Location</td>
								<td>
									<select id="location" name="location">
										<option>Select</option>
										<option>Gym</option>
										<option>Park</option>
										<option>From Home</option>
									</select>
								</td>
							</tr>
							<tr class="loginRow">
								<td>Duration - HR:Min</td>
								<td>
									<select id="durHR" name="durHR">
										<option>--</option>
										<option>00</option>
										<option>01</option>
										<option>02</option>
										<option>03</option>
										<option>04</option>
										<option>05</option>
										<option>06</option>
										<option>07</option>
										<option>08</option>
										<option>09</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
										<option>13</option>
										<option>14</option>
										<option>15</option>
										<option>16</option>
										<option>17</option>
										<option>18</option>
										<option>19</option>
										<option>20</option>
										<option>21</option>
										<option>22</option>
										<option>23</option>
									</select>
								</td>
								<td>
									<select id="durMi" name="durMi">
										<option>--</option>
										<option>00</option>
										<option>01</option>
										<option>02</option>
										<option>03</option>
										<option>04</option>
										<option>05</option>
										<option>06</option>
										<option>07</option>
										<option>08</option>
										<option>09</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
										<option>13</option>
										<option>14</option>
										<option>15</option>
										<option>16</option>
										<option>17</option>
										<option>18</option>
										<option>19</option>
										<option>20</option>
										<option>21</option>
										<option>22</option>
										<option>23</option>
										<option>24</option>
										<option>25</option>
										<option>26</option>
										<option>27</option>
										<option>28</option>
										<option>29</option>
										<option>30</option>
										<option>31</option>
										<option>32</option>
										<option>33</option>
										<option>34</option>
										<option>35</option>
										<option>36</option>
										<option>37</option>
										<option>38</option>
										<option>39</option>
										<option>40</option>
										<option>41</option>
										<option>42</option>
										<option>43</option>
										<option>44</option>
										<option>45</option>
										<option>46</option>
										<option>47</option>
										<option>48</option>
										<option>49</option>
										<option>50</option>
										<option>51</option>
										<option>52</option>
										<option>53</option>
										<option>54</option>
										<option>55</option>
										<option>56</option>
										<option>57</option>
										<option>58</option>
										<option>59</option>
									</select>
								</td>
							</tr>
						</tbody>
  					</table>
  					<br>
  					<p><input type="submit" value="Add"/></p>
  				</form>
  			</div>
  			
  			<div class="col-sm-8">
  				<h3>Exercise Schedule</h3>
  				<p>When complete this section will display the users set meal schedule</p>
  			</div>
  		</div>
  	</div>
  	<br>
  	<div class="container">
  		<div class="row">
  			<div class="col-sm-6">
  				<h3>Location Settings - From Home</h3>
  				<br>
  				<form name="dietReq" action = "SetDietReqServlet" onsubmit="return validateForm()" method = "post">
  					<table>
  						<tbody>
  							<tr class="loginRow">
								<td>Gym Distance - HR:Min</td>
								<td>
									<select id="gyDiHR" name="gyDiHR">
										<option>--</option>
										<option>00</option>
										<option>01</option>
										<option>02</option>
										<option>03</option>
										<option>04</option>
										<option>05</option>
										<option>06</option>
										<option>07</option>
										<option>08</option>
										<option>09</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
										<option>13</option>
										<option>14</option>
										<option>15</option>
										<option>16</option>
										<option>17</option>
										<option>18</option>
										<option>19</option>
										<option>20</option>
										<option>21</option>
										<option>22</option>
										<option>23</option>
									</select>
								</td>
								<td>
									<select id="gyDiMi" name="gyDiMi">
										<option>--</option>
										<option>00</option>
										<option>01</option>
										<option>02</option>
										<option>03</option>
										<option>04</option>
										<option>05</option>
										<option>06</option>
										<option>07</option>
										<option>08</option>
										<option>09</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
										<option>13</option>
										<option>14</option>
										<option>15</option>
										<option>16</option>
										<option>17</option>
										<option>18</option>
										<option>19</option>
										<option>20</option>
										<option>21</option>
										<option>22</option>
										<option>23</option>
										<option>24</option>
										<option>25</option>
										<option>26</option>
										<option>27</option>
										<option>28</option>
										<option>29</option>
										<option>30</option>
										<option>31</option>
										<option>32</option>
										<option>33</option>
										<option>34</option>
										<option>35</option>
										<option>36</option>
										<option>37</option>
										<option>38</option>
										<option>39</option>
										<option>40</option>
										<option>41</option>
										<option>42</option>
										<option>43</option>
										<option>44</option>
										<option>45</option>
										<option>46</option>
										<option>47</option>
										<option>48</option>
										<option>49</option>
										<option>50</option>
										<option>51</option>
										<option>52</option>
										<option>53</option>
										<option>54</option>
										<option>55</option>
										<option>56</option>
										<option>57</option>
										<option>58</option>
										<option>59</option>
									</select>
								</td>
							</tr>
  							<tr class="loginRow">
								<td>Park Distance - HR:Min</td>
								<td>
									<select id="pkDiHR" name="pkDiHR">
										<option>--</option>
										<option>00</option>
										<option>01</option>
										<option>02</option>
										<option>03</option>
										<option>04</option>
										<option>05</option>
										<option>06</option>
										<option>07</option>
										<option>08</option>
										<option>09</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
										<option>13</option>
										<option>14</option>
										<option>15</option>
										<option>16</option>
										<option>17</option>
										<option>18</option>
										<option>19</option>
										<option>20</option>
										<option>21</option>
										<option>22</option>
										<option>23</option>
									</select>
								</td>
								<td>
									<select id="pkDiMi" name="pkDiMi">
										<option>--</option>
										<option>00</option>
										<option>01</option>
										<option>02</option>
										<option>03</option>
										<option>04</option>
										<option>05</option>
										<option>06</option>
										<option>07</option>
										<option>08</option>
										<option>09</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
										<option>13</option>
										<option>14</option>
										<option>15</option>
										<option>16</option>
										<option>17</option>
										<option>18</option>
										<option>19</option>
										<option>20</option>
										<option>21</option>
										<option>22</option>
										<option>23</option>
										<option>24</option>
										<option>25</option>
										<option>26</option>
										<option>27</option>
										<option>28</option>
										<option>29</option>
										<option>30</option>
										<option>31</option>
										<option>32</option>
										<option>33</option>
										<option>34</option>
										<option>35</option>
										<option>36</option>
										<option>37</option>
										<option>38</option>
										<option>39</option>
										<option>40</option>
										<option>41</option>
										<option>42</option>
										<option>43</option>
										<option>44</option>
										<option>45</option>
										<option>46</option>
										<option>47</option>
										<option>48</option>
										<option>49</option>
										<option>50</option>
										<option>51</option>
										<option>52</option>
										<option>53</option>
										<option>54</option>
										<option>55</option>
										<option>56</option>
										<option>57</option>
										<option>58</option>
										<option>59</option>
									</select>
								</td>
							</tr>
  						</tbody>
  					</table>
  					<p><input type="submit" value="Set"/></p>
  				</form>
  			</div>
  			<div class="col-sm-6">
  				<h3>Targets</h3>
  				<form method="POST" action="http://localhost:8080/Healthy-Life-Git/controller/addTarget" onsubmit="return validateDistances()">
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