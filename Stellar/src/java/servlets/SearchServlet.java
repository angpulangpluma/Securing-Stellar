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
import entities.TopicData;
import entities.UserData;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/searchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username = request.getParameter("username");
		String userId = request.getParameter("id");
		String searchResult = request.getParameter("searchBar");

		searchResult = searchResult.toLowerCase();		
		HttpSession session = request.getSession();
		
		session.setAttribute("userId", userId);
		session.setAttribute("searchResult", searchResult);
		
		Connection conn = null;
		Statement stmt = null;

	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	    	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stellardb", "root", "");	
	        stmt = conn.createStatement();
	        String userQuery = "SELECT * FROM userdata WHERE LCASE(username) = '" + searchResult + "'"
	        		+ "|| email = '%" + searchResult + "%'"
	        		+ "|| LCASE(firstName) = '" + searchResult + "'"
	        		+ "|| LCASE(lastName) = '" + searchResult + "'"
	        		+ "|| description LIKE '%" + searchResult + "%'";
	        String topicQuery = "SELECT * FROM userdata as u, topicdata as t WHERE (LCASE(title) = '" + searchResult + "'"
	        		+ "|| content LIKE '%" + searchResult + "%')"
	        		+ "&& t.userId = u.userId";
	        String followerQuery = "SELECT f.followerId, u.* FROM followerdata as f, userdata as u"
	        		+ " WHERE f.userId = " + userId
	        		+ "&& f.followerId = u.userId"
	        		+ "&& (LCASE(u.username) = '" + searchResult + "'"
	        		+ "|| LCASE(u.firstName) = '" + searchResult + "'"
	        		+ "|| LCASE(u.lastName) = '" + searchResult + "'"
	        		+ "|| u.description LIKE '%" + searchResult + "%'"
	        		+ "|| u.email LIKE '%" + searchResult + "%')";
	        String followingQuery = "SELECT f.followingId, u.* FROM followingdata as f, userdata as u"
	        		+ " WHERE f.userId = " + userId
	        		+ "&& f.followingId = u.userId"
	        		+ "&& (LCASE(u.username) = '" + searchResult + "'"
	        		+ "|| LCASE(u.firstName) = '" + searchResult + "'"
	        		+ "|| LCASE(u.lastName) = '" + searchResult + "'"
	        		+ "|| u.description LIKE '%" + searchResult + "%'"
	        		+ "|| u.email LIKE '%" + searchResult + "%')";
	        
	        ArrayList<UserData> users = new ArrayList<UserData>();
	        ArrayList<TopicData> topics = new ArrayList<TopicData>();
	        ArrayList<UserData> topicUsers = new ArrayList<UserData>();
	        ArrayList<UserData> followers = new ArrayList<UserData>();
	        ArrayList<UserData> following = new ArrayList<UserData>();
	        
	        ResultSet rs = stmt.executeQuery(userQuery);
	        while(rs.next()) {
	        	UserData user = new UserData();
	        	
	        	user.setUserId(rs.getInt("userId"));
	        	user.setUsername(rs.getString("username"));
	        	user.setPassword(rs.getString("password"));
	        	user.setEmail(rs.getString("email"));
	        	user.setFirstName(rs.getString("firstName"));
	        	user.setLastName(rs.getString("lastName"));
	        	user.setDescription(rs.getString("description"));
	        	user.setProfPic(rs.getString("profPic"));
	        	user.setAverageStars(rs.getFloat("averageStars"));
	        	
	        	users.add(user);
	        }
	        
	        rs = stmt.executeQuery(topicQuery);
	        while(rs.next()) {
	        	TopicData topic = new TopicData();
	        	UserData user = new UserData();
	        	
	        	user.setUserId(rs.getInt(1));
	        	user.setUsername(rs.getString("username"));
	        	user.setPassword(rs.getString("password"));
	        	user.setEmail(rs.getString("email"));
	        	user.setFirstName(rs.getString("firstName"));
	        	user.setLastName(rs.getString("lastName"));
	        	user.setDescription(rs.getString("description"));
	        	user.setProfPic(rs.getString("profPic"));
	        	user.setAverageStars(rs.getFloat("averageStars"));
	        	
	        	topic.setTopicId(rs.getInt("topicId"));
	        	topic.setTitle(rs.getString("title"));
	        	topic.setContent(rs.getString("content"));
	        	topic.setRating(rs.getInt("rating"));
	        	topic.setUserId(rs.getInt("userId"));
	        	topic.setUsername(rs.getString("username"));
	        	topic.setProfPic(rs.getString("profPic"));
	        	topic.setLink("profile?username="+username+"&id="+userId+"&profileId="+topic.getUserId());
				
	        	topicUsers.add(user);	        	
	        	topics.add(topic);
	        }
	        
	        rs = stmt.executeQuery(followerQuery);
	        while(rs.next()) {
	        	UserData follower = new UserData();
	        	
	        	follower.setUserId(rs.getInt("userId"));
	        	follower.setUsername(rs.getString("username"));
	        	follower.setPassword(rs.getString("password"));
	        	follower.setEmail(rs.getString("email"));
	        	follower.setFirstName(rs.getString("firstName"));
	        	follower.setLastName(rs.getString("lastName"));
	        	follower.setDescription(rs.getString("description"));
	        	follower.setProfPic(rs.getString("profPic"));
	        	follower.setAverageStars(rs.getFloat("averageStars"));
	        	
	        	followers.add(follower);
	        }
	        
	        rs = stmt.executeQuery(followingQuery);
	        while(rs.next()) {
	        	UserData follow = new UserData();	        	
	        	follow.setUserId(rs.getInt("userId"));
	        	follow.setUsername(rs.getString("username"));
	        	follow.setPassword(rs.getString("password"));
	        	follow.setEmail(rs.getString("email"));
	        	follow.setFirstName(rs.getString("firstName"));
	        	follow.setLastName(rs.getString("lastName"));
	        	follow.setDescription(rs.getString("description"));
	        	follow.setProfPic(rs.getString("profPic"));
	        	follow.setAverageStars(rs.getFloat("averageStars"));
	        	
	        	following.add(follow);
	        }
	        
	        ArrayList<SuggestedData> suggestionList = new ArrayList<SuggestedData>();			
	        while(rs.next()) {
				SuggestedData suggested = new SuggestedData();
				
				suggested.setUserId(rs.getInt("userId"));
				suggested.setUsername(rs.getString("username"));
				suggested.setProfPic(rs.getString("profPic"));
				suggested.setLink("/Stellar/profile?username="+suggested.getUsername()+"&id="+suggested.getUserId());
				
				suggestionList.add(suggested);
			}	        
	        session.setAttribute("users", users);
	        session.setAttribute("topics", topics);
	        session.setAttribute("topicUsers", topicUsers);
	        session.setAttribute("followers", followers);
	        session.setAttribute("following", following);	        
	        request.setAttribute("suggestionList", suggestionList);	        

//	        request.getRequestDispatcher("search.jsp").forward(request, response);
			request.setAttribute("destination", "search.jsp");
			request.getRequestDispatcher("/notification").forward(request, response);
	    } catch(Exception e) {
	    	System.out.println(e.getMessage());
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
