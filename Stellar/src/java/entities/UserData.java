package entities;

import java.sql.Date;
import java.util.ArrayList;


public class UserData {
	
	private int userId;
	private String username;
	private String password;
	private String email;
	private Date birthday;
	private String firstName;
	private String lastName;
	private String description;
	private String profPic;
	private float averageStars;

	private ArrayList<UserData> followers;
	private ArrayList<UserData> following;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getProfPic() {
		return profPic;
	}
	public void setProfPic(String profPic) {
		this.profPic = profPic;
	}
	public float getAverageStars() {
		return averageStars;
	}
	public void setAverageStars(float averageStars) {
		this.averageStars = averageStars;
	}
	public ArrayList<UserData> getFollowers() {
		return followers;
	}
	public void setFollowers(ArrayList<UserData> followers) {
		this.followers = followers;
	}
	public ArrayList<UserData> getFollowing() {
		return following;
	}
	public void setFollowing(ArrayList<UserData> following) {
		this.following = following;
	}
}
