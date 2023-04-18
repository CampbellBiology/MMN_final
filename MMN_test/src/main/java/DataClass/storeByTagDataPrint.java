package DataClass;

import DB.DB_Conn;

public class storeByTagDataPrint {
	String storeImgPath;
	String storeName;
	String cateName;
	String review;
	int storeCode;
	int tagID;
	boolean watchlist;
	double averageRating;
	
	public String getStoreImgPath() {
		return storeImgPath;
	}
	public void setStoreImgPath(String storeImgPath) {
		this.storeImgPath = storeImgPath;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public int getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(int storeCode) {
		this.storeCode = storeCode;
	}
	public int getTagID() {
		return tagID;
	}
	public void setTagID(int tagID) {
		this.tagID = tagID;
	}
	public boolean isWatchlist() {
		return watchlist;
	}
	public void setWatchlist(boolean watchlist) {
		this.watchlist = watchlist;
	}
	public double getAverageRating() {
		return averageRating;
	}
	public void setAverageRating(double averageRating) {
		this.averageRating = averageRating;
	}
}
