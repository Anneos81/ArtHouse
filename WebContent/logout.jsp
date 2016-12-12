<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
if(session.getAttribute("user-object") == null) {
	request.setAttribute("msg", "Please login first");
%>
	<jsp:forward page="loginseller.jsp" />
	
<% }

 session.invalidate();

%>
<jsp:forward page="homepage.jsp" />
