package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.SuggestedData;

/**
 * Servlet implementation class NotifServlet
 */
@WebServlet("/notification")
public class NotifServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotifServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("id");
		String username = request.getParameter("username");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("id", userId);
		session.setAttribute("username", username);
		String id = request.getParameter("id");
		
		Connection conn = null;
		Statement stmt = null;
		
		String query = "";

	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	    	
	    	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stellardb", "root", "");	
	        stmt = conn.createStatement();
	        
	        query = "SELECT n.*, title, username, profPic FROM notifdata as n, userdata as u, topicdata as t "
	        		+ "WHERE n.viewerId = u.userId"
	        		+ " && isViewed = 0"
	        		+ " && n.topicId = t.topicId"
	        		+ " && n.userId = " + userId;
	        
	        ResultSet rs = stmt.executeQuery(query);
	        
	        ArrayList<String> notifications = new ArrayList<String>();
	        ArrayList<String> profPics = new ArrayList<String>();
	        ArrayList<SuggestedData> suggestionList = new ArrayList<SuggestedData>();
			
	        int last_id = 0; //value of last notification ID
	        
	        while(rs.next()) {
	        	String notification = "";
	        	String link = "<a href='profile?username=" + rs.getString("username") + "&id=" + userId + "&profileId=" + rs.getInt("viewerId") + "'>";
	        	
	        	if(rs.getInt("isRating") == 0) {//not rating
	        		if(rs.getInt("commentId") > 0) {//replied with new comment
	        			notification = link + rs.getString("username") + "</a> commented on <a>" + rs.getString("title") + "</a>.";
	        		}
	        		else {//posted new topic
	        			notification = link + rs.getString("username") + "</a> posted the topic, <a>" + rs.getString("title") + "</a>.";
	        		}
	        	}
	        	else if(rs.getInt("isRating") == 1){//rating
	        		if(rs.getInt("commentId") > 0) {//rated comment
	        			notification = link + rs.getString("username") + "</a> rated your <a>comment</a>.";
	        		}
	        		else {//rated topic
	        			notification = link + rs.getString("username") + "</a> rated <a>" + rs.getString("title") + "</a>.";
	        		}
	        	}
	        	
	        	if(notification != "") {
	        		notifications.add(notification);
	        		last_id = rs.getInt("notifId");
	        		System.out.println("Last ID: " + last_id);
	        		profPics.add(rs.getString("profPic"));
	        	}
	        }
	        
			query = "SELECT * FROM userdata	ORDER BY RAND() LIMIT 5";
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				SuggestedData suggested = new SuggestedData();
				
				suggested.setUserId(rs.getInt("userId"));
				suggested.setUsername(rs.getString("username"));
				suggested.setProfPic(rs.getString("profPic"));
				suggested.setLink("profile?username="+username+"&id="+id+"&profileId="+suggested.getUserId());
				
				suggestionList.add(suggested);
			}
			request.setAttribute("suggestionList", suggestionList);
			 
	        session.setAttribute("notifications", notifications);
	        session.setAttribute("notifId", last_id);
	        session.setAttribute("profPics", profPics);
	        String destination = (String) request.getAttribute("destination");
	       
//	        request.getRequestDispatcher("notifications.jsp").forward(request, response);
	        if(destination != null) {
	        	request.getRequestDispatcher(destination).forward(request, response);
	        }
	        else {
	        	request.getRequestDispatcher("notifications.jsp").forward(request, response);
	        }
	    } catch(Exception e) {
	    	System.out.println(e.getMessage());
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
