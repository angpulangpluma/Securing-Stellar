<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>STELLAR | Login</title>

		<link rel="stylesheet" type="text/css" href="login.css">
		<script src="login.js"></script>

	</head>

	<body>
		<div id="bg-img">
			<div id="bg-trapezoid1"></div>
			<div id="bg-trapezoid2"></div>
			<div id="bg-trapezoid3"></div>
			<div id="bg-trapezoid4"></div>
			<div id="bg-trapezoid5"></div>
			<div id="bg-trapezoid6"></div>
			<!-- <div id="bg-trapezoid7"></div>
			<div id="bg-trapezoid8"></div> -->
			<div id="bg-trapezoid9"></div>
			<div id="bg-trapezoid10"></div>
			<div id="bg-trapezoid11"></div>
			<div id="bg-trapezoid12"></div>
			<div id="bg-trapezoid13"></div>
			<div id="bg-trapezoid14"></div>
<!-- 			<div id="bg-rect1"></div>
			<div id="bg-rect2"></div>
			<div id="bg-rect3"></div>
			<div id="bg-rect4"></div> -->
		</div>

		<!--
		<div id="bg-triangle">
			<div id="bg-triangle1"></div>
			<div id="bg-triangle2"></div>

			<div id="bg-triangle3"></div>
			<div id="bg-triangle4"></div>

			<div id="bg-triangle5"></div>
			<div id="bg-triangle6"></div>

			<div id="bg-triangle7"></div>
			<div id="bg-triangle8"></div>
		</div>
		-->

		<div id="login-form">
			<form id="user-login" method="post">
				<table id="form-table">
					<tr><td colspan="2"><h2>Login to the System</h2>
						<span id="error-check" class="field-notice">${error}</span>
						</td>
					</tr>
					<tr>
						<!-- <td><span class="form-field">Username</span></td> -->
						<td colspan="2"><input id="username" name="username" type="text" onblur="usernameCheck()" placeholder="Username"></td>
						<td><span id="username-check" class="field-notice"></span>
					</tr>
					<tr>
						<!-- <td><span class="form-field">Password</span></td> -->
						<td colspan="2"><input id="pwd" name="pwd" type="password" onblur="pwdCheck()" placeholder="Password"></td>
						<td><span id="password-check" class="field-notice"></span>
					</tr>
					<tr>
						<td colspan="2"><input id="login" name="login" type="submit" value="Enter Stellar" onclick="checkFields(); return false;"></td>
					</tr>
					<tr>
						<td colspan="2"><input id="back" name="home" type="button" value="Back" onclick="location.href='/Stellar/main'"></td>
					</tr>
				</table>
			</form>
		</div>
	</body>

</html>