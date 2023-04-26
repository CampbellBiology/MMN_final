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
	
		System.out.println("watchlistAddOrDelete session1:"+session.getAttribute("memberID"));
		String userID = (String)session.getAttribute("memberID");
		System.out.println("watchlistAddOrDelete session2:"+session.getAttribute("memberID"));
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