package DataClass;

//로그인에 사용하는 객체
public class loginData {
	public static String userID;
	public static String userPW;
	private static int loginStatus;

	public static int getLoginStatus() {
		return loginStatus;
	}

	public static void setLoginStatus(int loginStatus) {
		loginData.loginStatus = loginStatus;
	}

	//로그인 상태 조회
	public static int isLoginStatus() {
		if (loginStatus == 0 || loginStatus == 1) {
			System.out.println("로그인 중입니다.");
			return 1;
		} else {
			System.out.println("로그인을 하지 않았습니다.");
			return 0;
		}
	}
}
