package DataClass;

//태그 페이지 표시를 위한 가게정보 객체
public class storeByTagDataPrint implements Comparable<storeByTagDataPrint>{
	String storeImgPath;
	String storeName;
	String cateName;
	String addr;
	String nickName;
	reviewData rd;
	int storeCode;
	int tagID;
	boolean watchlist;
	double averageRating;

	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
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
	
	public reviewData getRd() {
		return rd;
	}
	public void setRd(reviewData rd) {
		this.rd = rd;
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
	
	@Override
    public int compareTo(storeByTagDataPrint store) {
        if(store.getAverageRating() < averageRating) {
            return -1;
        }
        else if(store.getAverageRating() > averageRating) {
            return 1;
        }
        return 0;
    }
}
