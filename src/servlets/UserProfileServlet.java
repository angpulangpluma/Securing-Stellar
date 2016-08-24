package servlets;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.owasp.esapi.ESAPI;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

import entities.SuggestedData;
import entities.TopicData;
import entities.UserData;

/**
 * Servlet implementation class UserProfileServlet
 */
@WebServlet("/user")
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfileServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		Statement stmt = null;
		Statement stmt2 = null;
		UserData user = new UserData();
		UserData follow;
		
		String username = request.getParameter("username");
		String id = request.getParameter("id");
		ArrayList<UserData> userList = new ArrayList<UserData>();
		ArrayList<TopicData> topicList = new ArrayList<TopicData>();
		ArrayList<SuggestedData> suggestionList = new ArrayList<SuggestedData>();
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stellardb", "root", "");
			stmt = conn.createStatement();
			stmt2 = conn.createStatement();
			
			String query = "SELECT * FROM userdata WHERE userId = "+id;
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				user.setUserId(rs.getInt("userId"));
				user.setUsername(rs.getString("username"));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setDescription(rs.getString("description"));
				user.setProfPic(rs.getString("profPic"));
				user.setAverageStars(rs.getFloat("averageStars"));
				
				user.setFollowers(new ArrayList<UserData>());
				user.setFollowing(new ArrayList<UserData>());
				
				userList.add(user);
			}
			
			
			query = "SELECT * FROM userdata WHERE userId IN (SELECT followerId FROM followerdata WHERE userId = "+id+")";
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				follow = new UserData();
				follow.setUserId(rs.getInt("userId"));
				follow.setUsername(rs.getString("username"));
				follow.setFirstName(rs.getString("firstName"));
				follow.setLastName(rs.getString("lastName"));
				follow.setDescription(rs.getString("description"));
				follow.setProfPic(rs.getString("profPic"));
				
				follow.setAverageStars(rs.getFloat("averageStars"));
				userList.get(0).getFollowers().add(follow);
			}	
			
			query = "SELECT * FROM userdata WHERE userId IN (SELECT followingId FROM followingdata WHERE userId = "+id+")";
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				follow = new UserData();
				follow.setUserId(rs.getInt("userId"));
				follow.setUsername(rs.getString("username"));
				follow.setFirstName(rs.getString("firstName"));
				follow.setLastName(rs.getString("lastName"));
				follow.setDescription(rs.getString("description"));
				follow.setProfPic(rs.getString("profPic"));
				
				follow.setAverageStars(rs.getFloat("averageStars"));
				userList.get(0).getFollowing().add(follow);
			}	
//			String topicDataQuery = "SELECT * FROM topicdata WHERE userId = " + id + " ORDER BY topicId DESC";
			String topicDataQuery = "SELECT * FROM topicdata WHERE userId = " + id
					+ " OR userId IN (SELECT followingId FROM followingdata WHERE userId = "+id+") ORDER BY topicId DESC";
			
			rs = stmt.executeQuery(topicDataQuery);
			ResultSet rs2;
			String topicProfPicQuery = "";
			while(rs.next()) {
				TopicData topic = new TopicData();
				topic.setUserId(rs.getInt("userId"));
				topic.setTitle(rs.getString("title"));
				topic.setContent(rs.getString("content"));
				topic.setRating(rs.getFloat("rating"));
				topic.setTopicId(rs.getInt("topicId"));
				
				topicProfPicQuery = "SELECT * from userData WHERE userId = " + topic.getUserId();
				rs2 = stmt2.executeQuery(topicProfPicQuery);
				rs2.next();
				topic.setProfPic(rs2.getString("profPic"));
				topic.setUsername(rs2.getString("username"));
				topic.setLink("profile?username="+username+"&id="+id+"&profileId="+topic.getUserId());
				
				topicList.add(topic);
			}
			
			query = "SELECT * FROM userdata	ORDER BY RAND() LIMIT 5";
//			query = "SELECT * FROM userdata";
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				SuggestedData suggested = new SuggestedData();
				
				suggested.setUserId(rs.getInt("userId"));
				suggested.setUsername(rs.getString("username"));
				suggested.setProfPic(rs.getString("profPic"));
				suggested.setLink("/Stellar/profile?username="+suggested.getUsername()+"&id="+suggested.getUserId());
				
				suggestionList.add(suggested);
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
	
		//TODO: Un-hard code
		request.setAttribute("userId", userList.get(0).getUserId());
		request.setAttribute("username", userList.get(0).getUsername());
		request.setAttribute("firstname", userList.get(0).getFirstName());
		request.setAttribute("lastname", userList.get(0).getLastName());
		request.setAttribute("desc", userList.get(0).getDescription());
		request.setAttribute("profPic", userList.get(0).getProfPic());
		request.setAttribute("averageStars", userList.get(0).getAverageStars());
		
		request.setAttribute("followers", userList.get(0).getFollowers());
		request.setAttribute("following", userList.get(0).getFollowing());
		
		request.setAttribute("userList", userList);
		request.setAttribute("topicList", topicList);
		request.setAttribute("suggestionList", suggestionList);


//		request.getRequestDispatcher("user.jsp").forward(request, response);
		request.setAttribute("destination", "user.jsp");
		request.getRequestDispatcher("/notification").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO: Update userdata @ stellardb
		
		String userId = request.getParameter("edit-userId");
		String username = ESAPI.encoder().encodeForHTML(request.getParameter("edit-username"));
		String firstName = ESAPI.encoder().encodeForHTML(request.getParameter("edit-firstname"));
		String lastName = ESAPI.encoder().encodeForHTML(request.getParameter("edit-lastname"));
		String desc = ESAPI.encoder().encodeForHTML(request.getParameter("edit-desc"));
		
		System.out.println("userId: " + userId);
		
		HttpSession session = request.getSession();
		session.setAttribute("edit-userId", userId);
		session.setAttribute("edit-username", username);
		session.setAttribute("edit-firstname", firstName);
		session.setAttribute("edit-lastname", lastName);
		session.setAttribute("edit-desc", desc);
		
		Connection conn = null;
		Statement stmt = null;
		
		//preparedstatement
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stellardb", "root", "");
			
			String query = "UPDATE userdata " +
		               "SET username = ?, firstName = ?, lastName = ?, description = ? " +
				       " WHERE userId = ?;";
			
			PreparedStatement ps = conn.prepareStatement(query);
			
			ps.setString(1, username);
			ps.setString(2, firstName);
			ps.setString(3, lastName);
			ps.setString(4, desc);
			ps.setString(5, userId);
			ps.executeUpdate();
		
//			session.setAttribute("id", session.getAttribute("id"));
			session.setAttribute("username", username);

			System.out.println("query: " + query);
			
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		response.setHeader("Refresh", "0; URL=user");
		response.sendRedirect("/Stellar/user?username="+request.getParameter("edit-username")+"&id="+session.getAttribute("id"));
	}

}