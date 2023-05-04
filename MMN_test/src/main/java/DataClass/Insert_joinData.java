package DataClass;

//회원가입에 사용하는 객체
public class Insert_joinData {
	public String userID;
	public String userPW;
	public String userName;
	public String userEmail;
	public String userImgPath;
	public String isMaster;
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String _name) {
		userName = _name;
	}
	
	public String getUserImgPath() {
		return userImgPath;
	}

	public void setUserImgPath(String _img) {
		userImgPath = _img;
	}
}