package DataClass;

import java.util.ArrayList;

import DB.DB_Conn;

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
