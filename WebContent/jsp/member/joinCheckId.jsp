<%@page import="Library.Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	// join.jsp id -> join.js id ����
	// join.js id -> jlinCheckId.jsp inputID
	// joinCheckId.jsp�� �����ؼ� ���� inputID�� �ҷ�����

	// ����� �޾ƿ����� ���ο� ID ���
	String id = request.getParameter("inputID");
	System.out.println(id);
	
	// ��� ���� �۾� ó��
	MemberDAO mdao = new MemberDAO();

	// ȸ�� ���� ���̵� üũ �޼��� ����
	int check = mdao.joinCheckId(id);
%>

<%=check%>