package servlets;



import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.owasp.esapi.ESAPI;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
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
			request.getRequestDispatcher("login.jsp").forward(request, response);	
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String username = ESAPI.encoder().encodeForHTML(request.getParameter("username"));
		String password = request.getParameter("pwd");
		
		Connection conn = null;
		//Statement stmt = null;
		
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");	        
	    	
	    	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stellardb", "root", "");	
	        //stmt = conn.createStatement();
	    	
	    	//prepared statement combined with esapi
	        String query = "SELECT * FROM userdata " +
	                       "WHERE username = ? AND password= ?;";
	        
	        PreparedStatement ps = conn.prepareStatement(query);
	        
	        ps.setString(1, username);
	        ps.setString(2, password);
	        
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
		        int rows = rs.getInt(1); 
	        	request.setAttribute("error", "");
	        	String id = rs.getString("userId");
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("username", username);

				response.sendRedirect("/Stellar/home?username="+username+"&id="+id);
			//	request.getRequestDispatcher("home").forward(request, response);
			} else {
				request.setAttribute("error", "Incorrect username or password");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
	    } catch(Exception e) {
	    	e.printStackTrace();
	    	System.out.println(e.getMessage());	    	
	    	request.setAttribute("error", "Cannot log in at this moment");
	    	request.getRequestDispatcher("login.jsp").forward(request, response);
	    }						
	}

}
