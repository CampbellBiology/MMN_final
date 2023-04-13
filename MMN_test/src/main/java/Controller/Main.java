package Controller;

import java.util.ArrayList;

import DB.DB_Conn;
import DataClass.watchlistData;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DB_Conn db = new DB_Conn();
		
//		db.addWatchlistInfo("aabb", 2);
//		db.addWatchlistInfo("aabb", 1);
		
//		db.deleteWatchlistInfo("aabb", 2);
		
		ArrayList <watchlistData> wdl = db.getWatchListInfo("aabb");
		
		for(watchlistData wd:wdl) {
			System.out.println(wd.getStoreCode());
		}
	}

}
