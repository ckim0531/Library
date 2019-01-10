<%@page import="Library.Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	// join.jsp id -> join.js id 전달
	// join.js id -> jlinCheckId.jsp inputID
	// joinCheckId.jsp로 전달해서 받은 inputID값 불러오기

	// 제대로 받아오는지 내부에 ID 출력
	String id = request.getParameter("inputID");
	System.out.println(id);
	
	// 디비 저장 작업 처리
	MemberDAO mdao = new MemberDAO();

	// 회원 가입 아이디 체크 메서드 구현
	int check = mdao.joinCheckId(id);
%>

<%=check%>