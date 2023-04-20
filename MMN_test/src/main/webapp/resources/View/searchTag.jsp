<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="Controller.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String query = request.getParameter("query");
	searchResult sr = new searchResult(query);

	for(int i=0;i<sr.getTagInfo().size();i++){
		out.println(sr.getTagInfo().get(i).getTagName());
	}
%>