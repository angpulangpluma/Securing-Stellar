$(document).ready(function(){
	$("button").click(function() {
		var myId = $(this).attr("id");
		if(myId == "search-filter1")  {
			var e1 = document.getElementById("box-searchResults1");
			var e2 = document.getElementById("box-searchResults2");
			var e3 = document.getElementById("box-searchResults3");
			var e4 = document.getElementById("box-searchResults4");
			
			e1.style.display = 'block';
			e2.style.display = 'none';
			e3.style.display = 'none';
			e4.style.display = 'none';
		}
		
		if(myId == "search-filter2")  {
			var e1 = document.getElementById("box-searchResults1");
			var e2 = document.getElementById("box-searchResults2");
			var e3 = document.getElementById("box-searchResults3");
			var e4 = document.getElementById("box-searchResults4");
			
			e1.style.display = 'none';
			e2.style.display = 'block';
			e3.style.display = 'none';
			e4.style.display = 'none';
		}
		
		if(myId == "search-filter3")  {
			var e1 = document.getElementById("box-searchResults1");
			var e2 = document.getElementById("box-searchResults2");
			var e3 = document.getElementById("box-searchResults3");
			var e4 = document.getElementById("box-searchResults4");
			
			e1.style.display = 'none';
			e2.style.display = 'none';
			e3.style.display = 'block';
			e4.style.display = 'none';
		}
		
		if(myId == "search-filter4")  {
			var e1 = document.getElementById("box-searchResults1");
			var e2 = document.getElementById("box-searchResults2");
			var e3 = document.getElementById("box-searchResults3");
			var e4 = document.getElementById("box-searchResults4");
			
			e1.style.display = 'none';
			e2.style.display = 'none';
			e3.style.display = 'none';
			e4.style.display = 'block';
		}
	});
	
	/* document.getElementById("search-filter1").onclick = function {
		var e1 = document.getElementById("box-searchResults1");
		var e2 = document.getElementById("box-searchResults2");
		var e3 = document.getElementById("box-searchResults3");
		var e4 = document.getElementById("box-searchResults4");
		
		e1.style.display = 'block';
		e2.style.display = 'none';
		e3.style.display = 'none';
		e4.style.display = 'none';
	}
	
	document.getElementById("search-filter2").onclick = function {
		var e1 = document.getElementById("box-searchResults1");
		var e2 = document.getElementById("box-searchResults2");
		var e3 = document.getElementById("box-searchResults3");
		var e4 = document.getElementById("box-searchResults4");
		
		e1.style.display = 'none';
		e2.style.display = 'block';
		e3.style.display = 'none';
		e4.style.display = 'none';
	}
	
	document.getElementById("search-filter3").onclick = function {
		var e1 = document.getElementById("box-searchResults1");
		var e2 = document.getElementById("box-searchResults2");
		var e3 = document.getElementById("box-searchResults3");
		var e4 = document.getElementById("box-searchResults4");
		
		e1.style.display = 'none';
		e2.style.display = 'none';
		e3.style.display = 'block';
		e4.style.display = 'none';
	}
	
	document.getElementById("search-filter4").onclick = function {
		var e1 = document.getElementById("box-searchResults1");
		var e2 = document.getElementById("box-searchResults2");
		var e3 = document.getElementById("box-searchResults3");
		var e4 = document.getElementById("box-searchResults4");
		
		e1.style.display = 'none';
		e2.style.display = 'none';
		e3.style.display = 'none';
		e4.style.display = 'block';
	} */
});