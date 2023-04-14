package DataClass;

import DB.DB_Conn;

// storeData 중 화면에 출력할 데이터만 파싱한다. (관심목록 출력)
public class watchlistStoreDataPrint {
	String storeImagePath;
	String storeName;
	double averageRating;
	String cateName;
	String addr;
	int storeCode;
	
	public String getStoreImagePath() {
		return storeImagePath;
	}

	public void setStoreImagePath(String storeImagePath) {
		this.storeImagePath = storeImagePath;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public double getAverageRating() {
		return averageRating;
	}

	public void setAverageRating(double averageRating) {
		this.averageRating = averageRating;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getAddr() {
		return addr;
	}

	public int getStoreCode() {
		return storeCode;
	}

	public void setStoreCode(int storeCode) {
		this.storeCode = storeCode;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	
	public watchlistStoreDataPrint(storeData _sd) {
		// TODO Auto-generated constructor stub
		
		DB_Conn _db = new DB_Conn();
		
		storeImagePath = _sd.getStoreImgPath();
		storeName = _sd.getStoreName();
		averageRating = _db.getAverageRating(_sd.getStoreCode());
		cateName = _db.getCategoryName(_sd.getCateCode());
		addr = _sd.getAddr();
		storeCode = _sd.getStoreCode();
	}
}
