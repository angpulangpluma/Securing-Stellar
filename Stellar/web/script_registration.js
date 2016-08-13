//Check email field
function emailCheck() {
	var email = document.getElementById("email");
	var notice = document.getElementById("email-check");

	if(email.value == "")
		notice.innerHTML = "Enter your email";
	else
		notice.innerHTML = "";
}

//Check username field
function usernameCheck() {
	var username = document.getElementById("username");
	var notice = document.getElementById("username-check");

	if(username.value.length < 4)
		notice.innerHTML = "Username must be at least 4 characters";
	else
		notice.innerHTML = "";
}

//Check password length
function passwordCheck_length() {
	var pwd1 = document.getElementById("pwd1");
	var notice = document.getElementById("pwd1-check");

	if(pwd1.value.length < 8)
		notice.innerHTML = "Password must be at least 8 characters";
	else
		notice.innerHTML = "";
}

//Check password digit count
function passwordCheck_digits() {
	var pwd1 = document.getElementById("pwd1");
	var notice = document.getElementById("pwd1-check");

	if(!containDigits(pwd1.value))
		notice.innerHTML = "Password should contain at least 1 digit";
	else
		notice.innerHTML = "";
}

//Count number of digits in password
function containDigits(pwd1) {
	var counter = 0;

	for(var i = 0; i < pwd1.length; i++) {
		if(pwd1[i] >= '0' && pwd1[i] <= '9')
			counter++;
	}

	if(counter > 0)
		return true;
}

//Check if pwd1 is equal to pwd2
function confirmPassword() {
	var pwd1 = document.getElementById("pwd1");
	var pwd2 = document.getElementById("pwd2");
	var notice = document.getElementById("pwd2-check");

	if(pwd1.value == pwd2.value)
		notice.innerHTML = "";
	else
		notice.innerHTML = "Passwords do not match";
}

//Change birthday dropdown values
function refreshDate(){
	var inputYear = document.getElementsByName("year")[0],
		inputMonth = document.getElementsByName("month")[0],
  		inputDay = document.getElementsByName("day")[0];
       
 	var date = new Date();
 	var n = date.getFullYear();
 
 	for (var i = n; i >= 1916; i--) {
  		var opt = new Option();
  		opt.value = opt.text = i;
  		inputYear.add(opt);
    }

 	inputYear.addEventListener("change", check);
 	inputMonth.addEventListener("change", check);

 function check() {
 	var y = +inputYear.value,
 		m = inputMonth.value,
 		d = inputDay.value;
 
 	if (m === "2")
     	var mlength = 28 + (!(y & 3) && ((y % 100) !== 0 || !(y & 15)));
 	else
 		var mlength = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][m - 1];
 
 	inputDay.length = 0;
 
 	for (var i = 1; i <= mlength; i++) {
    	var option = new Option();
     	option.value = option.text = i;
     	
     	if (i == d)
     		option.selected = true;
     	
     	inputDay.add(option);
 	}
 }
    check();
}

//Check required fields after clicking submit
//Display notice if successful
function validateRequiredFields() {
	var valid = true;

	var form = document.getElementById("form-container");
	var bg = document.getElementById("bg-rectangles");
	
	var email = document.getElementById("email");
	var email_check = document.getElementById("email-check");

	var username = document.getElementById("username");
	var username_check = document.getElementById("username-check");
	
	var pwd1 = document.getElementById("pwd1");
	var pwd1_check = document.getElementById("pwd1-check");

	var success_notice = document.getElementById("success-notice");
	var welcome_user = document.getElementById("welcome-user");

	if(email.value == "") {
		email_check.innerHTML = "Enter your email";
		valid = false;
	}

	if(username.value.length < 4) {
		username_check.innerHTML = "Username must be at least 4 characters";
		valid = false;
	}

	if(pwd1.value.length < 8) {
		pwd1_check.innerHTML = "Password must be at least 8 characters";
		valid = false;
	}

	if(!valid){
		event.preventDefault();
		console.log("Not Valid");
	}
	else {
		form.style.display = "none";
		bg.style.display = "none";

		success_notice.style.display = "initial";
		welcome_user.innerHTML = "Welcome to the System, " + username.value + "!"
		console.log("Valid");
		event.preventDefault();
	}
}