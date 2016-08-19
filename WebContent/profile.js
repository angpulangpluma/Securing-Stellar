function updateTitle() {
	var username = getParameterByName('username');
	document.title = "STELLAR | "+username;
}

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

$(document).ready(function(){
//	document.getElementById("button-follow").onclick = function () {
//		location.href = "/Stellar/follow";
//	};
	
	$("#box-suggested1").hover(function(){
		$("#star1").css("display", "initial");}, function(){
		$("#star1").css("display", "none");
	});
	
	$("#box-suggested2").hover(function(){
		$("#star2").css("display", "initial");}, function(){
		$("#star2").css("display", "none");
	});
	$("#box-suggested3").hover(function(){
		$("#star3").css("display", "initial");}, function(){
		$("#star3").css("display", "none");
	});
	$("#box-suggested4").hover(function(){
		$("#star4").css("display", "initial");}, function(){
		$("#star4").css("display", "none");
	});
	$("#box-suggested5").hover(function(){
		$("#star5").css("display", "initial");}, function(){
		$("#star5").css("display", "none");
	});

	
	$("#more-followers").on("click",function(){		 
		var fragment;
		$("#overlay-inner-followers").innerHTML = "";
		
		
		fragment += "<div class='box-overlay-inner-followers'><img src='user-default.png'><label>"+"</label>";

		$("#overlay-inner-followers").innerHTML = fragment;
	});
});