package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetUpdates
 */
@WebServlet("/GetUpdates")
public class GetUpdates extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUpdates() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");
	    
	    String lastId = request.getParameter("last_id");
	    String userId = request.getParameter("user_id");
	    String username = request.getParameter("username");
		
	    System.out.println("NEPGYA went in!!!" + userId);
	    
	    Connection conn = null;		
		Statement stmt = null;
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	        
	    	// db: webapde, username: root, password: blank
	    	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stellardb", "root", "");
	
	        stmt = conn.createStatement();
	        
	        System.out.println("NEPGYA tried!!!" + lastId);
	        
	        // select user based on given id
	        String query = "SELECT n.*, title, username, profPic FROM notifdata as n, userdata as u, topicdata as t "
	        		+ "WHERE n.viewerId = u.userId"
	        		+ " && n.notifId > " + lastId
	        		+ " && isViewed = 0"
	        		+ " && n.topicId = t.topicId"
	        		+ " && n.userId = " + userId;
	        ResultSet rs = stmt.executeQuery(query);
	        
	        if (rs.next()) {
	        	System.out.println("NEPGYA queried!!!");
	        	int id = rs.getInt("n.notifId");
	        	String profPic = "<img src='"+rs.getString("profPic")+"'>";
	        	
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
	        	
	        	response.getWriter().write("{\"id\": \"" + id + "\", \"notification\": \"" + notification + "\", \"profPic\": \"" + profPic + "\"}");
	        	System.out.println("NEPGYA WROTE!!!");
	        } else {
	        	response.getWriter().write("{\"id\": \"0\"");
	        }
	    } catch(Exception e) {
	    	response.getWriter().write("{\"id\": \"0\"");
	    	System.out.println(e.getMessage());
	    } finally {
	    	try {
		    	if (conn != null)
		    		conn.close();
	    	} catch(SQLException se) {}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
