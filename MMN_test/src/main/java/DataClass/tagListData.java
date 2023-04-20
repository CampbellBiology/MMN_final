package DataClass;

public class tagListData implements Comparable<tagListData>{
	String storeImagePath;
	String storeName;
	double averageRating;
	String reviewContent;
	
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
