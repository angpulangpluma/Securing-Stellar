function update() {
	var link = document.getElementById("link-user");
	var query = window.location.search.substring(1);
	link.href = "/Stellar/user?"+query;
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
});