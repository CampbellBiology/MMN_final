package Controller;

import java.util.ArrayList;

import DB.DB_Conn;
import DataClass.storeData;
import DataClass.tagData;

//검색한 내용에 대한 가게 정보 데이터
public class searchResult {
	DB_Conn db;
	ArrayList<storeData> storeInfo;
	ArrayList<tagData> tagInfo;
// 2부터 10까지의 공백
	String[] space = { "          ", "         ", "        ", "       ", "      ", "     ", "    ", "   ", "  " };

	public searchResult(String query) {
		db = new DB_Conn();

		// 검색어 글자수 제한 10
		// query 를 재가공한다. 쓸데없는 공백 제거

		query = query.trim();

		for (int i = 0; i <= 8; i++) {
			query = query.replace(space[i], " ");
		}

		calcStoreInfo(query);
		calcTagInfo(query);
	}

	public ArrayList<storeData> getStoreInfo() {
		return storeInfo;
	}

	public void setStoreInfo(ArrayList<storeData> storeInfo) {
		this.storeInfo = storeInfo;
	}

	public ArrayList<tagData> getTagInfo() {
		return tagInfo;
	}

	public void setTagInfo(ArrayList<tagData> tagInfo) {
		this.tagInfo = tagInfo;
	}
	
	//가게정보에 메뉴정보를 추가
	public void calcStoreInfo(String query) {
		storeInfo = db.getStoreInfo(query);
		ArrayList<storeData> tmp = db.getMenuInfo(query);

		for (storeData sd : tmp) {
			storeInfo.add(sd);
		}
		
		storeInfo = (ArrayList<storeData>) DeduplicationUtils.deduplication(storeInfo, storeData::getStoreCode);
	}

	public void calcTagInfo(String query) {
		tagInfo = db.getTagInfo(query);
	}
}
