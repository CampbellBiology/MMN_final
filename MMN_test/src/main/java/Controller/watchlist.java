package Controller;

import java.util.ArrayList;

import DB.DB_Conn;
import DataClass.loginData;
import DataClass.storeData;
import DataClass.watchlistData;


// 중복된 값이 들어가면 안됨
// 로그인 된 상태에서 관심목록을 불러옴
// 로그아웃된 후 재갱신
// 데이터베이스에 같은 값을 여러번 넣을 수 있다. 그러니 중복체크를 조심해야 한다.

public class watchlist {
	ArrayList<watchlistData> list;
	
	public watchlist(loginData _ld, DB_Conn _db) {
		if(_ld.isLoginStatus() == 1) {
			list = _db.getWatchListInfo(_ld.userID);
		}
	}
}
