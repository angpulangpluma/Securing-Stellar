package entities;

import java.sql.Date;

public class SuggestedData {
	private int userId;
	private String username;
	private String profPic;
	private String link;
	
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
	public String getProfPic() {
		return profPic;
	}
	public void setProfPic(String profPic) {
		this.profPic = profPic;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
}
