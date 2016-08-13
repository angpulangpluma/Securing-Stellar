<%@ page import="java.util.*" %>
<%@ page import="entities.*" %>
<%@ page import="servlets.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Stellar</title>
	<script src="jquery-3.0.0.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="post.css">
	<link rel="stylesheet" type="text/css" href="profile.css">
	<link rel="stylesheet" type="text/css" href="post_featured.css">
	
	<!-- Topbar -->
	<link rel="stylesheet" type="text/css" href="topbar.css">
	<script src="topbar.js"></script>
	<script src="content.js"></script>
	
	<!-- Posts -->
	<!--<link rel="stylesheet" type="text/css" href="post-profile.css">-->
	<link rel="stylesheet" type="text/css" href="rating.css">
	<script src="post.js"></script>
	<script src="post_overlay.js"></script>
	<script src="profile.js"></script>
	<script src="rating.js"></script>
	<!--<link rel="stylesheet" type="text/css" href="palette.css">-->
	
	<script type="text/javascript">
		function update() {
			//setInterval(function(){ loadInfo(); }, 3000);
			setTimeout(function(){ loadInfo(); }, 3000);
		}

		function loadInfo() {
    	    $.ajax({
        	    url: "/Stellar/gettopicupdates", 
            	type: 'GET',     
           	 data: {
             	last_id: $("#last-id").html()
             },
            	success: function(data) {        
            		var response = JSON.parse(data);
            	
            		if (response.id != 0) {
            			var new_message = "<div class='box-post>'" +
            							  "<div class='box-postTitle'>" + topicList.get(t).getTitle() + "</div>" +
        								  "<div class='box-postText'>" + topicList.get(t).getContent() + "</div>" +
        				                  "<div class='box-postProfPic'></div>" + 
        								  "<div class='rating'>" +
        									"<span class='rate1'>&#9734</span>" +
        									"<span class='rate2'>&#9734</span>" +
        							    	"<span class='rate3'>&#9734</span>" +
        							    	"<span class='rate4'>&#9734</span>" +
        							    	"<span class='rate5'>&#9734</span>" +
        				            	  "</div>" +
        				            	  "</div>";
                		$("#box-postContainer").html(new_message + $("#box-postContainer").html());
                	
                		$("#last-id").html(response.id);
            		}             	
            	}
        	});
        
        	setTimeout(function(){ loadInfo(); }, 3000);
    	}
		
	</script>
