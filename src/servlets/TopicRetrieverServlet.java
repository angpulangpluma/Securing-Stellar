package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TopicRetrieverServlet
 */
@WebServlet("/gettopicupdates")
public class TopicRetrieverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TopicRetrieverServlet() {
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
		Connection conn = null;
		Statement stmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stellardb", "root", "");
			
			stmt = conn.createStatement();
			
			String query = "SELECT * from topicdata where topicId > " + lastId;
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				int id = rs.getInt("topicId");
				String title = rs.getString("title");
				String content = rs.getString("content");
				float rating = rs.getFloat("rating");
				
				response.getWriter().write("{\"id\": \"" + id + "\", \"message\": \"" + title + "\"}");
			}
			else {
				response.getWriter().write("{\"id\": \"0\"");
			}
		}
		catch(Exception e) {
			response.getWriter().write("{\"id\": \"0\"");
			System.out.println(e.getMessage());
		}
		finally {
			try {
				if(conn != null)
					conn.close();
			}
			catch(SQLException se) {
			}
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
