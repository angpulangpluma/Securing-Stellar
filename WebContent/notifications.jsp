<%@ page import="java.util.*" %>
<%@ page import="servlets.*" %>
<%@ page import="entities.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>STELLAR | Notifications</title>
	<script src="jquery-3.0.0.min.js"></script>

	<link rel="stylesheet" type="text/css" href="notifications.css">

	<!-- Topbar -->
	<link rel="stylesheet" type="text/css" href="topbar.css">
	<script src="topbar.js"></script>
	<script src="content.js"></script>

	<script src="post_overlay.js"></script>
	<script src="notifications.js"></script>
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
	<label id="box-notificationList-label">Notifications</label>
	<div id="box-notificationList">
		<%
		ArrayList<String> notifications = (ArrayList<String>) request.getSession().getAttribute("notifications");
		profPics = (ArrayList<String>) request.getSession().getAttribute("profPics");
		
		for(int i = notifications.size()-1; i >= 0; i--) {
			out.print("<div class='notif-post'>");
			out.print("<div class='notif-postProfPic'><img src='" + profPics.get(i) + "'></div>");
			out.print(notifications.get(i));
			out.print("</div>");
		}
		%>
	</div>
	
	<div id="box-ad1"></div>
	<div id="box-ad2"></div>

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