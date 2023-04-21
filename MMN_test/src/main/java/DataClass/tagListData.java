package DataClass;

//메인 페이지에서 가게이미지 hover시 사용하는 객체
public class tagListData implements Comparable<tagListData>{
	String storeImagePath;
	String storeName;
	double averageRating;
	String reviewContent;
	int storeCode;
	
	public int getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(int storeCode) {
		this.storeCode = storeCode;
	}
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
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	
	//평점에 따라 내림차순 정렬
	@Override
    public int compareTo(tagListData tld) {
        if(tld.getAverageRating() < averageRating) {
            return -1;
        }
        else if(tld.getAverageRating() > averageRating) {
            return 1;
        }
        return 0;
    }
}
