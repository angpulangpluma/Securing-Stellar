package servlets;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.owasp.esapi.ESAPI;

/**
 * Servlet implementation class PostTopicHome
 */
@WebServlet("/posttopichome")
public class PostTopicHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostTopicHomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.sendRedirect("http://localhost:8080/Stellar/home");
		response.sendRedirect("/Stellar/home");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		Statement stmt = null;
		
		String title = ESAPI.encoder().encodeForHTML(request.getParameter("postTitle"));
		String content = ESAPI.encoder().encodeForHTML(request.getParameter("userpost"));
		String userId = request.getParameter("id");
		String username = request.getParameter("username");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stellardb", "root", "");
			
			stmt = conn.createStatement();
			
			String query = "INSERT INTO topicdata (title, content, userId) VALUES (?, ?, ?);";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, userId);
			ps.executeUpdate();
			
			//Get Latest Topic
			String getTopic = "SELECT MAX(topicId) FROM topicdata WHERE userId = " + userId;
			ResultSet rs = stmt.executeQuery(getTopic);
			int latestTopic = 0;
			
			if(rs.next()) {
				latestTopic = rs.getInt(1);
			}
			
			//Get Followers
			ArrayList<Integer> followers = new ArrayList<Integer>();
			String getFollowers = "SELECT u.* FROM userdata as u, followerdata as f WHERE"
					+ " f.userId = " + userId
					+ " && f.followerId = u.userId";
			rs = stmt.executeQuery(getFollowers);
			
			//Add followerId to followers
			while(rs.next()) {
				followers.add(rs.getInt("userId"));
			}
			
			String updateQuery;
			
			//Insert into notifdata for each follower
			for(int i = 0; i < followers.size(); i++) {
				updateQuery = "INSERT INTO notifdata (userId, viewerId, topicId, commentId, isRating) VALUES ("
						+ followers.get(i) + ", "
						+ userId + ", "
						+ latestTopic + ", 0, 0)";
				stmt.executeUpdate(updateQuery);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("/Stellar/home?username="+username+"&id="+userId);
	}

}
