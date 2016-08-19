<%@ page import="java.util.*" %>
<%@ page import="servlets.*" %>
<%@ page import="entities.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>STELLAR | Search</title>
	<script src="jquery-3.0.0.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="search.css">
	
	<!-- Topbar -->
	<link rel="stylesheet" type="text/css" href="topbar.css">
	<script src="topbar.js"></script>
	<script src="content.js"></script>

	<script src="search_buttonFilter.js"></script>
	<script src="search.js"></script>
</head>
<body>
	<% ArrayList<SuggestedData> suggested = (ArrayList<SuggestedData>)request.getAttribute("suggestionList"); %>
	<!-- Topbar START -->
	<div id="dropdown-notif" display="none">
		<a><button id="notif-seemore">See More</button></a>
		<input id="last-notifid" type="hidden" name="last-notifid" value="<% out.print(request.getSession().getAttribute("notifId")); %>" />
		<div id="dropdown-content">
			<%
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
	<!-- Topbar END -->


	<div id="box-ad1"></div>
	<div id="box-ad2"></div>

	<div id="box-filterSearch"> <!-- make sure to put this on the side of the div -->
		<button id="search-filter1"></button>
		<button id="search-filter2"></button>
		<button id="search-filter3"></button>
		<button id="search-filter4"></button>
	</div>
	
	<div id="box-searchResults1"><!-- Users -->
		<label class="box-searchResults-label" id="result1">Users</label>
		<div class="box-searchResults">
		<%
		ArrayList<UserData> users = (ArrayList<UserData>)request.getSession().getAttribute("users");
		for(int i = 0; i < users.size(); i++) {
			out.print("<div class='box-user'>"
					+ "<div class='box-userLabel'>" + users.get(i).getFirstName() + " " + users.get(i).getLastName() + "</div>"
					+ "<a href='profile?username="+request.getParameter("username")+"&id="+request.getParameter("id")+"&profileId="+users.get(i).getUserId()+"'><div class='box-userPicture'>"
					+ "<img src='" + users.get(i).getProfPic() + "'></div></a>"					
					+ "<div class='box-userDesc'>"+ users.get(i).getDescription() + "</div></div>");
		}
		%>
		</div>
			<!-- div class='box-userDesc'>"+ users.get(i).getDescription() + "</div -->
	</div>
	
	<div id="box-searchResults2"><!-- Topics -->
		<label class="box-searchResults-label" id="result2">Topics</label>
		<div class="box-searchResults">
		<%
		ArrayList<TopicData> topics = (ArrayList<TopicData>)request.getSession().getAttribute("topics");
		ArrayList<UserData> topicUsers = (ArrayList<UserData>) request.getSession().getAttribute("topicUsers");
		
		for(int i = 0; i < topics.size(); i++) {
			out.print("<div class='box-post'><a style='text-decoration: none;' href='"+ topics.get(i).getLink()+"'><div class='box-postProfPic' style='background-image: url(\""+topics.get(i).getProfPic()+"\"); background-size: contain; background-repeat: no-repeat;'><div class='box-postLabel'>"+topics.get(i).getUsername()+"</div></div></a>"
					+ "<div class='box-postTitle'>" + topics.get(i).getTitle() + "</div><hr><div class='box-postContent'>"
					+ topics.get(i).getContent() +
					"</div></div>");
		}
		%>
		</div>
	</div>
	
	<div id="box-searchResults3"><!-- Followers -->
		<label class="box-searchResults-label" id="result3">Followers</label>
		<div class="box-searchResults">
		<%
		ArrayList<UserData> followers = (ArrayList<UserData>)request.getSession().getAttribute("followers");
		
		for(int i = 0; i < followers.size(); i++) {
			out.print("<div class='box-user'>"
					+ "<div class='box-userLabel'>" + followers.get(i).getFirstName() + " " + followers.get(i).getLastName() + "</div>"
					+ "<a href='profile?username="+request.getParameter("username")+"&id="+request.getParameter("id")+"&profileId="+users.get(i).getUserId()+"'><div class='box-userPicture'>"
					+ "<img src='" + followers.get(i).getProfPic() + "'></div></a>"					
					+ "<div class='box-userDesc'>"+ followers.get(i).getDescription() + "</div></div>");
		}			
		%>
		</div>
	</div>
	
	<div id="box-searchResults4"><!-- Following -->
		<label class="box-searchResults-label" id="result4">Following</label>
		<div class="box-searchResults">
		<%
		ArrayList<UserData> following = (ArrayList<UserData>)request.getSession().getAttribute("following");
		
		for(int i = 0; i < following.size(); i++) {
			out.print("<div class='box-user'>"
					+ "<div class='box-userLabel'>" + following.get(i).getFirstName() + " " + following.get(i).getLastName() + "</div>"
					+ "<a href='profile?username="+request.getParameter("username")+"&id="+request.getParameter("id")+"&profileId="+users.get(i).getUserId()+"'><div class='box-userPicture'>"
					+ "<img src='" + following.get(i).getProfPic() + "'></div></a>"					
					+ "<div class='box-userDesc'>"+ following.get(i).getDescription() + "</div></div>");
		}	
		%>
		</div>
	</div>

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
			String fragment = "";
			int j = 0;
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