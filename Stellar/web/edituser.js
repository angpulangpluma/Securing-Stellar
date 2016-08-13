function showEditForm() {
	$("#box-profPic1").css("left", "13.34%");
	$("#box-profPic1").css("top", "13.34%");
	$("#box-profPic1").css("z-index", "100");
	
	$("#box-profPic2").css("left", "0%");
	$("#box-profPic2").css("top", "0%");
	$("#box-profPic2").css("z-index", "0");
	
	var edit_form = document.getElementById("edit-container");
	var overlay = document.getElementById("overlay");

	edit_form.style.display = "initial";
	overlay.style.display = "initial";
}

function usernameCheck() {
	var username = document.getElementById("edit-username");
	var notice = username.getAttribute("placeholder");

	if(username.value.length < 4) {
		username.setAttribute("placeholder", "Must be at least 4 characters");
		username.style.backgroundColor = "#C04848";
	}
	else {
		username.style.backgroundColor = "transparent";
	}
}

function editProfile() {


	var edit_form = document.getElementById("edit-container");
	var overlay = document.getElementById("overlay");

	var username_old = document.getElementById("box-username");
	var username_new = document.getElementById("edit-username");

	var fullname_old = document.getElementById("box-fullname");
	var firstname_new = document.getElementById("edit-firstname");
	var lastname_new = document.getElementById("edit-lastname");
	var fullname_new = firstname_new.value + " " + lastname_new.value;

	var desc_old = document.getElementById("desc-box");
	var desc_new = document.getElementById("edit-desc");
	
	//var edit_btn = document.getElementById("edit-btn");
	
	//var edit_button_value = document.getElementById("edit-btn").value;
	//console.log(edit_btn_value);
	
	if(username_new.value.length < 4) {
		event.preventDefault();
	}
	else {
		$("#box-profPic1").css("left", "0%");
		$("#box-profPic1").css("top", "0%");
		$("#box-profPic1").css("z-index", "0");
	
		$("#box-profPic2").css("left", "13.34%");
		$("#box-profPic2").css("top", "13.34%");
		$("#box-profPic2").css("z-index", "100");
		document.edit_form.submit();
		username_old.innerHTML = username_new.value;
		fullname_old.innerHTML = fullname_new;
		desc_old.innerHTML = desc_new.value;

		edit_form.style.display = "none";
		overlay.style.display = "none";

	//	event.preventDefault();
	}
}