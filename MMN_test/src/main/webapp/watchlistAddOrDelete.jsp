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
	
		String userID = request.getParameter("userId");
		int storeCode = Integer.parseInt(request.getParameter("storeCode"));

		boolean res = db.haveWatchlist(userID, storeCode);
		
		System.out.println("watchlistAddOrDelete");
		
		if(res == true){
			db.deleteWatchlistInfo(userID, storeCode);
		}
		else{
			db.addWatchlistInfo(userID, storeCode);
		}
	%>
	
</body>
</html>