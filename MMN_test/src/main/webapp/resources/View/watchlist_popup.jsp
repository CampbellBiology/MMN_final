<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DB.*" %>
<%@page import="DataClass.*" %>
<%@page import="java.util.*" %>

<%
	DB_Conn db=new DB_Conn();
	String userID = loginData.userID;
	ArrayList <watchlistData> wdList = db.getWatchListInfo(userID);
	
	System.out.println("리스트 개수: " + wdList.size());
	
	int lim = Math.min(wdList.size(), 10);
	
	if(lim == 0){
		out.println("<img src=\"../UI/UI/뭐뭇나_List_none.png\" class=\"list_none\"id=\"list_none\">");
	}
	else{
		for(int i=0;i<lim;i++){
			int storeCode = wdList.get(i).getStoreCode();
			watchlistStoreDataPrint wsdp = new watchlistStoreDataPrint(db.getStoreData(storeCode));
			out.println("<div id=\"store"+i+"\" class=\"store\">");
			out.println("<div class=\"keep_icon\">");
			out.println("<img src=\"https://raw.githubusercontent.com/CampbellBiology/MMN2/master/MMN_test/src/main/webapp/resources/UI/UI/star_yellow.png\"");
			out.println("id=\"keepImg"+ i +"\" onclick = \"sendRequest("+storeCode+"); keepClick("+i+");\" onmouseover=\"onHover("+i+")\" onmouseout=\"offHover("+i+")\">");
			out.println("</div>");
			out.println("<a onclick=\"forPopup("+storeCode+")\">");
			out.println("<div class=\"store_photo\" style=\"background:url("+wsdp.getStoreImagePath()+") no-repeat; background-size: 100%;\"></div>");
			out.println("<div class=\"store_details\">");
			out.println("<div class=\"store_name\"><span class=\"subject\">가게명: </span><span class=\"gray\">"+wsdp.getStoreName()+"</span></div><hr>");
			out.println("<div class=\"store_score\"><span class=\"subject\">평점: </span><span class=\"gray\">"+wsdp.getAverageRating()+"</span></div><hr>");
			out.println("<div class=\"store_category\"><span class=\"subject\">업종분류: </span><span class=\"gray\">"+wsdp.getCateName()+"</span></div><hr>");
			out.println("<div class=\"store_address\"><span class=\"subject\">주소: </span><span class=\"gray\">"+wsdp.getAddr()+"</span></div>");
			out.println("</div>");
			out.println("</a>");
			out.println("</div>");
		}
	}
%>