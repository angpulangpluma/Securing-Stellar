package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if (session.getAttribute("username") != null &&
			    request.getParameter("username") != null &&				
			    request.getParameter("username").equals(session.getAttribute("username"))) {
			request.getRequestDispatcher("home.jsp").forward(request, response);
		} else {
			session.invalidate();			
			request.getRequestDispatcher("main.jsp").forward(request, response);	
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Connection conn = null;
		Statement stmt = null;

	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	        
	    	// db: webapde, username: root, password: blank
	    	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapde", "root", "");
	
	        stmt = conn.createStatement();

	        String query = "SELECT COUNT(*) FROM user " +
	                       "WHERE username='" + username + "' AND password='" + password + "'";
	        ResultSet rs = stmt.executeQuery(query);
	        		
	        rs.next();
	        int rows = rs.getInt(1); 
	        if (rows == 1) {
				HttpSession session = request.getSession();
				
				String id = request.getParameter("id");
				session.setAttribute("username", username);
				session.setAttribute("id", id);
//				request.getRequestDispatcher("home.jsp").forward(request, response);
				response.sendRedirect("/home?id=" + id);
			} else {
				request.setAttribute("error", "Incorrect username or password");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
	    } catch(Exception e) {
	    	System.out.println(e.getMessage());
	    	
	    	request.setAttribute("error", "Cannot log in at this moment");
			request.getRequestDispatcher("login.jsp").forward(request, response);
	    }						
	}

}
