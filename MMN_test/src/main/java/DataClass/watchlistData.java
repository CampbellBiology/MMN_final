package DataClass;

// 데이터베이스에 있는 관심목록 데이터들
public class watchlistData {
	String userID;
	int storeCode;
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(int storeCode) {
		this.storeCode = storeCode;
	}
	
	public watchlistData(String _userID, int _storeCode) {
		userID = _userID;
		storeCode = _storeCode;
	}
}
