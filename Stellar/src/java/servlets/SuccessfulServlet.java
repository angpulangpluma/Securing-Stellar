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

import entities.UserData;

/**
 * Servlet implementation class SuccessfulServlet
 */
@WebServlet("/success")
public class SuccessfulServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuccessfulServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		Statement stmt = null;
		
		ArrayList<UserData> users = new ArrayList<UserData>();
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	        
	    	// db: webapde, username: root, password: blank
	    	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapde", "root", "");
	
	        stmt = conn.createStatement();	      
	        // select user based on given id
	        int id = Integer.parseInt(request.getParameter("id"));
	        System.out.println("ID IS "+id);
	        String query = "SELECT * FROM user WHERE id=" + id;
	        ResultSet rs = stmt.executeQuery(query);
	       	
	        rs.next();  // retrieve first row
	        
	        UserData user = new UserData();
	        
	        // user columns
        	user.setUserId(rs.getInt("id"));
        	user.setUsername(rs.getString("username"));
        	user.setPassword(rs.getString("password"));
        	user.setFirstName(rs.getString("firstName"));
        	user.setLastName(rs.getString("lastName"));
        	user.setDescription(rs.getString("description"));
        	
        	request.setAttribute("user", user);        	
	    } catch(Exception e) {
	    	System.out.println(e.getMessage());
	    }
	    
	    request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String firstname = request.getParameter("fName");
		String lastname = request.getParameter("lName");
		
		String username = request.getParameter("uName");
		String password = request.getParameter("pass");
		String confirm = request.getParameter("confirmPass");
		
		String description = request.getParameter("desc");
		
		String birthMonth = request.getParameter("birthMonth");
		String birthDay = request.getParameter("birthDay");
		
		session.setAttribute("fName", firstname);
		session.setAttribute("lName", lastname);
		session.setAttribute("uName", username);
		
		session.setAttribute("birthMonth", birthMonth);
		session.setAttribute("birthDay", birthDay);
	}

}
