package DataClass;

import DB.DB_Conn;

// storeData 중 화면에 출력할 데이터만 파싱한다. (관심목록 출력)
public class watchlistStoreDataPrint {
	String storeImagePath;
	String storeName;
	double averageRating;
	String cateName;
	String addr;
	
	public watchlistStoreDataPrint(storeData _sd) {
		// TODO Auto-generated constructor stub
		
		DB_Conn _db = new DB_Conn();
		
		storeImagePath = _sd.getStoreImgPath();
		storeName = _sd.getStoreName();
		averageRating = _db.getAverageRating(_sd.getStoreCode());
		cateName = _db.getCategoryName(_sd.getCateCode());
		addr = _sd.getAddr();
	}
}
