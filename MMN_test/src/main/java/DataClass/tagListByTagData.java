package DataClass;

import java.util.ArrayList;
import DB.DB_Conn;

//메인 페이지에서 가게이미지 hover시에 사용하는 데이터를 리스트로 만든다.
public class tagListByTagData {
	ArrayList <tagListData> tldList;
	
	public tagListByTagData(int tagID){
		DB_Conn db = new DB_Conn();
		tldList = db.getTagListByTag(tagID);
	}

	public ArrayList<tagListData> getTldList() {
		return tldList;
	}

	public void setTldList(ArrayList<tagListData> tldList) {
		this.tldList = tldList;
	}
}
