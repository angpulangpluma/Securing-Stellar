function usernameCheck() {
	var username = document.getElementById("username");
	var notice = document.getElementById("username-check");

	if(username.value == "")
		notice.innerHTML = "Enter your username";
	else
		notice.innerHTML = "";
}

function pwdCheck() {
	var pwd = document.getElementById("pwd");
	var notice = document.getElementById("password-check");

	if(pwd.value == "")
		notice.innerHTML = "Enter your password";
	else
		notice.innerHTML = "";
}

function checkFields() {
	var valid = true;

	var username = document.getElementById("username");
	var username_check = document.getElementById("username-check");

	var pwd = document.getElementById("pwd");
	var pwd_check = document.getElementById("password-check");


	var error_check = document.getElementById("error-check");
	
	if(username.value == "") {
		error_check.innerHTML = "";
		username_check.innerHTML = "Enter your username";
		valid = false;
	}
	//TODO: if username is not in database
	if(pwd.value == "") {
		error_check.innerHTML = "";
		pwd_check.innerHTML = "Enter your password";		
		valid = false;
	}
	//TODO: if password does not match username

	if(!valid)
		event.preventDefault();
	
	else if(valid) {
		document.login.submit();
	}
}