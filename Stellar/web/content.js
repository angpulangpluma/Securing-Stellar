$(document).ready(function(){

	/* Links */
	// $("div").click(function() {
	// 	var myClass = $(this).attr("class");
	// 	if(myClass == "box-postProfPic")  {
	// 		location.href = "profile.html";
	// 	}
	// });
	$(".ranking-postProfPic").click(function() {
		location.href = "profile.html";
	});

	// $("#box-profPicture").click(function(){
	// 	location.href = "user.html";
	// });


});

function userImage() {
	var xhttp; 
	  if (str == "") {
	    document.getElementById("txtHint").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
//	  xhttp.onreadystatechange = function() {
	    if (xhttp.readyState == 4 && xhttp.status == 200) {
	    document.getElementById("txtHint").innerHTML = xhttp.responseText;
//	    }
	  };
	  xhttp.open("GET", "getcustomer.asp?q="+str, true);
	  xhttp.send();
}