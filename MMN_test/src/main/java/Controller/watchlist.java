package Controller;

import java.util.ArrayList;

import DB.DB_Conn;
import DataClass.loginData;
import DataClass.storeData;
import DataClass.watchlistData;
import DataClass.watchlistStoreDataPrint;

// 중복된 값이 들어가면 안됨 => 해결(데이터베이스에 외래키 2개를 기본키로 사용)
// 로그인 된 상태에서 관심목록을 불러옴 => 해결(loginServlet.java 에 watchlist 객체를 생성)
// 로그아웃된 후 클리어
// 데이터베이스에 같은 값을 여러번 넣을 수 있다. 그러니 중복체크를 조심해야 한다. => 해결(데이터베이스에 기본키를 줌)

// 관심목록 컨트롤러
public class watchlist {
	ArrayList<watchlistData> wdList;
	// 스토어 데이터 중 일부만을 보여주는 리스트(가게이름, 평점, 주소 등)
	ArrayList<watchlistStoreDataPrint> wsdpList;

	public ArrayList<watchlistData> getWdList() {
		return wdList;
	}

	public void setWdList(ArrayList<watchlistData> wdList) {
		this.wdList = wdList;
	}

	public ArrayList<watchlistStoreDataPrint> getWsdpList() {
		return wsdpList;
	}

	public void setWsdpList(ArrayList<watchlistStoreDataPrint> wsdpList) {
		this.wsdpList = wsdpList;
	}

	//메인 페이지에서 유저아이디를 이용하여 관심목록 출력
	public watchlist(String userID) {
		if (loginData.isLoginStatus() == 1) {
			DB_Conn _db = new DB_Conn();
			wsdpList = new ArrayList<>();

			// 관심목록에 등록된 가게코드와 아이디를 관심목록(wdList)에 담는다.
			wdList = _db.getWatchListInfo(userID);

			// 가져온 가게코드들을 순회한다
			for (int i = 0; i < wdList.size(); i++) {
				// 가게코드를 가져온다.
				int storeCode = wdList.get(i).getStoreCode();

				// 가게코드에 맞는 storeData를 가져온다.
				storeData sd = _db.getStoreData(storeCode);

				// 가져온 storeData를 출력하는 객체를 생성한다.
				watchlistStoreDataPrint wsdp = new watchlistStoreDataPrint(sd);

				// 관심목록 출력 리스트에 wsdp 객체를 추가한다.
				wsdpList.add(wsdp);
			}
		}

	}
}
