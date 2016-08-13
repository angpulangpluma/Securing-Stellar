<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>STELLAR | Welcome</title>

		<link rel="stylesheet" type="text/css" href="successful.css">
		<script src="registration.js"></script>
	
	</head>

	<body>
		<!-- Success Notice START -->
		<div id="success-notice">
			<div id="logo"></div>
			<div id="success-notice-box1"></div>
			<div id="success-notice-box2"></div>
			<div id="welcome-text">
				<span id="welcome-user">Welcome to the System, ${username} !</span>
				<p>
				<span id="login-link">click <a href="/Stellar/login">here</a> to start your journey.</span>
			</div>		
		</div>
		<!-- Success Notice END -->

		<!-- Trapezoid Image START -->
		<div id="bg-img">
			<div id="bg-trapezoid1"></div>
			<div id="bg-trapezoid2"></div>
			<div id="bg-trapezoid3"></div>
			<div id="bg-trapezoid4"></div>
			<div id="bg-trapezoid5"></div>
			<div id="bg-trapezoid6"></div>
			<div id="bg-trapezoid9"></div>
			<div id="bg-trapezoid10"></div>
			<div id="bg-trapezoid11"></div>
			<div id="bg-trapezoid12"></div>
			<div id="bg-trapezoid13"></div>
			<div id="bg-trapezoid14"></div> 
		</div>
		<!-- Trapezoid Image END -->

		<!-- Registration Form START -->
		<div id="form-container">
			<h2>Join the Stellar System. <span id="backToHome" onclick = "redirectToMain()">(OR NAH)</span></h2><span class="warning">* - Required field</span>

			<form id="user-registration" method="post">
				<table id="form-table">
					<tr>
						<td><span class="form-field">First Name</span></td>
						<td><input id="firstname" name="firstname" type="text"></td>
					</tr>
					<tr>
						<td><span class="form-field">Last Name</span></td>
						<td><input id="lastname" name="lastname" type="text"></td>
						
					</tr>
					<tr>
						<td>
							<span class="warning">*</span>
							<span class="form-field">Email</span>
						</td>
						<td><input id="email" name="email" type="text" onblur="emailCheck()"></td>
						<td><span id="email-check" class="field-notice"></span></td>
					</tr>
					<tr>
						<td>
							<span class="warning">*</span>
							<span class="form-field">Username</span>
						</td>
						<td><input id="username" name="username" type="text" onblur="usernameCheck()" onkeyup="usernameCheck()"></td>
						<td><span id="username-check" class="field-notice"></span></td>
					</tr>
					<tr>
						<td>
							<span class="warning">*</span>
							<span class="form-field">Password</span>
						</td>
						<td><input id="pwd1" name="pwd1" type="password" onkeyup="passwordCheck_digits()" onblur="passwordCheck_length()"></td>
						<td><span id="pwd1-check" class="field-notice"></span></td>
					</tr>
					<tr>
						<td>
							<span class="warning">*</span>
							<span class="form-field">Confirm Password</span>
						</td>
						<td><input id="pwd2" name="pwd2" type="password" onkeyup="confirmPassword()"></td>
						<td><span id="pwd2-check" class="field-notice"></span></td>
					</tr>
					<tr>
						<td><span class="form-field">Birthday</span></td>
						<td>
							<!-- Month START -->
							<div class="dropdown-month">
								<select id="month" name="month" onchange="refreshDate()">
									<option value="">MONTH</option>
									<option value="1">January</option>
									<option value="2">February</option>
									<option value="3">March</option>
									<option value="4">April</option>
									<option value="5">May</option>
									<option value="6">June</option>
									<option value="7">July</option>
									<option value="8">August</option>
									<option value="9">September</option>
									<option value="10">October</option>
									<option value="11">November</option>
									<option value="12">December</option>
								</select>
            				</div>
            				<!-- Month END -->

            				<!-- Day START -->
            				<div class="dropdown-day">
            					<select id="day" name="day">
            						<option value="">DAY</option>
            					</select>
            				</div>
            				<!-- Day END -->
            	
            				<!-- Year START -->
            				<div class="dropdown-year">
            					<select id="year" name="year" onchange="refreshDate()">
            						<option value="">YEAR</option>
            					</select>
            				</div>
            				<!-- Year END -->
						</td>
					</tr>
					<tr>
						<td><span class="form-field">Location</span></td>
						<td><input id="location" name="location" type="text" value=""></td>
					</tr>
					<tr>
						<td colspan="2"><span class="form-field">Describe yourself:</span></td>
					</tr>
					<tr>
						<td colspan="2"><textarea id="desc" name="desc" rows="8" cols="65" placeholder="Put your description here"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input id="register" name="register" type="submit" onclick="validateRequiredFields()" value="Register"></td>
					</tr>
					<tr>
						<td colspan="2"><span class="field-notice">By clicking the Submit button, make sure you agree to our Terms and Conditions.</span></td>
					</tr>
				</table>
			</form>
		</div>
		<!-- Registration Form END -->
	</body>

</html>