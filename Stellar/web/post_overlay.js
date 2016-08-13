$(document).ready(function(){
	// $(".box_postText").click(function() {
	// 	var e = document.getElementById("post-overlay");
	// 	e.style.display = 'block';
	// });
	
	$("#overlay-x").click(function() {
		var e = document.getElementById("post-overlay");
		e.style.display = 'none';
	});

	$("#overlay-followers-close").click(function() {
		var e = document.getElementById("all-followers");
		e.style.display = 'none';
	});
	$("#overlay-following-close").click(function() {
		var e = document.getElementById("all-following");
		e.style.display = 'none';
	});

	$("#more-followers").click(function() {
		var e = document.getElementById("all-followers");
		e.style.display = 'block';
	});
	$("#more-following").click(function() {
		var e = document.getElementById("all-following");
		e.style.display = 'block';
	});
});