$(document).ready(function(){
	/* Links */
	document.getElementById("about").onclick = function() {
		var e1 = document.getElementById("box-page5-about");
		var e2 = document.getElementById("box-page5-credits");
		var e3 = document.getElementById("box-page5-developers");
		e1.style.display = "block";
		e2.style.display = "none";
		e3.style.display = "none";
	}
	document.getElementById("credits").onclick = function() {
		var e1 = document.getElementById("box-page5-about");
		var e2 = document.getElementById("box-page5-credits");
		var e3 = document.getElementById("box-page5-developers");
		e1.style.display = "none";
		e2.style.display = "block";
		e3.style.display = "none";
	}
	document.getElementById("developers").onclick = function() {
		var e1 = document.getElementById("box-page5-about");
		var e2 = document.getElementById("box-page5-credits");
		var e3 = document.getElementById("box-page5-developers");
		e1.style.display = "none";
		e2.style.display = "none";
		e3.style.display = "block";
	}
	
	document.getElementById("google").onclick = function () {
		location.href = "http://www.google.com/";
	};
	document.getElementById("facebook").onclick = function () {
		location.href = "http://www.facebook.com/";
	};
	document.getElementById("instagram").onclick = function () {
		location.href = "http://www.instagram.com/";
	};
	
	document.getElementById("btn-login").onclick = function () {
		location.href = "/Stellar/login";
	};
	document.getElementById("btn-register").onclick = function () {
		location.href = "/Stellar/register";
	};


	document.getElementById("post").onclick = function () {
		var numItems = $('.box-post').length;

		if(numItems < 3) {
			var text = $('textarea#newPost').val();
			$(	"<div style='display: none;' id='newPostId' class='box-post'>"
				+"<div class='box-postProfPic'></div>"
				+"<textarea id='text-newPost' style='top: 50%;' readonly='true'>"+text+"</textarea>"
				+"<div class='rating'>"
				+"<span class='rate1'>&#9734;</span><span class='rate2'>&#9734;</span><span class='rate3'>&#9734;</span><span class='rate4'>&#9734;</span><span class='rate5'>&#9734;</span>"
				+"</div>"
				+"</div>"
				).appendTo($('#box-postContainer')).slideDown("fast");
		}	
		else {
			$('#text-newPost').hide();
			$('#newPostId').hide();
			$('textarea#text-newPost').val("");
			$('#text-newPost').slideDown(function() {
				var text = $('textarea#newPost').val();
				$('textarea#text-newPost').val(text);
			});
			$('#newPostId').slideDown();			
		}		
	};

    /* Mouswheel Scroll */
	$('#main-page1').bind('mousewheel', function(e){
		if(e.originalEvent.wheelDelta /120 > 0) {	/*Scroll Up*/
			$("#main-page1").slideDown("slow");
		}
		else{
			$("#main-page1").slideUp("slow");	/*Scroll Down*/
			document.getElementById("radio1").checked = false;
			document.getElementById("radio2").checked = true;
		}
	});
	$('#main-page2').bind('mousewheel', function(e){
		if(e.originalEvent.wheelDelta /120 > 0) {
			$("#main-page1").slideDown("slow");
			$("#main-page2").slideDown("slow");
			
			document.getElementById("radio1").checked = true;
			document.getElementById("radio2").checked = false;
		}
		else{
			$("#main-page2").slideUp("slow");
			myMove();
			document.getElementById("radio2").checked = false;
			document.getElementById("radio3").checked = true;
		}
	});
	$('#main-page3').bind('mousewheel', function(e){
        if(e.originalEvent.wheelDelta /120 > 0) {
			$("#main-page2").slideDown("slow");
			$("#main-page3").slideDown("slow");
			myMove();
			document.getElementById("radio2").checked = true;
			document.getElementById("radio3").checked = false;
		}
		else{
			$("#main-page3").slideUp("slow");
			myMoveOut();
			document.getElementById("radio3").checked = false;
			document.getElementById("radio4").checked = true;
		}
	});
    $('#main-page4').bind('mousewheel', function(e){
        if(e.originalEvent.wheelDelta /120 > 0) {
			$("#main-page3").slideDown("slow");
			myMove();
			$("#main-page4").slideDown("slow");
			document.getElementById("radio3").checked = true;
			document.getElementById("radio4").checked = false;
        }
        else{
			$("#main-page4").slideUp("slow");
			document.getElementById("radio4").checked = false;
			document.getElementById("radio5").checked = true;
		}
	});
	$('#main-page5').bind('mousewheel', function(e){
		if(e.originalEvent.wheelDelta /120 > 0) {
			$("#main-page4").slideDown("slow");
			$("#main-page5").slideDown("slow");            
			document.getElementById("radio4").checked = true;
			document.getElementById("radio5").checked = false;

		}
		else{
		}
	});



	/*Radio Button Click*/
	$("#radio1").click(function(){
		if($('#main-page2').is(":visible")) {
			$("#main-page2").slideDown("slow");
			$("#main-page1").slideDown("slow");
		}
		else if($('#main-page3').is(":visible")) {
			$("#main-page3").slideDown("slow");
			myMoveOut();
			$("#main-page2").slideDown("slow");
			$("#main-page1").slideDown("slow");
		}
		else if($('#main-page4').is(":visible")) {
			$("#main-page4").slideDown("slow");
			$("#main-page3").slideDown("slow");
			myMove();
			$("#main-page2").slideDown("slow");
			$("#main-page1").slideDown("slow");
		}
		else if($('#main-page5').is(":visible")) {
			$("#main-page5").slideDown("slow");
			$("#main-page4").slideDown("slow");
			$("#main-page3").slideDown("slow");
			myMove();
			$("#main-page2").slideDown("slow");
			$("#main-page1").slideDown("slow");
		}			
	});

	$("#radio2").click(function(){

		if($('#main-page1').is(":visible")) {
			$("#main-page1").slideUp("slow");
		}
		else if($('#main-page3').is(":visible")) {
			$("#main-page3").slideDown("slow");
			myMoveOut();
			$("#main-page2").slideDown("slow");
		}
		else if($('#main-page4').is(":visible")) {
			$("#main-page4").slideDown("slow");
			$("#main-page3").slideDown("slow");
			myMove();
			$("#main-page2").slideDown("slow");
		}
		else if($('#main-page5').is(":visible")) {
			$("#main-page5").slideDown("slow");
			$("#main-page4").slideDown("slow");
			$("#main-page3").slideDown("slow");
			myMove();
			$("#main-page2").slideDown("slow");
		}			
	});

	$("#radio3").click(function(){

		if($('#main-page1').is(":visible")) {
			$("#main-page1").slideUp("slow");
			$("#main-page2").slideUp("slow");
			myMove();
		}
		else if($('#main-page2').is(":visible")) {
			$("#main-page2").slideUp("slow");
			myMove();
		}
		else if($('#main-page4').is(":visible")) {
			$("#main-page4").slideDown("slow");
			$("#main-page3").slideDown("slow");
			myMove();
		}
		else if($('#main-page5').is(":visible")) {
			$("#main-page5").slideDown("slow");
			$("#main-page4").slideDown("slow");
			$("#main-page3").slideDown("slow");
			myMove();
		}			
	});

	$("#radio4").click(function(){

		if($('#main-page1').is(":visible")) {
			$("#main-page1").slideUp("slow");
			$("#main-page2").slideUp("slow");
			$("#main-page3").slideUp("slow");
			myMoveOut();
		}
		else if($('#main-page2').is(":visible")) {
			$("#main-page2").slideUp("slow");
			$("#main-page3").slideUp("slow");
			myMoveOut();
		}
		else if($('#main-page3').is(":visible")) {
			$("#main-page3").slideUp("slow");
			myMoveOut();
		}
		else if($('#main-page5').is(":visible")) {
			$("#main-page5").slideDown("slow");
			$("#main-page4").slideDown("slow");
		}			
	});

	$("#radio5").click(function(){

		if($('#main-page1').is(":visible")) {
			$("#main-page1").slideUp("slow");
			$("#main-page2").slideUp("slow");
			$("#main-page3").slideUp("slow");
			myMoveOut();
			$("#main-page4").slideUp("slow");
		}
		else if($('#main-page2').is(":visible")) {
			$("#main-page2").slideUp("slow");
			$("#main-page3").slideUp("slow");
			myMoveOut();
			$("#main-page4").slideUp("slow");
		}
		else if($('#main-page3').is(":visible")) {
			$("#main-page3").slideUp("slow");
			myMoveOut();
			$("#main-page4").slideUp("slow");
		}
		else if($('#main-page4').is(":visible")) {		
			$("#main-page4").slideUp("slow");
		}			
	});


	var isRunning = false;

	function myMoveOut() {
		if(!isRunning) {
			var p = $("#img-page3-2");
			var position = p.position();
			var left = position.left;
		
			var id = setInterval(frame, 1);
			isRunning = true;
			function frame() {
				if (!isRunning || left == -450) {
					isRunning = false;
					clearInterval(id);
				}
				else {
					left--;
					p.css({left: left});
				}
			}
		}
	}

	function myMove() {
		// if(!isRunning) {	
			var p = $( "#img-page3-2" );
			var position = p.position();
			var left = position.left;
			
			var id = setInterval(frame, 1);
			isRunning = false;
			function frame() {
				if (left == -205) {
					clearInterval(id);
					isRunning = false;
				}
				else {
					left++;
					p.css({left: left});
					// p.position.left = left + 'px';
				}
			}
		// }
	}
	// var $post1  = jQuery("#box-post1");
	// var $post2  = jQuery("#box-post2");
	// var $post3  = jQuery("#box-post3");
	// var $post4  = jQuery("#box-post4");
	// var $post5  = jQuery("#box-post5");

	// var zooming = setInterval(function(){ 
 //    $post1.css("zoom") < 1.2 // If current zoom is under value
 //        ? $post1.animate({"zoom":"+=.025"}, 1) // Increment zoom by .025
 //        : clearInterval(zooming); // Otherwise, stop zooming
	// }, 1); // Run every 1 second



	// setInterval(function(){
	//     $("#box-post1").animate({"zoom":"+=.025"}, 500);
	// }, 1000);

  // $("#flip").click(function(){
  //       $("#main-page1").slideToggle("slow");
  //   });
	    // $(".btn1").click(function(){
	    //     $("#main-page1").slideUp();
	    // });
	    // $(".btn2").click(function(){
	    //     $("p").slideDown();
	    // });
});