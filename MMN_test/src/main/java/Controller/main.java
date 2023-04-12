package Controller;

import DataClass.storeData;
import DataClass.tagData;

public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		searchResult sr = new searchResult("고기");

		for(storeData sd : sr.storeInfo) {
			System.out.println(sd.getStoreName());
			System.out.println(sd.getStoreCode());
		}
		
		for(tagData td : sr.tagInfo) {
			System.out.println(td.getTagName());
		}
	}

}