</head>
<body onload="updateTitle()">
	<%
		ArrayList<UserData> userList = (ArrayList<UserData>)request.getAttribute("userList");
		ArrayList<SuggestedData> suggested = (ArrayList<SuggestedData>)request.getAttribute("suggestionList");
	
		boolean found = false;
		int i = 0;
		String username = "/";
		String firstName = "/";
		String lastName = "/";
		String profPic = "/";
		String description = "/";
		float averageStars = 0;
		ArrayList<UserData> followers = new ArrayList<UserData>();
		ArrayList<UserData> following = new ArrayList<UserData>();
		
		
		String attrUserId = request.getParameter("profileId");
		
		while(!found && i < userList.size()) {
		    if(String.valueOf(userList.get(i).getUserId()).equals(attrUserId)) {
				found = true;
				
				username = userList.get(i).getUsername();
				firstName = userList.get(i).getFirstName();
			    lastName = userList.get(i).getLastName();
			    description = userList.get(i).getDescription();
			    profPic = userList.get(i).getProfPic();
			    averageStars = userList.get(i).getAverageStars();
			    followers = userList.get(i).getFollowers();
			    following = userList.get(i).getFollowing();
		    }
			else
				i++;
		}
	%>
	<!-- topBar START -->
	<div id="dropdown-notif" display="none">
		<a><button id="notif-seemore">See More</button></a>
		<input id="last-notifid" type="hidden" name="last-notifid" value="<% out.print(request.getSession().getAttribute("notifId")); %>" />
		<div id="dropdown-content">
			<%
			System.out.println(request.getSession().getAttribute("notifId"));
			ArrayList<String> updates = (ArrayList<String>)request.getSession().getAttribute("notifications");
			ArrayList<String> profPics = (ArrayList<String>) request.getSession().getAttribute("profPics");
			
			for(int j = updates.size()-1; j >= 0; j--) {
				out.print("<div class='dropdown-notiflist'>");
				out.print("<div class='dropdown-notifProfPic'><img src='" + profPics.get(j) + "'></div>");
				out.print(updates.get(j));
				out.print("</div>");
			}
			%>
		</div>
	</div>
	
	<div id="topBar">
		<div id="search">
			<input id="searchBar" type="text" placeholder="Search" required />
			<a><button id="top-search"></button></a>
		</div>
		<button id="top-home"></button>
		<button id="top-notif"></button>
		<button id="top-logout"></button>
	</div>
	<!-- topBar END -->
	
	<div id="box-profPic">		
		<div id="box-profPic1"></div>
		<div id="box-profPic2">
			<div id="box-profPicture">	
				<img id="picture" src="<% out.println(profPic); %>"><!-- Image -->
			</div>
		</div>
	</div>

	<div id="box-username"><% out.println(username); %></div>
	<div id="box-fullname"><% out.println(firstName + " " + lastName); %></div>
	
	<%
		String id = request.getParameter("id");
		String fragment = "";
		for(int j = 0; j < followers.size(); j++) {
			if(String.valueOf(followers.get(j).getUserId()).equals(id)) {
				fragment = "<a href='unfollow?username="+request.getParameter("username")+"&id="+request.getParameter("id")+"&profileId="+request.getParameter("profileId")+"'><button class='button-following'>Unfollow</button></a>";
			}
		}
		if(fragment.equals("")) {
			fragment = "<a href='follow?username="+request.getParameter("username")+"&id="+request.getParameter("id")+"&profileId="+request.getParameter("profileId")+"'><button class='button-follow'>Follow</button></a>";
		}
		out.println(fragment);
	%>
	
	<!-- 
	<a href='<% out.println("follow?username="+request.getParameter("username")+"&id="+request.getParameter("id")+"&profileId="+request.getParameter("profileId")); %>'><button class="button-follow">Follow</button></a>		
	<a href="/Stellar/follow"><button class="button-follow">Follow</button></a>
	-->
	<div id="progressBar">
		<progress id="fame" class="progressStyle" value=<% out.println(averageStars);%> max="25">
			<div class="-webkit-progress-value">
				<div class="-webkit-progress-value">
				</div>
			</div>
		</progress>
	</div>
	
	<!-- Description START -->
	<div id="desc-box"><% out.println(description); %></div>
	<!-- Description END -->
	
	<!-- Followers/Following Overlay START -->
	<div id="all-followers">
		<div id="overlay-followers">
			<div id="overlay-followers-text">
				<label>Followers</label>
				<button id="overlay-followers-close">X</button>
				<!--</div>-->
			</div>
			<div id="overlay-inner-followers">
				<%
				fragment = "";
				for(int j = 0; j < followers.size(); j++) {
					fragment += "<div class='box-overlay-inner-followers'><a href='profile?username="+request.getParameter("username")+"&id="+request.getParameter("id")+"&profileId="+followers.get(j).getUserId()+"'><img src='"+followers.get(j).getProfPic()+"'><label>"+followers.get(j).getUsername()+"</label></a></div>";
					
				}
				out.println(fragment);
				%>
			</div>
		</div>
	</div>

	<div id="all-following">
		<div id="overlay-following">
			<div id="overlay-following-text">
				<label>Following</label>
				<button id="overlay-following-close">X</button>
				<!--</div>-->
			</div>
			<div id="overlay-inner-following">
			<%
				fragment = "";
				for(int j = 0; j < following.size(); j++) {
					fragment += "<div class='box-overlay-inner-following'><a href='profile?username="+request.getParameter("username")+"&id="+request.getParameter("id")+"&profileId="+following.get(j).getUserId()+"'><img src='"+following.get(j).getProfPic()+"'><label>"+following.get(j).getUsername()+"</label></a></div>";
					
				}
				out.println(fragment);
			%>
			</div>
		</div>
	</div>	
	<!-- Followers/Following Overlay END -->
	
	<!-- Followers/Following START -->
	<div id="box-followers">	
		<div id="text-followers"><label>Followers</label></div>
		<div id="box-followerSuggestions">
			<!-- TODO add link -->
			<%
				fragment = "";
				int j = 0;
				
				while(j < 5 && j < followers.size()) {
					fragment += "<div class='box-follower' id='box-follower"+(j+1)+"'><img src='"+followers.get(j).getProfPic()+"'></div>";
					j++;
				}
				out.println(fragment);
			%>
		</div>
		<div id="more-followers"><button>More</button></div>
	</div>
	<div id="box-following">
		<div id="text-following"><label>Following</label></div>
		<div id="box-followingSuggestions">
			<%
				fragment = "";
				j = 0;
			
				while(j < 5 && j < following.size()) {
					fragment += "<div class='box-following' id='box-following"+(j+1)+"'><img src='"+following.get(j).getProfPic()+"'></div>";
					j++;
				}
				out.println(fragment);
			%>
			
		</div>
		<div id="more-following"><button>More</button></div>
	</div>
	
	<div id="box-postContainer">
		<%
		ArrayList<TopicData> topicList = (ArrayList<TopicData>)request.getAttribute("topicList");
		for(int t = 0; t < topicList.size(); t++) {
			out.println("<div class='box-post'>");
			out.println("<div class='box-postTitle'>" + topicList.get(t).getTitle() + "</div>");
			out.println("<div class='box-postText'>" + topicList.get(t).getContent() + "</div>");
			out.println("<a href='"+topicList.get(t).getLink()+"'><div class='box-postProfPic'><div class='box-postLabel'>"+topicList.get(t).getUsername()+"</div><img src='"+topicList.get(t).getProfPic()+"'></div></a>");
			out.println("<div class='rating'>" +
			    			"<a href='rating?page=profile&userId=" + request.getAttribute("userId") + "&username=" + request.getAttribute("username") + "&topicRating=5&topicId=" + topicList.get(t).getTopicId() + "&profileId=" + request.getParameter("profileId")+"'><span class='rate1' id = 'rate1_" + t + "' onclick='rateTopic1(" + t + ")'>&#9734</span></a>" +
							"<a href='rating?page=profile&userId=" + request.getAttribute("userId") + "&username=" + request.getAttribute("username") + "&topicRating=4&topicId=" + topicList.get(t).getTopicId() + "&profileId=" + request.getParameter("profileId")+"'><span class='rate2' id = 'rate2_" + t + "' onclick='rateTopic2(" + t + ")'>&#9734</span></a>" +
							"<a href='rating?page=profile&userId=" + request.getAttribute("userId") + "&username=" + request.getAttribute("username") + "&topicRating=3&topicId=" + topicList.get(t).getTopicId() + "&profileId=" + request.getParameter("profileId")+"'><span class='rate3' id = 'rate3_" + t + "' onclick='rateTopic3(" + t + ")'>&#9734</span></a>" +
							"<a href='rating?page=profile&userId=" + request.getAttribute("userId") + "&username=" + request.getAttribute("username") + "&topicRating=2&topicId=" + topicList.get(t).getTopicId() + "&profileId=" + request.getParameter("profileId")+"'><span class='rate4' id = 'rate4_" + t + "' onclick='rateTopic4(" + t + ")'>&#9734</span></a>" +
							"<a href='rating?page=profile&userId=" + request.getAttribute("userId") + "&username=" + request.getAttribute("username") + "&topicRating=1&topicId=" + topicList.get(t).getTopicId() + "&profileId=" + request.getParameter("profileId")+"'><span class='rate5' id = 'rate5_" + t + "' onclick='rateTopic5(" + t + ")'>&#9734</span></a>" +
			            "</div>");
			out.println("<script>prefill_stars(" + topicList.get(t).getRating() + ", " + t + ")</script>");
			out.println("</div>");
		}
		%>
	</div>
	<!-- Center Posts END -->
	
	<!-- Post Overlay START -->
	<div id="post-overlay">
		<div id="post-transcluscentBox">
			<button id="overlay-x">X</button>
			
			<div id="post-featured">
				<div id="post-featured-content">
					<div id="post-postProfPic"></div>
					<div class="rating">
						<span class="rate1">&#9734;</span><span class="rate2">&#9734;</span><span class="rate3">&#9734;</span><span class="rate4">&#9734;</span><span class="rate5">&#9734;</span>
					</div>
				</div>
			</div>
			
			<div id="post-reply">
				<textarea maxlength="200" placeholder="Reply..."></textarea>
				<button>Reply</button>
			</div>
			
			<div id="post-comments">
				<div class="reply-entry">
				<div class="reply-profPic"></div>
				<div class="rating">
					<span class="rate1">&#9734;</span><span class="rate2">&#9734;</span><span class="rate3">&#9734;</span><span class="rate4">&#9734;</span><span class="rate5">&#9734;</span>
				</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Post Overlay END -->

	<!-- Rankings START -->
	<div id="box-ranking">
		<h1>RANKING</h1>

		<div id="box-ranking1">
			<div class="ranking-post">
				<div class="ranking-postProfPic"></div>
				<!-- TODO Add Rating -->
			</div>
		</div>

		<div id="box-ranking2">
			<div class="ranking-post">
				<div class="ranking-postProfPic"></div>
				<div class="rating">
					<!-- TODO Add Rating -->
				</div>
			</div>
		</div>

		<div id="box-ranking3">
			<div class="ranking-post">
				<div class="ranking-postProfPic"></div>
				<div class="rating">
					<!-- TODO Add Rating -->
				</div>
			</div>
		</div>

		<div id="box-ranking4">
			<div class="ranking-post">
				<div class="ranking-postProfPic"></div>
				<div class="rating">
					<!-- TODO Add Rating -->
				</div>
			</div>
		</div>
	</div>
	<!-- Rankings END -->

	<!-- Suggested Users START -->
	<div id="box-suggested">
		<div id="text-suggestions"><label>Stargaze</label></div>
		<div id="box-suggestions">
		<%			
			fragment = "";
			j = 0;
			int size = suggested.size();
			while(j < 5 && j < size) {
				fragment += "<a href='"+suggested.get(j).getLink()+"'><div class='suggested' id='box-suggested"+(j+1)+"'><img src='"+suggested.get(j).getProfPic()+"'></div></a>";
				j++;
			}
			out.println(fragment);
		%>
	
		</div>
		<div id="box-suggestions-name">
		<%
			fragment = "";
			j = 0;
			size = suggested.size();
			while(j < 5 && j < size) {
				
				fragment += "<label id='star"+(j+1)+"'>"+suggested.get(j).getUsername()+"</label>";
				j++;
			}
			out.println(fragment);
		%>
		</div>
	</div>
	<!-- Suggested Users END -->
</body>
</html>