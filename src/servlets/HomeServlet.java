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
 * Servlet implementation class HomeServlet
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
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
			    request.getParameter("username").equals(session.getAttribute("username")) &&
			    session.getAttribute("id") != null &&
			    request.getParameter("id") != null &&				
			    request.getParameter("id").equals(session.getAttribute("id"))) {
			
			Connection conn = null;
			Statement stmt = null;
			UserData user = new UserData();
			
			String id = request.getParameter("id");
			String username = request.getParameter("username");
			ArrayList<UserData> userList = new ArrayList<UserData>();
			ArrayList<SuggestedData> suggestionList = new ArrayList<SuggestedData>();
			ArrayList<TopicData> topicList = new ArrayList<TopicData>();

			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stellardb", "root", "");
				stmt = conn.createStatement();
				
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
					userList.add(user);
				}
				
				String topicDataQuery = "SELECT * FROM topicdata ORDER BY topicId DESC";
				rs = stmt.executeQuery(topicDataQuery);
				ResultSet topicRS2;
				Statement stmt2 = conn.createStatement();
				String topicProfPicQuery = "";
				while(rs.next()) {
					TopicData topic = new TopicData();
					topic.setUserId(rs.getInt("userId"));
					topic.setTitle(rs.getString("title"));
					topic.setContent(rs.getString("content"));
					topic.setRating(rs.getFloat("rating"));
					topic.setTopicId(rs.getInt("topicId"));
					
					topicProfPicQuery = "SELECT * from userData WHERE userId = " + topic.getUserId();
					topicRS2 = stmt2.executeQuery(topicProfPicQuery);
					topicRS2.next();
					topic.setProfPic(topicRS2.getString("profPic"));
					topic.setUsername(topicRS2.getString("username"));
					topic.setLink("profile?username="+username+"&id="+id+"&profileId="+topic.getUserId());
					
					
					topicList.add(topic);
				}
				
				query = "SELECT * FROM userdata	ORDER BY RAND() LIMIT 5";
				rs = stmt.executeQuery(query);
				
				while(rs.next()) {
					SuggestedData suggested = new SuggestedData();
					
					suggested.setUserId(rs.getInt("userId"));
					suggested.setUsername(rs.getString("username"));
					suggested.setProfPic(rs.getString("profPic"));
					suggested.setLink("profile?username="+username+"&id="+id+"&profileId="+suggested.getUserId());
					
					suggestionList.add(suggested);
				}
			}
			catch(Exception e) {
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
			request.setAttribute("userList", userList);
			request.setAttribute("topicList", topicList);
			request.setAttribute("suggestionList", suggestionList);
			
			request.setAttribute("destination", "home.jsp");
			request.getRequestDispatcher("/notification").forward(request, response);
//			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		else {
			session.invalidate();
			response.sendRedirect("/Stellar/login");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
