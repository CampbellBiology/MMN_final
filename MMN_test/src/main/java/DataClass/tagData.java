package DataClass;

public class tagData  implements Comparable<tagData>{
	int tagId;
	String tagName;
	int tagViews;
	
	public int getTagId() {
		return tagId;
	}
	public void setTagId(int tagId) {
		this.tagId = tagId;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public int getTagViews() {
		return tagViews;
	}
	public void setTagViews(int tagViews) {
		this.tagViews = tagViews;
	}
	
	@Override
    public int compareTo(tagData td) {
        if(td.tagViews < tagViews) {
            return -1;
        }
        else if(td.tagViews > tagViews) {
            return 1;
        }
        return 0;
    }
}
