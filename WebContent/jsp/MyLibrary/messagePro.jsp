<%@page import="Library.Message.MessageSend"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String msgTo = request.getParameter("msgTo");
		String msgContent = request.getParameter("msgContent");
		
		MessageSend msg = new MessageSend();
		
		msg.msgSend(msgTo, msgContent);
		
		response.sendRedirect("message.jsp");
	%>
	
</body>
</html>