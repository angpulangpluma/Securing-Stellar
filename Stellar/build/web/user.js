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
function filterUser() {
	document.getElementById("box-postContainer").innerHTML = "lol";
	alert('no');
	
	
}
$(document).ready(function(){
	

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
//	$("#btn-upload").hover(function(){
//		$("#btn-upload").css("display", "initial");}, function(){
//		$("#btn-upload").css("display", "none");
//	});
	
//	$("#btn-upload").click(function(){
//		$("#box-profPic2").css("z-index", "999");
//	});
	
	
	$("#more-followers").on("click",function(){		 
		var fragment;
		$("#overlay-inner-followers").innerHTML = "";		
		fragment += "<div class='box-overlay-inner-followers'><img src='user-default.png'><label>"+"</label>";

		$("#overlay-inner-followers").innerHTML = fragment;
	});
	
	$("#btn-upload").on("click",function(){		 
		if($(this).attr("data-click-state") == 1) {
			$(this).attr("data-click-state", 0)			
//			$("#box-profPic1").css("z-index", "0");
			
			$("#box-profPic1").css("left", "0%");
			$("#box-profPic1").css("top", "0%");
			$("#box-profPic1").css("z-index", "0");
			

			$("#box-profPic2").css("left", "13.34%");
			$("#box-profPic2").css("top", "13.34%");
			$("#box-profPic2").css("z-index", "100");
		 
		} else {
			$(this).attr("data-click-state", 1)
//			$("#box-profPic1").css("z-index", "999");

			$("#box-profPic1").css("left", "13.34%");
			$("#box-profPic1").css("top", "13.34%");
			$("#box-profPic1").css("z-index", "100");
			

			$("#box-profPic2").css("left", "0%");
			$("#box-profPic2").css("top", "0%");
			$("#box-profPic2").css("z-index", "0");
			
		} 
	});
});