package Controller;

import java.util.ArrayList;

import DB.DB_Conn;
import DataClass.loginData;
import DataClass.storeData;
import DataClass.watchlistData;
import DataClass.watchlistStoreDataPrint;


// 중복된 값이 들어가면 안됨 => 해결(데이터베이스에 기본키를 줌)
// 로그인 된 상태에서 관심목록을 불러옴 => 해결(loginServlet.java 에 watchlist 객체를 생성)
// 로그아웃된 후 클리어
// 데이터베이스에 같은 값을 여러번 넣을 수 있다. 그러니 중복체크를 조심해야 한다. => 해결(데이터베이스에 기본키를 줌)

// 관심목록 컨트롤러
public class watchlist {
	ArrayList<watchlistData> wdList;
	ArrayList<watchlistStoreDataPrint> wsdList;
	
	public watchlist(loginData _ld, DB_Conn _db) {
		// 로그인 상태라면
		if(_ld.isLoginStatus() == 1) {
			// 관심목록에 등록된 가게코드와 아이디를 관심목록(wdList)에 담는다.
			wdList = _db.getWatchListInfo(_ld.userID);
			
			// 가져온 가게코드들을 순회한다
			for(int i=0;i<wdList.size();i++) {
				// 가게코드를 가져온다.
				int storeCode = wdList.get(i).getStoreCode();
				
				// 가게코드에 맞는 storeData를 가져온다.
				storeData sd = _db.getStoreData(storeCode);
				
				// 가져온 storeData를 출력하는 객체를 생성한다.
				watchlistStoreDataPrint wsd = new watchlistStoreDataPrint(sd);
				
				// 관심목록 출력 리스트에 wsd 객체를 추가한다.
				wsdList.add(wsd);
			}
		}
	}
}
