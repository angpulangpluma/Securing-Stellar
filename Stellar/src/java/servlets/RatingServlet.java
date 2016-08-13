package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RatingServlet
 */
@WebServlet("/rating")
public class RatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RatingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = request.getParameter("userId");
		String username = request.getParameter("username");
		String rating = request.getParameter("topicRating");
		String topicId = request.getParameter("topicId");
		String page = request.getParameter("page");
		String profileId = request.getParameter("profileId");
		
		System.out.println("rating: " + rating);
		System.out.println("topicId: " + topicId);
		
		Connection conn = null;
		Statement stmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stellardb", "root", "");
			
			stmt = conn.createStatement();
			
			String query = "UPDATE topicdata " +
			               "SET rating = "  + rating + 
			               " WHERE topicId = " + topicId + ";";
			stmt.executeUpdate(query);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
//		response.sendRedirect("/Stellar/home");
		if(page.equals("home"))
			response.sendRedirect("/Stellar/home?username="+username+"&id="+userId);
		else if(page.equals("user"))
			response.sendRedirect("/Stellar/user?username="+username+"&id="+userId);
		else if(page.equals("profile"))
			response.sendRedirect("/Stellar/profile?username="+username+"&id="+userId+"&profileId="+profileId);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		Statement stmt = null;
		
		String rating = request.getParameter("topicRating");
		String topicId = request.getParameter("topicId");
		String userId = request.getParameter("userId");
		String username = request.getParameter("username");
		String page = request.getParameter("page");
		
		System.out.println("Rating: " + rating);
		System.out.println("Topic ID: " + topicId);
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stellardb", "root", "#An1m0dlsu");
			
			stmt = conn.createStatement();
			
			String query = "UPDATE topicdata " +
			               "SET rating = "  + rating + 
			               " WHERE topicId = " + topicId + ";";
			
			
			stmt.executeUpdate(query);
			
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		response.sendRedirect("/Stellar/home?username="+username+"&id="+userId);
	}

}
