$(document).ready(function(){

	/* Links */
	document.getElementById("top-home").onclick = function () {
		location.href = "/Stellar/home?username="+getParameterByName("username")+"&id="+getParameterByName("id");
	};
	document.getElementById("top-notif").onclick = function () {
		var e = document.getElementById("dropdown-notif");
		if(e.style.display == 'block') {
			e.style.display = 'none';
			document.getElementById("top-notif").style.borderBottomRightRadius = "5px";	
			document.getElementById("top-notif").style.borderBottomLeftRadius = "5px";
		}
		else {
			e.style.display = 'block';
			document.getElementById("top-notif").style.borderBottomRightRadius = 0;	
			document.getElementById("top-notif").style.borderBottomLeftRadius = 0;
		}
	}
	document.getElementById("top-logout").onclick = function () {
		location.href = "/Stellar/logout";
	};
	document.getElementById("top-search").onclick = function () {
		location.href = "/Stellar/searchServlet?username="+getParameterByName("username")+"&id="+getParameterByName("id")+"&searchBar="+document.getElementById("searchBar").value;
	};
	document.getElementById("notif-seemore").onclick = function() {
		location.href = "/Stellar/notification?username="+getParameterByName("username")+"&id="+getParameterByName("id");
	}
	document.getElementById("dropdown-content").onload(notif_update());
	
});

function notif_update() {
	//alert($("#last-notifid").val());
	setTimeout(function() { load_info(); }, 3000);
}

function load_info() {
	//alert("Nepu");
    $.ajax({
        url: "/Stellar/GetUpdates", 
        type: 'GET',
        data: {
        	last_id: $("#last-notifid").val(),
        	user_id: getParameterByName("id")
        },
        success: function(data) {        
        	var response = JSON.parse(data);
        	
        	if (response.id != 0) {
        		//This is where we append the new data onto the existing notifications in the dropdown
//        		<div class="dropdown-notiflist">
//					<div class="dropdown-notifProfPic"></div>
//				</div>
        		
        		var update = "<div class='dropdown-notiflist'>" +
        				"<div class='dropdown-notifProfPic'>" + response.profPic + "</div>" +
        				response.notification + "</div>";
            	$("#dropdown-content").html(update + $("#dropdown-content").html());
            	
            	$("#last-notifid").val(response.id);
        	}             	
        }
    });
    
    setTimeout(function(){ load_info(); }, 3000);
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