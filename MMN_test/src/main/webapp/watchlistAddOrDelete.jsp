<%@page import="DataClass.loginData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="DB.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		DB_Conn db = new DB_Conn();
	
		System.out.println("watchlistAddOrDelete login Data userID: " + loginData.userID);
		System.out.println("watchlistAddOrDelete " + "session:"+session.getAttribute("memberID"));
		String userID = loginData.userID;
		int storeCode = Integer.parseInt(request.getParameter("storeCode"));

		System.out.println("watchlistAddOrDelete " + userID + "/" + storeCode);

		boolean res = db.haveWatchlist(userID, storeCode);
		
		System.out.println("watchlistAddOrDelete");
		
		if(res == true){
			System.out.println("Delete");
			db.deleteWatchlistInfo(userID, storeCode);
		}
		else{
			System.out.println("Add");
			db.addWatchlistInfo(userID, storeCode);
		}
	%>
	
</body>
</html>