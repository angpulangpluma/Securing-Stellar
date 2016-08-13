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

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("registration.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		
		String username = request.getParameter("username");
		String password = request.getParameter("pwd1");
		String confirm = request.getParameter("pwd2");
		String description = request.getParameter("desc");

		String birthMonth = request.getParameter("month");
		String birthDay = request.getParameter("day");
		
		session.setAttribute("firstname", firstname);
		session.setAttribute("lastname", lastname);
		session.setAttribute("email", email);
				
		session.setAttribute("username", username);
		session.setAttribute("password", password);
		session.setAttribute("desc", description);
		
		session.setAttribute("month", birthMonth);
		session.setAttribute("day", birthDay);
				
		Connection conn = null;
		Statement stmt = null;
		
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	        
	    	// db: webapde, username: root, password: blank
	    	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stellardb", "root", "");
	
	        stmt = conn.createStatement();
	        String query = "INSERT INTO userdata (username, password, email, firstName, lastName, description, profPic, averageStars) VALUES ('"
	        									//id is auto increment
	        				+username+"', '" 	//username
	        				+password+"', '"	//password
	        				+email+"', '"	//password
	        				+firstname+"', '" 	//firstname
	        				+lastname+"', '"	//lastname
	        				+description+"', '"	//description
	        				+"user-default.png', '"
	        				+"0.0');";	//description
//		        "insert into emp (firstname, lastname) values('"+eid+"','"+name+"','"+sal+"')"
   
	        int update = stmt.executeUpdate(query);	//for data manipulation, ERROR CHECK update	

	        request.getRequestDispatcher("successful.jsp").forward(request, response);
	    } catch(Exception e) {
	    	request.getRequestDispatcher("registration.jsp").forward(request, response);
	    	System.out.println(e.getMessage());
	    }							
	}
	
	private boolean checkInputs(HttpServletRequest request) {
	
		return false;
	}
}
